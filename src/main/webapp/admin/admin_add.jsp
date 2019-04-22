<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加管理员</title>
    
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
		
		function reset(){
			$("#account").val("");
			$("#pwd").val("");
			$("#pwd2").val("");
		}
		
		function submit(){
			var account = $("#account").val();
			var pwd = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
			if(account==""){
				alert("账号不能为空");
				return;
			}
			if(pwd==""){
				alert("密码不能为空");
				return;
			}
			if(pwd2!=pwd){
				alert("密码不一致");
				return;
			}
			var inf = {"account":account,"pwd":pwd};
			$.ajax({
				type:'post',
				url:basePath+'/admin/addadmin',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(inf),
				success:function(data){
					if(data=="success"){
						alert("添加成功");
						reset();
					}
					if(data=="fail"){
						alert("添加失败，请稍后再试");
					}
				}
			})
		}
		
	</script>
  </head>
  
  <body>
    <div id="app">
  		<jsp:include page="admin_common.jsp"></jsp:include>
  		
  		<div data-v-166a34a6 class="order-manager m-view">
        	<div class="main-operate">
            	<h4>订单管理</h4>
          	</div>
          	<div align="center" style="width:100%;">
	        		<table>
	        			<tr>
	        				<td>账号：</td>
	        				<td><input type="text" placeholder="账号" id="account" value="" style="width: 200px;height: 30px"></td>
	        			</tr>
	        			<tr>
	        				<td>密码：</td>
	        				<td><input type="password" placeholder="密码" id="pwd" value="" style="width: 200px;height: 30px"></td>
	        			</tr>
	        			<tr>
	        				<td>重复密码：</td>
	        				<td><input type="password" placeholder="重复密码" id="pwd2" value="" style="width: 200px;height: 30px"></td>
	        			</tr>
	        			<tr align="center">
	        				<td colspan="2">
	        					<input type="button" value="添加" onclick="submit()" style="width: 40px;height: 25px;">
		        				<input type="button" value="重置" onclick="reset()" style="width: 40px;height: 25px;">
	        				</td>
	        			</tr>
	        		</table>
		        	
	        </div>
        </div>
    </div>
  </body>
</html>
