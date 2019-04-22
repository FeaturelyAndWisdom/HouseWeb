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
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_order_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_order_css2.css"/>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css2.css"/>
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<style type="text/css">
		#odetail td{
			font-size: 19px;		
		}
	</style>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/order_manage.js"></script>
  </head>
  
  <body>
  <div id="app">
    <jsp:include page="seller_common.jsp">
    	<jsp:param value="订单管理" name="type"/>
    </jsp:include>
    
    <!--center-->
    <div data-v-166a34a6 class="order-manager m-view">
        	<div class="main-operate">
            	<h4>订单管理</h4>
                <div data-v-1b1fd10f class=" main-box">
					<ul data-v-1b1fd10f="" class="clearfix left switch-box" id="checks">
						<li data-v-1b1fd10f="" class="active">全部 <!----> <!----> <!----></li>
						<!-- <li data-v-1b1fd10f="" class="">待支付</li>
						<li data-v-1b1fd10f="" class="">待确认</li>
						<li data-v-1b1fd10f="" class="">待入住</li>
						<li data-v-1b1fd10f="" class="">已入住</li>
						<li data-v-1b1fd10f="" class="">已离店</li>
						<li data-v-1b1fd10f="" class="">已取消</li> -->
					</ul>
					<ul data-v-1b1fd10f="" class="right search-box">
      					<li data-v-1b1fd10f>
        				<div data-v-1b1fd10f="" class="ivu-input-wrapper ivu-input-type" style="width: 200px;"><!----> 
            				<i class="ivu-icon ivu-icon-ios-search ivu-input-icon ivu-input-icon-normal"></i> <!----> 
           					<input autocomplete="off" spellcheck="false" type="text" placeholder="订单号" class="ivu-input"></div>&nbsp;&nbsp;
            				<button data-v-1b1fd10f="" type="button" class="ivu-btn ivu-btn-primary"><span>搜索</span></button>			
            			</div>
				        </li>
				    </ul>
				</div>
				
				<div align="center" style="width:100%;">
					<c:if test="${requestScope.olst==null || fn:length(olst)==0}">
				    	<div class="empty-order"></div>
				    </c:if>
					<c:if test="${fn:length(olst)>0}">
               	 <table style="border:#999;width:100%;margin-top:10px;display:block;" id="orderlst" border="1" cellspacing="2" align="center">
                 	<thead style="height:35px;">
                    <tr bgcolor="#CCCCCC">
                        <th height="32" style="width: 9%">订单号</th>
                        <th style="width: 9%">订单日期</th>
                        <th style="width: 12%">用户(手机)</th>
                        <th style="width: 12%">居住日期</th>
                        <th style="width: 10%">房屋编号</th>
                        <th style="width: 5%">状态</th>
                        <th style="width: 10%">操作</th>
                   </tr>
                    </thead>
                 	<c:forEach items="${requestScope.olst}" var="order">
		                   <tr align="center" style="height:35px;">
		                        <td>${order.ordernum}</td>
		                        <td><fmt:formatDate value="${order.madedate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                        <td>${order.pername}(${order.pertel})</td>
		                        <td><fmt:formatDate value="${order.livetime}" pattern="yyyy-MM-dd"/>至<fmt:formatDate value="${order.leavetime}" pattern="yyyy-MM-dd"/></td>
		                        <td>${order.house.hid}（${order.house.housename}）</td>
		                        <td>
			                        <c:if test="${order.state==0}">
			                        	<span data-state='0' id="order_state">未完成确认</span>
			                        </c:if>
			                        <c:if test="${order.state==1}">
			                        	<span data-state='1' id="order_state">已完成确认</span>
			                        </c:if> 
			                        <c:if test="${order.state==2}">
			                        	<span data-state='2' id="order_state">已完成评价</span>
			                        </c:if> 
		                        </td>
		                        <td>
		                        	<a href="javascript:;" onclick="findOrderDetail('${order.oid}')">查看详情</a>
		                        	<a href="javascript:;" onclick="accompOrder('${order.oid}')">确认订单</a>
		                        </td>
		                   </tr>
                   </c:forEach>
                </table>
                </c:if>
                
                <table width="421" height="363" id="odetail" cellpadding="3" style="margin-top:30px;display:none;height:100%;" >
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
                
                <div class="page-box" style="overflow: hidden;"><!----></div>
            </div>
        </div>
    <!--end center-->
   </div>
  </div>
  <script type="text/javascript">
		$(function(){
			$("#checks li").click(function(){
				$("#checks li").attr("class","");
				$(this).attr("class","active");
			})
		})
	</script>
  </body>
</html>

