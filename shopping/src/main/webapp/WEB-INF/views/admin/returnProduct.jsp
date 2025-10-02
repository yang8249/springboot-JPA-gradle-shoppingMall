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
<style>
.preview-image {
  display: flex;
  gap: 10px;
  width: fit-content; /* 자식 크기만큼 자동 확장 */
}
.upload-thumb-wrap {
  display: flex;
  gap: 10px;
  width: fit-content; /* 자식 크기만큼 자동 확장 */
}
.ThumbImage {
  width: 120px; /* 원하는 크기로 조절 */
  height: auto;
  object-fit: cover;
}
</style>
<div class="container">
 <input type="hidden" value="${delivery.phone}" class="form-control" id="phone" name="phone"  >
 <input type="hidden" value="${delivery.product.productSeq}" class="form-control" id="productSeq"name="productSeq"  >
 <input type="hidden" value="${delivery.id}" class="form-control" id="deliId"name="deliId"  >
 <input type="hidden" value="${returnDelivery.id}" class="form-control" id="returnDeliveryId"name="returnDeliveryId"  >
 
		 
      <h1>반품 요청</h1>
      <br>
  	<form action="/auth/loginProc" method="post" class="was-validated" enctype="multipart/form-data">
  	<div class="form-inline">
	  <div class="form-group">
	    <label for="orderName">주문자 명</label>
	    <input type="text" value="${delivery.orderName}" data-info="주문자 명" class="form-control" id="orderName" readonly name="orderName" required>
	  </div>
		  <div class="form-group">
		    <label for="bank">은행명</label>
		    <input type="text" value="${delivery.bank}" data-info="은행명" class="form-control" id="bank" readonly name="bank" required>
		  </div>
		  <div class="form-group">
		    <label for="payCustomer">입금자 명</label>
		    <input type="text" value="${delivery.payCustomer}" data-info="입금자 명" class="form-control" id="payCustomer" readonly name="payCustomer" required>
		  </div>	
    </div>
  	<div class="form-inline">
		  <div class="form-group">
		    <label for="productName">제품 명</label>
		    <input type="text" value="${delivery.product.productName}" data-info="제품 명" class="form-control" id="productName" readonly name="productName" required>
		  </div>	
		  <div class="form-group">
		    <label for="price">가격</label>
		    <input type="text" value="${delivery.totalPrice}" class="form-control" data-info="가격" id="price" name="totalPrice" readonly>
		  </div>
		  <div class="form-group">
		    <label>연락처</label>
		    <input id="rphone2_1" readonly data-info="휴대전화" name="rphone2_[]" maxlength="3"
				fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
				fw-alone="N" fw-msg="" placeholder="" size="4" value=""
				type="text">
			-
			<input id="rphone2_2" readonly data-info="휴대전화"
			name="rphone2_[]" maxlength="4"
			fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
			fw-alone="N" fw-msg="" placeholder="" size="4" value=""
			type="text">
			
			-
			<input id="rphone2_3" readonly data-info="휴대전화" name="rphone2_[]" maxlength="4"
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
					class="xans-record-" 
					${delivery.product.category eq 'outerwear' ? 'selected' : ''}
					>Outerwear</option>
				<option value="tops"
					class="xans-record-" 
					${delivery.product.category eq 'tops' ? 'selected' : ''}
					>Tops</option>
				<option value="dresses"
					class="xans-record-" 
					${delivery.product.category eq 'dresses' ? 'selected' : ''}
					>Dresses</option>
				<option value="bottoms"
					class="xans-record-"
					${delivery.product.category eq 'bottoms' ? 'selected' : ''}
					>Bottoms</option>
				<option value="accessories"
					class="xans-record-"
					${delivery.product.category eq 'accessories' ? 'selected' : ''}
					>Accessories</option>
			</select>
		</div>
		
		  <div class="form-group">
		  <!-- 여따가는 이미지 넣을 예정 제품썸넬 -->
		</div>
     </div>
		<br>
		<div class="form-group">
	    <label for="returnTitle">제목</label>
	    <input type="text" value="${returnDelivery.returnTitle}" data-info="제목" class="form-control" id="returnTitle" placeholder="Enter title" name="returnTitle" required>
	  </div>
	  <div class="form-group">
		  <label for="reason">반품사유</label>
		  <textarea data-info="반품사유" class="form-control summernote" rows="5" id="reason">${returnDelivery.reason}</textarea>
	  </div>
	<!-- 파일업로드 폼 -->
	<div class=" bs3-primary preview-image" id="dynamicBox">
       <input type="file" id="input_file" multiple class="upload-hidden"> 
       <div class="upload-display">
      </div>
		
			        <div class="upload-thumb-wrap">
		<c:forEach var="file" items="${returnDelivery.fileInfo}" varStatus="status">
			          <img src="${pageContext.request.contextPath}/image?filename=${file.uuid}"
						class="ThumbImage" alt="">
		</c:forEach>
			        </div>
			        
				
		

     </div>
	</form>
	
	<br>
	<hr>
	<br>
	  <div class="form-group">
		  <label for="adminNote">승인/거절 사유</label>
		  <textarea data-info="관리자사유" class="form-control summernote" rows="5" id="adminNote">${returnDelivery.adminNote}</textarea>
	  </div>
	<button id="btn-approve" class="btn btn-primary">승인하기</button>
	<button id="btn-reject" class="btn btn-danger">반려하기</button>
</div>
<script>
  $('.summernote').summernote({
    placeholder: '반품 사유를 상세히 적어주세요.',
    tabsize: 2,
    height: 300
  });
</script>
<script type="text/javascript">
 let pageable = ${products.number};
</script>
<script type="text/javascript" src="/js/product/returnAdmin.js"></script>
<%@ include file="../layout/footer.jsp" %>