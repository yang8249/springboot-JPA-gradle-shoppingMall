<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">

	<!-- action="/auth/loginProc" 으로 보낸 submit이 
		스프링 시큐리티에서 자동으로 가로채가지고 
		authenticationManager 메서드로 이동하게된다
	 -->
  	<form action="/auth/loginProc" method="post" class="was-validated">
	  <div class="form-group">
	    <label for="username">Username</label>
	    <input type="text" name="username" class="form-control" id="username" placeholder="Enter username" name="username" required>
	  </div>
	  <div class="form-group">
	    <label for="password">Password</label>
	    <input type="password" name="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
	  </div>
	<button id="btn-login" class="btn btn-primary">로그인</button>
		<a href="https://kauth.kakao.com/oauth/authorize?response_type=code
		&client_id=dec6846c84164e1751cadf8f9581c8dc
		&redirect_uri=http://localhost:8000/auth/kakao/callback">
			<img alt="" height="38" src="/img/kakao_login_medium.png">
		</a>
	</form>
</div>

<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp" %>