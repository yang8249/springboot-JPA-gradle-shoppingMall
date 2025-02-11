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


let index = {
	init:function(){
		if(window.location.pathname == "/"){
			$($("#menuClick").children()[0]).addClass('active');			
		}else{
			switch(category){
				case "outerwear":
					$($("#menuClick").children(".outerwear")).addClass('active');
					break;
				case "tops":
					$($("#menuClick").children(".tops")).addClass('active');
					break;
				case "dresses":
					$($("#menuClick").children(".dresses")).addClass('active');
					break;
				case "bottoms":
					$($("#menuClick").children(".bottoms")).addClass('active');
					break;
				case "accessories":
					$($("#menuClick").children(".accessories")).addClass('active');
					break;
				
			}
		}
		
		$("#menuClick").children().on("click", (e)=>{
			$("#menuClick").children(".active").removeClass('active');
			$(e.target.parentNode).addClass('active');			
		});
	}
}

index.init();