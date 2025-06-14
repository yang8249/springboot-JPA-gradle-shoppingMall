<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	  <form action="/user/join" method="POST" class="was-validated">
	  <input type="hidden" id="userId" value="${principal.user.id}">
	  <div class="form-group">
	    <label for="username">Username</label>
	    <input type="text" value="${principal.user.username}" class="form-control" id="username" placeholder="Enter username" name="username" readonly required>
	  </div>
	  
		<c:if test="${empty principal.user.oauth}">
		  <div class="form-group">
		    <label for="password">Password</label>
		    <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
		  </div>
		</c:if>
	  
	  <div class="form-group">
	    <label for="email">Email</label>
	    <input type="email" value="${principal.user.email}" class="form-control" id="email" placeholder="Enter email" name="email" readonly required>
	  </div>
	  
	  <div class="form-group form-check">
	    <label class="form-check-label">
	      <input class="form-check-input" type="checkbox" name="remember" required>
	    </label>
	  </div>
	</form>
  <button id="btn-update" class="btn btn-primary">회원정보 수정</button>
</div>

<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp" %>