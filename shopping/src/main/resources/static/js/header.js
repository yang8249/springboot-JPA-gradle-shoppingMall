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





const btn = document.getElementById('searchBtn');
const box = document.getElementById('searchBox');

const input = document.getElementById('searchInput');

btn.addEventListener('click', () => {
  box.classList.toggle('show');
  if (box.classList.contains('show')) {
      input.focus(); // 열릴 때 자동 포커스
  }
});


  // ✅ Enter 입력 시 API 호출
  input.addEventListener('keydown', async (e) => {
	if (e.key === 'Enter') {
	    const query = input.value.trim();
	    if (!query) return;

	    console.log(`검색 요청: ${query}`);

	    try {
	      // ✅ 올바른 파라미터명과 기본값 추가
	      const res = await fetch(`/articles/search/advanced?query=${encodeURIComponent(query)}`);

	      if (!res.ok) throw new Error('API 요청 실패');
	      const data = await res.json();

	      console.log('검색 결과:', data);

	      // 🔽 예시: 검색 결과를 화면에 표시하고 싶다면
	      const resultDiv = document.getElementById('results');
	      if (resultDiv) {
	        resultDiv.innerHTML = data.content.map(article => `
	          <div class="result-item">
	            <h3>${article.title}</h3>
	            <p>${article.content}</p>
	          </div>
	        `).join('');
	      }		
		  	// AJAX 요청
			$.ajax({
			    url: "/searchProductList", // 서버 엔드포인트
			    type: "POST",
			    contentType: "application/json",
			    data: JSON.stringify(data), // 검색 조건 JSON
			    success: function(data) {
					console.log("검색된 제품 목록:", data);
					// 페이지 이동
					window.location.href = '/productListPage';

			    },
			    error: function(xhr, status, error) {
			        console.error("검색 오류:", error);
			    }
			});

	    } catch (err) {
	      console.error('검색 중 오류:', err);
	    }
	  }
  });