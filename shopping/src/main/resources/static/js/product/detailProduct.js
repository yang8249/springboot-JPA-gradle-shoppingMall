$(function(){
	
		
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

    // window의 load 이벤트에 이미지 줌 기능을 연결합니다.
    $(window).on('load', function(){
        imageZoom(".img", ".zoom_result");
    });
	
	$(".countEvent").click((e)=>{
		console.log(e.target.classList[0]);
		const arrow = e.target.classList[0];
		const quanti = $("#quantity").val();
		
		//가격은 DB에서 가져온걸로 뿌려주기
		const price = $(".option_box_price").val();
		
		if(arrow == "up"){
			$("#quantity").val(Number(quanti)+1);

			//가격은 DB에서 가져온걸로 뿌려주기
			$(".quantity_price").text(Number(price)*2);
		}else if(arrow == "down"){
			if($("#quantity").val() <= 1){return;}
			$("#quantity").val(Number(quanti)-1);

			//가격은 DB에서 가져온걸로 뿌려주기
			$(".quantity_price").text(Number(price)/2);
		}
	});
});

