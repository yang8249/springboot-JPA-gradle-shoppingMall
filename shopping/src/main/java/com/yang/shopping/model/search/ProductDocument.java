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

import java.time.Instant;
import java.util.Set;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Document(indexName = "product")  // Elasticsearch 인덱스 이름
public class ProductDocument {

    @Id
    private int productSeq;    // DB PK를 문자열로 변환

    private String productName;   // 검색 핵심
    private String category;      // 카테고리 검색
    private String content;       // 상세 검색

    private String color;         // 색상 검색 필요시 포함
    private String colorRGB;      // 색상 RGB
    private int price;            // 가격 검색 / 정렬용


    public int getProductSeq() {
        return productSeq;
    }

    public void setProductSeq(int productSeq) {
        this.productSeq = productSeq;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getColorRGB() {
        return colorRGB;
    }

    public void setColorRGB(String colorRGB) {
        this.colorRGB = colorRGB;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}