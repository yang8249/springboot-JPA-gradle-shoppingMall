package com.yang.shopping.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

import com.yang.shopping.config.auth.PrincipalDetailService;

import jakarta.servlet.DispatcherType;

//컨피그레이션 설정을 해야 스프링 컨테이너에서 빈 관리를 할 수있다.
// 결론 : 컨피그레이션을 써야 빈 등록이 됨.

//EnableWebSecurity : 시큐리티라는 필터를 추가
// 기존 스프링 시큐리티 설정을 이 파일에서 진행하겠다. 라는 의미이다.

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Autowired
	private PrincipalDetailService principalDetailService;
	
	@Bean
	protected BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
	
	/*
	 * 시큐리티가 대신 로그인할때 비밀번호를 가로채는데
	 * 해당 password가 어떤 방법으로 암호화되었는지 알아야
	 * DB에 저장된 해쉬값과 비교가 가능하다.
	*/
    @Bean
    protected AuthenticationManager customAuthenticationManager(HttpSecurity http) throws Exception {
        return http.getSharedObject(AuthenticationManagerBuilder.class)  // HttpSecurity에서 AuthenticationManagerBuilder 가져오기
            .userDetailsService(principalDetailService)  // UserDetailsService 설정
            .passwordEncoder(encoder())  // PasswordEncoder 설정
            .and()  // 설정 완료 후
            .build();  // AuthenticationManager 객체 생성
    }
	
	@Bean
	protected AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }
	
	@Bean
    protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		http
		 .csrf((csrfConfig) ->
         		csrfConfig.disable()
			 ) // csrf 토큰 비활성화 (테스트시 걸어두는게 좋음) 추후 지울 예정 (보안설정필요)
		 .authorizeHttpRequests((request) -> 
		 	
		 	// 서버 내부에서 처리하는건 FORWARD인데, 스프링시큐리티는
		 	// 기본적으로 REQUEST 방식에 대한 필터라서 이렇게 dispatcher 설정을 해줘야한다.
		 	// 이거 안하면 무한 리다이렉트 걸림 ㅠ
            request.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
		     //.requestMatchers().authenticated()
		     .anyRequest().permitAll() //permitAll은 권한없어도 OK해주는 옵션
		     
		 )
	     .formLogin(login -> login
	    		 //초기 로그인 페이지를 커스텀해서 내 JSP로 넘기는 필터임.
	 		     .loginPage("/auth/loginForm")
	 		     .loginProcessingUrl("/auth/loginProc")
	             .defaultSuccessUrl("/", true)
	             .permitAll() //permitAll은 권한없어도 OK해주는 옵션
	     );
		
		return http.build();
	}
}
