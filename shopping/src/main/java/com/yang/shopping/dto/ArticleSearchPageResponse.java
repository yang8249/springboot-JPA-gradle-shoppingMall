package com.yang.shopping.dto;

import java.util.List;

public class ArticleSearchPageResponse {

    private List<ArticleSearchHitResponse> hits;
    private long totalHits;
    private ArticleInsightsResponse insights;

    public ArticleSearchPageResponse() {
    }

    public ArticleSearchPageResponse(List<ArticleSearchHitResponse> hits, long totalHits, ArticleInsightsResponse insights) {
        this.hits = hits;
        this.totalHits = totalHits;
        this.insights = insights;
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
