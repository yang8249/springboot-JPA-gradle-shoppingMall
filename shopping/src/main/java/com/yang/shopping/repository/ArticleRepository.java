package com.yang.shopping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.yang.shopping.model.Article;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Long> {
    // 기본 CRUD 제공
    List<Article> findByTitleContainingOrContentContaining(String title, String content);
}
