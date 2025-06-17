$(document).ready(function(){
	
	$("#selArray").val(productCategory);
	
	
	$("#btn-update").on("click", ()=>{
		update();
	});	
	function update(){
	
		const arrList = {};  // 빈 객체 생성
		const fileInput = $('#input_file')[0];
	  	const files = fileInput.files;  // FileList 객체

		  // arrList 객체 안에 fileList 배열을 생성하여 파일 정보를 담을 준비
		  arrList.fileList = [];

		  if (files.length > 0) {
		      // 선택된 파일들에 대해 반복문 처리
		      for (let i = 0; i < files.length; i++) {
		          const file = files[i];  // 각 파일 정보

		          // arrList.fileList[i]에 파일 정보를 객체 형태로 저장
		          arrList.fileList[i] = {
		              fileName: file.name,  // 파일 이름
		              fileSize: file.size,  // 파일 크기 (바이트 단위)
		              fileType: file.type   // 파일 MIME 타입
		          };
		      }

		      // 파일 정보 출력 (디버깅용)
		      console.log(arrList);
		  }

		  	arrList.productSeq = productSeq; 
		  	arrList.productName = $("#productName").val();  
			arrList.price = $("#price").val();  
			arrList.color = $("#color").val();  
			arrList.category = $("#category").val(); 
			arrList.content = $("#content").val();  
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
		  
			const product ={
				productSeq: arrList.productSeq,
				productName: arrList.productName,
				price: arrList.price,
				color: arrList.color,
				category: arrList.category,
				content: arrList.content
			};
			const fileInfo = arrList.fileList;
			
			
			const data = {
				product : product,
				file : fileInfo
			};
		
		const formData = new FormData();
		// Blob 생성 시 type 지정!!
		const productBlob = new Blob(
		    [JSON.stringify(product)],
		    { type: "application/json" }  // 중요!!!
		);
		
		formData.append("product", productBlob);
		const fileInfoList = $("#input_file")[0].files; // 파일 리스트를 가져옴

		// 파일을 하나씩 FormData에 추가
		for (let i = 0; i < fileInfoList.length; i++) {
		    formData.append("file", fileInfoList[i]); // 각 파일을 "file" 필드로 추가
		}
		
		  
		$.ajax({
			headers: {
		        'X-CSRF-Token': getCsrfToken()  // 쿠키에서 가져온 CSRF 토큰을 헤더에 추가
		    },
			url:"/api/Product/modifyProduct",
		    type: 'PUT',
			enctype: 'multipart/form-data',	// 필수
		    data: formData,
		    processData: false, // 자동으로 데이터 처리를 하지 않음
		    contentType: false, // content-type을 자동으로 설정하지 않음
		}).done((result)=>{
			console.log("제품 수정 완료 : "+result);
			location.href = "/product/detailProduct?id="+productSeq+"&userId="+userId.value;
		}).fail((error)=>{
			location.href = "/product/detailProduct?id="+productSeq+"&userId="+userId.value;
		});
	}
});