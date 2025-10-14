package com.yang.shopping.dto;

import java.util.Map;

public class ArticleInsightsResponse {

    private Map<String, Long> categoryCounts;
    private Map<String, Long> tagCounts;
    private Double averageRating;

    public ArticleInsightsResponse() {
    }

    public ArticleInsightsResponse(Map<String, Long> categoryCounts, Map<String, Long> tagCounts, Double averageRating) {
        this.categoryCounts = categoryCounts;
        this.tagCounts = tagCounts;
        this.averageRating = averageRating;
    }

    public Map<String, Long> getCategoryCounts() {
        return categoryCounts;
    }

    public void setCategoryCounts(Map<String, Long> categoryCounts) {
        this.categoryCounts = categoryCounts;
    }

    public Map<String, Long> getTagCounts() {
        return tagCounts;
    }

    public void setTagCounts(Map<String, Long> tagCounts) {
        this.tagCounts = tagCounts;
    }

    public Double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(Double averageRating) {
        this.averageRating = averageRating;
    }
}
