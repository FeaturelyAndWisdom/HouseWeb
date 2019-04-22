<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_order_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_order_css2.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_mes.css"/>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css2.css"/>
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	
  </head>
  
  <body>
  <div id="app">
    <jsp:include page="seller_common.jsp">
    	<jsp:param value="消息" name="type"/>
    </jsp:include>
    
    <!--center-->
    <div data-v-166a34a6 class="order-manager m-view">
        	<div class="main-operate">
            	<h4>消息</h4>
                
                <div class="detailWraper">
				    <ul class="messageList">
				    	<c:forEach items="${sessionScope.user.sellmess}" var="mes">
				        <li>
				            <div class="title">
				                <h6>${mes.title}</h6>
				                <span class="text-muted"><fmt:formatDate value="${mes.senddate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
				            </div>
				
				            <p class="content">${mes.content}</p>
				        </li>
				        </c:forEach>
				    </ul>
				</div>
                
                <div class="page-box" style="overflow: hidden;"><!----></div>
            </div>
        </div>
    <!--end center-->
   </div>
  </div>
  </body>
</html>

