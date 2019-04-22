$(function(){
		$('img').click(function(){
			$(this).attr('src', '../kaptcha?' + Math.floor(Math.random()*100) );
		});
	})

function regUser(){
	var localObj = window.location;
	var protocol = location.protocol;
	var host = localObj.host;
	var contextPath = localObj.pathname.split("/")[1]; 
	var basePath = protocol +"//"+host+"/"+contextPath;
	
	var uname = $("#uname").val();
	var pwd = $("#pwd").val();
	var pwd2 = $("#pwd2").val();
	var tel = $("#tel").val();
	var email = $("#email").val();
	var code = $("#code").val();
	var flag = true;
	if(uname==""){
		$("#uname_ver").css("display","block");
		flag = false;
	}else{
		$("#uname_ver").css("display","none");
	}
	if(pwd==""){
		$("#pwd_ver").css("display","block");
		flag = false;
	}else{
		$("#pwd_ver").css("display","none");
	}
	if(pwd2==""){
		$("#pwd2_ver").text("请重复密码");
		$("#pwd2_ver").css("display","block");
		flag = false;
	}else if(pwd2!=pwd){
		$("#pwd2_ver").text("两次密码不一致");
		$("#pwd2_ver").css("display","block");
		flag = false;
	}else{
		$("#pwd2_ver").text("");
		$("#pwd2_ver").css("display","none");
	}
	if(tel==""){
		$("#tel_ver").text("手机号码不能为空");
		$("#tel_ver").css("display","block");
		flag = false;
	}else if(!(/^1[3|4|5|8][0-9]\d{8}$/.test(tel))){
		$("#tel_ver").text("手机号码格式错误");
		$("#tel_ver").css("display","block");
		flag = false;
	}else{
		$("#tel_ver").text("");
		$("#tel_ver").css("display","none");
	}
	if(email==""){
		$("#email_ver").text("邮箱不能为空");
		$("#email_ver").css("display","block");
		flag = false;
	}else if(!(/\w+@\w+(\.\w+)+/.test(email))){
		$("#email_ver").text("邮箱格式错误");
		$("#email_ver").css("display","block");
		flag = false;
	}else{
		$("#email_ver").text("");
		$("#email_ver").css("display","none");
	}
	if(code==""){
		$("#code_ver").text("验证码不能为空");
		$("#code_ver").css("display","block");
		flag = false;
	}else{
		$("#code_ver").text("");
		$("#code_ver").css("display","none");
	}
	if(!flag){
		return;
	}
	var inf = {"user":{"uname":uname,"pwd":pwd,"tel":tel,"email":email}, "code":code} 
	$.ajax({
			type:'post',
			url:basePath+'/user/userreg',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(inf),
			success:function(data){
				if(data=='code error'){
					alert('验证码有误，请重新输入！');
					$("#mykaptcha").click();
				}
				if(data=='fail'){
					alert('注册失败，请稍后再试！');
					$("#mykaptcha").click();
				}
				if(data=='email repeat'){
					$("#email_ver").text("邮箱已被注册");
					$("#email_ver").css("display","block");
					$("#mykaptcha").click();
				}
				if(data=='success'){
					alert('注册成功');
					location.replace(document.referrer);
				}
			}
		})
}