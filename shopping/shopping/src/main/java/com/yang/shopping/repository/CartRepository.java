package com.yang.shopping.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.yang.shopping.model.Cart;
import com.yang.shopping.model.Product;


//DAO를 여기서 처리한다.
//자동으로 Bean등록이 된다. (@Repository 어노테이션을 생략가능함)
public interface CartRepository extends JpaRepository<Cart, Integer>{
	
    @Query("SELECT p FROM Product p WHERE p.category = :category")
    Page<Cart> findByCategory(@Param("category") String category, Pageable pageable);


	
}