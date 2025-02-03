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
public class Reply{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false, length = 200)
	private String content;
	
	@ManyToOne //Many = reply, One = board 테이블을 뜻한다. 1대다 관계임.
	@JoinColumn(name = "boardId") //boardId라는 컬럼명으로 외래키를 만든다.
	private Board board;
	
	@ManyToOne 
	@JoinColumn(name = "userId")
	private Users user;

	@CreationTimestamp
	private Timestamp createDate;
}