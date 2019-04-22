<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台登录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login_css.css"/>
<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
	var localObj = window.location;
	var protocol = location.protocol;
	var host = localObj.host;
	var contextPath = localObj.pathname.split("/")[1]; 
	var basePath = protocol +"//"+host+"/"+contextPath;
	
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
		var inf = {"admin":{"account":uname,"pwd":pwd},"valicode":code}; 
		$.ajax({
				type:'post',
				url:basePath+'/adminlogin',
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
					if(data=='success'){
						alert('登录成功');
						location=basePath+"/admin/findAllOrder";
					}
				}
			})
	}
</script>
</head>

<body style="background-image: url(${pageContext.request.contextPath}/img/body07.jpg);">
<div class="wrap-large">
        <div class="hd-box" style="margin-top:90px">
            <h1 class="site-logo"></h1>
        </div>
        
    <div class="page-cont">
        <div class="main-cont">
            <div class="login-btn-tabs" align="center">
                <a class="active">途家管家后台登录</a>
            </div>
            <div class="my-form-box">
                <div class="m-from">
                    <div id="userNamePwdLoginContainer" class="form-group" style="display: block;">
                        <div class="verify-info" data-error="" style="display:none"></div>
                        <form action="https://passport.tujia.com/PortalSite/Login" method="post" id="userLoginForm" novalidate="novalidate"><input type="password" name="stop-chrome-autofill" style="position: absolute; top: -999999px; width: 0; height: 0;">                        
                            
                            <input type="hidden" name="source" value="https://www.tujia.com/?utm_source=360&amp;utm_medium=cpc&amp;utm_term=hspz1title">
                            <div class="control-group">
                                <label for="" class="controls-label">用户名</label>
                                <div class="controls">
                                    <label for="userName">
                                        <input id="userName" name="userName" placeholder="用户名" type="text">
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="" class="controls-label">密码</label>
                                <div class="controls">
                                    <label for="pwd">
                              <input name="pwd" id="pwd" type="password" placeholder="密码" autocomplete="off">
                                    </label>                                 
                                </div>
                            </div>
                            
                            <div class="control-group verify-group">
                                <label for="" class="controls-label">验证码</label>
                                <div class="controls">
                                    <label for="verifyCode">
                         <input id="verifyCode" name="verifyCode" placeholder="请输入验证码" type="text" value="">
                                    </label>
                              <img src="../kaptcha" id="mykaptcha" class="verify-image" width="130" height="40" title="看不清，换一张" >
                                </div>
                            </div>
                            <div class="control-group button-group" style="margin-top:40px">
                                <input type="button" value="登录" onclick="userlogin()" title="登录" class="login-btn">
                            </div>
                        </form>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </div>
</body>
</html>
