
let cartList, wishList;

async function getCartList(){
	//주문목록이용
	await new Promise((resolve, reject) => {
	  $.ajax({
		url:"/api/mypage/cartList",
		type:"POST",
		data:JSON.stringify(user),
		contentType:"application/json; charset=utf-8",
	    dataType: "json",
	    success: async function(response) {
	      resolve(response);  // 성공적으로 데이터를 받으면 resolve 호출
		  cartList = response.data;
		  await getWishList();
	    },
	    error: function(xhr, status, error) {
	      reject(error);  // 에러 발생 시 reject 호출
	    }
	  });
	});
}

async function getWishList(){
	//주문목록이용
	await new Promise((resolve, reject) => {
	  $.ajax({
		url:"/api/mypage/wishList",
		type:"POST",
		data:JSON.stringify(user),
		contentType:"application/json; charset=utf-8",
	    dataType: "json",
	    success: async function(response) {
	      resolve(response);  // 성공적으로 데이터를 받으면 resolve 호출
		  wishList = response.data;
		  await initCartwishGrid();
	    },
	    error: function(xhr, status, error) {
	      reject(error);  // 에러 발생 시 reject 호출
	    }
	  });
	});
}


getCartList();

async function initCartwishGrid(){
	
	//장바구니 그리드
	//define some sample data
	console.log("cartList : "+cartList);
	
	const tabledata = [];

	//데이터 긁어오기
	for (let i = 0; i < cartList.length; i++) {
	  const obj = {
	    num: i+1,
	    image: cartList[i].product.fileInfo[0].uuid,
		productSeq: cartList[i].product.productSeq,
		productName: cartList[i].product.productName,
		productCount: cartList[i].productCount,
		category: cartList[i].product.category,
		totalPrice: Number(cartList[i].totalPrice).toLocaleString()+"원",
		createDate: cartList[i].createDate.slice(0, 10)
	  };

	  tabledata.push(obj);
	}

	console.log(tabledata);
	 
	//긁어온 데이터로 테이블 생성
	var table = new Tabulator("#example-table3", {
	  	height:705, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
	  	data:tabledata, //assign data to table
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
	 	 	{title:"제품 명", field:"productName", hozAlign:"center", vertAlign: "middle", formatter: "textarea"},
			{title:"카테고리", field:"category", hozAlign:"center", vertAlign: "middle", width: 125},
			{title:"담은 갯수", field:"productCount", hozAlign:"center", vertAlign: "middle", width: 100},
			{title:"총 금액", field:"totalPrice", hozAlign:"center", vertAlign: "middle"},
	 	 	{title:"장바구니 등록 일", field:"createDate", hozAlign:"center", vertAlign: "middle", width: 150},
	  	]
	 });

	 
	 //요기는 위에서 만든 그리드 버튼이벤트 넣는곳
	 //trigger an alert message when the row is clicked
	 table.on("rowClick", function(e, row){ 
		
		console.log(e);
		console.log(row);
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
	 

	 
	  

	 //찜목록 그리드
	 //define some sample data
	 console.log("wishList : "+wishList);

	 const tabledata2 = [];

	 //데이터 긁어오기
	 for (let i = 0; i < wishList.length; i++) {
	   const obj = {
	     num: i+1,
	     image: wishList[i].product.fileInfo[0].uuid,
	 	productSeq: wishList[i].product.productSeq,
	 	productName: wishList[i].product.productName,
	 	category: wishList[i].product.category,
	 	createDate: wishList[i].createDate.slice(0, 10)
	   };

	   tabledata2.push(obj);
	 }

	 console.log(tabledata2);
	  
	 //긁어온 데이터로 테이블 생성
	 var table = new Tabulator("#example-table4", {
	   	height:705, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
	   	data:tabledata2, //assign data to table
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
	  	 	{title:"제품 명", field:"productName", hozAlign:"center", vertAlign: "middle", formatter: "textarea"},
	 		{title:"카테고리", field:"category", hozAlign:"center", vertAlign: "middle", width: 120},
	  	 	{title:"찜 등록 일", field:"createDate", hozAlign:"center", vertAlign: "middle", width: 150},
	   	]
	  });

	  
	  //요기는 위에서 만든 그리드 버튼이벤트 넣는곳
	  //trigger an alert message when the row is clicked
	  table.on("rowClick", function(e, row){ 
	 	
	 	console.log(e);
	 	console.log(row);
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