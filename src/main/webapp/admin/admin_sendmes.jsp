<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>发送消息</title>
    
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
		
		function send(){
			var uid = $("#uid").val();
			var title = $("#title").val();
			var content = $("#content").val();
			var type = $("input[name='mestype']:checked").val();
			var sendid = $("#aid").val();
			if(uid==""){
				alert("接收人不能为空")
				return;
			}
			if(title==""){
				alert("标题不能为空")
				return;
			}
			if(content==""){
				alert("内容不能为空")
				return;
			}
			var inf = {"title":title,"content":content,"uid":uid,"type":type,"sender":sendid};
			$.ajax({
				type:'post',
				url:basePath+'/admin/sendmes',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(inf),
				success:function(data){
					if(data=="usernull"){
						alert("无此用户，请检查后重新发送");
					}
					if(data=="success"){
						alert("发送成功");
					}
					if(data=="fail"){
						alert("发送失败，请稍后再试");
					}
				}
			
			})
		}
		
		function reset(){
			$("#uid").val("");
			$("#title").val("");
			$("#content").val("");
		}
	</script>
  </head>
  
  <body>
    <div id="app">
  		<jsp:include page="admin_common.jsp"></jsp:include>
  		
  		<div data-v-166a34a6 class="order-manager m-view">
        	<div class="main-operate">
            	<h4>发送消息</h4>
          	</div>
          	<div align="center" style="width:100%;">
          	<input type="hidden" id="aid" value="${sessionScope.admin.aid}">
	        		<table>
	        			<tr>
	        				<td width="30%">消息类型：</td>
	        				<td>
	        					<input type="radio" name="mestype" checked="checked" value="0">用户消息&nbsp;&nbsp;&nbsp;&nbsp;
	        					<input type="radio" name="mestype" value="1">商户消息
	        				</td>
	        			</tr>
	        			<tr>
	        				<td>用户id：</td>
	        				<td><input type="text" placeholder="ID" id="uid" value="" style="width: 250px;height: 30px"></td>
	        			</tr>
	        			<tr>
	        				<td>标题：</td>
	        				<td><input type="text" placeholder="标题" id="title" value="" style="width: 250px;height: 30px"></td>
	        			</tr>
	        			<tr>
	        				<td>内容：</td>
	        				<td>
	        					<textarea rows="10" cols="50" id="content"></textarea>
	        				</td>
	        			</tr>
	        			<tr align="center">
	        				<td colspan="2">
	        					<input type="button" value="发送" onclick="send()" style="width: 40px;height: 25px; margin-right: 20px;">
		        				<input type="button" value="重置" onclick="reset()" style="width: 40px;height: 25px;">
	        				</td>
	        			</tr>
	        		</table>
		        	
	        </div>
        </div>
    </div>
  </body>
</html>
