package com.yang.shopping.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yang.shopping.dto.DeliveryDto;
import com.yang.shopping.model.Cart;
import com.yang.shopping.model.Delivery;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.ReturnDelivery;
import com.yang.shopping.model.Users;
import com.yang.shopping.model.Wish;
import com.yang.shopping.repository.CartRepository;
import com.yang.shopping.repository.DeliveryRepository;
import com.yang.shopping.repository.ProductRepository;
import com.yang.shopping.repository.ReturnRepository;
import com.yang.shopping.repository.UserRepository;
import com.yang.shopping.repository.WishRepository;




/*
 * 트랜잭션 관리 때문에 서비스 단위를 사용한다.
 * 여러개 서비스(DML)를 동시에 처리할때 순차적으로 처리하기위해 트랜잭션관리가 필요하다.
*/
//service 어노테이션을 붙이면 컴포넌트 스캔을 통해 Bean에 등록을 해준다.
@Service
public class DeliveryService {

	@Autowired
	private DeliveryRepository deliveryRepository;

	@Autowired
	private ReturnRepository returnRepository;


	//관리자가 반품오케이 하면
	//구매완료 (delivery) 테이블에 저장된 건 삭제시켜주는 서비수
	@Transactional
	public void removeDelivery(DeliveryDto deliveryDto) {
		try {
			
			//반품요청 시 관리자가 작성할거 빼고 입력받아둠
			ReturnDelivery returnDeli = new ReturnDelivery();
			returnDeli.setReason(null);
			returnDeli.setRefund(null);
			returnDeli.setDelivery(deliveryDto.getDelivery());
			returnDeli.setProduct(deliveryDto.getProduct());
			returnDeli.setUser(deliveryDto.getUser());
		    ReturnDelivery savedReturn = returnRepository.save(returnDeli);  // 제품 저장
			
			if (savedReturn != null) {
			    // 저장 성공
				deliveryRepository.deleteById(deliveryDto.getDelivery().getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DeliveryService : 제품삭제() : "+e.getMessage());
		}
	}



	//선택한 주문정보 디테일 가져오기
	@Transactional
	public Delivery deliveryInfo(int deliId) {
		try {
			
			return deliveryRepository.findById(deliId).orElse(null);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DeliveryService : 제품삭제() : "+e.getMessage());
		}
		return null;
	}
	
	
	
}
