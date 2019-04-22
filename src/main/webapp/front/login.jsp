<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login_css.css"/>
<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javaScript" src="${pageContext.request.contextPath}/js/login.js"></script>
</head>

<body style="background-image: url(${pageContext.request.contextPath}/img/body05.jpg)">
<div class="wrap-large">
        <div class="back-home">
            <a href="index.jsp" class="link-btn">返回首页</a>
        </div>
        <div class="hd-box">
            <h1 class="site-logo"></h1>
        </div>
        
    
    <div class="page-cont">
        <div class="main-cont">
            <div class="login-btn-tabs" align="center">
                <a href="#userNamePwdLoginContainer" class="active">普通方式登录</a>
            </div>
            <div class="my-form-box">
                <div class="m-from">
                    <div id="userNamePwdLoginContainer" class="form-group" style="display: block;">
                        <div class="verify-info" data-error="" style="display:none"></div>
                        <form action="" method="post" id="userLoginForm" >
                            <div class="control-group">
                                <label for="userName" class="controls-label">用户名</label>
                                <div class="controls">
                                    <label for="userName">
                                  <input id="userName" name="userName" placeholder="用户名" type="text" value="">
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="" class="controls-label">密码</label>
                                <div class="controls">
                                    <label for="pwd">
                                  <input name="pwd" id="pwd" placeholder="密码" type="password">
                                    </label><i class="icon-eye"></i>                                    
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
                            <br />
                            <div class="control-group button-group">
                                <input type="button" value="登录" title="登录" onclick="userlogin()" class="login-btn">
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
