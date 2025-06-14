$(document).ready(function(){
	
	$("#selArray").val(productCategory);
	
	
	$("#btn-update").on("click", ()=>{
		update();
	});	
	function update(){
		let data = {
			productSeq : productSeq
		};
	
		$.ajax({
			headers: {
		        'X-CSRF-Token': getCsrfToken()  // 쿠키에서 가져온 CSRF 토큰을 헤더에 추가
		    },
			type:"PUT",
			url:"/api/product/modifyProduct",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
		}).done((result)=>{
			console.log("제품 수정 완료 : "+result);
			location.href = "/";
		}).fail((error)=>{
			alert(JSON.stringify(error));
		});
	}
});