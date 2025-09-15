package com.yang.shopping.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.yang.shopping.model.Product;


//DAO를 여기서 처리한다.
//자동으로 Bean등록이 된다. (@Repository 어노테이션을 생략가능함)
public interface ProductRepository extends JpaRepository<Product, Integer>{
	
    @Query("SELECT p FROM Product p LEFT JOIN FETCH p.fileInfo WHERE p.category = :category")
    Page<Product> findByCategory(@Param("category") String category, Pageable pageable);

    @Query("SELECT p FROM Product p LEFT JOIN FETCH p.fileInfo WHERE p.productSeq = :productSeq")
    Optional<Product> getProductWithFileInfo(@Param("productSeq") int id);

    @Query("SELECT p FROM Product p LEFT JOIN FETCH p.fileInfo WHERE p.user.userId = :userId ORDER BY p.purchaseDate DESCq")
    Optional<Product> recentlyBuyItem(@Param("userId") int id);

	/*d
	 * @Query("SELECT p, fi FROM Product p " +
	 * "LEFT JOIN FileInfo fi on p.productSeq = fi.productSeq" +
	 * "ORDER BY p.createDate DESC ") List<Product> findByNewProduct();
	 */

	
}