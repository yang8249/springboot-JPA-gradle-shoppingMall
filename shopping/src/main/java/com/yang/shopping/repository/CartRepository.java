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
import com.yang.shopping.model.Wish;


//DAO를 여기서 처리한다.
//자동으로 Bean등록이 된다. (@Repository 어노테이션을 생략가능함)
public interface CartRepository extends JpaRepository<Cart, Integer>{
	
    @Query("SELECT p FROM Product p WHERE p.category = :category")
    Page<Cart> findByCategory(@Param("category") String category, Pageable pageable);


    @Query("SELECT p FROM Cart p WHERE p.user.id = :userId")
    Optional<List<Cart>> findUserIdCartList(@Param("userId") int userId);
    
    @Query("SELECT p FROM Cart p WHERE p.product.id = :id and p.user.id = :userId")
    Optional<Cart> customFindByCart(@Param("id") int productId, @Param("userId") int userId);
	
}