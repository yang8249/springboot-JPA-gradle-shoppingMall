package com.yang.shopping.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yang.shopping.model.Cart;
import com.yang.shopping.model.Delivery;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.Users;
import com.yang.shopping.model.Wish;
import com.yang.shopping.repository.CartRepository;
import com.yang.shopping.repository.PayRepository;
import com.yang.shopping.repository.ProductRepository;
import com.yang.shopping.repository.UserRepository;
import com.yang.shopping.repository.WishRepository;




/*
 * 트랜잭션 관리 때문에 서비스 단위를 사용한다.
 * 여러개 서비스(DML)를 동시에 처리할때 순차적으로 처리하기위해 트랜잭션관리가 필요하다.
*/
//service 어노테이션을 붙이면 컴포넌트 스캔을 통해 Bean에 등록을 해준다.
@Service
public class PayService {

	@Autowired
	private PayRepository payRepository;
	


	@Transactional
	public void insertPay(Users user, Delivery delivery, Cart cart, Product product) {
		try {
				delivery.setMainAddr(delivery.getMainAddr());
				delivery.setDetailAddr(delivery.getDetailAddr());
				delivery.setZoneCode(delivery.getZoneCode());
				delivery.setPhone(delivery.getPhone());
				delivery.setBank(delivery.getBank());
				delivery.setPayCustomer(delivery.getPayCustomer());
				delivery.setDetailInfo1(delivery.getDetailInfo1());
				delivery.setDetailInfo2(delivery.getDetailInfo2());
				delivery.setUser(user);
			 
				payRepository.save(delivery);
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("BoardService : 글쓰기() : "+e.getMessage());
		}
	}
	
	
}
