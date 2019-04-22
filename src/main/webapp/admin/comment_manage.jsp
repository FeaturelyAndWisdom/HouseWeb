<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>点评管理</title>
    
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
	
	
  </head>
  
  <body>
  <div id="app">
    <jsp:include page="admin_common.jsp"></jsp:include>
    
    <!--center-->
    <div data-v-166a34a6 class="order-manager m-view">
        	<div class="main-operate">
            	<h4>点评管理</h4>
                <div data-v-1b1fd10f class=" main-box">
					<ul data-v-1b1fd10f="" class="clearfix left switch-box" id="checks">
						<li data-v-1b1fd10f="" class="active">全部 <!----> <!----> <!----></li>
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
				
				<script type="text/javascript">
					var localObj = window.location;
					var protocol = location.protocol;
					var host = localObj.host;
					var contextPath = localObj.pathname.split("/")[1]; 
					var basePath = protocol +"//"+host+"/"+contextPath;
					
					function findCommentdetail(oid,onum,hname){
						$("#commdetail").css("display","block");
						$("#ordlst").css("display","none");
						$("#odnum").val(onum);
						$("#odhname").val(hname);
						$.ajax({
							type:'post',
							url:basePath+"/findCommByOrder",
							data:"oid="+oid,
							success:function(data){
								$("#odcontent").val(data.content);
							}
						})
					}
					
					function back(){
						$("#commdetail").css("display","none");
						$("#ordlst").css("display","block");
					}
					
					function delorder(oid){
						var flag = window.confirm('确定删除该条评论吗？');
						if(flag){
							$.ajax({
								type:'get',
								url:basePath+"/deleOrder",
								data:"oid="+oid,
								success:function(data){
									if(data=="fail"){
										alert("删除失败，请稍后再试");
										return;
									}else if(data=="success"){
										alert("删除成功");
										history.go(0);
									}
								}
							})
						}
					}
				</script>
				
				<div align="center" id="ordlst" style="width:100%;">
					<c:if test="${requestScope.ordlst==null || fn:length(ordlst)==0}">
				    	<div class="empty-order"></div>
				    </c:if>
					<c:if test="${fn:length(ordlst)>0}">
               	 <table style="border:#999;width:100%;margin-top:10px;display:block;" id="orderlst" border="1" cellspacing="2" align="center">
                 	<thead style="height:35px;">
                    <tr bgcolor="#CCCCCC">
                        <th height="32" style="width: 9%">订单号</th>
                        <th style="width: 12%">用户(手机)</th>
                        <th style="width: 10%">房屋编号</th>
                        <th style="width: 5%">商家用户</th>
                        <th style="width: 10%">操作</th>
                   </tr>
                    </thead>
                 	<c:forEach items="${requestScope.ordlst}" var="order">
		                   <tr align="center" style="height:35px;">
		                        <td>${order.ordernum}</td>
		                        <td>${order.pername}(${order.pertel})</td>
		                        <td>${order.house.hid}（${order.house.housename}）</td>
		                        <td>${order.seller.uname}</td>
		                        <td>
			                        <a href="javascript:;" onclick="findCommentdetail('${order.oid}','${order.ordernum}','${order.house.housename}')">查看详情</a>
			                        <a href="javascript:;" onclick="delorder('${order.oid}')">删除评论</a>
		                        </td>
		                   </tr>
                   </c:forEach>
                </table>
                </c:if>
                </div>
                
                <div id="commdetail" style="display:none" align="center">
			    	<table style="width: 600px; margin-top: 30px;" >
		                	<tr align="center">
		                    	<td width="150px" style="padding-left: 30px;">订单编号：</td>
		                    	<td width="400px;">
		                    		<input type="text" readonly="readonly" id="odnum" value="sss"/>
		                    	</td>    
		                    </tr>
		                  <tr align="center">
		                    	<td style="padding-left: 30px;">房屋名称：</td>
		                    	<td><input readonly="readonly" id="odhname" value=""/></td>    
		                    </tr>
		                  <tr align="center">
		                    	<td style="padding-left: 30px;">评论内容：</td>
		                    	<td><textarea rows="10" cols="60" id="odcontent" style="resize:none" readonly="readonly"></textarea></td>    
		                    </tr>
		                    <tr>
		                    	<td colspan="2"><a href="javascript:;" style="font-size: 17px;" onclick="back()">返回</a></td>
		                    </tr>
		                </table>
			    </div>
				
                
                <div class="page-box" style="overflow: hidden;"><!----></div>
            </div>
        </div>
    <!--end center-->
   </div>
  </div>
  </body>
</html>
