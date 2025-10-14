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
    public ArticleResponse create(@Valid @RequestBody ArticleRequest request) {
        return service.save(request);
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
