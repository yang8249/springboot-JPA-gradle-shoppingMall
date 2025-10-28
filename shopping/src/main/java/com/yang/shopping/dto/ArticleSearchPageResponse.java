package com.yang.shopping.dto;

import java.util.List;

import com.yang.shopping.model.search.ArticleDocument;

public class ArticleSearchPageResponse {

    private List<ArticleSearchHitResponse> hits;
    private long totalHits;
    private ArticleInsightsResponse insights;
    
    private List<ArticleDocument> articles;
    private int page;
    private int size;
    private long total;
    
    // ✅ 생성자 추가
    public ArticleSearchPageResponse(List<ArticleDocument> articles, int page, int size, long total) {
        this.articles = articles;
        this.page = page;
        this.size = size;
        this.total = total;
    }
    
    public ArticleSearchPageResponse() {
    }

    public ArticleSearchPageResponse(List<ArticleSearchHitResponse> hits, long totalHits, ArticleInsightsResponse insights) {
        this.hits = hits;
        this.totalHits = totalHits;
        this.insights = insights;
    }

    public ArticleSearchPageResponse(List<ArticleResponse> products, long total) {
		// TODO Auto-generated constructor stub
	}

	public List<ArticleSearchHitResponse> getHits() {
        return hits;
    }

    public void setHits(List<ArticleSearchHitResponse> hits) {
        this.hits = hits;
    }

    public long getTotalHits() {
        return totalHits;
    }

    public void setTotalHits(long totalHits) {
        this.totalHits = totalHits;
    }

    public ArticleInsightsResponse getInsights() {
        return insights;
    }

    public void setInsights(ArticleInsightsResponse insights) {
        this.insights = insights;
    }
}
