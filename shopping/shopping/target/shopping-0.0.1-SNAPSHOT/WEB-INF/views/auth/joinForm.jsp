<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<style>
	.mainContainer{
		margin-bottom: 100px;
	}
</style>
<div class="container mainContainer">
	  <form action="/user/join" method="POST" class="was-validated">
	  <div class="form-group">
	    <label for="username">아이디</label>
	    <input type="text" class="form-control" id="username" placeholder="Enter username" name="username" required>
	  </div>
	  <div class="form-group">
	    <label for="email">이메일</label>
	    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
	  </div>
	  <div class="form-group">
	    <label for="password">비밀번호</label>
	    <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
	  </div>
	</form>
  <button id="btn-save" class="btn btn-primary">회원가입</button>
</div>

<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp" %>