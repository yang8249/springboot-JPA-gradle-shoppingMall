window.onload = function() {
	
	
	
	
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
		      const res = await fetch(`/articles/search/products?keyword=${encodeURIComponent(query)}&page=0&size=10`);

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

		    } catch (err) {
		      console.error('검색 중 오류:', err);
		    }
		  }
	  });
};
