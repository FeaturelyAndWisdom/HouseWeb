<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInf_css.css"/> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member_common_css.css"/>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInf_pers_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<style type="text/css">
		td{
			font-size: 13px;
			align:center;
		}
	</style>
  </head>
  
  <body>
    <jsp:include page="userinf_common.jsp">
    	<jsp:param value="订单管理" name="type"></jsp:param>
    </jsp:include>
    <div class="grid_19" style="width:900px" id="order">

	    <div class="orderHead">
	        <h4>订单管理</h4>
	    </div>
	    
	    <div class="tab">
	        <ul class="tabmenu">
	            <li><a href="Javascript:;" class="current">全部订单</a></li>           
	        </ul>
	    </div>
	    
	    <div class="pb-tab" style="margin-top: 10px;">
	    <c:if test="${requestScope.olst==null || fn:length(olst)==0}">
	    	<div class="no-comment-page">
		        <span class="tutu">
		            <img src="https://staticfile.tujia.com/PortalSite2/Images/User/tutu.png"></span><br>
		            &nbsp;&nbsp;&nbsp;&nbsp;您还没有的订单
		    </div>
	    </c:if>
	    
	    <c:if test="${fn:length(olst)>0}">
	        <table style="display:block;width: 100%" id="orderlst">
	            <thead style="width: 100%">
	                <tr> 
	                    <th style="width: 12%">订单编号</th>
	                    <th style="width: 17%">订单日期</th>
	                    <th style="width: 20%">商户（手机）</th>
	                    <th style="width: 20%">居住日期</th>
	                    <th style="width: 15%">房屋编号</th>
	                    <th style="width: 10%">订单状态</th>
	                    <th style="width: 7%">操作</th>
	                </tr>
	            </thead>
	            <script>
	            	function findOrderDetail(oid){
	            		var localObj = window.location;
						var protocol = location.protocol;
						var host = localObj.host;
						var contextPath = localObj.pathname.split("/")[1]; 
						var basePath = protocol +"//"+host+"/"+contextPath;
	            		$.ajax({
	            			type:'post',
	            			url:basePath+'/findOrderById',
	            			data:'oid='+oid,
	            			success:function(data){
	            				var temp = new Date(data.madedate);
								$("#orderlst").css("display","none");
								$("#odetail").css("display","block");
								$("#onum").text(data.ordernum);
								$("#odate").text(temp.getFullYear()+'-'+(temp.getMonth()+1)+'-'+temp.getDate());
								temp = new Date(data.livetime);
								var temp2 = new Date(data.leavetime);
								$("#livedate").text(temp.getFullYear()+'-'+(temp.getMonth()+1)+'-'+temp.getDate()+'至'+temp2.getFullYear()+'-'+(temp2.getMonth()+1)+'-'+temp2.getDate());
								$("#hnum").text(data.housenum);
								$("#pnum").text(data.pernum);
								$("#pname").text(data.pername);
								$("#ptel").text(data.pertel);
								$("#pcid").text(data.percardid);
								$("#sellname").text(data.seller.uname);
								$("#tprice").text(data.totalprice);
								$("#house").attr("href","${pageContext.request.contextPath}/findHouseById?hid="+data.house.hid+"&gopage=1");
								$("#house").text(data.house.housename);
								if(data.state==0){
									$("#ostate").text("未确认");
								}else if(data.state==1){
									$("#ostate").text("已确认");
								}
	            			}
	            		})
	            	}
	            	
	            	function back(){
	            		$("#orderlst").css("display","block");
						$("#odetail").css("display","none");
	            	}
	            </script>
	            <tbody>
	            	<c:forEach items="${requestScope.olst}" var="order">
	            		<tr align="center">
		                    <td>${order.ordernum}</td>
	                        <td><fmt:formatDate value="${order.madedate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
	                        <td>${order.user.uname}(${order.user.tel})</td>
	                        <td><fmt:formatDate value="${order.livetime}" pattern="yyyy-MM-dd"/>至<fmt:formatDate value="${order.leavetime}" pattern="yyyy-MM-dd"/></td>
	                        <td>${order.house.hid}（${order.house.housename}）</td>
	                        <td>
								<c:if test="${order.state==0}">
		                        	<span>商家未确认</span>
		                        </c:if>
		                        <c:if test="${order.state==1}">
		                        	<span>商家已确认</span>
		                        </c:if> 
		                        <c:if test="${order.state==2}">
		                        	<span>已评论</span>
		                        </c:if> 
							</td>
	                        <td>
	                        	<a href="javascript:;" onclick="findOrderDetail('${order.oid}')">查看详情</a>
	                        </td>
		                </tr>
	            	</c:forEach>
	            		<tr>
	            			<td colspan="7"><span style="float: right;font-size: 8px;">需商家确认后方可评价</span></td>
	            		</tr>
		        </tbody>
	        </table>
	    </c:if>
	    <table width="421" height="363" id="odetail" cellpadding="3" style="margin-top:30px;display:none;height:100%;margin-left: 150px;" >
                	<tr align="center">
                    	<td width="113">订单编号：</td>
                    	<td width="229" id="onum">1551510859832CrrJ7fPm</td>    
                    <tr>
                  <tr align="center">
                    	<td>订单日期：</td>
                    	<td id="odate">2019-03-02 15:14:19</td>    
                    <tr>
                  <tr align="center">
                    	<td>居住时间：</td>
                    	<td id="livedate">2019-03-09至2019-03-14</td>    
                    <tr>
                  <tr align="center">
                    	<td>房屋名称：</td>
                    	<td><a id="house"></a></td>    
                    <tr>
                  <tr align="center">
                    	<td>房屋套数：</td>
                    	<td id="hnum">1套</td>    
                    <tr>
                  <tr align="center">
                    	<td>人数：</td>
                    	<td id="pnum">4人</td>    
                    <tr>
                  <tr align="center">
                    	<td>居住人姓名：</td>
                    	<td id="pname">宋江</td>    
                    <tr>
                  <tr align="center">
                    	<td>居住人电话：</td>
                    	<td id="ptel">13654895640</td>    
                    <tr>
                  <tr align="center">
                    	<td>居住人证件号：</td>
                    	<td id="pcid">610103199702142817</td>    
                    <tr>
                  <tr align="center">
                    	<td>商家用户：</td>
                    	<td id="sellname">卡布达</td>    
                    <tr>
                  <tr align="center">
                    	<td>订单总额：</td>
                    	<td id="tprice">500</td>    
                    <tr>
                  <tr align="center">
                    	<td>订单状态：</td>
                    	<td id="ostate"></td>    
                    <tr>
                    <tr>
                    	<td colspan="2"><a href="javascript:;" onclick="back()" style="float:right;font-size:25px;">返回</a></td>
                    </tr>
                </table>
	</div>
  </body>
</html>
