package com.yang.shopping.service;

import co.elastic.clients.elasticsearch._types.FieldValue;
import co.elastic.clients.elasticsearch._types.aggregations.Aggregate;
import co.elastic.clients.elasticsearch._types.aggregations.Aggregation;
import co.elastic.clients.elasticsearch._types.aggregations.StringTermsBucket;
import co.elastic.clients.elasticsearch._types.query_dsl.BoolQuery;
import co.elastic.clients.elasticsearch._types.query_dsl.Query;
import co.elastic.clients.elasticsearch.core.SearchRequest;
import co.elastic.clients.elasticsearch.core.SearchResponse;
import co.elastic.clients.elasticsearch.transform.Settings;
import co.elastic.clients.json.JsonpMapper;
import co.elastic.clients.json.JsonpUtils;
import co.elastic.clients.json.jackson.JacksonJsonpMapper;
import jakarta.annotation.PostConstruct;
import jakarta.json.spi.JsonProvider;
import jakarta.json.stream.JsonGenerator;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.elasticsearch.client.elc.NativeQuery;
import org.springframework.data.elasticsearch.client.elc.NativeQueryBuilder;
import org.springframework.data.elasticsearch.client.elc.ElasticsearchAggregation;
import org.springframework.data.elasticsearch.client.elc.ElasticsearchAggregations;
import org.springframework.data.elasticsearch.core.AggregationsContainer;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.IndexOperations;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.query.HighlightQuery;
import org.springframework.data.elasticsearch.core.query.highlight.Highlight;
import org.springframework.data.elasticsearch.core.query.highlight.HighlightField;
import org.springframework.data.elasticsearch.core.query.highlight.HighlightFieldParameters;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.yang.shopping.dto.ArticleInsightsResponse;
import com.yang.shopping.dto.ArticleRequest;
import com.yang.shopping.dto.ArticleResponse;
import com.yang.shopping.dto.ArticleSearchHitResponse;
import com.yang.shopping.dto.ArticleSearchPageResponse;
import com.yang.shopping.dto.BulkLoadResponse;
import com.yang.shopping.dto.ReindexResponse;
import com.yang.shopping.dto.SuggestionResponse;
import com.yang.shopping.mapper.ArticleMapper;
import com.yang.shopping.model.Article;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.search.ArticleDocument;
import com.yang.shopping.repository.ArticleRepository;
import com.yang.shopping.repository.ProductRepository;

import java.io.StringWriter;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ArticleService {

    private static final String CATEGORY_AGG = "by_category";
    private static final String TAGS_AGG = "by_tags";
    private static final String AVG_RATING_AGG = "avg_rating";

    private static final String CATEGORY_KEYWORD_FIELD = "category.keyword";
    private static final String TAGS_KEYWORD_FIELD = "tags.keyword";
    private static final String RATING_FIELD = "rating";
    private static final String PUBLISHED_AT_FIELD = "publishedAt";

    private final ArticleRepository repository;
    private final ElasticsearchOperations elasticOps;
    private final ArticleMapper mapper;

	@Autowired
	private ProductRepository productRepository;
	private ArticleRepository articleRepository;
	
    public ArticleSearchPageResponse searchProducts(String keyword, int page, int size) {

		System.out.println("엘라스틱 서비스 진입완료");
		
        Pageable pageable = PageRequest.of(page, size);
        NativeQuery query = NativeQuery.builder()
            .withQuery(q -> q.match(m -> m.field("title").query(keyword)))
            .withPageable(pageable)
            .build();

        SearchHits<ArticleDocument> hits = elasticOps.search(query, ArticleDocument.class);
        List<ArticleResponse> products = hits.getSearchHits().stream()
            .map(hit -> mapper.toResponse(hit.getContent()))
            .toList();

        long total = hits.getTotalHits();
        System.out.println("검색 완료: " + total + "개의 상품이 검색되었습니다.");
        System.out.println("검색된 상품: " + products);
        return new ArticleSearchPageResponse(products, total);
    }
    
    public ArticleSearchPageResponse searchProductsSame(String keyword, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);

        NativeQuery query = NativeQuery.builder()
                .withQuery(q -> q
                    .multiMatch(m -> m
                        .fields("title", "content", "category")
                        .query(keyword)
                        .fuzziness("AUTO") // 오타 허용
                    )
                )
                .withPageable(pageable)
                .build();



        SearchHits<ArticleDocument> hits = elasticOps.search(query, ArticleDocument.class);

        List<ArticleResponse> products = hits.getSearchHits().stream()
                .map(hit -> mapper.toResponse(hit.getContent()))
                .toList();

        long total = hits.getTotalHits();

        System.out.println("검색 완료: " + total + "개의 상품이 검색되었습니다.");
        System.out.println("검색된 상품: " + products);

        return new ArticleSearchPageResponse(products, total);
    }
