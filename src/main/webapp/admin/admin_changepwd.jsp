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

	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_order_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_order_css2.css"/>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css2.css"/>
	
	<script type="text/javascript">
		var localObj = window.location;
		var protocol = location.protocol;
		var host = localObj.host;
		var contextPath = localObj.pathname.split("/")[1]; 
		var basePath = protocol +"//"+host+"/"+contextPath;
		
		function submit(){
			var oldpwd = $("#oldpwd").val();
			var newpwd = $("#newpwd").val();
			var pwd2 = $("#pwd2").val();
			var aid = $("#aid").val();
			if(oldpwd==""){
				alert("原密码不能为空");
				return;
			}
			if(newpwd==""){
				alert("新密码不能为空");
				return;
			}
			if(pwd2!=newpwd){
				alert("密码不一致");
				return;
			}
			var inf = {"admin":{"aid":aid,"pwd":newpwd},"oldpwd":oldpwd};
			$.ajax({
				type:'post',
				url:basePath+'/admin/changepwd',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(inf),
				success:function(data){
					if(data=="oldpwd error"){
						alert("原密码错误");
					}
					if(data=="success"){
						alert("修改成功");
					}
					if(data=="fail"){
						alert("修改失败，请稍后再试");
					}
				}
			})
		}
		
		function reset(){
			$("#oldpwd").val("");
			$("#newpwd").val("");
			$("#pwd2").val("");
		}
	</script>
  </head>
  
  <body>
    <div id="app">
  		<jsp:include page="admin_common.jsp"></jsp:include>
  		
  		<div data-v-166a34a6 class="order-manager m-view">
        	<div class="main-operate">
            	<h4>修改密码</h4>
          	</div>
          	
			<div align="center" style="width:100%;">
        		<table>
	        			<tr>
	        				<td>原密码：</td>
	        				<td>
	        					<input type="password" placeholder="原密码" id="oldpwd" value="" style="width: 200px;height: 30px">
	        					<input type="hidden" id="aid" value="${sessionScope.admin.aid}">
	        				</td>
	        			</tr>
	        			<tr>
	        				<td>新密码：</td>
	        				<td><input type="password" placeholder="新密码" id="newpwd" value="" style="width: 200px;height: 30px"></td>
	        			</tr>
	        			<tr>
	        				<td>重复密码：</td>
	        				<td><input type="password" placeholder="重复密码" id="pwd2" value="" style="width: 200px;height: 30px"></td>
	        			</tr>
	        			<tr align="center">
	        				<td colspan="2">
	        					<input type="button" value="确定" onclick="submit()" style="width: 40px;height: 25px;">
		        				<input type="button" value="重置" onclick="reset()" style="width: 40px;height: 25px;">
	        				</td>
	        			</tr>
	        		</table>
        </div>          	
        </div>
    </div>
  </body>
</html>
