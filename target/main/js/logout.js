function logout(){
	var localObj = window.location;
	var protocol = location.protocol;
	var host = localObj.host;
	var contextPath = localObj.pathname.split("/")[1]; 
	var basePath = protocol +"//"+host+"/"+contextPath;
		$.ajax({
			type:'get',
			url:basePath+'/user/userlogout',
			data:'',
			success:function(data){
				window.location=basePath+"/front/index.jsp"
			}		
		});
	}