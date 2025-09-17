package com.yang.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yang.shopping.model.RoleType;
import com.yang.shopping.model.Users;
import com.yang.shopping.repository.UserRepository;



/*
 * 트랜잭션 관리 때문에 서비스 단위를 사용한다.
 * 여러개 서비스(DML)를 동시에 처리할때 순차적으로 처리하기위해 트랜잭션관리가 필요하다.
*/
//service 어노테이션을 붙이면 컴포넌트 스캔을 통해 Bean에 등록을 해준다.
@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;

	@Transactional(readOnly = true)
	public Users findUser(String username) {
		Users user = userRepository.findByUsername(username).orElseGet(()->{
			return new Users();
		});
		return user;
	}
	
	//이 트랜잭션 어노테이션으로 해당 서비스를 하나의 트랜잭션 단위로 묶었다.
	@Transactional
	public int join(Users user) {
		try {
			String encode = encoder.encode(user.getPassword());
			
			user.setPassword(encode);
			user.setRole(RoleType.USER);
			
			userRepository.save(user);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("UserService : 회원가입() : "+e.getMessage());
			return -1;
		}
	}

	//회원정보 수정
	@Transactional
	public void updateUser(Users user) {
		Users Persistence = userRepository.findById(user.getId())
			.orElseThrow(()->{
				return new IllegalArgumentException("회원 수정 실패 : 유저 정보가 없습니다.");
			});
		Persistence.setPassword(encoder.encode(user.getPassword()));
		Persistence.setName(user.getName());
		Persistence.setPhone(user.getPhone());
		Persistence.setEmail(user.getEmail());
		Persistence.setMainAddr(user.getMainAddr());
		Persistence.setDetailAddr(user.getDetailAddr());
		Persistence.setZoneCode(user.getZoneCode());
	}

	
	
//	//아래 메서드는 select라 트랜잭션에 설정을 한다.
//	//readonly옵션은 : select 시 트랜잭션 시작, 서비스 종료시 트랜잭션 종료한다.
//	@Transactional(readOnly = true)
//	public Users login(Users user) {
//		return userRepository.findUsersNameAndPassword(user.getUsername(), user.getPassword());
//	}
}
