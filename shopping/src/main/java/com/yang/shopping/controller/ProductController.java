package com.yang.shopping.controller;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yang.shopping.config.auth.PrincipalDetail;
import com.yang.shopping.controller.api.ProductApiController;
import com.yang.shopping.model.Cart;
import com.yang.shopping.model.Delivery;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.Wish;
import com.yang.shopping.service.CartService;
import com.yang.shopping.service.DeliveryService;
import com.yang.shopping.service.ProductService;
import com.yang.shopping.service.WishService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {


	@Autowired
	private ProductService productService;

	@Autowired
	private WishService wishService;
	
	@Autowired
	private CartService cartService;

	@Autowired
	private DeliveryService deliveryService;
	

	// 제품 목록
	@GetMapping("/products")
	public String productList(@RequestParam String category, Model model, HttpSession session,
			@PageableDefault(size = 10, sort = "productSeq", direction = Direction.DESC) Pageable pageable) {
		// 스프링 시큐리티에서 작성한 로그인처리 로직이 끝난다음에 principal 객체에 정보가 담겨진다.
		// System.out.println("로그인 사용자 : "+principal.getUsername());
		
		model.addAttribute("newProducts", productService.selectNewProduct());
		model.addAttribute("files", productService.selectNewProduct());
		//여기다 최대 4개만 뽑는 최신등록 제품 가져오기
		
		model.addAttribute("products", productService.selectProduct(category, pageable));
		model.addAttribute("category", category);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		
		if (authentication.getPrincipal() instanceof String && authentication.getPrincipal().equals("anonymousUser")) {
			System.out.println("사용자가 로그인하지 않았습니다."); 
	    } else {
	    	PrincipalDetail principal = (PrincipalDetail) authentication.getPrincipal();
	    	System.out.println("사용자가 로그인했습니다."); 
	    	int userId = principal.getUser().getId();
		  	System.out.println(principal.getUser().getId());
		  	model.addAttribute("wishs", wishService.userWishList(userId)); 
	    }
		 
		
		return "product/products";
	}
	
	// 제품 목록
		@PostMapping("/searchProductList")
		@ResponseBody
		public Page<Product> searchProductList(
				@RequestBody List<Map<String, Object>> articles,
		        //@RequestParam("jsonData") String jsonData,
		        Model model, HttpSession session,
				@PageableDefault(size = 10, sort = "productSeq", direction = Direction.DESC) Pageable pageable) throws JsonMappingException, JsonProcessingException {
			

//		    ObjectMapper mapper = new ObjectMapper();
//		    List<Map<String, Object>> articles = mapper.readValue(
//		        jsonData, new TypeReference<List<Map<String, Object>>>() {});
		    
		    // JSON에서 productId만 추출
		    List<String> ids = articles.stream()
		                               .map(a -> (String) a.get("productId"))
		                               .collect(Collectors.toList());

			
			Page<Product> products = productService.searchProduct(ids, pageable);

		    // 세션에 저장
		    session.setAttribute("searchedProducts", products);
		    model.addAttribute("products", products);
		    
		    
			
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

			
			if (authentication.getPrincipal() instanceof String && authentication.getPrincipal().equals("anonymousUser")) {
				System.out.println("사용자가 로그인하지 않았습니다."); 
		    } else {
		    	PrincipalDetail principal = (PrincipalDetail) authentication.getPrincipal();
		    	System.out.println("사용자가 로그인했습니다."); 
		    	int userId = principal.getUser().getId();
			  	System.out.println(principal.getUser().getId());
			  	model.addAttribute("wishs", wishService.userWishList(userId)); 
		    }
			 
			
			return products;
		}

		// 조회 후 페이지 이동
		@SuppressWarnings("unchecked")
		@GetMapping("/productListPage")
	public String productListPage(HttpSession session, Model model) {
	    Page<Product> products = (Page<Product>) session.getAttribute("searchedProducts");
	    
	    model.addAttribute("products", products);
		model.addAttribute("newProducts", productService.selectNewProduct());
		model.addAttribute("files", productService.selectNewProduct());
		//여기다 최대 4개만 뽑는 최신등록 제품 가져오기
	    
		return "product/products";
	}
		
	// 제품 상세 정보
	@GetMapping("/product/detailProduct")
	public String detailProduct(@RequestParam int id, @RequestParam String userId, Model model) {
		// 스프링 시큐리티에서 작성한 로그인처리 로직이 끝난다음에 principal 객체에 정보가 담겨진다.
		// System.out.println("로그인 사용자 : "+principal.getUsername());

		/*
		 * model.addAttribute("newProducts", productService.selectNewProduct()); //여기다
		 * 최대 4개만 뽑는 최신등록 제품 가져오기
		 * 
		 * model.addAttribute("products", productService.selectProduct(category,
		 * pageable)); model.addAttribute("category", category);
		 */
		System.out.println("userId : "+userId);
		Product product = productService.productInfo(id);
		if(!userId.isEmpty()) {
			Wish wish = wishService.wishInfo(id, Integer.parseInt(userId));
			model.addAttribute("wish", wish);
			Cart cart = cartService.cartInfo(id, Integer.parseInt(userId));
			model.addAttribute("cart", cart);
		}

		model.addAttribute("product", product);
		model.addAttribute("productSeq",id);
		//model.addAttribute("wish", wish);
		
        // 천 단위 콤마 추가
        NumberFormat formatter = NumberFormat.getNumberInstance(Locale.KOREA);
        String formattedAmount = formatter.format(product.getPrice()) + "원";

		model.addAttribute("productPrice",formattedAmount);
		
		//Json으로 유저정보 보내볼려다가 걍 안함
//		String json = new Gson().toJson(principal);
//		request.setAttribute("user", json);
		
		return "product/detailProduct";
	}

	// 제품 등록
	@GetMapping("/product/addProduct")
	public String addProduct() {
		
		return "product/addProduct";
	}
	

	// 반품 페이지
	@GetMapping("/product/writeReturnItem")
	public String addProduct(@RequestParam int id, @RequestParam int userId, Model model) {
		
		System.out.println("배송 id : "+id);
		System.out.println("유저 id : "+userId);
		Delivery delivery = deliveryService.deliveryInfo(id);

		model.addAttribute("delivery", delivery);
		
		return "product/returnProduct";
	}

	// 제품 수정
	@GetMapping("/product/modifyProduct")
	public String modifyProduct(@RequestParam int id, Model model) {
		
		Product product = productService.productInfo(id);

		model.addAttribute("product", product);
		
		return "product/modifyProduct";
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