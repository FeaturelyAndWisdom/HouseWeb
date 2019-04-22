	function openCityList(){
		$("#citylst").css('display',"block")
	}
	
	function openDatelst(){
		$("#datelst").css('display',"block")
	}
	
	function openPerslst(){
		$("#perslst").css('display',"block")
	}
		
	$(function(){
		$("#citylst").mouseleave(function(){
			$("#citylst").css('display',"none")
		});
		$("#datelst").mouseleave(function(){
			$("#datelst").css('display',"none")
		});
		$("#perslst").mouseleave(function(){
			$("#perslst").css('display',"none")
		});
	})
	
	function searchIndex(){
		var city = $("#cityBookingId").val();
		var peonum = $("#peonum").val();
		window.open('indexsearch?nowpage=1&cityid='+city+'&peonum='+peonum);
	}
	
	var citypage=1;
	function cityPageUp(){
		if(citypage==1){
			return;
		}else{
			$("#citypage"+citypage).css("display","none");
			$("#citypage"+(citypage-1)).css("display","block");
			citypage-=1;
		}
	}
	
	function cityPageDown(){
		if(citypage==11){
			return;
		}else{
			$("#citypage"+citypage).css("display","none");
			$("#citypage"+(citypage+1)).css("display","block");
			citypage+=1;
		}
	}
	
	function cityClick(cid,cname){
		$("#cityBooking").val(cname);
		$("#cityBookingId").val(cid);
	}
	
	$(function(){
   		$("#peo_nums li a").click(function(){
   			$("#count").val($(this).text());
   			var num = $(this).attr("data-num");
   			$("#peonum").val(num);
   		})
   	})