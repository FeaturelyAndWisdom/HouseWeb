<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>我的收藏</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInf_css.css"/> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member_common_css.css"/>
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	
  </head>
  
  <body>
    
    <jsp:include page="userinf_common.jsp">
    	<jsp:param value="我的收藏" name="type"></jsp:param>
    </jsp:include>
    <div class="grid_19" style="width:750px" id="order">

	    <div class="orderHead" style="border-bottom:2px solid #f60">
	        <h4>我的收藏</h4>
	    </div>
	
		<c:choose>	
			<c:when test="${fn:length(houselst)==0}">    
			    <div style="" id="nofavorite" class="no-favorite">
		            <p>
		                快来途家收藏你的第一间房屋<br>
		                为旅行收藏不一样的住宿体验<br>
		                <br>
		            </p>
		        </div>
        	</c:when>
        	<c:otherwise>
				<div class="collection-cont" id="favoriteList">
					<div class="collection-list">
						<div class="collection-list">
							<ul>
								<c:forEach items="${requestScope.houselst}" var="house">
									<li class="myfavorite">
									<a href="${pageContext.request.contextPath}/findHouseById?hid=${house.hid}&gopage=1" target="_blank" class="pic-box"> 
										<img src="${pageContext.request.contextPath}/houseImg/${house.imglst[0].imgpath}" width="368" height="232">
									</a>
										<div class="house-hd">
											<h2>
										<a class="title" href="${pageContext.request.contextPath}/findHouseById?hid=${house.hid}&gopage=1" target="_blank" title="${house.housename}">${house.housename}</a>
											</h2>
											<span class="price-box"><dfn>¥</dfn>${house.house_price}</span>
										</div>
										<div class="house-info">
											<p class="house-datelist">
												<span title="公寓 " class="lab-text">${house.housetype}</span> |
												<span class="lab-text">${house.bedr_num}室${house.livr_num}厅${house.wcr_num}卫</span>|
												<span class="lab-text">${house.renttype}</span>|
												<span class="lab-text">${house.housearea}平米</span>| 
												<span class="lab-text">宜住${house.live_peo_num}人</span>
											</p>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</c:otherwise>
        </c:choose>
	</div>
  </body>
</html>
