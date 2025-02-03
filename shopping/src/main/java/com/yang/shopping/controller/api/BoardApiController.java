package com.yang.shopping.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.yang.shopping.config.auth.PrincipalDetail;
import com.yang.shopping.dto.ResponseDto;
import com.yang.shopping.model.Board;
import com.yang.shopping.service.BoardService;

import jakarta.servlet.http.HttpSession;

@RestController
public class BoardApiController {

	@Autowired
	private BoardService boardService;
	
	@PostMapping("/api/board")
	public ResponseDto<Board> saveBoard(@RequestBody Board board, @AuthenticationPrincipal PrincipalDetail principal) {
		
		boardService.saveContent(board, principal.getUser());
		
		return new ResponseDto<Board>(HttpStatus.OK.value(), board);
	}

	@PutMapping("/api/board/{id}")
	public ResponseDto<Integer> updateBoard(@PathVariable int id, @RequestBody Board board){
		boardService.updateBoard(id, board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@DeleteMapping("/api/board/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id){
		boardService.deleteBoard(id);
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
