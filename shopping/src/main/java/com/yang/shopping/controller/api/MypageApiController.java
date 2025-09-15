package com.yang.shopping.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.yang.shopping.dto.ResponseDto;
import com.yang.shopping.model.Delivery;
import com.yang.shopping.model.Users;
import com.yang.shopping.service.MypageService;
import com.yang.shopping.service.UserService;

import jakarta.servlet.http.HttpSession;

@RestController
public class MypageApiController {

	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	//구매현황 (최근7일) 정보 가져오기
	@PostMapping("/api/mypage/weekBuyData")
	public ResponseDto<List<Delivery>> getWeekBuyList(@RequestBody Users user) {
		
		//사용자 id값으로 정보 가져오기
		List<Delivery> result = mypageService.getWeekBuyList(user);
		
		return new ResponseDto<List<Delivery>>(HttpStatus.OK.value(), result);
	}

	//여기다 최근구매목록 10개 데이터 가져오기
	@PostMapping("/api/mypage/newBuyData")
	public ResponseDto<Integer> getNewBuyList(@RequestBody Users user) {
		
		return null;
	}
	
	

	//사용자 정보 가져오기
//	@PostMapping("/mypage/selectAccountInfo{id}")
//	public ResponseDto<Integer> selectAccountInfo(@RequestBody Users user) {
//		
//		//사용자 id값으로 정보 가져오기 **비밀번호는 빼고!
//		int result = mypageService.findUser(user);
//		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
//	}

	
	
	
}
