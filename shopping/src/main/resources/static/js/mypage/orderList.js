
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

	/*for (let i = 1; i <= orderList.length; i++) {
	  const obj = {
	    id: i,
	    num: i,
	    image: orderList.product.fileInfo[0].uuid,
	    name: orderList.,
	    age: (10 + i).toString(),
	    col: ["red", "blue", "green", "orange", "yellow", "purple", "gray"][i % 7],
	    dob: ""
	  };

	  test.push(obj);
	}*/

	console.log(test);
	
	 var tabledata = [
		{id:1, num:"num", image:"image", name:"Oli Bob", age:"12", col:"red", dob:""},
		{id:2, num:"num", image:"image", name:"Oli Bob", age:"12", col:"red", dob:""},
	 	{id:3, num:"num", image:"image", name:"Oli Bob", age:"12", col:"red", dob:""},
	 	{id:4, num:"num", image:"image", name:"Mary May", age:"1", col:"blue", dob:"14/05/1982"},
	 	{id:5, num:"num", image:"image", name:"Christine Lobowski", age:"42", col:"green", dob:"22/05/1982"},
	 	{id:6, num:"num", image:"image", name:"Brendon Philips", age:"125", col:"orange", dob:"01/08/1980"},
	 	{id:7, num:"num", image:"image", name:"Margret Marmajuke", age:"16", col:"yellow", dob:"31/01/1999"},
	 ];
	 
	 //create Tabulator on DOM element with id "example-table"
	 var table = new Tabulator("#example-table1", {
	  	height:205, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
	  	data:tabledata, //assign data to table
	  	layout:"fitColumns", //fit columns to width of table (optional)
	  	columns:[ //Define Table Columns
			{title:"순번", field:"num", width:20},
			{title:"image", field:"image", width:200},
	 	 	{title:"주문자", field:"name", width:150},
	 	 	{title:"뭐쓰지?", field:"age", hozAlign:"left", formatter:"progress"},
	 	 	{title:"제품 명", field:"col"},
			{title:"결제 금액", field:"col"},
	 	 	{title:"결제일", field:"dob", sorter:"date", hozAlign:"center"},
	  	],		
		rowFormatter:function(row){
	        var element = row.getElement(),
	        data = row.getData(),
	        width = element.offsetWidth,
	        rowTable, cellContents;

	        //clear current row data
	        while(element.firstChild) element.removeChild(element.firstChild);

	        //define a table layout structure and set width of row
	        rowTable = document.createElement("table")
	        rowTable.style.width = (width - 18) + "px";

	        rowTabletr = document.createElement("tr");

	        //add image on left of row
	        cellContents = "<td><img src='/image?filename=" + data.image + "'></td>";

	        //add row data on right hand side
	        cellContents += "<td><div><strong>Type:</strong> " + data.type + "</div><div><strong>Age:</strong> " + data.age + "</div><div><strong>Rind:</strong> " + data.rind + "</div><div><strong>Colour:</strong> " + data.color + "</div></td>"

	        rowTabletr.innerHTML = cellContents;

	        rowTable.appendChild(rowTabletr);

	        //append newly formatted contents to the row
	        element.append(rowTable);
	    }
	 });

	 //trigger an alert message when the row is clicked
	 table.on("rowClick", function(e, row){ 
	 	alert("Row " + row.getData().id + " Clicked!!!!");
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