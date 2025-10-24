package com.yang.shopping.model;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonManagedReference;



@Getter
@Setter
@ToString(exclude = "fileInfo")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity // ORM -> Java Obejct -> 테이블로 매핑해주는 기술이다.
public class Article {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private String title;
  

	@Column(length = 100)
	private String color;

	@Column(length = 100)
	private String colorRGB;

	@Column(nullable = false, length = 100)
	private String category;

	@Lob
	private String content;

  private String author;

  private Double rating;

  private LocalDateTime publishedAt;

  @ElementCollection(fetch = FetchType.EAGER)
  @CollectionTable(name = "article_tags", joinColumns = @JoinColumn(name = "article_id"))
  @Column(name = "tag")
  @Builder.Default
  private Set<String> tags = new HashSet<>();

	@CreationTimestamp
	private Timestamp createDate;
}
//@Entity
//@Data
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder
//public class Article {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;
//
//    private String title;
//
//    @Column(columnDefinition = "TEXT")
//    private String content;
//
//    private String author;
//
//    private String category;
//
//    private Double rating;
//
//    private LocalDateTime publishedAt;
//
//    @ElementCollection(fetch = FetchType.EAGER)
//    @CollectionTable(name = "article_tags", joinColumns = @JoinColumn(name = "article_id"))
//    @Column(name = "tag")
//    @Builder.Default
//    private Set<String> tags = new HashSet<>();
//}
