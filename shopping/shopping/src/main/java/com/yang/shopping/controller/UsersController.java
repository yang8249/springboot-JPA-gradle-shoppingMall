package com.yang.shopping.controller;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.reactive.function.client.WebClient;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yang.shopping.config.auth.PrincipalDetail;
import com.yang.shopping.model.KakaoProfile;
import com.yang.shopping.model.OAuthToken;
import com.yang.shopping.model.Users;
import com.yang.shopping.service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//인증이 안된 유저들에 대해서는 /auth~ 경로만 허용하는 필터를 적용한다.
@Controller
public class UsersController {

    @Value("${yang.key}")
    private String ykey;

	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private HttpSession session;
	
	@GetMapping("/auth/joinForm")
	public String joinForm() {
		
		return "auth/joinForm";
	}

	@GetMapping("/auth/loginForm")
	public String loginForm() {
		
		return "auth/loginForm";
	}

	@GetMapping("/auth/updateForm")
	public String updateForm() {
		
		return "auth/updateForm";
	}

	//@ResponseBody를 사용하면 데이터를 리턴하는 컨트롤러가 된다.
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(String code, HttpServletResponse httpServletResponse) {

		//카카오 토큰발급 API 경로로 웹클라이언트 생성
        WebClient webClient = WebClient.create("https://kauth.kakao.com/oauth/token");
        
        // MultiValueMap을 사용해 x-www-form-urlencoded 데이터 생성
        // x-www-form-urlencoded 형식으로 전송할때에는 Map이 아닌 다중값Map 자료형을 사용해야한다. (같은 Key값 적용.)
        MultiValueMap<String, String> requestBody = new LinkedMultiValueMap<>();
        requestBody.add("grant_type", "authorization_code");
        requestBody.add("client_id", "dec6846c84164e1751cadf8f9581c8dc");
        requestBody.add("redirect_uri", "http://localhost:8000/auth/kakao/callback");
        requestBody.add("code", code);
        
        
        // Jackson라이브러리가 Map자료형을 자동으로 JSON형식으로 변환하여 전송한다.
        // 생성한 경로로 POST 요청을 보낸다.
        String response = webClient.post()
            .header("Content-Type", "application/x-www-form-urlencoded;charset=utf-8") // 헤더 설정
            .bodyValue(requestBody) // JSON 데이터
            .retrieve() // 응답 받기
            .bodyToMono(String.class) // 비동기 처리
            .block(); // 동기 방식으로 결과 가져오기


        ObjectMapper objectMapper = new ObjectMapper();
        OAuthToken oauthToken = null;
        try {
        	//JSON을 Model에 맞춰서 변환하기위해 ObjectMapper를 사용한다. 
			oauthToken = objectMapper.readValue(response, OAuthToken.class);
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        System.out.println("토큰발급 완료 : " + oauthToken.getAccess_token());
        
				
        //카카오 사용자 리소스 API 경로로 웹클라이언트 재생성
        WebClient webClient2 = WebClient.create("https://kapi.kakao.com/v2/user/me");
        

        // 사용자 정보를 JSON형식으로 전달받게된다.
        String response2 = webClient2.post()
    	    .header(HttpHeaders.CONTENT_TYPE, "application/x-www-form-urlencoded;charset=utf-8")
    	    .header(HttpHeaders.AUTHORIZATION, "Bearer " + oauthToken.getAccess_token())
            .retrieve() // 응답 받기
            .bodyToMono(String.class) // 비동기 처리
            .block(); // 동기 방식으로 결과 가져오기


        ObjectMapper objectMapper2 = new ObjectMapper();
        KakaoProfile kakaoProfile = null;
        
        try {
            kakaoProfile = objectMapper2.readValue(response2, KakaoProfile.class);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }


        System.out.println("사용자 전달받기 완료 : " + kakaoProfile);

        // 받아온 카카오톡 프로필을 가지고 강제 회원 등록
        Users kakaoUser = Users.builder()
                    .username(kakaoProfile.getKakao_account().getProfile().getNickname())
                    .password(ykey)
                    .email("kakao@kakao.com") //이메일 동의받는 심사를 받아야해서 임시로 넣음.
                    .oauth("kakao")
                    .build();

        // 이미 가입되어 있는 회원인지 확인
        Users originUser = userService.findUser(kakaoUser.getUsername());

        System.out.println("가입된 카카오 계정인지 확인 : " + originUser);
        if (originUser.getUsername() == null) {
            System.out.println("회원가입 진행 !!");
            userService.join(kakaoUser);
        }

        // 로그인 처리
        System.out.println("로그인처리 진행 !!");
 		// (1. UsernamePasswordAuthenticationToken 토큰 생성시 이제 정확한 정보를 추가해줘야 한다 UserDetails, password, role)
 		// (2. SecurityContext에 Authentication 객체를 추가하면 예전에는 세션이 만들어졌다)
 		// (3. 이제는 보안때문에, 해당 컨텍스트를 세션에 직접 주입해줘야 한다 HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY)
        //kakaoUser.setPassword(ykey);
 		PrincipalDetail principalDetail = new PrincipalDetail(kakaoUser);
 		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(principalDetail, ykey, principalDetail.getAuthorities()));
 		SecurityContext securityContext = SecurityContextHolder.getContext();
 		securityContext.setAuthentication(authentication);
 		session.setAttribute(HttpSessionSecurityContextRepository.
 				SPRING_SECURITY_CONTEXT_KEY, securityContext);
 		
 		// 쿠키 생성 (유효기간: 1시간)
        Cookie cookie = new Cookie("kakaoAccessToken", oauthToken.getAccess_token());
        cookie.setMaxAge(60 * 60); // 1시간 (초 단위)
        cookie.setPath("/"); // 모든 경로에서 접근 가능
        cookie.setHttpOnly(true); // JavaScript에서 접근 불가 (보안 강화)
        cookie.setSecure(false); // HTTPS에서만 전송 (개발 환경에서는 false로 변경 필요)

        // 응답에 쿠키 추가
        httpServletResponse.addCookie(cookie);
        
        return "redirect:/";
	}
	
