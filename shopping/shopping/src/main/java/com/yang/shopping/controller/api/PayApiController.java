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
import org.springframework.web.bind.annotation.RestController;

import com.yang.shopping.config.auth.PrincipalDetail;
import com.yang.shopping.dto.PayDto;
import com.yang.shopping.dto.ResponseDto;
import com.yang.shopping.dto.WishDto;
import com.yang.shopping.model.Board;
import com.yang.shopping.model.Cart;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.Users;
import com.yang.shopping.service.PayService;
import com.yang.shopping.service.ProductService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpSession;

@RestController
public class PayApiController {

	@Autowired
	private PayService payService;
	
	//결제하기
	@PostMapping("/api/pay/insertPay")
	public ResponseDto<PayDto> addCart(@RequestBody PayDto payDto) {
		
		System.out.println("users : "+payDto.getUsers());
		System.out.println("delivery : "+payDto.getDelivery());
		System.out.println("cart : "+payDto.getCart());
		System.out.println("product : "+payDto.getProduct());
		
		payService.insertPay(payDto.getUsers(), payDto.getDelivery(), payDto.getCart(), payDto.getProduct());

		
		return new ResponseDto<PayDto>(HttpStatus.OK.value(), payDto);
	}
	
}