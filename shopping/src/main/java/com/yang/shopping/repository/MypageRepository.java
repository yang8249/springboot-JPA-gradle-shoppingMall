package com.yang.shopping.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.yang.shopping.model.Delivery;
import com.yang.shopping.model.Users;

//DAO를 여기서 처리한다.
//자동으로 Bean등록이 된다. (@Repository 어노테이션을 생략가능함)
public interface MypageRepository extends JpaRepository<Delivery, Integer>{
	
	@Query(value = "SELECT *, DATE_FORMAT(p.createDate, '%Y-%m-%d') as date FROM Delivery p WHERE p.userId = :userId", nativeQuery = true)
	Optional<List<Delivery>> getWeekBuyList(@Param("userId") int userId);
	
	
	
	
	
	
	
	//JPA 네이밍 전략
	// 만약 쿼리를 직접 지정하고싶으면 쿼리 어노테이션을 사용하면된다.
	//ex) @Query(value="select * from user;", nativeQuery=true)
	//Users login(String username, String password);
//	@Query(value="select * from users WHERE username = ? and password = ?;"
//			, nativeQuery=true)
//	Users findUsersNameAndPassword(String username, String password);
	
	
}