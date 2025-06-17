package com.yang.shopping.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.yang.shopping.model.Board;
import com.yang.shopping.service.BoardService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping({"", "/"})
	public String index(Model model, 
			@PageableDefault(size = 3, sort = "id", direction = Direction.DESC) Pageable pageable) {
		/* @AuthenticationPrincipal PrincipalDetail principal */
		//스프링 시큐리티에서 작성한 로그인처리 로직이 끝난다음에 principal 객체에 정보가 담겨진다.
		Page<Board> boards = boardService.selectAllBoard(pageable);
		
		model.addAttribute("boards", boards);
		
		return "main";
	}

	@GetMapping("/board/{id}")
	public String findById(@PathVariable int id, Model model) {
		//스프링 시큐리티에서 작성한 로그인처리 로직이 끝난다음에 principal 객체에 정보가 담겨진다.
		//System.out.println("로그인 사용자 : "+principal.getUsername());
		model.addAttribute("board", boardService.boardDetail(id));
		return "board/detail";
	}

	@GetMapping("/board/{id}/updateForm")
	public String boardUpdate(@PathVariable int id, Model model) {
		//스프링 시큐리티에서 작성한 로그인처리 로직이 끝난다음에 principal 객체에 정보가 담겨진다.
		//System.out.println("로그인 사용자 : "+principal.getUsername());
		model.addAttribute("board", boardService.boardDetail(id));
		return "board/updateForm";
	}
	
	@GetMapping("/board/saveForm")
	public String saveForm() {
		//스프링 시큐리티에서 작성한 로그인처리 로직이 끝난다음에 principal 객체에 정보가 담겨진다.
		//System.out.println("로그인 사용자 : "+principal.getUsername());
		
		return "board/saveForm";
	}
}