package com.yang.shopping.config.auth;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.google.gson.Gson;
import com.yang.shopping.model.Users;
import com.yang.shopping.repository.UserRepository;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class PrincipalDetailService implements UserDetailsService{

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private HttpServletResponse response;
	
	@Autowired
	private HttpServletRequest request;
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

		  Cookie userCookie = new Cookie("username", username); // 쿠키 생성 (이름, 값)
	        userCookie.setMaxAge(3600); // 1일 동안 유지
	        userCookie.setPath("/"); // 모든 경로에서 쿠키 사용 가능
	        userCookie.setHttpOnly(false); // JavaScript에서 접근 불가능 (보안 강화)
	        response.addCookie(userCookie); // 응답에 쿠키 추가

	        
	        // Json으로 유저정보 보내볼까하다가 안함 ㅋ
//			String json = new Gson().toJson(principal);
//			request.setAttribute("user", json);
			
			
		return new PrincipalDetail(principal);
	}

	
}
