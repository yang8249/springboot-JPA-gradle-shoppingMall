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
public class Users{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false, length = 30)
	private String username;

	@Column(nullable = false, length = 100)
	private String password;

	@Column(nullable = false, length = 50)
	private String email;

	//이름
	@Column(length = 50)
	private String name;
	
	//주소
	@Column(length = 200)
	private String mainAddr;
	//상세주소
	@Column(length = 200)
	private String detailAddr;
	//우편번호
	@ColumnDefault("0")
	private String zoneCode;

	//연락처
	@Column(length = 200)
	private String phone;

	@Enumerated(EnumType.STRING)
	private RoleType role;

    private String oauth; // kakao, google, ...
    
	@CreationTimestamp
	private Timestamp createDate;
	
}