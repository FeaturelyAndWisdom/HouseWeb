<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  <body style="background-color:#FFF">
  	<!--header-->
  	<script type="text/javascript">
		$(function(){
			$('#guide').text('<%=request.getParameter("type")%>');
		})
	</script>
    <div class="hd-wrap-fluid ">
        <div class="m-hd">
            <div class="site-logo-cont">
                <a href="${pageContext.request.contextPath}/front/index.jsp" target="_blank" class="site-logo">途家网</a>
                <span class="logo-text">旅途中的家</span>
            </div>
            <div class="nav-list">
                <ul>
             		<li class="first"><a href="${pageContext.request.contextPath}/front/index.jsp" class="home-link " target="_blank">首页</a></li>
                </ul>
            </div>
            <div class="sub-link"> 
            	欢迎您！${sessionScope.user.uname}       
	            <a href="javascript:;" class="mytujia" id="mytujiamenu">我的途家</a>        
	            <a href="${pageContext.request.contextPath}/user/userlogout" class="logout-btn">[退出]</a>        
            </div>
        </div>
    </div>
    <!--end header-->
    
    <div class="container_24">
        <div class="m-directory">
            <a href="${pageContext.request.contextPath}/front/index.jsp">途家网</a><span>&gt;</span>
            	我的途家<span>&gt;</span>
            	<font id="guide">订单管理</font>
        </div>
    </div>
    
    <!--body-->
    	<!-- <div class="container_24 clearfix" id="orderWrapper"> -->
        	<!--left-->
            <div class="grid_5" style="margin-left:270px;width:190px">
                <div class="m-menu">
                    <div class="user-group">
                        <img src="${pageContext.request.contextPath}/userIcon/${sessionScope.user.uimg}" alt="" width="60" height="60" class="user-pic">
                        <div class="user-group-info">
                            <a href="javascript:;" class="user-name">
                                ${sessionScope.user.uname}
                            </a>
                            <p><a href="${pageContext.request.contextPath}/front/userInfo/userinf_setPerInf.jsp" class="link-btn">修改个人资料</a></p>
                        </div>
                    </div>
                    
                    <div class="menu-group">
                        <h2 class="menu-name"><i class="icons-manage"></i>我的订单</h2>
                        <ul class="menu-list">
                            <li><a id="myorders" href="${pageContext.request.contextPath}/findOrders?uid=${sessionScope.user.uid}&type=0" title="订单管理" class="current">订单管理</a></li>
                            <li><a id="mycomments" href="${pageContext.request.contextPath}/findCommOrder?uid=${sessionScope.user.uid}" title="点评管理">点评管理</a></li>
                        </ul>
                    </div>
                    
                    <div class="menu-group">
                        <h2 class="menu-name"><i class="icons-user"></i>个人中心</h2>
                        <ul class="menu-list">
                 			<li><a id="myUserInfoInfo" title="个人资料" href="${pageContext.request.contextPath}/front/userInfo/userinf_setPerInf.jsp">个人资料</a></li>
                            <li><a id="mypassword" title="修改密码" href="${pageContext.request.contextPath}/front/userInfo/userinf_changePwd.jsp">修改密码</a></li>
                            <li><a id="myfavorite" title="我的收藏" href="${pageContext.request.contextPath}/user/findfavhouse?uid=${sessionScope.user.uid}">我的收藏</a></li>
                            <li><a id="livePers" title="常用入住人管理" href="${pageContext.request.contextPath}/front/userInfo/userinf_pers.jsp">常用入住人</a></li>
                            <c:set var="index" value="0"></c:set>
                            <c:forEach items="${sessionScope.user.custmess}" var="mes">
                            	<c:if test="${mes.state==0}">
                            		<c:set var="index" value="${index+1}"></c:set>
                            	</c:if>
                            </c:forEach>
                            <c:choose>
                            <c:when test="${index>0}">
                            	<li><a id="userMes" title="消息" href="${pageContext.request.contextPath}/user/readmes?uid=${sessionScope.user.uid}&type=0">消息(${index})</a></li>
                            </c:when>
                            <c:otherwise>
                            	<li><a id="userMes" title="消息" href="${pageContext.request.contextPath}/user/readmes?uid=${sessionScope.user.uid}&type=0">消息</a></li>
                            </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                    
                    <div class="menu-group">
                        <h2 class="menu-name"><i class="icons-manage"></i>
                        	<a href="${pageContext.request.contextPath}/sellerpageInit">进入商户系统>></a>
                        </h2>
                    </div>
                </div>
         </div>
         <!--end left-->
        <!-- </div> -->
    <!--end body-->
  </body>
</html>
