package com.yang.shopping.model.search;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.DateFormat;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import jakarta.persistence.Column;

import java.time.Instant;
import java.util.Set;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Document(indexName = "articles")
public class ArticleDocument {

    @Id
    private String id;

    private String productId;


    @Field(type = FieldType.Text, analyzer = "korean_synonym_analyzer")
    private String title;

    @Field(type = FieldType.Text, analyzer = "korean_synonym_analyzer")
    private String content;

    @Field(type = FieldType.Keyword)
    private String author;

    @Field(type = FieldType.Keyword)
    private String category;

    @Field(type = FieldType.Double)
    private Double rating;

    @Field(type = FieldType.Date, format = DateFormat.date_hour_minute_second_millis)
    private Instant publishedAt;

    @Field(type = FieldType.Keyword)
    private Set<String> tags;
}
