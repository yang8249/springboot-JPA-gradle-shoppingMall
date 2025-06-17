<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
		.mgb-10{
	    	margin-bottom: 10px;
	    }
	</style>
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">계정관리</h1>
      </div>
      
      <h3>사용자 정보</h2>
      <div class="table-responsive small" style="overflow: hidden; width: 80%;">
      <br>
        <form class="row g-3">
	 	<input type="hidden" id="userId" value="${principal.user.id}">
	 	<div class="form-group">
		    <label for="inputAddress" class=" form-label">아이디</label>
	    	<input type="text" value="${principal.user.username}" class="form-control" id="username" placeholder="아이디를 입력하세요." name="username" readonly required>
	  	</div>
		  
			<c:if test="${empty principal.user.oauth}">
			  <div class="form-group">
		    <label for="inputAddress" class=" form-label">비밀번호</label>
			    <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요." name="password" required>
			  </div>
			</c:if>
		  
		  <div class="form-group">
		    <label for="inputAddress" class=" form-label">이메일</label>
		    <input type="email" value="${principal.user.email}" class="form-control" id="email" placeholder="이메일을 입력하세요." name="email" readonly required>
		  </div>
      </div>
      
	  <hr>
		  
      	<h3>기본 주소</h2>
      	 <br>
		  <div class="col-12 mgb-10">
		    <label for="inputAddress" class=" form-label">주소</label>
		    <div style="display: flex;">
			    <input type="text" class="mainAddr form-control" id="inputAddress" placeholder="주소를 입력하세요.">
			    <button type="button" class="addressApi-btn btn-warning" style="width: 125px; margin-left: 30px">주소 찾기</button> 
		    </div>
		  </div>
		  <div class="col-12 mgb-10">
		    <label for="inputAddress2" class=" form-label">상세주소 (수기입력)</label>
		    <input type="text" class="detailAddr form-control" id="inputAddress2" placeholder="상세주소를 입력하세요.">
		  </div>
		  
		  <div class="col-3">
		    <label for="inputAddress3" class=" form-label">우편번호</label>
		    <input type="text" class="zoneNum form-control" id="inputAddress3" placeholder="우편번호를 입력하세요.">
		  </div>
		  
		  <hr>
		  <div class="col-12">
		    <button type="submit" class="btn btn-primary">저장하기</button>
		  </div>
		</form>
<script src="/js/mypage/account.js"></script>