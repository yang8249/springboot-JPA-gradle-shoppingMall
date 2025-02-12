window.onload = function() {
	const ctx = document.getElementById('chartJS-myChart');

	new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
	    datasets: [{
	      label: '# of Votes',
	      data: [12, 19, 3, 5, 2, 3],
	      borderWidth: 1
	    }]
	  },
	  options: {
	    scales: {
	      y: {
	        beginAtZero: true
	      }
	    }
	  }
	});
	
	$(".mypage-nav-button").children().children().click((e)=>{
		const selectMenu = e.target.attributes.value.value;
		
		
		const ableContent = $("#ableContent").children(":not(.mypage-disabled)")[0].className;
		
		
		if(selectMenu != ableContent){
			$("#ableContent").children("."+ableContent).addClass("mypage-disabled");
			$("#ableContent").children("."+selectMenu).removeClass("mypage-disabled");
		}
	});
	
	
	
};
