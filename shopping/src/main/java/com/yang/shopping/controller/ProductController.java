package com.yang.shopping.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.yang.shopping.dto.ResponseDto;
import com.yang.shopping.model.Board;
import com.yang.shopping.model.Product;
import com.yang.shopping.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	// 제품 목록
	@GetMapping("/products")
	public String productList(@RequestParam String category, Model model,
			@PageableDefault(size = 10, sort = "productSeq", direction = Direction.DESC) Pageable pageable) {
		// 스프링 시큐리티에서 작성한 로그인처리 로직이 끝난다음에 principal 객체에 정보가 담겨진다.
		// System.out.println("로그인 사용자 : "+principal.getUsername());

		model.addAttribute("newProducts", productService.selectNewProduct());
		//여기다 최대 4개만 뽑는 최신등록 제품 가져오기
		
		model.addAttribute("products", productService.selectProduct(category, pageable));
		model.addAttribute("category", category);
		
		return "product/products";
	}
	
	// 제품 상세 정보
	@GetMapping("/product/detailProduct")
	public String detailProduct(@RequestParam("id") int id, Model model) {
		// 스프링 시큐리티에서 작성한 로그인처리 로직이 끝난다음에 principal 객체에 정보가 담겨진다.
		// System.out.println("로그인 사용자 : "+principal.getUsername());

		/*
		 * model.addAttribute("newProducts", productService.selectNewProduct()); //여기다
		 * 최대 4개만 뽑는 최신등록 제품 가져오기
		 * 
		 * model.addAttribute("products", productService.selectProduct(category,
		 * pageable)); model.addAttribute("category", category);
		 */
		
		return "product/detailProduct";
	}

	/*
	 * public String index(Model model,
	 * 
	 * @PageableDefault(size = 3, sort = "id", direction = Direction.DESC) Pageable
	 * pageable) {
	 * 
	 * @AuthenticationPrincipal PrincipalDetail principal //스프링 시큐리티에서 작성한 로그인처리 로직이
	 * 끝난다음에 principal 객체에 정보가 담겨진다. Page<Product> products =
	 * productService.selectAllProduct(pageable);
	 * 
	 * model.addAttribute("products", products);
	 * 
	 * return "main"; }
	 * 
	 * //제품 디테일
	 * 
	 * @GetMapping("/product/{id}") public String findById(@PathVariable int id,
	 * Model model) { //스프링 시큐리티에서 작성한 로그인처리 로직이 끝난다음에 principal 객체에 정보가 담겨진다.
	 * //System.out.println("로그인 사용자 : "+principal.getUsername());
	 * model.addAttribute("product", productService.productDetail(id)); return
	 * "product/detail"; }
	 * 
	 * //제품 수정
	 * 
	 * @GetMapping("/product/{id}/updateForm") public String
	 * productUpdate(@PathVariable int id, Model model) { //스프링 시큐리티에서 작성한 로그인처리 로직이
	 * 끝난다음에 principal 객체에 정보가 담겨진다.
	 * //System.out.println("로그인 사용자 : "+principal.getUsername());
	 * model.addAttribute("product", productService.productDetail(id)); return
	 * "product/updateForm"; }
	 * 
	 * //제품 저장
	 * 
	 * @GetMapping("/product/saveForm") public String saveForm() { //스프링 시큐리티에서 작성한
	 * 로그인처리 로직이 끝난다음에 principal 객체에 정보가 담겨진다.
	 * //System.out.println("로그인 사용자 : "+principal.getUsername());
	 * 
	 * return "product/saveForm"; }
	 */
}