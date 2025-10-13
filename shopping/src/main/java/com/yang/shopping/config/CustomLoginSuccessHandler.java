package com.yang.shopping.config;

import java.io.IOException;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.yang.shopping.config.auth.PrincipalDetail;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {

        PrincipalDetail principal = (PrincipalDetail) authentication.getPrincipal();
        int userId = principal.getId();

        // 세션에 userId 저장
        HttpSession session = request.getSession();
        session.setAttribute("userId", userId);

        // 로그인 후 이동할 경로
        response.sendRedirect("/"); // 또는 "/chat" 등 원하는 경로
    }
}