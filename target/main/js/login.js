$(function(){
		$('img').click(function(){
			$(this).attr('src', '../kaptcha?' + Math.floor(Math.random()*100) );
		});
	})
	
	function userlogin(){
		var localObj = window.location;
		var protocol = location.protocol;
		var host = localObj.host;
		var contextPath = localObj.pathname.split("/")[1]; 
		var basePath = protocol +"//"+host+"/"+contextPath;
		var uname = $("#userName").val();
		var pwd = $("#pwd").val();
		var code = $("#verifyCode").val();
		if(uname==''){
			alert('用户名不能为空！');
			return;
		}
		if(pwd==''){
			alert('密码不能为空！');
			return;
		}
		if(code==''){
			alert('验证码不能为空！');
			return;
		}
		var inf = {"user":{"email":uname,"pwd":pwd},"code":code}; 
		$.ajax({
				type:'post',
				url:basePath+'/user/userlogin',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(inf),
				success:function(data){
					if(data=='code error'){
						alert('验证码有误，请重新输入！');
						$("#mykaptcha").click();
					}
					if(data=='fail'){
						alert('用户名密码有误，请重新输入！');
						$("#mykaptcha").click();
					}
					if(data=='userban'){
						alert('该用户已被封停，请联系管理员');
						$("#mykaptcha").click();
					}
					if(data=='success'){
						alert('登录成功');
						location=basePath+"/front/index.jsp"
					}
				}
			})
	}