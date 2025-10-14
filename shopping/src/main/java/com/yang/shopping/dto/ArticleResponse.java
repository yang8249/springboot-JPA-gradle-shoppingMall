package com.yang.shopping.dto;

import java.time.LocalDateTime;
import java.util.Set;

public class ArticleResponse {
    private String id;
    private String title;
    private String content;
    private String author;
    private String category;
    private Double rating;
    private LocalDateTime publishedAt;
    private Set<String> tags;

    public ArticleResponse() {
    }

    public ArticleResponse(String id, String title, String content, String author, String category,
                           Double rating, LocalDateTime publishedAt, Set<String> tags) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.author = author;
        this.category = category;
        this.rating = rating;
        this.publishedAt = publishedAt;
        this.tags = tags;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public LocalDateTime getPublishedAt() {
        return publishedAt;
    }

    public void setPublishedAt(LocalDateTime publishedAt) {
        this.publishedAt = publishedAt;
    }

    public Set<String> getTags() {
        return tags;
    }

    public void setTags(Set<String> tags) {
        this.tags = tags;
    }
}
