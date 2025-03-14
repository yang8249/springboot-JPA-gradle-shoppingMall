
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
		

$(function(){
	//찜하기
	$(".wish").on("click", (e)=>{

		/*let elementData = $(".wish[data-productseq]")[i].attributes["data-productseq"].value;
		console.log(elementData);
		myWishArr.includes(Number(elementData))*/
		const dataSeq = Number(e.currentTarget.dataset["productseq"]);
		const isElement = $(".wish[data-productseq='"+dataSeq+"']").hasClass("addWish");
		console.log(isElement);
		if(!isElement){
			addWish(dataSeq);				
		}else{
			removeWish(dataSeq);
		}
	});	
	function addWish(productSeq){
		if($("#userId").val() == null || $("#userId").val() == ""){
			return alert("로그인을 해주세요.");
		}
		
		// cart, Product와 Users 객체
		const wish = {
		};
		const product = {
		    productSeq: productSeq
		};
		const user = {
		   	id : $("#userId").val()
		};
		
		// 두 객체를 하나의 JSON 객체로 묶기
		let data = {
			wish : wish,
			product: product,
			user: user
		};
		
		$.ajax({
			headers: {
		        'X-CSRF-Token': getCsrfToken()  // 쿠키에서 가져온 CSRF 토큰을 헤더에 추가
		    },
			type:"POST",
			url:"/api/Product/addWish",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
		}).done((result)=>{
			$("#actionWish").addClass("btn-primary");
			alert("찜하기 완료 : "+result);
			
			const seq = result.data.product.productSeq;
			const element = $(".wish[data-productseq='"+seq+"']");
			element.css("background-color", "#f79fcc");
			element.addClass("addWish");
		}).fail((error)=>{
			alert(JSON.stringify(error));
		});
	}
	function removeWish(productSeq){
		
		// cart, Product와 Users 객체
		const wish = {
		};
		const product = {
		    productSeq: productSeq
		};
		const user = {
		   	id : $("#userId").val()
		};
		
		// 두 객체를 하나의 JSON 객체로 묶기
		let data = {
			wish : wish,
			product: product,
			user: user
		};
		
		$.ajax({
			headers: {
		        'X-CSRF-Token': getCsrfToken()  // 쿠키에서 가져온 CSRF 토큰을 헤더에 추가
		    },
			type:"DELETE",
			url:"/api/Product/removeWish",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
		}).done((result)=>{
			$("#actionWish").removeClass("btn-primary")
			alert("찜하기를 취소하였습니다. : "+result);
			console.log(result);
			const seq = result.data.product.productSeq;
			const element = $(".wish[data-productseq='"+seq+"']");
			element.css("background-color", "");
			element.removeClass("addWish");
			//$(element[i]).css("background-color", "#f79fcc");
		}).fail((error)=>{
			alert(JSON.stringify(error));
		});
	}
	
	//장바구니 담기
	$(".cart").on("click", (e)=>{
		addCart(e);
	});	
	function addCart(e){
		if($("#userId").val() == null || $("#userId").val() == ""){
			return alert("로그인을 해주세요.");
		}
		
		// cart, Product와 Users 객체
		const cart = {
			productCount : 1,
			productName : $(e.currentTarget).data("productname"),
			totalPrice : $(e.currentTarget).data("productprice")
		};
		const product = {
		    productSeq: $(e.currentTarget).data("productseq")
		};
		const user = {
		   	id : $("#userId").val()
		};
		
		// 두 객체를 하나의 JSON 객체로 묶기
		let data = {
			cart : cart,
			product: product,
			user: user
		};
		
		$.ajax({
			headers: {
		        'X-CSRF-Token': getCsrfToken()  // 쿠키에서 가져온 CSRF 토큰을 헤더에 추가
		    },
			type:"POST",
			url:"/api/Product/addCart",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
		}).done((result)=>{
			alert("장바구니 담기 완료 : "+result);
			console.log("result : "+result);
		}).fail((error)=>{
			alert(JSON.stringify(error));
		});
	}
	
})


$(window).on('load', function(){
	
	//찜목록 찾기
	for(const product of productList){
		for(const wish of wishList){
			console.log("wish : "+wish.productId);
			console.log("product : "+product.id);
			if(product.id == wish.productId){
				myWishArr.push(product.id);
				console.log("myWishArr : "+myWishArr);
			}
		}
	}
	
	//찾은 찜목록에 색칠해주기
	const element = $(".wish[data-productseq]");
	for(i=0; i<element.length; i++){
		let elementData = $(".wish[data-productseq]")[i].attributes["data-productseq"].value;
		console.log(elementData);
		if(myWishArr.includes(Number(elementData))){
			console.log("성공!");
			$(element[i]).css("background-color", "#f79fcc");
			$(element[i]).addClass("addWish");
		}
	}
	
});