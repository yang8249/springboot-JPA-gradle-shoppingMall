package com.yang.shopping.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.yang.shopping.model.Delivery;
import com.yang.shopping.model.Product;


//DAO를 여기서 처리한다.
//자동으로 Bean등록이 된다. (@Repository 어노테이션을 생략가능함)
public interface DeliveryRepository extends JpaRepository<Delivery, Integer>{
	
    @Query("SELECT p FROM Delivery p LEFT JOIN FETCH p.product WHERE p.user.id = :userId ORDER BY p.createDate DESC")
    List<Delivery> recentlyBuyItem(@Param("userId") String id, Pageable pageable);

	
}