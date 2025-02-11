/**
 * 회원가입 js입니다.
 */
// 쿠키에서 특정 이름의 값을 가져오는 함수
function getCsrfToken() {
    // 쿠키 문자열을 세미콜론(;) 기준으로 분리하여 배열로 저장
    let cookies = document.cookie.split(';');

    // 배열에서 'XSRF-TOKEN='으로 시작하는 쿠키를 찾아 값을 반환
    let csrfToken = cookies.find(cookie => cookie.trim().startsWith('XSRF-TOKEN='));

    // 'XSRF-TOKEN=' 이후의 값을 반환, 없으면 null 반환
    return csrfToken ? csrfToken.split('=')[1] : null;
}

console.log(pageable);

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