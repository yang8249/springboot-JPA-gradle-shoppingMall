<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
	
	.container {
  display: flex;
  justify-content: flex-start; /* 왼쪽 기준 정렬 */
  align-items: center;         /* 수직 가운데 정렬 (선택사항) */
  position: relative;
      margin-left: 10px;
}

.left-box {
  position: absolute;
  left: 0;
  top: 50%;
  transform: translateY(-50%);
  
}

.center-box {
  margin: 0 auto;
  padding-left: 26%;
}
</style>


	<div class="container">
	  <div class="left-box"><h1 class="h2">장바구니</h1></div>
	  <div class="center-box"><h1 class="h2">찜 목록</h1></div>
	</div>
	     <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	     </div>
      	<div style="display: flex; gap: 20px;">
			<div id="example-table3" style="flex: 1.2;"></div>
			<div id="example-table4" style="flex: 0.8;"></div>
		</div>
	
<script src="/js/mypage/shopBasket.js"></script>