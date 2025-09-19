$(document).ready(function(){


	const phone = $("#phone").val(); // 또는 "010-222-333"
	const [phoneNum1, phoneNum2, phoneNum3] = phone.split("-");

	$("#rphone2_1").val(phoneNum1);	
	$("#rphone2_2").val(phoneNum2);
	$("#rphone2_3").val(phoneNum3);
		
	const input = document.getElementById('inputBox');
	const box = document.getElementById('dynamicBox');


	
   var fileTarget = $('.filebox .upload-hidden');

   fileTarget.on('change', function () {
       const files = $(this)[0].files;
       let filenames = [];

       if (window.FileReader && files.length) {
           filenames = [...files].map(file => file.name);
       } else {
           // Old IE fallback
           const val = $(this).val();
           filenames = [val.split('/').pop().split('\\').pop()];
       }

       $(this).siblings('.upload-name').val(filenames.join(', '));
	   const length = filenames.join(', ').length;
	   input.style.width = `${length + 5}ch`; // +1은 여유 공간
	   box.style.width = `${length + 17}ch`; // +1은 여유 공간
   });

    //preview image 
    var imgTarget = $('.preview-image .upload-hidden');

    imgTarget.on('change',async function(){
        var parent = $(this).parent();
		if($($(".upload-display").siblings()[0]).is("br")){
			$($(".upload-display").siblings()[0]).remove();
		}
        parent.children('.upload-display').remove();

        if(window.FileReader){
			const files = $(this)[0].files;

			for (const file of files) {
			    if (!file.type.match(/image\//)) continue;
			    const src = await readFileAsDataURL(file);
			    parent.append(`
			      <div class="upload-display">
			        <div class="upload-thumb-wrap">
			          <img src="${src}" class="upload-thumb">
			        </div>
			      </div>
			    `);
			  }
			  async function readFileAsDataURL(file) {
	  			  return new Promise((resolve, reject) => {
	  			    const reader = new FileReader();
	  			    reader.onload = e => resolve(e.target.result);
	  			    reader.onerror = reject;
	  			    reader.readAsDataURL(file);
		  		});
		  	}

        }

        else {
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

            var img = $(this).siblings('.upload-display').find('img');
            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
        }
    });
	
		//제품 저장
		$("#btn-save").click((e)=>{
			
			const arrList = {};  // 빈 객체 생성
			
			const fileInput = $('#input_file')[0];
		  	const files = fileInput.files;  // FileList 객체

			  // arrList 객체 안에 fileList 배열을 생성하여 파일 정보를 담을 준비
			  arrList.fileList = [];

			  if (files.length > 0) {
			      // 선택된 파일들에 대해 반복문 처리
			      for (let i = 0; i < files.length; i++) {
			          const file = files[i];  // 각 파일 정보

			          // arrList.fileList[i]에 파일 정보를 객체 형태로 저장
			          arrList.fileList[i] = {
			              fileName: file.name,  // 파일 이름
			              fileSize: file.size,  // 파일 크기 (바이트 단위)
			              fileType: file.type   // 파일 MIME 타입
			          };
			      }

			      // 파일 정보 출력 (디버깅용)
			      console.log(arrList);
			  } else {
			      console.log("파일이 선택되지 않았습니다.");
				alert("파일을 등록해주세요.");
				return;
			  }
			
			arrList.orderName = $("#orderName").val();  
			arrList.bank = $("#bank").val();  
			arrList.payCustomer = $("#payCustomer").val(); 
			arrList.productName = $("#productName").val();  
			arrList.totalPrice = $("#price").val();  
			arrList.rphone2_1 = $("#rphone2_1").val();	
			arrList.rphone2_2 = $("#rphone2_2").val();
			arrList.rphone2_3 = $("#rphone2_3").val();
			arrList.category = $("#category").val();  
			arrList.returnTitle = $("#returnTitle").val();  
			arrList.reason = $("#reason").val();  
			arrList.deliId = $("#deliId").val();  
			arrList.productSeq = $("#productSeq").val();  
			
			for (const key in arrList) {
				const value = arrList[key];
			  	console.log(`${key}: ${value}`);  // 키와 값을 출력
				  if(!value){
					alert($("#"+`${key}`).data("info")+"정보를 입력해주세요.")
	
					e.preventDefault();  // 기본 동작을 막음
					e.stopPropagation(); // 이벤트 전파를 막음
					return false;
				  }
			  }
			  
			  console.log(arrList);

			  const returnDelivery ={
				refund: arrList.totalPrice,
				returnTitle: arrList.returnTitle,
				reason: arrList.reason
			  };
			  const users = {
	  				id : $("#userId").val()
				};

				const delivery = {
					id: arrList.deliId
				} 

				const data = {
					returnDelivery : returnDelivery,
					users : users,
					delivery : delivery
				}
				
			const formData = new FormData();
			formData.append("returnDelivery", JSON.stringify(data));
			const fileInfoList = $("#input_file")[0].files; // 파일 리스트를 가져옴

			// 파일을 
			// 하나씩 FormData에 추가
			for (let i = 0; i < fileInfoList.length; i++) {
			    formData.append("file", fileInfoList[i]); // 각 파일을 "file" 필드로 추가
			}
			
			$.ajax({
				url:"/api/Product/insertReturn",
			    type: 'POST',
				enctype: 'multipart/form-data',	// 필수
			    data: formData,
			    processData: false, // 자동으로 데이터 처리를 하지 않음
			    contentType: false, // content-type을 자동으로 설정하지 않음
			    success: function(response) {
					alert("반품 요청이 완료되었습니다.");
			        console.log("Upload Success: ", response);
					location.href = "/";
			    },
			    error: function(xhr, status, error) {
			        console.log("Upload Failed: ", error);
			    }
			});

			/*//여기 밑에 결제가 완료되었습니다. 알람띄어주고
			//마이페이지 구매정보로 옮겨주기
			$.ajax({
				headers: {
			        'X-CSRF-Token': getCsrfToken()  // 쿠키에서 가져온 CSRF 토큰을 헤더에 추가
			    },
				type:"POST",
				url:"/api/Product/addProduct",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
			}).done((result)=>{
				alert("제픔등록 완료!");
				console.log("result : "+result);
			}).fail((error)=>{
				alert(JSON.stringify(error));
			});*/
			
		});
		
});