<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户管理</title>
    
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
		
		function banuser(uid){
			$.ajax({
				type:'get',
				url:basePath+'/user/admin/operuser',
				data:'uid='+uid+"&type=0",
				success:function(data){
					if(data=="fail"){
						alert('操作失败，请稍后再试');
						return;
					}
					if(data=="success"){
						alert('操作成功');
						history.go(0);
					}
				}
			})
		}
		
		function reopenuser(uid){
			$.ajax({
				type:'get',
				url:basePath+'/user/admin/operuser',
				data:'uid='+uid+"&type=1",
				success:function(data){
					if(data=="fail"){
						alert('操作失败，请稍后再试');
						return;
					}
					if(data=="success"){
						alert('操作成功');
						history.go(0);
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
            	<h4>用户管理</h4>
            	<div data-v-1b1fd10f class=" main-box">
					<ul data-v-1b1fd10f="" class="clearfix left switch-box" id="checks">
						<li data-v-1b1fd10f="" class="active">全部</li>
					</ul>
					<ul data-v-1b1fd10f="" class="right search-box">
      					<li data-v-1b1fd10f>
        				<div data-v-1b1fd10f="" class="ivu-input-wrapper ivu-input-type" style="width: 200px;"><!----> 
            				<i class="ivu-icon ivu-icon-ios-search ivu-input-icon ivu-input-icon-normal"></i> <!----> 
           					<input autocomplete="off" spellcheck="false" type="text" placeholder="用户名/用户id" class="ivu-input"></div>&nbsp;&nbsp;
            				<button data-v-1b1fd10f="" type="button" class="ivu-btn ivu-btn-primary"><span>搜索</span></button>			
            			</div>
				        </li>
				    </ul>
				</div>
				
				
				<div align="center" style="width:100%;">
               	 <table style="border:#999;width:100%;margin-top:10px;display:block;" id="orderlst" border="1" cellspacing="2" align="center">
                 	<thead style="height:35px;">
                    <tr bgcolor="#CCCCCC">
                        <th height="32" style="width: 7%">用户ID</th>
                        <th style="width: 9%">用户名</th>
                        <th style="width: 9%">手机号码</th>
                        <th style="width: 11%">邮箱</th>
                        <th style="width: 8%">注册日期</th>
                        <th style="width: 9%">真实姓名</th>
                        <th style="width: 10%">所在城市</th>
                        <th style="width: 8%">生日</th>
                        <th style="width: 5%">状态</th>
                        <th style="width: 10%">操作</th>
                   </tr>
                    </thead>
                    	<c:forEach items="${requestScope.userlst}" var="user">
                    		<tr align="center" style="height:35px;">
		                        <td>${user.uid}</td>
		                        <td>${user.uname}</td>
		                        <td>${user.tel}</td>
		                        <td>${user.email}</td>
		                        <td><fmt:formatDate value="${user.regdate}" pattern="yyyy-MM-dd"/></td>
		                        <td>${user.realname}</td>
		                        <td>${user.lprov.pname} ${user.lcity.cname}</td>
		                        <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td>
		                        <td>
		                        	<c:if test="${user.isdel==0}">在用</c:if>
		                        	<c:if test="${user.isdel==1}">封停</c:if>
		                        </td>
		                        <td>
		                        	<c:if test="${user.isdel==0}">
		                        		<a href="javascript:;" onclick="banuser('${user.uid}')">封停</a>
		                        	</c:if>
		                        	<c:if test="${user.isdel==1}">
		                        		<a href="javascript:;" onclick="reopenuser('${user.uid}')">解封</a>
		                        	</c:if>
		                        </td>
		                   </tr>
                    	</c:forEach>
		        </table>
			</div>
		</div>
  	</div>
  </body>
</html>
