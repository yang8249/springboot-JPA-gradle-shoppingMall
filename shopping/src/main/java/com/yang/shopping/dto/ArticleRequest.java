package com.yang.shopping.dto;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.yang.shopping.model.Article;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;

import java.time.LocalDateTime;
import java.util.Set;

public class ArticleRequest {
	
    private Article article;
    
    public Article getArticle() { return article; }
    
    public void setArticle(Article article) { this.article = article; }
    
    @NotBlank
    private String title;
    @NotBlank
    private String productId;

    public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	@NotBlank
    private String content;

    private String author;

    private String category;

    @PositiveOrZero
    private Double rating;

    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private LocalDateTime publishedAt;

    private Set<String> tags;

    public ArticleRequest() {
    }

    public ArticleRequest(String title, String productId, String content, String author, String category,
                          Double rating, LocalDateTime publishedAt, Set<String> tags) {
        this.title = title;
        this.productId = productId;
        this.content = content;
        this.author = author;
        this.category = category;
        this.rating = rating;
        this.publishedAt = publishedAt;
        this.tags = tags;
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
