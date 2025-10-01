/**
 * 회원가입 js입니다.
 */
// 쿠키에서 특정 이름의 값을 가져오는 함수
let index = {
	init:function(){
		$("#btn-save").on("click", ()=>{
			this.save();
		});
		$("#btn-delete").on("click", ()=>{
			this.deleteById();
		});
		$("#btn-update").on("click", ()=>{
			this.update();
		});
	},
	
	save:function(){
	
		let data = {
			title : $("#title").val(),
			content : $("#content").val()
		};
	
		$.ajax({
			headers: {
		        'X-CSRF-Token': getCsrfToken()  // 쿠키에서 가져온 CSRF 토큰을 헤더에 추가
		    },
			type:"POST",
			url:"/api/board",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
		}).done((result)=>{
			console.log("글이 저장되었습니다. : "+result);
			location.href = "/";
		}).fail((error)=>{
			alert(JSON.stringify(error));
		});
		
	},
	deleteById:function(){
			$.ajax({
				headers: {
			        'X-CSRF-Token': getCsrfToken()  // 쿠키에서 가져온 CSRF 토큰을 헤더에 추가
			    },
				type:"DELETE",
				url:"/api/board/"+$("#boardId").text(),
				contentType:"application/json; charset=utf-8",
				dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
			}).done((result)=>{
				console.log("삭제가 완료되었습니다. : "+result);
				location.href = "/";
			}).fail((error)=>{
				alert(JSON.stringify(error));
			});
			
	},
	update:function(){
		
		let data = {
			id : $("#boardId").val(),
			title : $("#title").val(),
			content : $("#content").val()
		};
	
		$.ajax({
			headers: {
		        'X-CSRF-Token': getCsrfToken()  // 쿠키에서 가져온 CSRF 토큰을 헤더에 추가
		    },
			type:"PUT",
			url:"/api/board/"+data.id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
		}).done((result)=>{
			console.log("글이 수정되었습니다. : "+result);
			location.href = "/";
		}).fail((error)=>{
			alert(JSON.stringify(error));
		});
			
	}
}

index.init();