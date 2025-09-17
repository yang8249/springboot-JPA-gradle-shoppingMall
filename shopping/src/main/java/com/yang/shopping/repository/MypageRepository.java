package com.yang.shopping.repository;

import java.sql.Timestamp;
import java.time.LocalDate;
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
	

	//@Query("SELECT d FROM Delivery d LEFT JOIN FETCH d.product WHERE d.createDate BETWEEN :start AND :end AND d.user.id = :userId ORDER BY d.createDate DESC")
    @Query(value = """
            WITH RECURSIVE week_days AS (
                SELECT DATE('2025-09-15') AS day
                UNION ALL
                SELECT DATE_ADD(day, INTERVAL 1 DAY)
                FROM week_days
                WHERE day < DATE('2025-09-21')
            )
            SELECT 
                wd.day,
                COUNT(d.id) AS purchase_count,
                GROUP_CONCAT(d.id) AS product_ids,
                COUNT(p1.productSeq) as outerwear,
                COUNT(p2.productSeq) as tops,
                COUNT(p3.productSeq) as dresses,
                COUNT(p4.productSeq) as bottoms,
                COUNT(p5.productSeq) as accessories
            FROM week_days wd
            LEFT JOIN delivery d ON DATE(d.createDate) = wd.day and d.userId = :userId 
            left join product p1 on p1.productSeq = d.productId and p1.category = 'outerwear'
            left join product p2 on p2.productSeq = d.productId and p2.category = 'tops'
            left join product p3 on p3.productSeq = d.productId and p3.category = 'dresses'
            left join product p4 on p4.productSeq = d.productId and p4.category = 'bottoms'
            left join product p5 on p5.productSeq = d.productId and p5.category = 'accessories'
            GROUP BY wd.day
            ORDER BY wd.day""", nativeQuery = true)
    List<Object> findWeeklyPurchases(
    		@Param("start") Timestamp start,
    		@Param("end") Timestamp end,
    		@Param("userId") int id
		);
	

    // 주문목록 뽑는놈
    @Query("SELECT d FROM Delivery d WHERE d.user.id = :userId ORDER BY d.createDate DESC")
    List<Object> orderList(
    		@Param("userId") int id
		);

    // 주문목록 뽑는놈2
    @Query("SELECT d FROM Cart d WHERE d.user.id = :userId ORDER BY d.createDate DESC")
    List<Object> cartList(
    		@Param("userId") int id
		);
    

    // 주문목록 뽑는놈3
    @Query("SELECT d FROM Wish d WHERE d.user.id = :userId ORDER BY d.createDate DESC")
    List<Object> wishList(
    		@Param("userId") int id
		);
	
	
	
	//JPA 네이밍 전략
	// 만약 쿼리를 직접 지정하고싶으면 쿼리 어노테이션을 사용하면된다.
	//ex) @Query(value="select * from user;", nativeQuery=true)
	//Users login(String username, String password);
//	@Query(value="select * from users WHERE username = ? and password = ?;"
//			, nativeQuery=true)
//	Users findUsersNameAndPassword(String username, String password);
	
	
}