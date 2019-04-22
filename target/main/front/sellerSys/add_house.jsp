<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>上房</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css2.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/houseImg.css"/>
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	
	<!-- 百度地图导入 -->
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/addHouse.js"></script>
	
	
	<style type="text/css">
		body, html{width: 100%;height: 100%}
		#baidumap{height:500px;width:100%;}
		.nowrite{
			color: rgb(221, 221, 221);
		}
		
		.field-validation-error, .error-msg {
		    display: inline-block;
		    color: #ff5756;
		    font-size: 12px;
		}
		
		.field-validation-error span {
		    line-height: 28px;
		    display: inline-block;
		    height: 28px;
		    margin: 0;
		    padding: 0 10px 0 27px;
		    color: #333;
		    background: #fff2f2 url(${pageContext.request.contextPath}/img/r-ico02.gif) no-repeat 6px center;
		    border: 1px solid #ff8080;
		    font-size: 12px !important;
		    margin-left: 0;
		}
	</style>
  </head>
  
  <body>
  <div id="app">
	<header data-v-166a34a6="" class="g-header">
        <div class="g-content">
            <span class="icon logo icon-logo"></span> 
            <span class="g-merchant">
            <span class="m-merchant-list-text m-merchant-list-sigo" style="cursor: text;">
            【途家房东】No.190120129</span></span> 
            <ul class="g-right">
                <li style="float: left;"><font class="u-opertion-item">
                欢迎您！15902923280</font></li>
                <li><a class="u-opertion-item" href="javascript:;">【退出】</a></li>
                <li><a class="u-opertion-item" href="javascript:;">
                <span class="icon icon-fdzy"></span>商户系统</a></li> 
            </ul> 
        </div>
    </header>
    
    <div data-v-166a34a6 class="g-content clearfix z-hiddenMenuBar zh-CN">
    	<div data-v-166a34a6 id="blate-container" class="m-view">
	        <!--左侧菜单栏-->
        	<div data-v-166a34a6 class="step-content">
            <ul class="step-ul" id="guide">
            
            <li class="active" onclick="guideChange(1)"><div class="step-img stepList1"></div> 
            <span>房屋位置</span>
            <i class="icon-img ivu-icon ivu-icon-android-alert" style="font-size: 20px; color: rgb(255, 102, 102); display: none;"></i>
            <i class="icon-img ivu-icon ivu-icon-ios-checkmark-outline" style="font-size: 20px; color: rgb(129, 199, 132);display: none;"></i>
            </li> 
            
            <li class="" onclick="guideChange(2)"><div class="step-img stepList2"></div> 
            <span class="nowrite">房屋详情</span>
            <i class="icon-img ivu-icon ivu-icon-android-alert" style="font-size: 20px; color: rgb(255, 102, 102); display: none;"></i> 
            <i class="icon-img ivu-icon ivu-icon-ios-checkmark-outline" style="font-size: 20px; color: rgb(129, 199, 132);display: none;"></i>
            </li> 
            
            <li class="" onclick="guideChange(3)"><div class="step-img stepList3"></div> 
            <span class="nowrite">房屋描述</span>
            <i class="icon-img ivu-icon ivu-icon-android-alert" style="font-size: 20px; color: rgb(255, 102, 102); display: none;"></i> 
            <i class="icon-img ivu-icon ivu-icon-ios-checkmark-outline" style="font-size: 20px; color: rgb(129, 199, 132);display: none;"></i>
            </li> 
            
            <li class="" onclick="guideChange(4)"><div class="step-img stepList4"></div> 
            <span class="nowrite">设施服务</span>
            <i class="icon-img ivu-icon ivu-icon-android-alert" style="font-size: 20px; color: rgb(255, 102, 102); display: none;"></i> 
            <i class="icon-img ivu-icon ivu-icon-ios-checkmark-outline" style="font-size: 20px; color: rgb(129, 199, 132);display: none;"></i>
            </li> 
            
            <li class="" onclick="guideChange(5)"><div class="step-img stepList5"></div> 
            <span class="nowrite">入住规则</span>
            <i class="icon-img ivu-icon ivu-icon-android-alert" style="font-size: 20px; color: rgb(255, 102, 102); display: none;"></i> 
			<i class="icon-img ivu-icon ivu-icon-ios-checkmark-outline" style="font-size: 20px; color: rgb(129, 199, 132);display: none;"></i>
			</li> 
			
            <li class="" onclick="guideChange(6)"><div class="step-img stepList7"></div> 
            <span class="nowrite">房屋照片</span>
            <i class="icon-img ivu-icon ivu-icon-android-alert" style="font-size: 20px; color: rgb(255, 102, 102); display: none;"></i> 
            <i class="icon-img ivu-icon ivu-icon-ios-checkmark-outline" style="font-size: 20px; color: rgb(129, 199, 132);display: none;"></i>
            </li> 
            
            <li class="" onclick="guideChange(7)"><div class="step-img stepList6"></div> 
            <span class="nowrite">价格</span>
            <i class="icon-img ivu-icon ivu-icon-android-alert" style="font-size: 20px; color: rgb(255, 102, 102); display: none;"></i> 
            <i class="icon-img ivu-icon ivu-icon-ios-checkmark-outline" style="font-size: 20px; color: rgb(129, 199, 132);display: none;"></i>
            </li> 
            
            </ul> <div class="distance-step">还差<font id="step" style="color: blue;">7</font>步</div></div>
            <!--end左侧菜单栏-->
            
            <!--content-->
            <div class="operation-content">
            	
           		<!-- floor1  -->
				<jsp:include page="publish_house/publish_part1.jsp"></jsp:include>
				<!-- floor2 -->
				<jsp:include page="publish_house/publish_part2.jsp"></jsp:include>
				<!-- floor3 -->
				<jsp:include page="publish_house/publish_part3.jsp"></jsp:include>
				<!-- floor4 -->
				<jsp:include page="publish_house/publish_part4.jsp"></jsp:include>	
				<!--floor5  -->
				<jsp:include page="publish_house/publish_part5.jsp"></jsp:include>	
				<!-- floor6  -->
				<jsp:include page="publish_house/publish_part6.jsp"></jsp:include>	
				<!-- floor7  -->
				<jsp:include page="publish_house/publish_part7.jsp"></jsp:include>	
			</div>
			<!--end content-->
            </div>
         </div>
      </div>
      
  </body>
</html>
