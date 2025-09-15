package com.yang.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yang.shopping.model.Delivery;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.RoleType;
import com.yang.shopping.model.Users;
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

    private final ProductRepository productRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private MypageRepository mypageRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;

    MypageService(ProductRepository productRepository) {
        this.productRepository = productRepository;
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
	public Product recentlyBuyItem(String id) {
		return productRepository.getProductWithFileInfo(id).orElse(null);
		//return productRepository.findById(id).orElse(null);
	}

}
