<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>房屋管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css2.css"/>
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_order_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_order_css2.css"/>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_houmge_ulist.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_houmge_uluc.css"/>
	
	<script type="text/javascript">
		function gotoaddhouse(){
			location="${pageContext.request.contextPath}/serviceInit";
		}
		
		var localObj = window.location;
		var protocol = location.protocol;
		var host = localObj.host;
		var contextPath = localObj.pathname.split("/")[1]; 
		var basePath = protocol +"//"+host+"/"+contextPath;
                   	
       	function findHousedetail(hid){
       		$("#houselst").css("display","none");
       		$("#housedetail").css("display","block");
       		
       		$.ajax({
       			type:'get',
       			url:basePath+'/admin/findHouseByIdJson',
       			data:'hid='+hid,
       			success:function(data){
       				$("#hid").text(data.hid);
       				$("#housename").text(data.housename);
       				$("#location").text(data.location);
       				$("#locatremark").text(data.locatremark);
       				$("#doorid").text(data.doorid);
       				$("#renttype").text(data.renttype);
       				$("#housetype").text(data.housetype);
       				$("#housearea").text(data.housearea);
       				$("#housesight").text(data.housesight);
       				$("#bedr_num").text(data.bedr_num);
       				$("#wcr_num").text(data.wcr_num);
       				$("#livr_num").text(data.livr_num);
       				$("#kit_num").text(data.kit_num);
       				$("#bkr_num").text(data.bkr_num);
       				$("#bal_num").text(data.bal_num);
       				$("#live_peo_num").text(data.live_peo_num);
       				$("#house_feature").text(data.house_feature);
       				$("#house_traffic").text(data.house_traffic);
       				$("#house_arround").text(data.house_arround);
       				$("#enterlive_time").text(data.enterlive_time);
       				$("#leavelive_time").text(data.leavelive_time);
       				$("#otherdesc").text(data.otherdesc);
       				$("#house_price").text(data.house_price);
       				$("#least_day").text(data.least_day);
       				$("#enterlive_time").text(data.enterlive_time);
       				if(data.isdel==0){
       					if(data.state==0){
       						$("#hstate").text("待审核");
       					}else{
       						$("#hstate").text("通过审核");
       					}
       				}else{
       					$("#hstate").text("已下架");	
       				}
       				var services = data.servicelst;
       				var temp='';
       				for(var i=0;i<services.length;i++){
       					temp+=services[i].itemname+" ";
       				}
       				$("#service").text(temp);
       			}
       		})
       	}
       	
       	function back(){
       		$("#housedetail").css("display","none");
       		$("#houselst").css("display","block");
       	}
       	
		function downhouse(hid){
			$.ajax({
       			type:'get',
       			url:basePath+'/admin/operhouse',
       			data:'hid='+hid+'&type=1',
       			success:function(data){
       				if(data=="fail"){
       					alert("操作失败，请稍后再试");
       					return;
       				}
       				if(data=="success"){
       					alert("下架成功");
       					history.go(0);
       				}
       			}
       		})
		}
		
	</script>
  </head>
  
  <body>
  <div id="app">
    <jsp:include page="seller_common.jsp">
    	<jsp:param value="房屋管理" name="type"/>
    </jsp:include>
    
    <!--center-->
    <div data-v-166a34a6 class="order-manager m-view">
        	<div class="main-operate">
            	<h4>房屋管理</h4>
                <div data-v-1b1fd10f class=" main-box">
					<ul data-v-1b1fd10f="" class="clearfix left switch-box" id="checks" style="width: 400px">
						<li data-v-1b1fd10f="" class="active">全部 <!----> <!----> <!----></li>
						<!-- <li data-v-1b1fd10f="" class="">已发布</li>
						<li data-v-1b1fd10f="" class="">待审核</li>
						<li data-v-1b1fd10f="" class="">审核未通过</li> -->
					</ul>
					<ul data-v-1b1fd10f="" class="right search-box" style="width: 400px;float: left;">
      					<li data-v-1b1fd10f>
        				<div data-v-1b1fd10f="" class="ivu-input-wrapper ivu-input-type" style="width: 200px;"><!----> 
            				<i class="ivu-icon ivu-icon-ios-search ivu-input-icon ivu-input-icon-normal"></i> <!----> 
           					<input autocomplete="off" spellcheck="false" type="text" placeholder="房屋编号/房屋名称" class="ivu-input"></div>&nbsp;&nbsp;
            				<button data-v-1b1fd10f="" type="button" class="ivu-btn ivu-btn-primary"><span>搜索</span></button>	&nbsp;&nbsp;&nbsp;&nbsp;
            				<button type="button" class="ivu-btn ivu-btn-primary" onclick="gotoaddhouse()"><!----> 
            				<i class="ivu-icon ivu-icon-plus"></i> <span>发布新房屋</span></button>
            			</div>
				        </li>
				    </ul>
				</div>
				
				<div align="center" id="houselst" style="width:100%;">
					<c:if test="${requestScope.houselst==null || fn:length(houselst)==0}">
				    	<div class="empty-order"></div>
				    </c:if>
					<c:if test="${fn:length(houselst)>0}">
               	 <table style="border:#999;width:100%;margin-top:10px;display:block;" border="1" cellspacing="2" align="center">
                 	<thead style="height:35px;">
                    <tr bgcolor="#CCCCCC">
                        <th height="32" style="width: 7%">房屋编号</th>
                        <th style="width: 20%">地址(门牌号)</th>
                        <th style="width: 15%">房屋名称</th>
                        <th style="width: 5%">上架日期</th>
                        <th style="width: 7%">状态</th>
                        <th style="width: 8%">操作</th>
                   </tr>
                    </thead>
                 	<c:forEach items="${requestScope.houselst}" var="house">
		                   <tr align="center" style="height:35px;">
		                        <td>${house.hid}</td>
		                        <td>${house.location}(${house.doorid})</td>
		                        <td>${house.housename}</td>
		                        <td><fmt:formatDate value="${house.senddate}" pattern="yyyy-MM-dd"/></td>
		                        <td>
		                        	<c:if test="${house.isdel==0}">
			                        	<c:if test="${house.state==0}">
			                        		待审核
			                        	</c:if>
			                        	<c:if test="${house.state==1}">
			                        		通过审核，已上架
			                        	</c:if>
		                        	</c:if>
		                        	<c:if test="${house.isdel==1}">
		                        		已下架
		                        	</c:if>
		                        </td>
		                        <td>
		                        	<a href="javascript:;" onclick="findHousedetail('${house.hid}')">查看详情</a>
		                        	<c:if test="${house.isdel==0}">
			                        	<c:if test="${house.state==1}">
			                        		<a href="javascript:;" onclick="downhouse('${house.hid}')">下架房屋</a>
			                        	</c:if>
		                        	</c:if>
		                        </td>
		                   </tr>
                   </c:forEach>
                </table>
                </c:if>
                </div>
                
                <div id="housedetail" style="display:none" align="center">
			    	<table style="width: 100%; margin-top: 30px;" cellspacing="10">
		                  <tr align="center">
		                    	<td width="30%" style="padding-left: 30px;">房屋编号：</td>
		                    	<td width="400px;">
		                    		<span id="hid"></span>
		                    	</td>    
		                    </tr>
		                  <tr align="center">
		                    	<td style="padding-left: 30px;">房屋名称：</td>
		                    	<td>
									<span id="housename"></span>
								</td>    
		                    </tr>
		                  <tr align="center">
		                    	<td style="padding-left: 30px;">地理位置(描述)(门牌号)：</td>
		                    	<td>
		                    		<span id="location"></span>
		                    		(<span id="locatremark"></span>)
		                    		(<span id="doorid"></span>)
		                    	</td>    
		                    </tr>
		                  <tr align="center">
		                    	<td style="padding-left: 30px;">出租方式：</td>
		                    	<td>
		                    		<span id="renttype"></span>
		                    	</td>    
		                    </tr>
		                  <tr align="center">
		                    	<td style="padding-left: 30px;">房屋类型(面积)(特色风景)：</td>
		                    	<td>
		                    		<span id="housetype"></span>
		                    		(<span id="housearea"></span>)
		                    		(<span id="housesight"></span>)
		                    	</td>    
		                    </tr>
		                  <tr align="center">
		                    	<td style="padding-left: 30px;">房屋配置：</td>
		                    	<td>
		                    		卧室：<span id="bedr_num"></span>
		                    		卫生间：<span id="wcr_num"></span>
		                    		客厅：<span id="livr_num"></span>
		                    		厨房：<span id="kit_num"></span>
		                    		书房：<span id="bkr_num"></span>
		                    		阳台：<span id="bal_num"></span>
		                    		宜住人数：<span id="live_peo_num"></span>
		                    	</td>    
		                    </tr>
		                    <tr align="center">
		                    	<td style="padding-left: 30px;">房屋特色：</td>
		                    	<td>
		                    		<span id="house_feature"></span>
		                    	</td>    
		                    </tr>
		                    <tr align="center">
		                    	<td style="padding-left: 30px;">交通描述：</td>
		                    	<td>
		                    		<span id="house_traffic"></span>
		                    	</td>    
		                    </tr>
		                    <tr align="center">
		                    	<td style="padding-left: 30px;">周边描述：</td>
		                    	<td>
		                    		<span id="house_arround"></span>
		                    	</td>    
		                    </tr>
		                  <tr align="center">
		                    	<td style="padding-left: 30px;">入住规则：</td>
		                    	<td>
		                    		入住时间：<span id="enterlive_time"></span><br>
		                    		离开时间：<span id="leavelive_time"></span><br>
		                    		起住天数：<span id="least_day"></span><br>
		                    		房屋价格：<span id="house_price"></span><br>
		                    		其他描述：<span id="otherdesc"></span>
		                    	</td>    
		                    </tr>
		                  <tr align="center">
		                    	<td style="padding-left: 30px;">设施服务：</td>
		                    	<td>
		                    		<span id="service"></span>
		                    	</td>    
		                    </tr>
		                 <tr align="center">
		                    	<td style="padding-left: 30px;">状态：</td>
		                    	<td>
		                    		<span id="hstate"></span>
		                    	</td>    
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

