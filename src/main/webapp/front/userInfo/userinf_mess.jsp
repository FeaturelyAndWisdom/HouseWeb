<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>消息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInf_mes_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInf_css.css"/> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member_common_css.css"/>
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
  </head>
  
  <body>
    <jsp:include page="userinf_common.jsp">
    	<jsp:param value="消息" name="type"></jsp:param>
    </jsp:include>
    <div class="grid_19" style="width:750px" id="order">

	    <div class="orderHead" style="border-bottom:2px solid #f60">
	        <h4>消息</h4>
	    </div>
	    
	    <!-- 消息内容 -->
	    	<div class="notices-list">
		        <ul>
		        	<c:forEach items="${sessionScope.user.custmess}" var="mes">
		        		<li>
			                <h2><span><fmt:formatDate value="${mes.senddate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>${mes.title}</h2>
			                <div class="text-box">
			                 ${mes.content}
			                </div>
						</li>
		        	</c:forEach>
				</ul>
	  		</div>
	    <!-- end消息内容 -->
	</div>
  </body>
</html>
