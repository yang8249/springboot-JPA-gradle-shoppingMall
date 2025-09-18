package com.yang.shopping.model;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonBackReference;

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
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(exclude = "product")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity //ORM -> Java Obejct -> 테이블로 매핑해주는 기술이다.
public class FileInfo{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int fileSeq;

    // 파일 관련 정보
	@Column(length = 100)
    private String fileName; // 파일 이름
	@Column(length = 200)
    private String uuid; // 파일 랜덤 이름
	@Column(length = 200)
    private String filePath; // 파일 경로 (파일이 저장된 위치)
	@Column(length = 200)
    private Long fileSize;   // 파일 크기
	@Column(length = 200)
    private String fileType; // MIME 타입 (예: image/jpeg, application/pdf 등)

    @ManyToOne
    @JoinColumn(name = "productSeq", nullable = true)  // 외래 키 설정
    @JsonBackReference
	private Product product;
	
    @ManyToOne
    @JoinColumn(name = "id", nullable = true)  // 외래 키 설정
    @JsonBackReference
	private ReturnDelivery returnDelivery;
    
	@CreationTimestamp
	private Timestamp createDate;
}