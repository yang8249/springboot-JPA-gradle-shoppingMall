package com.yang.shopping.config.auth;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.yang.shopping.model.Users;
import com.yang.shopping.repository.UserRepository;

@Service
public class PrincipalDetailService implements UserDetailsService{

	@Autowired
	private UserRepository userRepository;
	
	/*
	 * 스프링이 로그인 요청을 가로챌때, username과 password 변수 2개를 가로채는데
	 * password는 시큐리티가 알아서하게된다.
	 * 하지만 username은 안하니까 따로 처리해준다.
	 * DB에 username이 존재하는지 확인하면됨.
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		// 유저 네임이 존재하는지 DB 탐색
		Users principal = userRepository.findByUsername(username)
				.orElseThrow(()->{ //값을 못찾았을경우 예외처리를 발생함.
					//예외 내용은 유저를 찾을수없다고 정의함.
					return new UsernameNotFoundException("해당 사용자를 찾을 수 없습니다. :"+username);
				});
		
		//위에서 검색 후 찾은 사용자 정보를 PrincipalDatil에 있는 user 객체 생성으로 만든다.
		//그리고 찾은 유저정보는 시큐리티 세션에 담아지게된다.
		return new PrincipalDetail(principal);
	}

	
}
