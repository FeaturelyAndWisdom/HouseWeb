					var localObj = window.location;
					var protocol = location.protocol;
					var host = localObj.host;
					var contextPath = localObj.pathname.split("/")[1]; 
					var basePath = protocol +"//"+host+"/"+contextPath;
	            	function findOrderDetail(oid){
	            		$.ajax({
	            			type:'get',
	            			url:basePath+'/findOrderById',
	            			data:'oid='+oid,
	            			success:function(data){
	            				var temp = new Date(data.madedate);
								$("#orderlst").css("display","none");
								$("#odetail").css("display","block");
								$("#onum").text(data.ordernum);
								$("#odate").text(temp.getFullYear()+'-'+(temp.getMonth()+1)+'-'+temp.getDate());
								temp = new Date(data.livetime);
								var temp2 = new Date(data.leavetime);
								$("#livedate").text(temp.getFullYear()+'-'+(temp.getMonth()+1)+'-'+temp.getDate()+'至'+temp2.getFullYear()+'-'+(temp2.getMonth()+1)+'-'+temp2.getDate());
								$("#hnum").text(data.housenum);
								$("#pnum").text(data.pernum);
								$("#pname").text(data.pername);
								$("#ptel").text(data.pertel);
								$("#pcid").text(data.percardid);
								$("#sellname").text(data.seller.uname);
								$("#tprice").text(data.totalprice);
								$("#house").attr("href","${pageContext.request.contextPath}/findHouseById?hid="+data.house.hid+"&gopage=1");
								$("#house").text(data.house.housename);
								if(data.state==0){
									$("#ostate").text("未确认");
								}else if(data.state==1){
									$("#ostate").text("已确认");
								}else if(data.state==2){
									$("#ostate").text("已评价");
								}
								
	            			}
	            		})
	            	}
	            	
	            	function back(){
	            		$("#orderlst").css("display","block");
						$("#odetail").css("display","none");
	            	}
	            	
	            	function accompOrder(oid){
	            		var s = $("#order_state").attr("data-state");
	            		if(s=="1"){
	            			alert("订单已确认，无需重复操作");
	            			return;
	            		}
	            		$.ajax({
	            			type:"post",
	            			url:basePath+'/accompOrder',
	            			data:"oid="+oid,
	            			success:function(data){
	            				if(data=="fail"){
	            					alert("确认失败，请稍后再试");
	            					return;
	            				}
	            				if(data=="success"){
	            					alert("确认成功，请等待用户评价");
	            					history.go(0);
	            				}
	            			}
	            		})
	            	}