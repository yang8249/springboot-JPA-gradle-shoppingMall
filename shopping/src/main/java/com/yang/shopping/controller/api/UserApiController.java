package com.yang.shopping.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.yang.shopping.dto.ResponseDto;
import com.yang.shopping.model.Users;
import com.yang.shopping.service.UserService;

import jakarta.servlet.http.HttpSession;

@RestController
public class UserApiController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody Users user) {
		
		//특별한 설정이 없으니 USER 권한으로 세팅한다. 
		// 이건 기본값으로 USER넣어도될듯?
		int result = userService.join(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}

	@PutMapping("/user")
	public ResponseDto<Integer> updateUser(HttpSession session, @RequestBody Users user) {
		userService.updateUser(user);
		//위 서비스가 실행되고나서 DB에 commit이 된 상태이다.
		//하지만 시큐리티세션의 user값은 변경되지 않은상태니, 직접 변경해줘야한다.
		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
		//컨텍스트홀더 객체를 선언하고 그안에 있는 컨텍스트를 꺼낸뒤
		//인증정보를 set해주어서 수정한 user정보로 생성한 authentication 객체를 넣어준다.
		SecurityContextHolder.getContext().setAuthentication(authentication); 
		
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	
	
	
	/*
	 * ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 스프링 시큐리티 적용 전 간단한 로그인 로직
	 * @PostMapping("/api/user/login") public ResponseDto<Integer>
	 * login(@RequestBody Users user, HttpSession session) {
	 * 
	 * Users principal = userService.login(user); System.out.println(principal !=
	 * null); if(principal != null) { session.setAttribute("user", principal); }
	 * return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); }
	 */
	
}
