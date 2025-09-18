<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>
<link rel="stylesheet" href="/css/fileUpload.css">

<style>
	.container { position:relative; } 
	.img_wrap { position: relative; width: 400px; height:400px; } 
	.img_wrap .img { position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 1; } 
	.zoom_lens { display: none; position:absolute; width:150px; height:150px; background: #000; border: 1px solid #fff; z-index: 2; opacity: 0.2; } 
	.zoom_result { display: none; position: absolute; top: 0; left:520px; width:400px; height:400px; } 
	.img_wrap:hover ~ .zoom_result,
	.img_wrap:hover .zoom_lens { display: block; } 
	.mainDivForm{
		display: flex;
	    flex-wrap: wrap;
	    flex-direction: row;
    }
</style>

<div class="container">

      <h1>제품 수정</h1>
      <br>
      
  	<form action="/auth/loginProc" method="post" class="was-validated">
		  <div class="form-group">
		    <label for="title">제품명</label>
		    <input type="text" value="${product.productName}" class="form-control" id="title" placeholder="Enter title" name="title" required>
		  </div>
  	<div class="form-inline">
		  <div class="form-group">
		    <label>가격</label>
		    <input type="number" class="form-control" id="price" value="${product.price}">
		  </div>
		  
		  <!-- (옵션 동적 세팅 기능 추가 필요) -->
		  <div class="form-group">
		    <label for="pwd">색상</label>
		    <input type="text" class="form-control" id="pwd" value="${product.color}">
		  </div>
		  <br>
		  <div class="sort">
			<select id="selArray" name="selArray"
				class="xans-element- xans-product xans-product-orderby"><option
					value="">- 카테고리 -</option>
				<option value="outerwear"
					class="xans-record-">Outerwear</option>
				<option value="tops"
					class="xans-record-">Tops</option>
				<option value="dresses"
					class="xans-record-">Dresses</option>
				<option value="bottoms"
					class="xans-record-">Bottoms</option>
				<option value="accessories"
					class="xans-record-">Accessories</option>
			</select>
		</div>
  	</div>
	
	<br>
	  <div class="form-group">
		  <label for="content">제품상세정보:</label>
		  <textarea class="form-control summernote" rows="5" id="content"></textarea>
	  </div>
	</form>
	<!-- 파일업로드 폼 -->
	<div class="filebox bs3-primary preview-image">
       <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">

       <label for="input_file">업로드</label> 
       <input type="file" id="input_file" multiple class="upload-hidden"> 
     </div>
	<br>
	<br>
	<button id="btn-save" class="btn btn-primary">제품 수정</button>
	<br>
	<br>
</div>
<script>
	
	const productCategory = `${product.category}`;
	
	
  $('.summernote').summernote({
    placeholder: 'Hello Bootstrap 4',
    tabsize: 2,
    height: 300
  });
</script>
<script type="text/javascript" src="/js/product/modifyProduct.js"></script>
<%@ include file="../layout/footer.jsp" %>