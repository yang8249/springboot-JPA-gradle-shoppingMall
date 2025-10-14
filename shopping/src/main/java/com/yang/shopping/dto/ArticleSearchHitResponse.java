package com.yang.shopping.dto;

import java.util.List;
import java.util.Map;

public class ArticleSearchHitResponse {

    private ArticleResponse article;
    private double score;
    private Map<String, List<String>> highlights;

    public ArticleSearchHitResponse() {
    }

    public ArticleSearchHitResponse(ArticleResponse article, double score, Map<String, List<String>> highlights) {
        this.article = article;
        this.score = score;
        this.highlights = highlights;
    }

    public ArticleResponse getArticle() {
        return article;
    }

    public void setArticle(ArticleResponse article) {
        this.article = article;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public Map<String, List<String>> getHighlights() {
        return highlights;
    }

    public void setHighlights(Map<String, List<String>> highlights) {
        this.highlights = highlights;
    }
}
