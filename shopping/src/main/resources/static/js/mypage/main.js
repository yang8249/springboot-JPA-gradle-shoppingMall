
let weekBuyList;
let newBuyList;

async function getBuyList(){
	//최근 7일간 구매내역
	await new Promise((resolve, reject) => {
	  $.ajax({
		url:"/api/mypage/weekBuyData",
		type:"POST",
		data:JSON.stringify(user),
		contentType:"application/json; charset=utf-8",
	    dataType: "json",
	    success: async function(response) {
	      resolve(response);  // 성공적으로 데이터를 받으면 resolve 호출
		  weekBuyList = response.data;
		  await chartDataLoad();
	    },
	    error: function(xhr, status, error) {
	      reject(error);  // 에러 발생 시 reject 호출
	    }
	  });
	});
	
	//최근 10개 구매내역
	await new Promise((resolve, reject) => {
	  $.ajax({
		url:"/api/mypage/newBuyData",
		type:"POST",
		data:JSON.stringify(user),
		contentType:"application/json; charset=utf-8",
	    dataType: "json",
	    success: function(response) {
	      resolve(response);  // 성공적으로 데이터를 받으면 resolve 호출
		  newBuyList = response.data;
	    },
	    error: function(xhr, status, error) {
	      reject(error);  // 에러 발생 시 reject 호출
	    }
	  });
	});
}

getBuyList();


async function chartDataLoad(){
	//대시보드 전용 차트
	const ctx = document.getElementsByClassName('chartJS-myChart1');
	
	console.log("weekBuyList : "+weekBuyList);
	console.log("newBuyList : "+newBuyList);
	/*let oCount = 0;
	let tCount = 0;
	let dCount = 0;
	let bCount = 0;
	let ACount = 0;
	for(let i=0; i<weekBuyList.length; i++){
		
		switch (weekBuyList[i].product.category) {
		    case "outerwear":
		        // 실행 코드
				console.log(1);
				oCount++;
		        break;
		    case "tops":
				console.log(2);    
			// 실행 코드
				tCount++;
		        break;
			case "dresses":
			    // 실행 코드
				oCount++;
				donsole.log(3);
			    break;
			case "bottoms":
			    // 실행 코드
				console.log(4);
				bCount++;
			    break;
			case "accessories":
			    // 실행 코드
				console.log(5);
				aCount++;
			    break;
		    default:
		        // 위 조건에 모두 해당하지 않을 때 실행
				
			
		}
	}*/
	
	// 3 = 아우터, 	7 = 악세사리
	// 3~7 번까지 카테고리로 사용함.
 	new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: ['월', '화', '수', '목', '금', '토', '일'],
	    datasets: [{
		      label: '아우터',
		      data: [
					weekBuyList[0][3], weekBuyList[1][3], 
				  	weekBuyList[2][3], weekBuyList[3][3], 
				  	weekBuyList[4][3], weekBuyList[5][3],
					weekBuyList[6][3]
		  		],
		      borderWidth: 1
		    }, 	  
			{
	  	      label: '상의',
				data: [
					weekBuyList[0][4], weekBuyList[1][4], 
				  	weekBuyList[2][4], weekBuyList[3][4], 
				  	weekBuyList[4][4], weekBuyList[5][4],
					weekBuyList[6][4]
					],
	  	      borderWidth: 1
	  	    }, 	  
  			{
  	  	      label: '드레스',
  				data: [
  					weekBuyList[0][5], weekBuyList[1][5], 
  				  	weekBuyList[2][5], weekBuyList[3][5], 
  				  	weekBuyList[4][5], weekBuyList[5][5],
  					weekBuyList[6][5]
  					],
  	  	      borderWidth: 1
  	  	    }, 	  
			{
	  	      label: '하의',
				data: [
					weekBuyList[0][6], weekBuyList[1][6], 
				  	weekBuyList[2][6], weekBuyList[3][6], 
				  	weekBuyList[4][6], weekBuyList[5][6],
					weekBuyList[6][6]
					],
	  	      borderWidth: 1
	  	    }, 	  
			{
	  	      label: '악세사리',
				data: [
					weekBuyList[0][7], weekBuyList[1][7], 
				  	weekBuyList[2][7], weekBuyList[3][7], 
				  	weekBuyList[4][7], weekBuyList[5][7],
					weekBuyList[6][7]
					],
	  	      borderWidth: 1
	  	    }
		]
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
	    labels: ['월', '화', '수', '목', '금', '토', '일'],
	    datasets: [{
		      label: '아우터',
		      data: [
					weekBuyList[0][3], weekBuyList[1][3], 
				  	weekBuyList[2][3], weekBuyList[3][3], 
				  	weekBuyList[4][3], weekBuyList[5][3],
					weekBuyList[6][3]
		  		],
		      borderWidth: 1
		    }, 	  
			{
	  	      label: '상의',
				data: [
					weekBuyList[0][4], weekBuyList[1][4], 
				  	weekBuyList[2][4], weekBuyList[3][4], 
				  	weekBuyList[4][4], weekBuyList[5][4],
					weekBuyList[6][4]
					],
	  	      borderWidth: 1
	  	    }, 	  
			{
	  	      label: '드레스',
				data: [
					weekBuyList[0][5], weekBuyList[1][5], 
				  	weekBuyList[2][5], weekBuyList[3][5], 
				  	weekBuyList[4][5], weekBuyList[5][5],
					weekBuyList[6][5]
					],
	  	      borderWidth: 1
	  	    }, 	  
			{
	  	      label: '하의',
				data: [
					weekBuyList[0][6], weekBuyList[1][6], 
				  	weekBuyList[2][6], weekBuyList[3][6], 
				  	weekBuyList[4][6], weekBuyList[5][6],
					weekBuyList[6][6]
					],
	  	      borderWidth: 1
	  	    }, 	  
			{
	  	      label: '악세사리',
				data: [
					weekBuyList[0][7], weekBuyList[1][7], 
				  	weekBuyList[2][7], weekBuyList[3][7], 
				  	weekBuyList[4][7], weekBuyList[5][7],
					weekBuyList[6][7]
					],
	  	      borderWidth: 1
	  	    }
		]
	  },
	  options: {
	    scales: {
	      y: {
	        beginAtZero: true
	      }
	    }
	  }
	});

}


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
	
	
		
	
	//사이드바 메뉴 이동 이벤트	
	$(".mypage-nav-button").children().children().click((e)=>{
		const selectMenu = e.target.attributes.value.value;
		
		
		const ableContent = $("#ableContent").children(":not(.mypage-disabled)")[0].className;
		
		//이전에 선택되있던 태그에 클래스 빼기
		$(".mypage-nav-button.nav.flex-column")
		  .children("li")
		  .children("a")
		  .filter(".active").removeClass("active");
		  
		//현재 선택한 태그에 클래스 부여하기
		$(e.target).addClass("active");
		  
		  
		
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
	$(document).on("click", ".grid-button", function(event) {
	  event.stopPropagation(); // 부모로 이벤트 전달 막기
	  console.log("버튼만 클릭됨");
	});
};