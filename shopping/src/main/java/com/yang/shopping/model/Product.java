package com.yang.shopping.model;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

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
@Entity //ORM -> Java Obejct -> 테이블로 매핑해주는 기술이다.
public class Product{
	
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
	
	@ManyToOne //Many = board, One = users 테이블을 뜻한다. 1대다 관계임.
	@JoinColumn(name = "fileSeq") //userId라는 컬럼명으로 외래키를 만든다. 
	private FileInfo fileInfo;

	@Column(nullable = false)
	@ColumnDefault("'N'")
	private String delYn;
	
	@CreationTimestamp
	private Timestamp createDate;
}