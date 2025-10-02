
let orderList;
let returnList;
var table = null;
var table2 = null;

async function getOrderList(){
	//주문목록이용
	await new Promise((resolve, reject) => {
	  $.ajax({
		url:"/api/mypage/orderList",
		type:"POST",
		data:JSON.stringify(user),
		contentType:"application/json; charset=utf-8",
	    dataType: "json",
	    success: async function(response) {
	      resolve(response);  // 성공적으로 데이터를 받으면 resolve 호출
		  orderList = response.data;
		  await getReturnList();
	    },
	    error: function(xhr, status, error) {
	      reject(error);  // 에러 발생 시 reject 호출
	    }
	  });
	});
}

async function getReturnList(){
	//주문목록이용
	await new Promise((resolve, reject) => {
	  $.ajax({
		url:"/api/mypage/returnList",
		type:"POST",
		data:JSON.stringify(user),
		contentType:"application/json; charset=utf-8",
	    dataType: "json",
	    success: async function(response) {
	      resolve(response);  // 성공적으로 데이터를 받으면 resolve 호출
		  returnList = response.data;
		  await initGrid();
	    },
	    error: function(xhr, status, error) {
	      reject(error);  // 에러 발생 시 reject 호출
	    }
	  });
	});
}

getOrderList();

async function initGrid(){
	//주문목록 그리드
	//define some sample data
	console.log("orderList : "+orderList);
	
	const test = [];

	for (let i = 0; i < orderList.length; i++) {
	  const obj = {
	    num: i+1,
		deliId: orderList[i].id,
	    image: orderList[i].product.fileInfo[0].uuid,
	    name: orderList[i].orderName,
		location: orderList[i].mainAddr +" "+ orderList[i].detailAddr,
		productSeq: orderList[i].product.productSeq,
		productName: orderList[i].product.productName,
		category: orderList[i].product.category,
		itemCount: orderList[i].itemCount,
		totalPrice: Number(orderList[i].totalPrice).toLocaleString()+"원",
		createDate: orderList[i].createDate.slice(0, 10)
	  };

	  test.push(obj);
	}

	console.log(test);
	
	 /*var tabledata = [
		{id:1, num:"num", image:"image", name:"Oli Bob", age:"12", col:"red", dob:""},
		{id:2, num:"num", image:"image", name:"Oli Bob", age:"12", col:"red", dob:""},
	 	{id:3, num:"num", image:"image", name:"Oli Bob", age:"12", col:"red", dob:""},
	 	{id:4, num:"num", image:"image", name:"Mary May", age:"1", col:"blue", dob:"14/05/1982"},
	 	{id:5, num:"num", image:"image", name:"Christine Lobowski", age:"42", col:"green", dob:"22/05/1982"},
	 	{id:6, num:"num", image:"image", name:"Brendon Philips", age:"125", col:"orange", dob:"01/08/1980"},
	 	{id:7, num:"num", image:"image", name:"Margret Marmajuke", age:"16", col:"yellow", dob:"31/01/1999"},
	 ];*/
	 
	 //create Tabulator on DOM element with id "example-table"
	  table = new Tabulator("#example-table1", {
		resizableRows: true,
	  	height:705, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
	  	data:test, //assign data to table
	  	layout:"fitColumns", //fit columns to width of table (optional)
		maxHeight: "600px", //늘어나다가 최대 600px 까지 늘어나도록 제한검
	  	columns:[ //Define Table Columns
			{title:"순번", field:"num", width:65, hozAlign:"center", vertAlign: "middle"},
			{
			  title:"image",
			  field:"image",
			  formatter: function(cell, formatterParams){
			    var imgUrl = cell.getValue();
			    return `<img src="/image?filename=${imgUrl}" style="height:100px;">`;
			  },hozAlign:"center", vertAlign: "center"
			},
			{
			    name: 'action',
			    index: 'action',
			    width: 100,
			    align: "center",
			    formatter: function(cellvalue, options, rowObject) {
					console.log("editRow :"+rowObject.id);
			      return `<button onclick="editRow('${rowObject.id}')">반품하기</button>`;
			    },hozAlign:"center", vertAlign: "middle"
			  },
	 	 	{title:"받는사람", field:"name", width:150, hozAlign:"center", vertAlign: "middle"},
	 	 	{title:"배송지", field:"location", width:400, hozAlign:"center", vertAlign: "middle", formatter: "textarea"},
	 	 	{title:"제품 명", field:"productName", hozAlign:"center", vertAlign: "middle", formatter: "textarea"},
			{title:"카테고리", field:"category", hozAlign:"center", vertAlign: "middle", width: 120},
			{title:"주문 갯수", field:"itemCount", hozAlign:"center", vertAlign: "middle", width: 100},
			{title:"결제 금액", field:"totalPrice", hozAlign:"center", vertAlign: "middle", width: 120},
	 	 	{title:"결제일", field:"createDate", hozAlign:"center", vertAlign: "middle" },
	  	],
	 });

	 //요기는 위에서 만든 그리드 버튼이벤트 넣는곳
	 //trigger an alert message when the row is clicked
	 table.on("rowClick", function(e, row){ 

	 console.log(e);
	 console.log(row);
	 
	 if (e.target.tagName === "BUTTON") {
	   console.log("버튼 태그 클릭됨!");
	   window.location = "/product/writeReturnItem?id="+ row._row.data.deliId +"&userId="+ user.id;
		
	   return; 
	 }
	 
	 const result = confirm("제품 페이지로 이동하시겠습니까?");
	 if (result) {
	   // 사용자가 "예"를 눌렀을 때
	   console.log("예");
	 	console.log("/product/detailProduct?id="+ row._row.data.productSeq +"&userId="+ user.id);
	 	window.location = "/product/detailProduct?id="+ row._row.data.productSeq +"&userId="+ user.id;
	 } else {
	   // 사용자가 "아니오"를 눌렀을 때
	   console.log("아니요");
	 }

	 });
	 
	 
	 
	 
	 
	 ////반품현황 그리드
 	//define some sample data
 	console.log("returnList : "+returnList);
 	
 	const returnListArr = [];

 	for (let i = 0; i < returnList.length; i++) {
		
		let status = returnList[i].status;
		switch(status) {
			case "REQUESTED":
				status = "반품 요청됨";
				break;
			case "APPROVED":
				status = "반품 승인됨";
				break;
			case "REJECTED":
				status = "반품 거절됨";
				break;
			case "REFUNDED":
				status = "반품 완료";
				break;
			default:
		}
 	  const obj = {
 	    num: i+1,
 		returnId: returnList[i].id,
 	    image: returnList[i].fileInfo[0].uuid,
 	    name: returnList[i].delivery.orderName,
 		location: returnList[i].delivery.mainAddr +" "+ returnList[i].delivery.detailAddr,
 		productSeq: returnList[i].delivery.product.productSeq,
 		productName: returnList[i].delivery.product.productName,
 		category: returnList[i].delivery.product.category,
 		itemCount: returnList[i].delivery.itemCount,
 		totalPrice: Number(returnList[i].delivery.totalPrice).toLocaleString()+"원",
 		createDate: returnList[i].createDate.slice(0, 10),
		reason: returnList[i].reason,
		returnTitle: returnList[i].returnTitle,
		adminNote: returnList[i].adminNote,
		status: status
 	  };

 	  returnListArr.push(obj);
 	}

 	console.log(returnListArr);
	
	 
	  
	table2 = new Tabulator("#example-table2", {
	  	height:705, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
	  	data:returnListArr, //assign data to table
	  	layout:"fitColumns", //fit columns to width of table (optional)
		maxHeight: "600px", //늘어나다가 최대 600px 까지 늘어나도록 제한검
	  	columns:[ //Define Table Columns
			{title:"순번", field:"num", width:65, hozAlign:"center", vertAlign: "middle"},
			{
			  title:"image",
			  field:"image",
			  formatter: function(cell, formatterParams){
			    var imgUrl = cell.getValue();
			    return `<img src="/image?filename=${imgUrl}" style="height:100px;">`;
			  },hozAlign:"center", vertAlign: "middle"
			},
			{
			    name: 'action',
			    index: 'action',
			    width: 100,
			    align: "center",
			    formatter: function(cellvalue, options, rowObject) {
					console.log("editRow :"+rowObject.id);
					if(cellvalue._cell.row.data.status == "반품 승인됨"){
						return; //버튼 안보이게
					} else if(cellvalue._cell.row.data.status == "반품 거절됨"){
						return; //버튼 안보이게
					}	
			      return `<button onclick="editRow('${rowObject.id}')">반품취소</button>`;
			    },hozAlign:"center", vertAlign: "middle"
			  },
	 	 	{title:"주문자", field:"name", width:150, hozAlign:"center", vertAlign: "middle"},
	 	 	{title:"배송지", field:"location", width:400, hozAlign:"center", vertAlign: "middle", formatter: "textarea"},
	 	 	{title:"제품 명", field:"productName", hozAlign:"center", vertAlign: "middle", formatter: "textarea"},
			{title:"카테고리", field:"category", hozAlign:"center", vertAlign: "middle"},
			{title:"주문 갯수", field:"itemCount", hozAlign:"center", vertAlign: "middle"},
			{title:"환불 예정 금액", field:"totalPrice", hozAlign:"center", vertAlign: "middle"},
	 	 	{title:"환불 요청일", field:"createDate", hozAlign:"center", vertAlign: "middle"},
			{title:"환불 진행 상태", field:"status", hozAlign:"center", vertAlign: "middle",
				formatter: function(cell) {
				    const value = cell.getValue();
				    const el = cell.getElement();
					console.log("status value : "+value);
					console.log("status el : "+el);
				    // 조건에 따라 배경색 변경
				    if (value === "반품 승인됨") {
				      el.style.backgroundColor = "#cce5ff"; // 연두색
				      el.style.color = "#155724"; // 글자색
				    } else if (value === "반품 거절됨") {
				      el.style.backgroundColor = "#f8d7da"; // 연노랑
				      el.style.color = "#856404";
    				} else if (value === "반품 완료") {
				      el.style.backgroundColor = "#d4edda"; // 연노랑
				      el.style.color = "#856404";
				    }

				    return value; // 셀에 표시할 텍스트
				  }
			},
	  	]
	 });

	 //요기는 위에서 만든 그리드 버튼이벤트 넣는곳
	 //trigger an alert message when the row is clicked
	 table2.on("rowClick", function(e, row){ 

	 console.log(e);
	 console.log(row);

	 if (e.target.tagName === "BUTTON") {
		 const result = confirm("반품을 취소하시겠습니까?");
		 if (result) {
	   		console.log("예");		
			$.ajax({
				url:"/api/mypage/cancelReturnItem?id="+ row._row.data.returnId,
				type:"DELETE",
				data:JSON.stringify(user),
				contentType:"application/json; charset=utf-8",
			    dataType: "json",
			    success: async function(response) {
					if (response.data > 0) {
						alert("반품이 취소되었습니다.");
						table2.getRows()[row.getPosition()-1].delete()
						return;
					}
				  alert("반품 취소에 실패했습니다.");
			    },
			    error: function(xhr, status, error) {
				  alert("반품 취소에 실패했습니다." + error);
			    }
			  });
		} else {
		   // 사용자가 "아니오"를 눌렀을 때
		   console.log("아니요");
		 }

	   return; 
	 }

	 const result = confirm("제품 페이지로 이동하시겠습니까?");
	 if (result) {
	   // 사용자가 "예"를 눌렀을 때
	   console.log("예");
	 	console.log("/product/detailProduct?id="+ row._row.data.productSeq +"&userId="+ user.id);
	 	window.location = "/product/detailProduct?id="+ row._row.data.productSeq +"&userId="+ user.id;
	 } else {
	   // 사용자가 "아니오"를 눌렀을 때
	   console.log("아니요");
	 }

	 });
}