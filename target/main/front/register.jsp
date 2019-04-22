<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>

<link rel="stylesheet" type="text/css" href="../css/register_css.css"/>
<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js">
	
</script>
</head>

<body style="background-image: url(../img/body04.jpg")>
	<div class="wrap-large">
    	<div class="back-home">
            <a href="index.jsp" class="link-btn">返回首页</a>
        </div>
        
        <div class="hd-box">
            <h1 class="site-logo"></h1>
        </div>
        
        <div class="page-cont">
        	<div class="main-box">
            	<div class="login-btn-tabs login-btn-tabs-type" style="margin-left:90px">
                    <a href="javascript:void(0)" class="active">普通会员注册</a>
                </div>
                <div class="m-from t-from">
                    <div class="form-group">
                        <form id="registerForm" action="" autocomplete="off" method="post">
                        	
                            <div class="control-group">
                                <label for="" class="controls-label">昵称</label>
                                <div class="controls">
                                    <label for="email">
										<input id="uname" placeholder="来起一个可爱的昵称让大家认识你" name="uname" type="text" value=""/>
                                    </label>
                                </div>
                                <div class="verify-info" id="uname_ver" style="display:none;">
                                	昵称不能为空
                                </div>
                            </div>
                            
                            <div class="control-group">
                                <label for="" class="controls-label">登录密码</label>
                                <div class="controls">
                                    <label for="password">                            
                                        <input id="pwd" name="pwd" placeholder="登录密码" type="password" value=""/>
                                    </label>
                                </div>
                                <div class="verify-info" id="pwd_ver" style="display:none;">
                                    	密码不能为空
                                </div>
                            </div>
                            
                            <div class="control-group">
                                <label for="" class="controls-label">确认密码</label>
                                <div class="controls">
                                    <label for="password">                            
                                        <input id="pwd2" name="pwd2" placeholder="确认密码" type="password" value="">
                                    </label>
                                </div>
                                <div class="verify-info" id="pwd2_ver" style="display:none">
                                   		
                                </div>
                            </div>
                            
                            
                            <div class="control-group phone-group">
                                <label for="" class="controls-label">手机号</label>
                                <div class="controls">
                                    <label for="mobile" style="margin-left: 0;">
       								<input id="tel" name="tel" type="text" placeholder="请输入手机号" value="" maxlengt="11" style="width: 300px;">
                                    </label>
                                </div>
                                <div class="verify-info" id="tel_ver" style="display:none">
                                    	
                                </div>
                            </div>
                            
                            
                        	<div class="control-group">
                                <label for="" class="controls-label">邮箱</label>
                                <div class="controls">
                                    <label for="email">
										<input id="email" placeholder="常用邮箱（将作为登录账号）" name="email" type="text" value="">
                                    </label>
                                </div>
                                <div class="verify-info" id="email_ver" style="display:none">
                                    
                                </div>
                            </div>
                            
                            <div id="verifyImageContainer" class="control-group verify-group" style="display:block">
                                <label for="verifyCode" class="controls-label">验证码</label>
                                <div class="controls">
                                    <label for="verifyCodePic">
                                        <input id="code" placeholder="请输入验证码" name="code" type="text" maxlength="8" value="">
                                    </label>
                                    <img id="verifyImage" alt="" class="verify-image" width="130" height="40" title="看不清，换一张" src="../kaptcha">
                                </div>
                                <div class="verify-info" id="code_ver" style="display:none">
                                    
                                </div>
                            </div>
                            
                            <div class="control-group text-group">
                                <label for="">
                                    <input id="chkFW" type="checkbox" checked="checked" style="display:block;">
                                    注册即代表同意<a href="http://content.tujia.com/Clause/index.htm" target="_blank" class="link-btn">《途家网服务协议》</a>
                                    <a href="https://pwa.tujia.com/pc/web/protocol/registerprivacy" target="_blank" class="link-btn">《隐私政策》</a>
                                </label>
                            </div>
                            <div class="control-group button-group">
                                <input id="registerSumbit" type="button" onclick="regUser()" value="注册" title="注册">
                            </div>
                        </form>
                    </div>
                    <div class="app-download"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
