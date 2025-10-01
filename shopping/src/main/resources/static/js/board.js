/**
 * 회원가입 js입니다.
 */
// 쿠키에서 특정 이름의 값을 가져오는 함수
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
	
let index2 = {
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
		$("#btn-answer").on("click", ()=>{
			this.answer();
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
			alert("글이 저장되었습니다.");
			console.log("글이 저장되었습니다. : "+result);
			location.href = "/boardList?userId="+$("#userId").val();
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
				url:"/api/board/"+$("#boardId").val(),
				contentType:"application/json; charset=utf-8",
				dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
			}).done((result)=>{
				alert("삭제가 완료되었습니다.");
				console.log("삭제가 완료되었습니다. : "+result);
				location.href = "/boardList?userId="+$("#userId").val();
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
			alert("글이 수정되었습니다.");
			console.log("글이 수정되었습니다. : "+result);
			location.href = "/boardList?userId="+$("#userId").val();
		}).fail((error)=>{
			alert(JSON.stringify(error));
		});
			
	},
	answer:function(){
		
		let data = {
			id : $("#boardId").val(),
			answer : $("#answer").val()
		};

		$.ajax({
			headers: {
		        'X-CSRF-Token': getCsrfToken()  // 쿠키에서 가져온 CSRF 토큰을 헤더에 추가
		    },
			type:"PUT",
			url:"/api/boardAnswer/"+data.id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
		}).done((result)=>{
			alert("답변이 완료되었습니다.");
			console.log("답변이 완료되었습니다. : "+result);
			location.href = "/admin"
		}).fail((error)=>{
			alert(JSON.stringify(error));
		});
			
	}
}

index2.init();