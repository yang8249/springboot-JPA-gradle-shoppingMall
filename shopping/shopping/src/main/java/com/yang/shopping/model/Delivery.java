package com.yang.shopping.model;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

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
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@DynamicInsert // insert시 null인 데이터들을 제외해서 인서트해준다. (그래야 디폴트값을 넣을수있음.)
@Entity //ORM -> Java Obejct -> 테이블로 매핑해주는 기술이다.
public class Delivery{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	//주소
	@Column(length = 200)
	private String mainAddr;
	//상세주소
	@Column(length = 200)
	private String detailAddr;
	//우편번호
	@Column(nullable = false)
	@ColumnDefault("0")
	private int zoneCode;
	
	//연락처
	@Column(length = 200)
	private String phone;

	//은행명
	@Column(length = 100)
	private String bank;

	//입금자명
	@Column(length = 100)
	private String payCustomer;
	

	//요청사항
	@Column(length = 200)
	private String detailInfo1;
	//요청사항
	@Column(length = 200)
	private String detailInfo2;

	@ManyToOne //Many = board, One = users 테이블을 뜻한다. 1대다 관계임.
	@JoinColumn(name = "userId") //userId라는 컬럼명으로 외래키를 만든다.
	private Users user;

	@CreationTimestamp
	private Timestamp createDate;
	
}