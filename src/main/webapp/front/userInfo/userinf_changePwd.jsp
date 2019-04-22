<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInf_css.css"/> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member_common_css.css"/>
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	
	<script type="text/javascript">
		var localObj = window.location;
		var protocol = location.protocol;
		var host = localObj.host;
		var contextPath = localObj.pathname.split("/")[1]; 
		var basePath = protocol +"//"+host+"/"+contextPath;
	
		function submit(){
			var old_pwd = $("#OldPassword").val();
			var new_pwd = $("#NewPassword").val();
			var new2_pwd = $("#RepNewPassword").val();
			var flag = false;
			if(old_pwd==""){
				$("#old_ver").html("<span>原密码不能为空</span>");
				$("#old_ver").css("display","block");
				flag = true;
			}else{
				$("#old_ver").css("display","none");
			}
			if(new_pwd==""){
				$("#new_ver").html("<span>新密码不能为空</span>");
				$("#new_ver").css("display","block");
				flag = true;
			}else{
				$("#new_ver").css("display","none");
			}
			if(new2_pwd!=new_pwd){
				$("#new2_ver").html("<span>两次密码不一致</span>");
				$("#new2_ver").css("display","block");
				flag = true;
			}else if(new2_pwd==""){
				$("#new2_ver").html("<span>请重复密码</span>");
				$("#new2_ver").css("display","block");
				flag = true;
			}else{
				$("#new2_ver").css("display","none");
			}
			
			if(flag){
				return;
			}
			var uid = $("#uid").val();
			var inf = {"user":{"uid":uid,"pwd":new_pwd},"oldpwd":old_pwd};
			$.ajax({
				type:'post',
				url:basePath+'/user/changePwd',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(inf),
				success:function(data){
					if(data=='oldpwd error'){
						alert('原密码错误，请重新输入！');
					}
					if(data=='fail'){
						alert('更改密码失败，请稍后再试！');
					}
					if(data=='success'){
						$("#content").css("display","none");
						$("#successInf").css("display","block");
					}
				}
			})
		}
	</script>
  </head>
  
  <body>
  
    <jsp:include page="userinf_common.jsp">
    	<jsp:param value="修改密码" name="type"></jsp:param>
    </jsp:include>
    <div class="grid_19" style="width:750px" id="order">

	    <div class="orderHead" style="border-bottom:2px solid #f60">
	        <h4>修改密码</h4>
	    </div>
	    
	    <p class="text" id="successInf" style="display:none"><span>修改成功!</span><br></p>
	    <div id="content">
	    <div class="modifyPassword clearfix">
	    	<input type="hidden" id="uid" value="${sessionScope.user.uid}">
			<p>
				<label for="">原密码</label>
				<input class="pwd" id="OldPassword" name="OldPassword" type="password">
				<span class="field-validation-error" data-valmsg-for="OldPassword" data-valmsg-replace="true" id="old_ver" style="display: none;">
				</span></p>
			<p>
				<label for="">新密码 </label>
				<input class="pwd" id="NewPassword" name="NewPassword" type="password">
				<span class="field-validation-error" data-valmsg-for="NewPassword" data-valmsg-replace="true" class="" id="new_ver" style="display: none;">
				</span></p>
			<p>
				<label for="">重复新密码</label>
				<input class="pwd" id="RepNewPassword" name="RepNewPassword" type="password">
				<span class="field-validation-error" data-valmsg-for="RepNewPassword" data-valmsg-replace="true" id="new2_ver" style="display: none;">
				</span></p>
		</div>
		<div class="buttonBox"><input type="button" value="确定修改" onclick="submit()" class="button button03"></div>
		</div>
	</div>
  </body>
</html>