//    public List<ArticleDocument> autocompleteTitle(String keyword, String category) {
//        NativeQuery query = NativeQuery.builder()
//            .withQuery(q -> q.bool(b -> {
//                b.must(m -> m.matchPhrasePrefix(mp -> mp.field("title").query(keyword).maxExpansions(10)));
//                if (category != null && !category.isEmpty()) {
//                    b.filter(f -> f.term(t -> t.field("category.keyword").value(category)));
//                }
//            }))
//            .withPageable(PageRequest.of(0, 5))
//            .build();
//
//        SearchHits<ArticleDocument> hits = elasticOps.search(query, ArticleDocument.class);
//
//        return hits.getSearchHits().stream()
//                   .map(SearchHit::getContent)
//                   .toList();
//    }
	 
    @PostConstruct
    void ensureIndex() {
        try {
            IndexOperations indexOps = elasticOps.indexOps(ArticleDocument.class);
            System.out.println("Elasticsearch 연결 정상, 인덱스 존재 여부: " + indexOps.exists());
            if (!indexOps.exists()) {
                indexOps.create();
                indexOps.putMapping();
                System.out.println("Elasticsearch 서버이미 있음: " + indexOps);
                ensureIndexAndIndexData();
            }
        } catch (Exception e) {
            System.out.println("Elasticsearch 서버 없음: " + e.getMessage());
        }
    }
    @PostConstruct
    void ensureIndexAndIndexData() {
        try {
            IndexOperations indexOps = elasticOps.indexOps(ArticleDocument.class);

            // 1️⃣ 기존 인덱스 삭제
            if (indexOps.exists()) {
                indexOps.delete();
                System.out.println("기존 인덱스 삭제 완료");
            }

            // 설정 Map으로 analyzer 지정
            Map<String, Object> settings = Map.of(
                "analysis", Map.of(
                    "analyzer", Map.of(
                        "korean_synonym_analyzer", Map.of(
                            "type", "custom",
                            "tokenizer", "nori_tokenizer",
                            "filter", List.of("lowercase", "synonym_filter")
                        )
                    ),
                    "filter", Map.of(
                        "synonym_filter", Map.of(
                            "type", "synonym",
                            "synonyms_path", "analysis/synonyms.txt"
                        )
                    )
                )
            );

            // 인덱스 생성 + 매핑 적용
            indexOps.create(settings);
            indexOps.putMapping(indexOps.createMapping());
            System.out.println("새 인덱스 및 매핑 생성 완료");

            // 3️⃣ DB 전체 조회 후 색인
            List<Product> products = productRepository.findAll();
            for (Product p : products) {
                ArticleDocument doc = mapToDocument(p);
                elasticOps.save(doc);
            }

            System.out.println("DB 데이터를 Elasticsearch에 새로 색인 완료 (총 " + products.size() + "건)");

        } catch (Exception e) {
            System.out.println("Elasticsearch 오류: " + e.getMessage());
        }
    }

    private ArticleDocument mapToDocument(Product p) {
        ArticleDocument doc = new ArticleDocument();
        doc.setProductId(String.valueOf(p.getProductSeq()));
        doc.setTitle(p.getProductName());
        doc.setContent(p.getContent());
        doc.setCategory(p.getCategory());
        return doc;
    }





    @Transactional
    public ArticleResponse save(ArticleRequest request) {
        Article entity = mapper.toEntity(request);
        return persist(entity);
    }

    public List<ArticleResponse> findAll() {
        return repository.findAll().stream()
                .map(mapper::toResponse)
                .toList();
    }

    public ArticleSearchPageResponse searchTitle(String title, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        NativeQuery query = baseQuery(pageable)
                .withQuery(q -> q.match(m -> m.field("title").query(title)))
                .build();
        return execute(query);
    }

    public ArticleSearchPageResponse fullTextSearch(String text, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        NativeQuery query = baseQuery(pageable)
                .withQuery(q -> q.multiMatch(m -> m
                        .query(text)
                        .fields("title^2", "content", "tags")))
                .build();
        return execute(query);
    }

    @Autowired
    private ElasticsearchOperations elasticsearchOperations;

    public List<ArticleDocument> advancedSearch(
            String text,
            String category,
            Set<String> tags,
            LocalDateTime publishedFrom,
            LocalDateTime publishedTo,
            Double minRating,
            int page,
            int size
    ) {

        BoolQuery.Builder boolBuilder = new BoolQuery.Builder();

        // ✅ 유사검색 (동의어 + fuzziness)
        if (StringUtils.hasText(text)) {
            boolBuilder.should(s -> s.multiMatch(mm -> mm
            	    .query(text)
            	    .fields("title^3", "content^2")
            	    .analyzer("korean_synonym_analyzer")
            	    .fuzziness("AUTO")
            	));
            
            boolBuilder.minimumShouldMatch("1");
        }

        if (StringUtils.hasText(category)) {
            boolBuilder.filter(f -> f.term(t -> t.field("category").value(category)));
        }

        if (tags != null && !tags.isEmpty()) {
            List<FieldValue> values = tags.stream().map(FieldValue::of).toList();
            boolBuilder.filter(f -> f.terms(t -> t.field("tags").terms(tv -> tv.value(values))));
        }

        if (publishedFrom != null || publishedTo != null) {
            boolBuilder.filter(f -> f.range(r -> r.date(d -> {
                d.field("publishedAt");
                if (publishedFrom != null)
                    d.gte(publishedFrom.atOffset(ZoneOffset.UTC).toInstant().toString());
                if (publishedTo != null)
                    d.lte(publishedTo.atOffset(ZoneOffset.UTC).toInstant().toString());
                return d;
            })));
        }

        if (minRating != null) {
            boolBuilder.filter(f -> f.range(r -> r.number(n -> n.field("rating").gte(minRating))));
        }

        // ✅ 조건이 없으면 match_all
        if (!StringUtils.hasText(text) &&
            !StringUtils.hasText(category) &&
            (tags == null || tags.isEmpty()) &&
            publishedFrom == null && publishedTo == null && minRating == null) {
            boolBuilder.must(m -> m.matchAll(ma -> ma));
        }

        // ✅ Spring Data용 NativeQuery 생성
        NativeQuery query = NativeQuery.builder()
                .withQuery(q -> q.bool(boolBuilder.build()))
                .withMaxResults(size)
                .build();

        // ✅ 실행
        return elasticsearchOperations.search(query, ArticleDocument.class)
                .stream()
                .map(SearchHit::getContent)
                .toList();
    }

    public SuggestionResponse suggestTitles(String prefix, int size) {
        NativeQuery query = NativeQuery.builder()
                .withQuery(q -> q.matchPhrasePrefix(m -> m.field("title").query(prefix)))
                .withPageable(PageRequest.of(0, size))
                .build();
        SearchHits<ArticleDocument> hits = elasticOps.search(query, ArticleDocument.class);
        List<String> suggestions = hits.getSearchHits().stream()
                .map(hit -> hit.getContent().getTitle())
                .distinct()
                .limit(size)
                .toList();
        return new SuggestionResponse(suggestions);
    }

    public BulkLoadResponse loadSampleData(int count) {
        List<ArticleResponse> created = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            created.add(persist(generateSampleArticle(i)));
        }
        return new BulkLoadResponse(created.size());
    }

    public ArticleInsightsResponse insights() {
        NativeQuery query = baseQuery(Pageable.unpaged())
                .withQuery(q -> q.matchAll(ma -> ma))
                .build();
        SearchHits<ArticleDocument> hits = elasticOps.search(query, ArticleDocument.class);
        return buildInsights(hits.getAggregations());
    }

    public void delete(Long id) {
        repository.deleteById(id);
        elasticOps.delete(String.valueOf(id), ArticleDocument.class);
        elasticOps.indexOps(ArticleDocument.class).refresh();
    }

    @Transactional(readOnly = true)
    public ReindexResponse reindexFromDatabase() {
        List<Article> articles = repository.findAll();
        if (articles.isEmpty()) {
            elasticOps.indexOps(ArticleDocument.class).refresh();
            return new ReindexResponse(0, 0);
        }

        List<ArticleDocument> documents = articles.stream()
                .map(mapper::toDocument)
                .filter(doc -> doc.getId() != null)
                .toList();

        documents.forEach(elasticOps::save);
        elasticOps.indexOps(ArticleDocument.class).refresh();

        return new ReindexResponse(articles.size(), documents.size());
    }

    private ArticleResponse persist(Article entity) {
        if (entity.getPublishedAt() == null) {
            entity.setPublishedAt(LocalDateTime.now());
        }
        if (entity.getTags() == null) {
            entity.setTags(new HashSet<>());
        }
        Article saved = repository.save(entity);
        ArticleDocument document = mapper.toDocument(saved);
        elasticOps.save(document);
        elasticOps.indexOps(ArticleDocument.class).refresh();
        System.out.println("저장된 ArticleDocument: " + document);

        return mapper.toResponse(saved);
    }

    private NativeQueryBuilder baseQuery(Pageable pageable) {
        HighlightField titleHighlight = new HighlightField("title",
                HighlightFieldParameters.builder()
                        .withPreTags("<em>")
                        .withPostTags("</em>")
                        .build());
        HighlightField contentHighlight = new HighlightField("content",
                HighlightFieldParameters.builder()
                        .withPreTags("<em>")
                        .withPostTags("</em>")
                        .withFragmentSize(180)
                        .build());
        Highlight highlight = new Highlight(List.of(titleHighlight, contentHighlight));

        return NativeQuery.builder()
                .withPageable(pageable)
                .withHighlightQuery(new HighlightQuery(highlight, ArticleDocument.class))
                .withAggregation(CATEGORY_AGG, Aggregation.of(a -> a.terms(t -> t.field(CATEGORY_KEYWORD_FIELD).size(10))))
                .withAggregation(TAGS_AGG, Aggregation.of(a -> a.terms(t -> t.field(TAGS_KEYWORD_FIELD).size(15))))
                .withAggregation(AVG_RATING_AGG, Aggregation.of(a -> a.avg(avg -> avg.field(RATING_FIELD))));
    }

    private ArticleSearchPageResponse execute(NativeQuery query) {
        SearchHits<ArticleDocument> hits = elasticOps.search(query, ArticleDocument.class);
        List<ArticleSearchHitResponse> items = hits.getSearchHits().stream()
                .map(this::mapHit)
                .toList();
        ArticleInsightsResponse insights = buildInsights(hits.getAggregations());
        long total = hits.getTotalHits();
        return new ArticleSearchPageResponse(items, total, insights);
    }

    private ArticleSearchHitResponse mapHit(SearchHit<ArticleDocument> hit) {
        ArticleResponse article = mapper.toResponse(hit.getContent());
        Map<String, List<String>> highlights = hit.getHighlightFields();
        double score = hit.getScore();
        return new ArticleSearchHitResponse(article, score, highlights);
    }

    private ArticleInsightsResponse buildInsights(AggregationsContainer<?> container) {
        if (!(container instanceof ElasticsearchAggregations elasticsearchAggregations)) {
            return new ArticleInsightsResponse(Collections.emptyMap(), Collections.emptyMap(), null);
        }
        Map<String, ElasticsearchAggregation> aggregationMap = elasticsearchAggregations.aggregationsAsMap();
        Map<String, Long> categoryCounts = extractTerms(aggregationMap.get(CATEGORY_AGG));
        Map<String, Long> tagCounts = extractTerms(aggregationMap.get(TAGS_AGG));
        Double averageRating = Optional.ofNullable(aggregationMap.get(AVG_RATING_AGG))
                .map(ElasticsearchAggregation::aggregation)
                .map(org.springframework.data.elasticsearch.client.elc.Aggregation::getAggregate)
                .map(Aggregate::avg)
                .map(avg -> avg.value())
                .orElse(null);
        return new ArticleInsightsResponse(categoryCounts, tagCounts, averageRating);
    }

    private Map<String, Long> extractTerms(ElasticsearchAggregation aggregation) {
        if (aggregation == null) {
            return Collections.emptyMap();
        }
        Aggregate aggregate = aggregation.aggregation().getAggregate();
        if (aggregate == null || aggregate.sterms() == null || aggregate.sterms().buckets() == null) {
            return Collections.emptyMap();
        }
        return aggregate.sterms().buckets().array().stream()
                .collect(Collectors.toMap(
                        bucket -> {
                            FieldValue key = bucket.key();
                            if (key == null) {
                                return "";
                            }
                            if (key.isString()) {
                                return key.stringValue();
                            }
                            return key._toJsonString();
                        },
                        StringTermsBucket::docCount,
                        Long::sum,
                        LinkedHashMap::new));
    }

    private BoolQuery.Builder applyFilters(BoolQuery.Builder builder,
            String text,
            String category,
            Set<String> tags,
            LocalDateTime publishedFrom,
            LocalDateTime publishedTo,
            Double minRating) {

			boolean[] hasMust = {false};
			boolean[] hasFilter = {false};
			
			if (StringUtils.hasText(text)) {
			// 🔹 multi_match + fuzziness
			builder.should(m -> m.multiMatch(mm -> mm
			.query(text)
			.fields("title^3", "content^2", "tags") // 가중치 지정
			.fuzziness("AUTO") // 오타 허용
			.prefixLength(1)   // fuzzy 적용 최소 글자 길이
			));
			
			// 🔹 wildcard 보조 (부분 일치)
			builder.should(m -> m.wildcard(w -> w
			.field("title")
			.value("*" + text + "*")
			.boost(2.0f)
			));
			builder.should(m -> m.wildcard(w -> w
			.field("content")
			.value("*" + text + "*")
			.boost(1.5f)
			));
			
			builder.minimumShouldMatch("1"); // should 중 하나만 맞아도 검색
			hasMust[0] = true;
			}
			
			// 카테고리 필터
			if (StringUtils.hasText(category)) {
			builder.filter(f -> f.term(t -> t.field("category").value(category)));
			hasFilter[0] = true;
			}
			
			// 태그 필터
			if (!CollectionUtils.isEmpty(tags)) {
			List<FieldValue> values = tags.stream().map(FieldValue::of).toList();
			builder.filter(f -> f.terms(t -> t.field("tags").terms(tv -> tv.value(values))));
			hasFilter[0] = true;
			}
			
			// 날짜 필터
			if (publishedFrom != null || publishedTo != null) {
			builder.filter(f -> f.range(r -> r.date(d -> {
			d.field("publishedAt");
			if (publishedFrom != null)
			d.gte(publishedFrom.atOffset(ZoneOffset.UTC).toInstant().toString());
			if (publishedTo != null)
			d.lte(publishedTo.atOffset(ZoneOffset.UTC).toInstant().toString());
			return d;
			})));
			hasFilter[0] = true;
			}
			
			// 최소 평점 필터
			if (minRating != null) {
			builder.filter(f -> f.range(r -> r.number(n -> n.field("rating").gte(minRating))));
			hasFilter[0] = true;
			}
			
			// 아무 조건 없으면 match_all
			if (!hasMust[0] && !hasFilter[0]) {
			builder.must(m -> m.matchAll(ma -> ma));
			}
			
			return builder;
			}



    private Article generateSampleArticle(int seed) {
        String[] categories = { "Tech", "Business", "Culture", "Sports", "Science" };
        String[] authors = { "Alice Kim", "Brian Lee", "Chris Park", "Dana Cho", "Evan Jung" };
        String[] keywordPool = { "Elasticsearch", "Scalability", "Realtime", "Search", "Analytics", "Dashboard",
                "Indexing", "Observability" };

        ThreadLocalRandom random = ThreadLocalRandom.current();

        Set<String> tags = random.ints(0, keywordPool.length)
                .distinct()
                .limit(3)
                .mapToObj(i -> keywordPool[i])
                .collect(Collectors.toSet());

        LocalDateTime publishedAt = LocalDateTime.now().minusDays(random.nextInt(0, 60));

        return Article.builder()
                .title("Elastic 체험 노트 #" + (seed + 1))
                .content("Elastic Stack으로 " + tags.iterator().next() + "를 구현한 사례와 베스트 프랙티스를 정리했습니다.")
                .author(authors[random.nextInt(authors.length)])
                .category(categories[random.nextInt(categories.length)])
                .rating(Math.round((random.nextDouble(3.5, 5.0)) * 10d) / 10d)
                .publishedAt(publishedAt)
                .tags(tags)
                .build();
    }
}
