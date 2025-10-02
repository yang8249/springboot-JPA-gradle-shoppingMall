$(document).ready(function(){


	const phone = $("#phone").val(); // 또는 "010-222-333"
	const [phoneNum1, phoneNum2, phoneNum3] = phone.split("-");

	$("#rphone2_1").val(phoneNum1);	
	$("#rphone2_2").val(phoneNum2);
	$("#rphone2_3").val(phoneNum3);
		
	
   
		//제품 저장
		$("#btn-approve").click((e)=>{
			
			const arrList = {};  // 빈 객체 생성
			
			
			arrList.adminNote = $("#adminNote").val();  
			arrList.deliId = $("#deliId").val();  
			arrList.productId = $("#productSeq").val();  
			arrList.id = $("#returnDeliveryId").val();  
			
			for (const key in arrList) {
				const value = arrList[key];
			  	console.log(`${key}: ${value}`);  // 키와 값을 출력
				  if(!value){
					alert($("#"+`${key}`).data("info")+"정보를 입력해주세요.")
	
					e.preventDefault();  // 기본 동작을 막음
					e.stopPropagation(); // 이벤트 전파를 막음
					return false;
				  }
			  }
			  
			  console.log(arrList);

			
			$.ajax({
				url:"/api/Product/updateReturn",
			    type: 'PUT',
				contentType: 'application/json; charset=utf-8'       ,
			    data: JSON.stringify(arrList), //얘를 직렬화 해줘야 서버에서 JSON으로 받을수있음.
			    success: function(response) {
					alert("반품 승인이 완료되었습니다.");
			        console.log("Upload Success: ", response);
					location.href = "/admin/returnProduct";
			    },
			    error: function(xhr, status, error) {
			        console.log("Upload Failed: ", error);
			    }
			});
		});

		//제품 저장
		$("#btn-reject").click((e)=>{
			
			const arrList = {};  // 빈 객체 생성
			
			
			arrList.adminNote = $("#adminNote").val();  
			arrList.deliId = $("#deliId").val();  
			arrList.productId = $("#productSeq").val();  
			arrList.id = $("#returnDeliveryId").val();  
			
			for (const key in arrList) {
				const value = arrList[key];
			  	console.log(`${key}: ${value}`);  // 키와 값을 출력
				  if(!value){
					alert($("#"+`${key}`).data("info")+"정보를 입력해주세요.")

					e.preventDefault();  // 기본 동작을 막음
					e.stopPropagation(); // 이벤트 전파를 막음
					return false;
				  }
			  }
			  
			  console.log(arrList);

			
			$.ajax({
				url:"/api/Product/rejectReturn",
			    type: 'PUT',
				contentType: 'application/json; charset=utf-8'       ,
				data: JSON.stringify(arrList), //얘를 직렬화 해줘야 서버에서 JSON으로 받을수있음.
			    success: function(response) {
					alert("반품 반려가 완료되었습니다.");
			        console.log("Upload Success: ", response);
					location.href = "/admin/returnProduct";
			    },
			    error: function(xhr, status, error) {
			        console.log("Upload Failed: ", error);
			    }
			});
		});
});