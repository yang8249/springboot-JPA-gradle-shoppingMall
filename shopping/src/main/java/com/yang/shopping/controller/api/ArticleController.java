package com.yang.shopping.controller.api;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import com.yang.shopping.dto.ArticleInsightsResponse;
import com.yang.shopping.dto.ArticleRequest;
import com.yang.shopping.dto.ArticleResponse;
import com.yang.shopping.dto.ArticleSearchPageResponse;
import com.yang.shopping.dto.BulkLoadResponse;
import com.yang.shopping.dto.ReindexResponse;
import com.yang.shopping.dto.SuggestionResponse;
import com.yang.shopping.model.Article;
import com.yang.shopping.model.search.ArticleDocument;
import com.yang.shopping.service.ArticleService;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/articles")
@RequiredArgsConstructor
public class ArticleController {

    private final ArticleService service;

    @PostMapping
    public ArticleResponse create( @RequestBody ArticleRequest request) {
    	
		System.out.println("엘라스틱서치 데이터 생성 진입");
		System.out.println("getTitle : "+ request.getTitle());
		System.out.println("getContent : "+ request.getContent());
		System.out.println("getTitle : "+ request.getCategory());
		
	    
	    return service.save(request);
    }
    
//    // 키워드 기반 자동완성/추천
//    @GetMapping("/search/autocomplete")
//    public List<ArticleDocument> autocomplete(
//            @RequestParam String keyword,
//            @RequestParam(required = false) String category) {
//        return service.autocompleteTitle(keyword, category);
//    }

	@GetMapping("/search/products")
	public ArticleSearchPageResponse searchProducts(@RequestParam String keyword,
	        @RequestParam(defaultValue = "0") int page,
	        @RequestParam(defaultValue = "10") int size) {
		System.out.println("엘라스틱 진입완료");
		System.out.println("keyword: " + keyword + ", page: " + page + ", size: " + size);
	    return service.searchProductsSame(keyword, page, size);
	}


    @PostMapping("/bulk/sample")
    public BulkLoadResponse bulkSample(@RequestParam(defaultValue = "25") int count) {
        return service.loadSampleData(count);
    }

    @PostMapping("/reindex")
    public ReindexResponse reindex() {
        return service.reindexFromDatabase();
    }

    @GetMapping
    public List<ArticleResponse> all() {
        return service.findAll();
    }

    @GetMapping("/search/title")
    public ArticleSearchPageResponse searchTitle(@RequestParam String title,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        return service.searchTitle(title, page, size);
    }

    @GetMapping("/search/full")
    public ArticleSearchPageResponse fullText(@RequestParam String text,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        return service.fullTextSearch(text, page, size);
    }

    @GetMapping("/search/advanced")
    public ArticleSearchPageResponse advanced(@RequestParam(required = false) String query,
            @RequestParam(required = false) String category,
            @RequestParam(required = false) List<String> tags,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime publishedFrom,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime publishedTo,
            @RequestParam(required = false) Double minRating,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        Set<String> tagSet = tags != null ? new HashSet<>(tags) : null;
        return service.advancedSearch(query, category, tagSet, publishedFrom, publishedTo, minRating, page, size);
    }

    @GetMapping("/search/suggest")
    public SuggestionResponse suggest(@RequestParam String prefix,
            @RequestParam(defaultValue = "5") int size) {
        return service.suggestTitles(prefix, size);
    }

    @GetMapping("/insights")
    public ArticleInsightsResponse insights() {
        return service.insights();
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        service.delete(id);
    }
}
