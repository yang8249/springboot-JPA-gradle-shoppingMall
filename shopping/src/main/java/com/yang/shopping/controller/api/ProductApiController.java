package com.yang.shopping.controller.api;

import java.security.Principal;
import java.text.NumberFormat;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.yang.shopping.config.auth.PrincipalDetail;
import com.yang.shopping.dto.CartDto;
import com.yang.shopping.dto.ResponseDto;
import com.yang.shopping.model.Board;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.Users;
import com.yang.shopping.service.ProductService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductApiController {

	@Autowired
	private ProductService productService;

	//장바구니 등록
	@PostMapping("/api/Product/addCart")
	public ResponseDto<CartDto> addCart(@RequestBody CartDto cartDto) {
		
		productService.insertAddCart(cartDto.getProduct(), cartDto.getUser());
		
		return new ResponseDto<CartDto>(HttpStatus.OK.value(), cartDto);
	}

	/*
	 * @PutMapping("/api/board/{id}") public ResponseDto<Integer>
	 * updateBoard(@PathVariable int id, @RequestBody Board board){
	 * productService.updateBoard(id, board); return new
	 * ResponseDto<Integer>(HttpStatus.OK.value(), 1); }
	 * 
	 * @DeleteMapping("/api/board/{id}") public ResponseDto<Integer>
	 * deleteById(@PathVariable int id){ productService.deleteBoard(id); return new
	 * ResponseDto<Integer>(HttpStatus.OK.value(), 1); }
	 */
	
}