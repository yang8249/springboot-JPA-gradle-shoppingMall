
let orderList;

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
	    num: i,
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
	 var table = new Tabulator("#example-table1", {
	  	height:705, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
	  	data:test, //assign data to table
	  	layout:"fitColumns", //fit columns to width of table (optional)
		maxHeight: "600px", //늘어나다가 최대 600px 까지 늘어나도록 제한검
	  	columns:[ //Define Table Columns
			{title:"순번", field:"num", width:65, hozAlign:"center", vertAlign: "center"},
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
			    },hozAlign:"center"
			  },
	 	 	{title:"받는사람", field:"name", width:150, hozAlign:"center", vertAlign: "center"},
	 	 	{title:"배송지", field:"location", width:400, hozAlign:"center", vertAlign: "center"},
	 	 	{title:"제품 명", field:"productName", hozAlign:"center", vertAlign: "center"},
			{title:"카테고리", field:"category", hozAlign:"center", vertAlign: "center", width: 120},
			{title:"주문 갯수", field:"itemCount", hozAlign:"center", vertAlign: "center", width: 100},
			{title:"결제 금액", field:"totalPrice", hozAlign:"center", vertAlign: "center", width: 120},
	 	 	{title:"결제일", field:"createDate", hozAlign:"center", vertAlign: "center" },
	  	]
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
	 

	 //반품현황 그리드
	 //define some sample data
	  var tabledata = [
	  	{id:1, name:"Oli Bob", age:"12", col:"red", dob:""},
	  	{id:2, name:"Mary May", age:"1", col:"blue", dob:"14/05/1982"},
	  	{id:3, name:"Christine Lobowski", age:"42", col:"green", dob:"22/05/1982"},
	  	{id:4, name:"Brendon Philips", age:"125", col:"orange", dob:"01/08/1980"},
	  	{id:5, name:"Margret Marmajuke", age:"16", col:"yellow", dob:"31/01/1999"},
	  ];
	  
	  //create Tabulator on DOM element with id "example-table"
	  var table = new Tabulator("#example-table2", {
	   	height:205, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
	   	data:tabledata, //assign data to table
	   	layout:"fitColumns", //fit columns to width of table (optional)
	   	columns:[ //Define Table Columns
	  	 	{title:"Name", field:"name", width:150},
	  	 	{title:"Age", field:"age", hozAlign:"left", formatter:"progress"},
	  	 	{title:"Favourite Color", field:"col"},
	  	 	{title:"Date Of Birth", field:"dob", sorter:"date", hozAlign:"center"},
	   	],
	  });

	  //trigger an alert message when the row is clicked
	  table.on("rowClick", function(e, row){ 
	  	alert("Row " + row.getData().id + " Clicked!!!!");
	  });

}