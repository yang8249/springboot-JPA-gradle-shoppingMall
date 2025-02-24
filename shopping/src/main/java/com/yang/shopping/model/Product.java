package com.yang.shopping.model;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity // ORM -> Java Obejct -> 테이블로 매핑해주는 기술이다.
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productSeq;

	@Column(nullable = false, length = 100)
	private String productName;

	@Column(nullable = false, length = 100)
	private int price;

	@Column(length = 100)
	private String color;

	@Column(length = 100)
	private String colorRGB;

	@Column(nullable = false, length = 100)
	private String category;

	@Lob
	private String content;

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<FileInfo> fileInfo;

	@Column(nullable = false)
	@ColumnDefault("'N'")
	private String delYn;

	@CreationTimestamp
	private Timestamp createDate;
}