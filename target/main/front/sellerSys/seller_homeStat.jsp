<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>房态管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_order_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_order_css2.css"/>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css2.css"/>
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	
	<style type="text/css">
		.order-manager .empty-order::before{
			content:'暂无近期房态';
		}
	</style>
  </head>
  
  <body>
  <div id="app">
    <jsp:include page="seller_common.jsp">
    	<jsp:param value="房态管理" name="type"/>
    </jsp:include>
    
    <!--center-->
    <div data-v-166a34a6 class="order-manager m-view">
        	<div class="main-operate">
            	<h4>房态管理</h4>
                
                <div class="empty-order"></div>
                <div class="page-box" style="overflow: hidden;"><!----></div>
                
            </div>
        </div>
    <!--end center-->
   </div>
  </div>
  </body>
</html>

