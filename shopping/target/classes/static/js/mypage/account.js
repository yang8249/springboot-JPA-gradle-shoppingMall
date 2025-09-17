
const phone = $("#phone").val(); // 또는 "010-222-333"
const [phoneNum1, phoneNum2, phoneNum3] = phone.split("-");

if(!!phone){
	$("#rphone2_1").val(phoneNum1);	
}
$("#rphone2_2").val(phoneNum2);
$("#rphone2_3").val(phoneNum3);

$("#btn-update").on("click", ()=>{
	update();
});	

function update(){
	
		const phoneNumber = $("#rphone2_1").val()+"-"+$("#rphone2_2").val()+"-"+$("#rphone2_3").val();
		let data = {
			id : $("#userId").val(),
			username : $("#username").val(),
			password : $("#password").val(),
			name : $("#name").val(),
			phone : phoneNumber,
			email : $("#email").val(),
			mainAddr : $("#inputAddress").val(),
			detailAddr : $("#inputAddress2").val(),
			zoneCode : $("#inputAddress3").val()
		};
	
		$.ajax({
			type:"PUT",
			url:"/user",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json" //서버에서 응답받을때에 데이터를 자바스크립트 객체로 받는다는뜻이다.
		}).done((result)=>{
			console.log("회원정보 수정 완료 ");
			location.reload();
		}).fail((error)=>{
			alert(JSON.stringify(error));
		});
	}