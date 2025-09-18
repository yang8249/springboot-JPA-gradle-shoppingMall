package com.yang.shopping.model;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.OrderBy;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@DynamicInsert // insert시 null인 데이터들을 제외해서 인서트해준다. (그래야 디폴트값을 넣을수있음.)
@Entity //ORM -> Java Obejct -> 테이블로 매핑해주는 기술이다.
public class ReturnDelivery{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	//처리상태
	@Column(length = 200)
	private String status;

	//환불금액
	@Column(length = 200)
	private String refund;

	//반품사유
	@Lob
	private String reason;

	//관리자 처리사유
	@Column(length = 200)
	private String adminNote;

	@ManyToOne //Many = board, One = users 테이블을 뜻한다. 1대다 관계임.
	@JoinColumn(name = "deliId") //userId라는 컬럼명으로 외래키를 만든다.
	private Delivery delivery;

	@ManyToOne //Many = board, One = users 테이블을 뜻한다. 1대다 관계임.
	@JoinColumn(name = "productId") //userId라는 컬럼명으로 외래키를 만든다.
	private Product product;
	
	@OneToMany(mappedBy = "returnDelivery", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderBy("fileSeq ASC")
	@JsonManagedReference
	private List<FileInfo> fileInfo;
	
	@ManyToOne //Many = board, One = users 테이블을 뜻한다. 1대다 관계임.
	@JoinColumn(name = "userId") //userId라는 컬럼명으로 외래키를 만든다.
	private Users user;
	
	@CreationTimestamp
	private Timestamp createDate;
	
}