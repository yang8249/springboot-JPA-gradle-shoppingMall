<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/fileUpload.css">
<style>
	.container5 { 
	    border: 1px solid black;
		position:relative; 
	
	} 
	.img_wrap { position: relative; width: 400px; height:400px; } 
	.img_wrap .img { position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 1; } 
	.zoom_lens { display: none; position:absolute; width:150px; height:150px; background: #000; border: 1px solid #fff; z-index: 2; opacity: 0.2; } 
	.zoom_result { display: none; position: absolute; top: 0; left:520px; width:400px; height:400px; } 
	.img_wrap:hover ~ .zoom_result,
	.img_wrap:hover .zoom_lens { display: block; } 
	
      #dynamicBox {
    border: 1px solid #333;
    padding: 10px;
    width: 300px;
    min-height: 40px;
    overflow: hidden;
    resize: none;
    transition: height 0.2s ease;
  }

  #inputBox {
    width: 200px;
    margin-top: 10px;
  }
</style>
<div class="container">

	 
		<div style="
			    display: flex;
			    flex-direction: row;
			    justify-content: flex-start;
			    align-items: center;
			">
			<button class="btn btn-secondary" onclick="history.back()" >돌아가기</button>
  		<input type="hidden" id="boardId" value="${board.id}">
  		 	<c:if test="${principal.user.role eq 'ADMIN'}">
				글 번호 : <span id="boardId" style="margin-right: 11px;"><i>${board.id}</i></span>
				작성자 : <span id="boardUserName"><i>${board.user.username}</i></span>
			</c:if> 
		</div>
	  <div class="form-group">
	    <label for="title">제목</label>
	    <input type="text" value="${board.title}" class="form-control" id="title" placeholder="Enter title" name="title" required>
	  </div>
	  <div class="form-group">
		  <label for="content">내용</label>
		  <textarea class="form-control summernote" rows="5" id="content">${board.content}</textarea>
	  </div>
	  
		<button class="btn btn-warning" id="btn-update">수정</button>
		<button id="btn-delete" class="btn btn-danger">삭제</button>
	
	<!-- 파일업로드 폼 -->
	<!-- <div class="filebox bs3-primary preview-image" id="dynamicBox">
       <input type="file" id="input_file" multiple class="upload-hidden"> 
       <input class="upload-name" id="inputBox"value="파일선택" disabled="disabled" >

       <label for="input_file">업로드</label> 
     </div> -->
</div>

	
	<br>
	<hr>
	<br>
	
	<div class="container">
	
		 
		  <div class="form-group">
			  <label for="answer">답변</label>
			  <textarea class="form-control summernote" rows="5" id="answer">${board.answer}</textarea>
		  </div>
		  
<c:if test="${principal.user.role eq 'ADMIN'}">
			<button class="btn btn-warning" id="btn-answer">답변하기</button>
		
</c:if>
		<!-- 파일업로드 폼 -->
		<!-- <div class="filebox bs3-primary preview-image" id="dynamicBox">
	       <input type="file" id="input_file" multiple class="upload-hidden"> 
	       <input class="upload-name" id="inputBox"value="파일선택" disabled="disabled" >
	
	       <label for="input_file">업로드</label> 
	     </div> -->
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


>