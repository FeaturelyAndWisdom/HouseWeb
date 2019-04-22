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

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInf_css.css"/> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member_common_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInf_pers_css.css"/>
	
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		var localObj = window.location;
		var protocol = location.protocol;
		var host = localObj.host;
		var contextPath = localObj.pathname.split("/")[1]; 
		var basePath = protocol +"//"+host+"/"+contextPath;
		
		$(function(){
			$("#a1").click(function(){
				if($(this).attr("class")!="current"){
					$(this).toggleClass("current")
					$("#a2").toggleClass("current")
				}
				$("#nosaytab").css("display","block");
				$("#saytab").css("display","none");
			})
			
			$("#a2").click(function(){
				if($(this).attr("class")!="current"){
					$(this).toggleClass("current")
					$("#a1").toggleClass("current")
				}
				$("#nosaytab").css("display","none");
				$("#saytab").css("display","block");
			})
		})
		
		function writeComment(oid,onum,hname,hid,sellid){
			$("#onum").val(onum);
			$("#housename").val(hname);
			$("#houseid").val(hid);
			$("#orderid").val(oid);
			$("#sellid").val(sellid);
			$("#writecomm").css("display","block");
			$("#nosaytab").css("display","none");
			$("#saytab").css("display","none");
		}
		
		function submitInfo(){
			var hid = $("#houseid").val();
			var oid = $("#orderid").val();
			var sellid = $("#sellid").val();
			var uid = $("#custid").val();
			var content = $("#content").val();
			
			var inf = {"hid":hid,"oid":oid,"sellid":sellid,"uid":uid,"content":content};
			$.ajax({
				type:"post",
				url:basePath+"/saveComment",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(inf),
				success:function(data){
					if(data=="fail"){
						alert("评论失败，请稍后再试");
						return;
					}else if(data=="success"){
						alert("评论成功");
						history.go(0);
					}							
				}
			})
		}
		
		function back(type){
			if(type==0){
				$("#writecomm").css("display","none");
				$("#nosaytab").css("display","block");
			}else{
				$("#saytab").css("display","block");
				$("#commdetail").css("display","none");
			}
			
			
		}
		
		function commentdetail(oid,onum,hname){
			$("#commdetail").css("display","block");
			$("#saytab").css("display","none");
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
	</script>	
	
	<style type="text/css">
		td{
			font-size: 13px;
			align:center;
		}
	</style>
  </head>
  
  <body>
  	<jsp:include page="userinf_common.jsp">
  		<jsp:param value="点评管理" name="type"></jsp:param>
  	</jsp:include>
    <div class="grid_19" style="width:900px" id="order">

	    <div class="orderHead">
	        <h4>点评管理</h4>
	    </div>
	    
	    <div class="tab">
	        <ul class="tabmenu">
	            <li><a href="Javascript:;" class="current" id="a1">未评价房屋</a></li>        
	            <li><a href="Javascript:;" id="a2">已评价房屋</a></li>   
	        </ul>
	    </div>
	    
	    <div class="pb-tab" style="margin-top: 10px;">
	    <div id="nosaytab">
	    <c:if test="${requestScope.nosaylst==null || fn:length(nosaylst)==0}">
	    	<div class="no-comment-page">
		        <span class="tutu">
		            <img src="https://staticfile.tujia.com/PortalSite2/Images/User/tutu.png"></span><br>
		            &nbsp;&nbsp;&nbsp;&nbsp;您没有可点评的订单
		    </div>
	    </c:if>
	    
	    <c:if test="${fn:length(nosaylst)>0}">
	    	<table style="display:block;width: 100%">
	            <thead style="width: 100%">
	                <tr> 
	                    <th style="width: 16%">订单编号</th>
	                    <th style="width: 19%">订单日期</th>
	                    <th style="width: 20%">商户（手机）</th>
	                    <th style="width: 19%">居住日期</th>
	                    <th style="width: 15%">房屋编号</th>
	                    <th style="width: 4%">操作</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:forEach items="${requestScope.nosaylst}" var="order">
	            		<tr align="center">
		                    <td>${order.ordernum}</td>
	                        <td><fmt:formatDate value="${order.madedate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
	                        <td>${order.user.uname}(${order.user.tel})</td>
	                        <td><fmt:formatDate value="${order.livetime}" pattern="yyyy-MM-dd"/>至<fmt:formatDate value="${order.leavetime}" pattern="yyyy-MM-dd"/></td>
	                        <td>${order.house.hid}（${order.house.housename}）</td>
	                        <td>
	                        	<a href="javascript:;" onclick="writeComment('${order.oid}','${order.ordernum}','${order.house.housename}','${order.house.hid}','${order.seller.uid}')">写点评</a>
	                        </td>
		                </tr>
	            	</c:forEach>
	            </tbody>
	       </table>
	    </c:if>
	    </div>
	    
	    <div id="writecomm" style="display:none" align="center">
	    	<table style="width: 600px; margin-top: 30px;" >
                	<tr align="center">
                    	<td width="150px" style="padding-left: 30px;">订单编号：</td>
                    	<td width="400px;">
                    		<input type="text" readonly="readonly" id="onum" value="sss"/>
                    		<input type="hidden" id="houseid" value="">
                    		<input type="hidden" id="orderid" value="">
                    		<input type="hidden" id="custid" value="${sessionScope.user.uid}">
                    		<input type="hidden" id="sellid" value="">
                    	</td>    
                    </tr>
                  <tr align="center">
                    	<td style="padding-left: 30px;">房屋名称：</td>
                    	<td><input readonly="readonly" id="housename" value=""/></td>    
                    </tr>
                  <tr align="center">
                    	<td style="padding-left: 30px;">评论内容：</td>
                    	<td><textarea rows="10" cols="60" id="content"></textarea></td>    
                    </tr>
                  
                    <tr>
                    	<td colspan="2" style="padding-left: 140px;height: 50px;">
                    		<input type="button" value="提交" onclick="submitInfo()" class="button button03">
                    		<input type="button" value="返回" onclick="back(0)" class="button button03">
                    	</td>
                    </tr>
                </table>
	    </div>
	    
	    <div id="saytab" style="display:none">
	    	<c:if test="${requestScope.saylst==null || fn:length(saylst)==0}">
		    	<div class="no-comment-page">
			        <span class="tutu">
			            <img src="https://staticfile.tujia.com/PortalSite2/Images/User/tutu.png"></span><br>
			            &nbsp;&nbsp;&nbsp;&nbsp;您没有已点评的订单
			    </div>
		    </c:if>
		    
		    <c:if test="${fn:length(saylst)>0}">
	    	<table style="display:block;width: 100%">
	            <thead style="width: 100%">
	                <tr> 
	                    <th style="width: 12%">订单编号</th>
	                    <th style="width: 16%">订单日期</th>
	                    <th style="width: 20%">商户（手机）</th>
	                    <th style="width: 18%">居住日期</th>
	                    <th style="width: 15%">房屋编号</th>
	                    <th style="width: 7%">操作</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:forEach items="${requestScope.saylst}" var="order">
	            		<tr align="center">
		                    <td>${order.ordernum}</td>
	                        <td><fmt:formatDate value="${order.madedate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
	                        <td>${order.user.uname}(${order.user.tel})</td>
	                        <td><fmt:formatDate value="${order.livetime}" pattern="yyyy-MM-dd"/>至<fmt:formatDate value="${order.leavetime}" pattern="yyyy-MM-dd"/></td>
	                        <td>${order.house.hid}（${order.house.housename}）</td>
	                        <td>
	                        	<a href="javascript:;" onclick="commentdetail('${order.oid}','${order.ordernum}','${order.house.housename}')">查看详情</a>
	                        </td>
		                </tr>
	            	</c:forEach>
	            </tbody>
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
                    	<td><textarea rows="10" cols="60" id="odcontent" readonly="readonly"></textarea></td>    
                    </tr>
                    <tr>
                    	<td colspan="2"><a href="javascript:;" onclick="back(1)">返回</a></td>
                    </tr>
                </table>
	    </div>
	    
	    </div>
	</div>
  </body>
</html>
