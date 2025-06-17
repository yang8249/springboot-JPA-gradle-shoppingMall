<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">
  	<form action="/auth/loginProc" method="post" class="was-validated">
  		<input type="hidden" id="boardId" value="${board.id}">
	  <div class="form-group">
	    <input type="text" class="form-control" id="title" placeholder="Enter title" 
	    value="${board.title}" name="title" required>
	  </div>
	  <div class="form-group">
		  <textarea class="form-control summernote" rows="5" id="content">
		  ${board.content}</textarea>
	  </div>
	</form>
	<button id="btn-update" class="btn btn-primary">글 수정</button>
</div>

    <script>
      $('.summernote').summernote({
        placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 300
      });
    </script>
    
<script type="text/javascript" src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp" %>