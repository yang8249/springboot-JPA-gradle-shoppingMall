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

      <h1>반품 요청</h1>
      <br>
  	<form action="/auth/loginProc" method="post" class="was-validated" enctype="multipart/form-data">
  	<div class="form-inline">
	  <div class="form-group">
	    <label for="title">주문자 명</label>
	    <input type="text" data-info="제품명" class="form-control" id="productName" readonly name="title" required>
	  </div>
		  <div class="form-group">
		    <label for="title">은행명</label>
		    <input type="text" data-info="제품명" class="form-control" id="productName" readonly name="title" required>
		  </div>
		  <div class="form-group">
		    <label for="title">입금자 명</label>
		    <input type="text" data-info="제품명" class="form-control" id="productName" readonly name="title" required>
		  </div>	
    </div>
  	<div class="form-inline">
		  <div class="form-group">
		    <label for="title">제품 명</label>
		    <input type="text" data-info="제품명" class="form-control" id="productName" readonly name="title" required>
		  </div>	
		  <div class="form-group">
		    <label>가격</label>
		    <input type="number" class="form-control" data-info="가격" id="price" readonly value="${product.price}">
		  </div>
		  <div class="form-group">
		    <label>연락처</label>
		    <input id="rphone2_1" data-info="휴대전화" name="rphone2_[]" maxlength="3"
				fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
				fw-alone="N" fw-msg="" placeholder="" size="4" value=""
				type="text">
			-
			<input id="rphone2_2" data-info="휴대전화"
			name="rphone2_[]" maxlength="4"
			fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
			fw-alone="N" fw-msg="" placeholder="" size="4" value=""
			type="text">
			
			-
			<input id="rphone2_3" data-info="휴대전화" name="rphone2_[]" maxlength="4"
				fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
				fw-alone="N" fw-msg="" placeholder="" size="4" value=""
				type="text">
		  </div>
		</div>
  	<div class="form-inline">
		  <div class="form-group">
			<select id="category" disabled data-info="카테고리" name="selArray"
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
		
		  <div class="form-group">
		  <!-- 여따가는 이미지 넣을 예정 제품썸넬 -->
		</div>
     </div>
		<br>
		<div class="form-group">
	    <label for="title">제목</label>
	    <input type="text" data-info="제품명" class="form-control" id="productName" placeholder="Enter title" name="title" required>
	  </div>
	  <div class="form-group">
		  <label for="content">반품사유</label>
		  <textarea data-info="제품상세" class="form-control summernote" rows="5" id="content"></textarea>
	  </div>
	<!-- 파일업로드 폼 -->
	<div class="filebox bs3-primary preview-image" id="dynamicBox">
       <input type="file" id="input_file" multiple class="upload-hidden"> 
       <input class="upload-name" id="inputBox"value="파일선택" disabled="disabled" >

       <label for="input_file">업로드</label> 
     </div>
	</form>
	
	<button id="btn-save" class="btn btn-primary">글쓰기</button>
</div>
<script>
  $('.summernote').summernote({
    placeholder: '상세히 적어주세요.',
    tabsize: 2,
    height: 300
  });
</script>
<script type="text/javascript">
 let pageable = ${products.number};
</script>
<script type="text/javascript" src="/js/product/addProduct.js"></script>
<%@ include file="../layout/footer.jsp" %>