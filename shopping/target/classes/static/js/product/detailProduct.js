if(!!isWish){
	$("#actionWish").addClass("btn-primary");
}

//쿠키가져오기
function getCookie(name) {
    let cookies = document.cookie.split("; "); // 쿠키 문자열을 배열로 변환
    for (let cookie of cookies) {
        let [key, value] = cookie.split("="); // key-value 분리
        if (key === name) {
            return decodeURIComponent(value); // 값 디코딩 후 반환
        }
    }
    return null; // 쿠키가 없을 경우
}

$(function(){	
	

			
	


	$("#btn-delete").on("click", ()=>{

		const product = {
		    productSeq: productSeq
		};
		
		let data = {
			product
		};
		
		$.ajax({
			headers: {
		        'X-CSRF-Token': getCsrfToken()  // 쿠키에서 가져온 CSRF 토큰을 헤더에 추가
		    },
			type:"DELETE",
			url:"/api/Product/removeProduct",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
		}).done((result)=>{
			console.log("삭제가 완료되었습니다. : "+result);
			location.href = "/";
		}).fail((error)=>{
			alert(JSON.stringify(error));
		});
	});
	
	
	//상품 갯수 추가
	$(".countEvent").click((e)=>{
		console.log(e.target.classList[0]);
		const arrow = e.target.classList[0];
		const quanti = $("#quantity").val();
		
		
		if(arrow == "up"){
			//숫자카운팅
			$("#quantity").val(Number(quanti)+1);

			//가격 증가		
			price += defaultPrice;
			stringPrice = price.toLocaleString('ko-KR') + "원";

			$(".quantity_price").text(stringPrice);
		}else if(arrow == "down"){
			if($("#quantity").val() <= 1){return;}
			
			//숫자카운팅
			$("#quantity").val(Number(quanti)-1);

			//가격 인하	
			price -= defaultPrice;
			stringPrice = price.toLocaleString('ko-KR') + "원";
			$(".quantity_price").text(stringPrice);
		}
		
		//최종 금액과 카운트 적용
		$($(".total").children()[0])[0].innerText = stringPrice;
		$($(".total").children()[1])[0].innerText = "("+$("#quantity").val()+"개)";
	});
	
	//장바구니 담기
	$("#actionCart").on("click", ()=>{
		addCart();
	});	
	function addCart(){
			if($("#userId").val() == null || $("#userId").val() == ""){
				return alert("로그인을 해주세요.");
			}
			
			// cart, Product와 Users 객체
			const cart = {
				productCount : $("#quantity").val(),
				productName : productName,
				totalPrice : price
			};
			const product = {
			    productSeq: productSeq,
				productCount : $("#quantity").val(),
				productName : productName,
				totalPrice : price
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
				location.href = "/";
			}).fail((error)=>{
				alert(JSON.stringify(error));
			});
		}

		//찜하기
		$("#actionWish").on("click", ()=>{
			if(!$("#actionWish").hasClass("btn-primary")){
				addWish();				
			}else{
				removeWish();
			}
		});	
		function addWish(){
			if($("#userId").val() == null || $("#userId").val() == ""){
				return alert("로그인을 해주세요.");
			}
			
			// cart, Product와 Users 객체
			const wish = {
				productName : productName
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
			}).fail((error)=>{
				alert(JSON.stringify(error));
			});
		}
		function removeWish(){
			
			// cart, Product와 Users 객체
			const wish = {
				id : isWish
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
			}).fail((error)=>{
				alert(JSON.stringify(error));
			});
		}

		//구매 팝업열기
		$("#actionBuy").on("click", ()=>{
			if(!userId.value){
				alert("로그인 후 이용해주세요.");
				return;
			}
			$("#payMenuDiv1").css("display", "");
		});	
				
		//구매 팝업닫기
		$("#closeBtn").on("click", ()=>{
			$("#payMenuDiv1").css("display", "none");
		});	

		//주소찾기 API호출
		$("#btn_search_rzipcode").click((e)=>{
			addressApi.open();
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
				
				$("#raddr1").val(data.address);
				$("#rzipcode1").val(data.zonecode);
		    }
		});

		$("#oemail3").change((e)=>{
			
			console.log(e.target.value);
			if(e.target.value == "etc"){
				$("#oemail2").css("display", "block");
			}else{
				$("#oemail2").css("display", "none");
				$("#oemail2").val("");
			}
		});

		$("#omessage_select").change((e)=>{
			if(e.target.value == "oMessage-input"){
				$("#messageInput").css("display", "block");
			}else{
				$("#messageInput").val("");
				$("#messageInput").css("display", "none");
			}
		});
		
		$("#allAgree").click((e)=>{
			console.log(e.target.checked);
			if(e.target.checked){
				$("#chk_purchase_agreement0").prop("checked", true);
				$("#mallAgree").prop("checked", true);
				$("#personAgree").prop("checked", true);
			}else{
				$("#chk_purchase_agreement0").prop("checked", false);
				$("#mallAgree").prop("checked", false);
				$("#personAgree").prop("checked", false);
			}
			
		});
		
		$("#btn_payment").click((e)=>{
			const arrList = {};  // 빈 객체 생성
			
			arrList.rname = $("#rname").val();    
			arrList.rzipcode1 = $("#rzipcode1").val();
			arrList.raddr1 = $("#raddr1").val();
			arrList.raddr2 = $("#raddr2").val();
			arrList.omessage_select = $("#omessage_select").val();
			arrList.omessage = $("#omessage").val();
			arrList.rphone2_1 = $("#rphone2_1").val();	
			arrList.rphone2_2 = $("#rphone2_2").val();
			arrList.rphone2_3 = $("#rphone2_3").val();
			arrList.oemail1 = $("#oemail1").val();
			if($("#oemail2").css("display") == "none"){
				arrList.oemail2 = $("#oemail3").val();
			}else{
				arrList.oemail2 = $("#oemail2").val();
			}
			arrList.bankaccount = $("#bankaccount").val();
			arrList.pname = $("#pname").val();
			arrList.chk_purchase_agreement0 = $("#chk_purchase_agreement0").prop("checked");
			arrList.mallAgree = $("#mallAgree").prop("checked");
			arrList.personAgree = $("#personAgree").prop("checked");  


			if(arrList.omessage_select == "oMessage-input"){
			  if(!arrList.omessage){
				alert($("#omessage_select").data("info")+"정보를 입력해주세요.")

				e.preventDefault();  // 기본 동작을 막음
				e.stopPropagation(); // 이벤트 전파를 막음
				return false;
			  }
			}
			
			for (const key in arrList) {
				const value = arrList[key];
			  	console.log(`${key}: ${value}`);  // 키와 값을 출력
				//조건문 나중에 다시처리하기
				if(key != "raddr2" && key != "omessage_select" && key != "omessage"){
				  if(!value){
					alert($("#"+`${key}`).data("info")+"정보를 입력해주세요.")
	
					e.preventDefault();  // 기본 동작을 막음
					e.stopPropagation(); // 이벤트 전파를 막음
					return false;
				  }
				}
			  }
			
			const users = {
				id : userId.value,
				username : arrList.rname,
				email : arrList.oemail1+"@"+oemail2,
				mainAddr : arrList.raddr1,
				detailAddr : arrList.raddr2,
				zoneCode : arrList.rzipcode1,
				phone : arrList.rphone2_1+"-"+arrList.rphone2_2+"-"+arrList.rphone2_3
			};
			const delivery = {
				mainAddr : arrList.raddr1,
				detailAddr : arrList.raddr2,
				phone : arrList.rphone2_1+"-"+arrList.rphone2_2+"-"+arrList.rphone2_3,
				detailInfo1 : arrList.omessage_select, 
				detailInfo2 : arrList.omessage,
				bank : arrList.bankaccount,
				payCustomer : arrList.pname
			};
			const product ={
				productSeq: productSeq
			}
			const cart = {
				productCount : $("#quantity").val(),
				productName : productName,
				totalPrice : price
			} 
			
			
			const data = {
				users : users,
				delivery : delivery,
				product : product,
				cart : cart
			}
			
			  
			//여기 밑에 결제가 완료되었습니다. 알람띄어주고
			//마이페이지 구매정보로 옮겨주기
			$.ajax({
				headers: {
			        'X-CSRF-Token': getCsrfToken()  // 쿠키에서 가져온 CSRF 토큰을 헤더에 추가
			    },
				type:"POST",
				url:"/api/pay/insertPay",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
			}).done((result)=>{
				alert("결제되었습니다!");
				console.log("result : "+result);
				location.href = "/user/mypageForm?page=orderList";
			}).fail((error)=>{
				alert(JSON.stringify(error));
			});
			
		});
		$("#btn_payment").click((e)=>{
			alert("기능 개발 예정입니다!");
		});

});


