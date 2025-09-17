package com.yang.shopping.controller.api;

import java.security.Principal;
import java.text.NumberFormat;
import java.util.List;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yang.shopping.config.auth.PrincipalDetail;
import com.yang.shopping.dto.CartDto;
import com.yang.shopping.dto.DeliveryDto;
import com.yang.shopping.dto.ProductDto;
import com.yang.shopping.dto.ResponseDto;
import com.yang.shopping.dto.WishDto;
import com.yang.shopping.model.Board;
import com.yang.shopping.model.Cart;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.Users;
import com.yang.shopping.service.DeliveryService;
import com.yang.shopping.service.ProductService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpSession;

@RestController
public class ProductApiController {

	@Autowired
	private ProductService productService;

	@Autowired
	private DeliveryService deliveryService;
	
	//제품 등록
	@PostMapping("/api/Product/addProduct")
	public ResponseDto<ProductDto> addProduct(
		    @RequestParam("product") String productJson, 
						@RequestParam List<MultipartFile> file) throws JsonMappingException, JsonProcessingException {

	    // JSON 문자열을 Product 객체로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    Product product = objectMapper.readValue(productJson, Product.class);

	    // ProductDto 생성
	    ProductDto productDto = new ProductDto();
	    productDto.setProduct(product);
	    productDto.setFile(file);
	    
		System.out.println("product : "+productDto.getProduct());
		System.out.println("fileInfo : "+productDto.getFile());
		
		productService.insertAddProduct(productDto);
		
		return new ResponseDto<ProductDto>(HttpStatus.OK.value(), null);
	}
	
	//장바구니 등록
	@PostMapping("/api/Product/addCart")
	public ResponseDto<CartDto> addCart(@RequestBody CartDto cartDto) {
		
		productService.insertAddCart(cartDto.getCart(), cartDto.getProduct(), cartDto.getUser());

		System.out.println("cartDto : "+cartDto.getCart());
		System.out.println("product : "+cartDto.getProduct());
		System.out.println("user : "+cartDto.getUser());
		
		return new ResponseDto<CartDto>(HttpStatus.OK.value(), cartDto);
	}

	//장바구니 삭제
	@DeleteMapping("/api/Product/removeCart")
	public ResponseDto<CartDto> removeCart(@RequestBody CartDto cartDto) {
		
		productService.deleteAddCart(cartDto.getCart(), cartDto.getProduct(), cartDto.getUser());
		
		return new ResponseDto<CartDto>(HttpStatus.OK.value(), cartDto);
	}
	
	//찜 등록
	@PostMapping("/api/Product/addWish")
	public ResponseDto<WishDto> addWish(@RequestBody WishDto wishDto) {
		
		productService.insertAddWish(wishDto.getWish(), wishDto.getProduct(), wishDto.getUser());
		
		return new ResponseDto<WishDto>(HttpStatus.OK.value(), wishDto);
	}

	//찜 삭제
	@DeleteMapping("/api/Product/removeWish")
	public ResponseDto<WishDto> removeWish(@RequestBody WishDto wishDto) {
		
		productService.deleteAddWish(wishDto.getWish(), wishDto.getProduct(), wishDto.getUser());
		
		return new ResponseDto<WishDto>(HttpStatus.OK.value(), wishDto);
	}
	
	//제품 삭제
	@DeleteMapping("/api/Product/removeProduct")
	public ResponseDto<ProductDto> removeProduct(@RequestBody ProductDto productDto) {
		
		productService.deleteProduct(productDto.getProduct());
		
		return new ResponseDto<ProductDto>(HttpStatus.OK.value(), productDto);
	}

	//반품 요청 (딜리버리 삭제는 나중에)
	//반품 테이블먼저 insert 칠거임 ㅋ
	@DeleteMapping("/api/Product/removeDelivery")
	public ResponseDto<DeliveryDto> removeDelivery(@RequestBody DeliveryDto deliveryDto) {
		
		deliveryService.removeDelivery(deliveryDto);
		
		return new ResponseDto<DeliveryDto>(HttpStatus.OK.value(), deliveryDto);
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