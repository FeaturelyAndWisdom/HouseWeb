<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css2.css"/>
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<style type="text/css">
		.container_24 {
		    margin-left: auto; 
		    margin-right: auto;
		    width: 960px;
		    margin-top:25px
		}
		.m-directory {
		    line-height: 24px;
		    margin: 10px 0 10px -10px;
		    padding: 0;
		    overflow: hidden;
		    text-align: left;
		    color: #333;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$('#guide').text('<%=request.getParameter("type")%>');
		})
	</script>
	
  </head>
  
  <body>
  	<header data-v-166a34a6="" class="g-header">
        <div class="g-content">
            <span class="icon logo icon-logo"></span> 
            <span class="g-merchant">
            <span class="m-merchant-list-text m-merchant-list-sigo" style="cursor: text;">
            【途家房东】No.190120129</span></span> 
            <ul class="g-right">
                <li style="float: left;"><font class="u-opertion-item">
                欢迎您！15902923280</font></li>
                <li><a class="u-opertion-item" href="${pageContext.request.contextPath}/user/userlogout">【退出】</a></li>
                <li><a class="u-opertion-item" href="${pageContext.request.contextPath}/front/sellerSys/seller_index.jsp?type=">
                <span class="icon icon-fdzy"></span>商户系统</a></li> 
            </ul> 
        </div>
    </header>
    
    <div class="container_24" >
        <div class="m-directory">
            <a href="${pageContext.request.contextPath}/front/index.jsp">途家网</a><span>&gt;</span>
                <a href="${pageContext.request.contextPath}/front/sellerSys/seller_index.jsp?type=">途家管家</a><span>&gt;</span>
                <font id="guide"></font>
        </div>
    </div>
    
   <div data-v-166a34a6 class="g-content clearfix zh-CN">
        <!--left style="float:left;margin-left:240px;margin-top:30px;margin-right:25px;"-->
        <nav data-v-306fd360 data-v-166a34a6 class="g-nav m-menu zh-CN">
            <ul data-v-306fd360>
                <li data-v-306fd360 class="m-menu">
                    <h5 data-v-306fd360>
                    <span data-v-306fd360 class="m-img">
                    <i data-v-306fd360 class="u-img icon-1000"></i></span>
                    <span data-v-306fd360>交易管理</span></h5> 
                    <div data-v-306fd360 class="g-menu-layout">
                    <a data-v-306fd360 href="${pageContext.request.contextPath}/findOrders?uid=${sessionScope.user.uid}&type=1" class="m-menu-item">订单管理</a>
                    <a data-v-306fd360 href="${pageContext.request.contextPath}/findSellerOrder?uid=${sessionScope.user.uid}" class="m-menu-item">点评管理</a>
                    </div>
                </li>
                <li data-v-306fd360 class="m-menu">
                    <h5 data-v-306fd360>
                    <span data-v-306fd360 class="m-img">
                    <i data-v-306fd360 class="u-img icon-2000"></i></span>
                    <span data-v-306fd360>房源管理</span></h5> 													
                    <div data-v-306fd360 class="g-menu-layout">
                        <a data-v-306fd360 href="${pageContext.request.contextPath}/findHousesByuid?uid=${sessionScope.user.uid}" class="m-menu-item">房屋管理</a>
                        <%-- <a data-v-306fd360 href="${pageContext.request.contextPath}/front/sellerSys/seller_homeStat.jsp" class="m-menu-item">房态管理</a> --%>
                    </div>
                </li>
                <li data-v-306fd360 class="m-menu" style="display:none">
                    <h5 data-v-306fd360><span data-v-306fd360 class="m-img">
                    <i data-v-306fd360 class="u-img icon-4000"></i></span>
                    <span data-v-306fd360>经营管理</span></h5> 
                    <div data-v-306fd360 class="g-menu-layout">
                    <a data-v-306fd360 href="${pageContext.request.contextPath}/front/sellerSys/seller_custMan.jsp" class="m-menu-item">宾客管理</a>
                    </div>
                </li>
                <li data-v-306fd360 class="m-menu">
                    <h5 data-v-306fd360><span data-v-306fd360 class="m-img">
                    <i data-v-306fd360 class="u-img icon-9000"></i></span>
                    <span data-v-306fd360>通知</span></h5> 
                    <div data-v-306fd360 class="g-menu-layout">
	                    <c:set var="i" value="0"></c:set>
	                    <c:forEach items="${sessionScope.user.sellmess}" var="mes">
	                    	<c:if test="${mes.state==0}">
	                    		<c:set var="i" value="${i+1}"></c:set>
	                    	</c:if>
	                    </c:forEach>
	                    <c:choose>
	                    <c:when test="${i>0}">
	                    	<a data-v-306fd360 href="${pageContext.request.contextPath}/user/readmes?uid=${sessionScope.user.uid}&type=1" class="m-menu-item">系统消息(${index})</a>
	                    </c:when>
	                    <c:otherwise>
	                    	<a data-v-306fd360 href="${pageContext.request.contextPath}/user/readmes?uid=${sessionScope.user.uid}&type=1" class="m-menu-item">系统消息</a>
	                    </c:otherwise>
	                    </c:choose>
                    </div>
                </li>
            </ul>
        </nav>
        <!--end left-->
  </body>
</html>