//쇼핑몰 이용약관 동의
function viewMallAgree() {
    window.open('https://ecudemo276583.cafe24.com/order/ec_orderform/agreement/mallagree.html?basket_type=A0000&delvtype=A'	, "PopupWin", "width=500,height=600");
}
//비회원 구매시 개인정보수집이용동의
function viewPersonAgree() {
	window.open('https://ecudemo276583.cafe24.com/order/ec_orderform/agreement/personagree.html?basket_type=A0000&delvtype=A'	, "PopupWin", "width=500,height=600");
}
// window의 load 이벤트에 이미지 줌 기능을 연결합니다.
    $(window).on('load', function(){
        imageZoom(".img", ".zoom_result");
    });
	//상품 자세히보기
	    function imageZoom(imgSelector, resultSelector) {
	        // 필요한 요소들을 선택 또는 생성합니다.
	        const img = $(imgSelector);
	        const result = $(resultSelector);
	        const lens = $("<div/>", { "class": "zoom_lens" });
	        lens.insertBefore(img);

	        // 렌즈와 결과 영역의 배경 이미지의 크기 배율을 계산합니다.
	        const cx = result.width() / lens.width();
	        const cy = result.height() / lens.height();

	        // 결과 영역에 배경 이미지를 설정합니다.
	        result.css({
	            "backgroundImage": `url(${img.attr('src')})`, 
	            "backgroundSize": `${img.width() * cx}px ${img.height() * cy}px`
	        });

	        // 마우스 이동 또는 터치 이벤트에 대한 핸들러를 설정합니다.
	        lens.add(img).on('mousemove touchmove', function (e) {
	            e.preventDefault();
	            const pos = getCursorPos(e, img);

	            // 렌즈가 이미지 범위를 넘어가지 않도록 조절합니다.
	            let x = pos.x - lens.width() / 2;
	            let y = pos.y - lens.height() / 2;
	            x = Math.max(0, Math.min(x, img.width() - lens.width()));
	            y = Math.max(0, Math.min(y, img.height() - lens.height()));

	            // 렌즈와 결과 영역의 위치를 업데이트합니다.
	            lens.css({ left: x, top: y });
	            result.css('backgroundPosition', `-${x * cx}px -${y * cy}px`);
	        });

	        // 커서 위치를 계산하는 함수를 정의합니다.
	        function getCursorPos(e, img) {
	            const imgOffset = img.offset();
	            let x = e.pageX - imgOffset.left;
	            let y = e.pageY - imgOffset.top;

	            if (e.type === 'touchmove') {
	                x = e.originalEvent.touches[0].pageX - imgOffset.left;
	                y = e.originalEvent.touches[0].pageY - imgOffset.top;
	            }

	            return { x, y };
	        }
	    }