package com.yang.shopping.mapper;


import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import com.yang.shopping.dto.ArticleRequest;
import com.yang.shopping.dto.ArticleResponse;
import com.yang.shopping.model.Article;
import com.yang.shopping.model.search.ArticleDocument;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Collections;
import java.util.HashSet;

@Component
public class ArticleMapper {

    public Article toEntity(ArticleRequest request) {
        if (request == null) {
            return null;
        }
        LocalDateTime publishedAt = request.getPublishedAt() != null ? request.getPublishedAt() : LocalDateTime.now();
    return Article.builder()
                .title(request.getTitle())
                .productId(request.getProductId())
                .content(request.getContent())
                .author(request.getAuthor())
                .category(request.getCategory())
                .rating(request.getRating())
                .publishedAt(publishedAt)
        .tags(CollectionUtils.isEmpty(request.getTags()) ? new HashSet<>() : new HashSet<>(request.getTags()))
                .build();
    }

    public ArticleResponse toResponse(Article entity) {
        if (entity == null) {
            return null;
        }
        return new ArticleResponse(
                entity.getId() != null ? String.valueOf(entity.getId()) : null,
                entity.getProductId(),
                entity.getTitle(),
                entity.getContent(),
                entity.getAuthor(),
                entity.getCategory(),
                entity.getRating(),
                entity.getPublishedAt(),
                entity.getTags()
        );
    }

    public ArticleResponse toResponse(ArticleDocument document) {
        if (document == null) {
            return null;
        }
        LocalDateTime publishedAt = document.getPublishedAt() != null
                ? LocalDateTime.ofInstant(document.getPublishedAt(), ZoneOffset.UTC)
                : null;
        return new ArticleResponse(
                document.getId(),
                document.getProductId(),
                document.getTitle(),
                document.getContent(),
                document.getAuthor(),
                document.getCategory(),
                document.getRating(),
                publishedAt,
                document.getTags() == null ? Collections.emptySet() : new HashSet<>(document.getTags())
        );
    }

    public ArticleDocument toDocument(Article entity) {
        if (entity == null) {
            return null;
        }
        Instant publishedAt = entity.getPublishedAt() != null
                ? entity.getPublishedAt().atOffset(ZoneOffset.UTC).toInstant()
                : Instant.now();
        return ArticleDocument.builder()
                .id(entity.getId() != null ? String.valueOf(entity.getId()) : null)
                .title(entity.getTitle())
                .productId(entity.getProductId())
                .content(entity.getContent())
                .author(entity.getAuthor())
                .category(entity.getCategory())
                .rating(entity.getRating())
                .publishedAt(publishedAt)
                .tags(entity.getTags() == null ? Collections.emptySet() : new HashSet<>(entity.getTags()))
                .build();
    }
}
