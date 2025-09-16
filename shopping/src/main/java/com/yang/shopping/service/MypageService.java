package com.yang.shopping.service;

import java.sql.Timestamp;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yang.shopping.model.Delivery;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.RoleType;
import com.yang.shopping.model.Users;
import com.yang.shopping.repository.DeliveryRepository;
import com.yang.shopping.repository.MypageRepository;
import com.yang.shopping.repository.ProductRepository;
import com.yang.shopping.repository.UserRepository;


/*
 * 트랜잭션 관리 때문에 서비스 단위를 사용한다.
 * 여러개 서비스(DML)를 동시에 처리할때 순차적으로 처리하기위해 트랜잭션관리가 필요하다.
*/
//service 어노테이션을 붙이면 컴포넌트 스캔을 통해 Bean에 등록을 해준다.
@Service
public class MypageService {

	@Autowired
    private final DeliveryRepository deliveryRepository;

	@Autowired
    private final ProductRepository productRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private MypageRepository mypageRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;

    MypageService(ProductRepository productRepository, DeliveryRepository deliveryRepository) {
        this.productRepository = productRepository;
        this.deliveryRepository = deliveryRepository;
    }

	@Transactional(readOnly = true)
	public Users findUser(String username) {
		Users user = userRepository.findByUsername(username).orElseGet(()->{
			return new Users();
		});
		return user;
	}

	//회원정보 수정
	@Transactional
	public void updateUser(Users user) {
		Users Persistence = userRepository.findById(user.getId())
			.orElseThrow(()->{
				return new IllegalArgumentException("회원 수정 실패 : 유저 정보가 없습니다.");
			});
		Persistence.setPassword(encoder.encode(user.getPassword()));
		Persistence.setEmail(user.getEmail());
	}

	public List<Delivery> getWeekBuyList(Users user) {
		List<Delivery> result = mypageRepository.getWeekBuyList(user.getId()).orElse(null);
		return result;
	}


	//수정할 제품 정보 불러오기
	@Transactional(readOnly = true)
	public List<Delivery> recentlyBuyItem(String id) {
		PageRequest pageRequest = PageRequest.of(0, 10); // 첫 페이지, 10개
		List<Delivery> deliveries = deliveryRepository.recentlyBuyItem(id, pageRequest);

		return deliveries;
		//return productRepository.findById(id).orElse(null);
	}

	public LocalDate getStartOfWeek() {
	    return LocalDate.now().with(DayOfWeek.MONDAY);
	}

	public LocalDate getEndOfWeek() {
	    return LocalDate.now().with(DayOfWeek.SUNDAY);
	}
	
	//수정할 제품 정보 불러오기
	@Transactional(readOnly = true)
	public List<Object> findWeeklyPurchases(int id) {
		LocalDate start = LocalDate.now().with(DayOfWeek.MONDAY);
		LocalDate end = LocalDate.now().with(DayOfWeek.SUNDAY);

		Timestamp startTs = Timestamp.valueOf(start.atStartOfDay());
		Timestamp endTs = Timestamp.valueOf(end.atTime(LocalTime.MAX)); // 23:59:59

		List<Object> result = mypageRepository.findWeeklyPurchases(startTs, endTs, id);
		return result;
    }

	//수정할 제품 정보 불러오기
	@Transactional(readOnly = true)
	public List<Object> orderList(int id) {
		List<Object> result = mypageRepository.orderList(id);
		return result;
    }
	
}