	@GetMapping("/auth/kakao/logout")
	public String kakaoLogout(@CookieValue(value = "kakaoAccessToken", required = false) String accessToken) {

        System.out.println("accessToken : " + accessToken);
		
//		String logoutURL = "https://kauth.kakao.com/oauth/logout?"
//        		+ "client_id=dec6846c84164e1751cadf8f9581c8dc&"
//        		+ "logout_redirect_uri=http://localhost:8000";
//
//		WebClient webClient1 = WebClient.create(logoutURL);
//		String response1 = null;
//		try {
//      	
//	        // 사용자 정보를 JSON형식으로 전달받게된다.
//			response1 = webClient1.get()
//	    	    .header(HttpHeaders.CONTENT_TYPE, "application/x-www-form-urlencoded;charset=utf-8")
//	            .retrieve() // 응답 받기
//	            .bodyToMono(String.class) 
//	            .block(); // 동기 방식으로 결과 가져오기
//	        
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

//        System.out.println("response1 !! " + response1);
      
		//카카오 사용자 리소스 API 경로로 웹클라이언트 재생성
        WebClient webClient2 = WebClient.create("https://kapi.kakao.com/v1/user/logout");
        String response2 = null;
        try {
        	
	        // 사용자 정보를 JSON형식으로 전달받게된다.
	        response2 = webClient2.post()
	    	    .header(HttpHeaders.CONTENT_TYPE, "application/x-www-form-urlencoded;charset=utf-8")
	    	    .header(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken)
	            .retrieve() // 응답 받기
	            .bodyToMono(String.class) 
	            .block(); // 동기 방식으로 결과 가져오기
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
      System.out.println("response2 !! " + response2);
	        
        return "redirect:/logout";
	}
	
	@GetMapping("/user/mypageForm")
	public String mypageForm(String page, Model model) {
		
		System.out.println("page : "+page);
		if(page != null || page != "") {
			model.addAttribute("page", page);
		}
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		
		if (authentication.getPrincipal() instanceof String && authentication.getPrincipal().equals("anonymousUser")) {
			System.out.println("사용자가 로그인하지 않았습니다."); 
			return "main";
	    } else {
	    	System.out.println("사용자가 로그인했습니다."); 
		  	model.addAttribute("principal", authentication.getPrincipal()); 
	    }
		
		return "user/mypageForm";
	}
}