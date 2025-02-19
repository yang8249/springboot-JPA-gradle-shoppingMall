window.onload = function() {
	
	if(page == "orderList"){
		ableContent = $("#ableContent").children(":not(.mypage-disabled)")[0].className;
				
		$("#ableContent").children("."+ableContent).addClass("mypage-disabled");
		$("#ableContent").children(".orderList").removeClass("mypage-disabled");

		// 쿼리스트링이 있으면, 쿼리스트링을 제거한 URL로 바꿉니다.
		let newUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
		window.history.replaceState({}, document.title, newUrl);
	}

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
	
	/*
	* 초기세팅 
	* - chart, grid, account정보 등
	*/
	
	//대시보드 전용 차트
	const ctx = document.getElementsByClassName('chartJS-myChart1');

	new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
	    datasets: [{
	      label: '# of Votes',
	      data: [12, 19, 3, 5, 2, 3],
	      borderWidth: 1
	    }]
	  },
	  options: {
	    scales: {
	      y: {
	        beginAtZero: true
	      }
	    }
	  }
	});
	
	//구매현황 전용 차트
	const ctx2 = document.getElementsByClassName('chartJS-myChart2');

	new Chart(ctx2, {
	  type: 'line',
	  data: {
	    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
	    datasets: [{
	      label: '# of Votes',
	      data: [12, 19, 3, 5, 2, 3],
	      borderWidth: 1
	    }]
	  },
	  options: {
	    scales: {
	      y: {
	        beginAtZero: true
	      }
	    }
	  }
	});
		
	
	//사이드바 메뉴 이동 이벤트	
	$(".mypage-nav-button").children().children().click((e)=>{
		const selectMenu = e.target.attributes.value.value;
		
		
		const ableContent = $("#ableContent").children(":not(.mypage-disabled)")[0].className;
		
		
		if(selectMenu != ableContent){
			$("#ableContent").children("."+ableContent).addClass("mypage-disabled");
			$("#ableContent").children("."+selectMenu).removeClass("mypage-disabled");
		}
	});
	
	//주소찾기 API
	const addressApi = new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			console.log("주소 : "+data.address);
			console.log("시,도 : "+data.sido);
			console.log("시,군,구 : "+data.sigungu);
			console.log("도로명 : "+data.query);
			console.log("동 : "+data.bname);
			console.log("우편번호 : "+data.zonecode);
			
			$(".mainAddr").val(data.address);
			$(".zoneNum").val(data.zonecode);
        }
    })
	
	$(".addressApi-btn").click((e)=>{
		addressApi.open();
	});
	
	
	//account정보 뿌려주기
	/*$.ajax({
		headers: {
	        'X-CSRF-Token': getCsrfToken()  // 쿠키에서 가져온 CSRF 토큰을 헤더에 추가
	    },
		type:"POST",
		url:"/mypage/selectAccountInfo",
		contentType:"application/json; charset=utf-8",
		dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
	}).done((result)=>{
		alert("회원가입 완료 : "+result);
		console.log("result : "+result);
		location.href = "/";
	}).fail((error)=>{
		alert(JSON.stringify(error));
	});*/
};
