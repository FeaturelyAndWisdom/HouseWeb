<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>民宿详情</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index_css.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/houseList_css.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/houseShow_css.css">



<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!--百度地图  -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jrSiYaOGOCtv2DXMv5xaLYfMdxOhTCOW"></script>

<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>

<script type="text/javascript">
	var localObj = window.location;
	var protocol = location.protocol;
	var host = localObj.host;
	var contextPath = localObj.pathname.split("/")[1]; 
	var basePath = protocol +"//"+host+"/"+contextPath;
	
	function joinFavor(){
		var uid = $("#uid").val();
		var hid = $("#hid").val();
		$.ajax({
			type:'get',
			url:basePath+'/user/operfav',
			data:'uid='+uid+"&hid="+hid+"&type=0",
			success:function(data){
				if(data=="success"){
					$("#cancelfav").css("display","block");
					$("#addfav").css("display","none");				
				}
				if(data=="pleaselogin"){
					alert("请先登录");
					window.open("${pageContext.request.contextPath}/front/login.jsp");
				}
			}
		})
	}
	
	function cancelFavor(){
		var uid = $("#uid").val();
		var hid = $("#hid").val();
		$.ajax({
			type:'get',
			url:basePath+'/user/operfav',
			data:'uid='+uid+"&hid="+hid+"&type=1",
			success:function(data){
				if(data=="success"){
					$("#cancelfav").css("display","none");
					$("#addfav").css("display","block");				
				}
			}
		})
	}
</script>

<style type="text/css">
	body, html{width: 100%;height: 100%}
	#baidumap{height:500px;width:100%;}
</style>
</head>

<body class="page-fluid">
	<!--header-->
    <div id="tujia_page_navbar" class="t-navbar-container rel">
        <div class="t-navbar-bg"></div><div class="fluid-content">
        <div class="t-navbar clearfix">
        <a href="/" class="t-logo t-fl">
        <img src="${pageContext.request.contextPath}/img/tujia-logo-2.2e28f2a.png" style="padding-top:9px"></a>
        <ul class="t-fl"><li><a class="t-nav-cata" href="${pageContext.request.contextPath}/front/index.jsp">首页</a></li></ul>
        <ul class="g-login log t-fr">
	        <c:choose>
	              <c:when test="${sessionScope.user==null}">
		              <li class="m-unlogin"><a class="t-lk-log t-lk-log-reg" href="${pageContext.request.contextPath}/front/register.jsp">注册</a></li>
		              <li class="m-unlogin"><a class="t-lk-log" target="_blank" href="${pageContext.request.contextPath}/front/login.jsp">登录</a></li>
	              </c:when>
	              <c:otherwise>
	                  	<ul class="g-login log t-fr">
				        <li class="m-login m-tujing-user">
				        <a class="t-lk-log" target="_blank" href="${pageContext.request.contextPath}/userInfo/userinf_order.jsp?type=订单管理">我的途家</a></li>
				        <li class="m-login"><a class="t-lk-log" href="${pageContext.request.contextPath}/user/userlogout">[退出]</a></li>
				        <li class="m-tujing m-tujing-merchant-system">
				        <a class="t-lk-log" target="_blank" href="${pageContext.request.contextPath}/front/sellerSys/seller_index.jsp?type=">商户系统</a></li></ul>
	              </c:otherwise>
              </c:choose>
	        </ul>
        </div></div>
    </div>
	<!--end header-->
    
  
    	<!--向导-->
        <div class="breadcrumb" style="margin-left:350px;background-color: white;">     
        	<a data-ssr="true" href="https://www.tujia.com" target="_blank">途家网</a> 
        	<span class="breadcrumb-item-separator">&gt;</span>  
        	<a data-ssr="true" href="${pageContext.request.contextPath}/gethousebycity?cityid=${house.city.cid}&nowpage=1" target="_blank">${house.city.cname}公寓住宿</a>  
        	<span class="breadcrumb-item-separator">&gt;</span>${hosue.housename}
        </div>
        <!--end 向导-->
    <!--图片列表-->
    <c:if test="${fn:length(house.imglst)%3==0}">
    	<c:set var="imgdiv_index" value="${fn:length(house.imglst)/3}"></c:set>
    </c:if>
    <c:if test="${fn:length(house.imglst)%3!=0}">
    	<c:set var="imgdiv_index" value="${fn:length(house.imglst)/3+1}"></c:set>
    	<fmt:parseNumber var="imgdiv_index" integerOnly="true" value="${imgdiv_index}" />
    </c:if>
    
 	<div id="carouselExampleControls" class="carousel slide" style="background-color: #666;" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <table style="border-collapse:separate; border-spacing:10px;">
    	<tr>
    	<c:forEach items="${house.imglst}" var="img">
    	<td><img src="${pageContext.request.contextPath}/houseImg/${img.imgpath}" width="550" height="430" class="d-block w-200" alt="..."></td>
    	</c:forEach>
         </tr>
    </table>
    </div>
    <c:forEach begin="1" end="${imgdiv_index-1}" var="index">
    	<div class="carousel-item">
	       <table style="border-collapse:separate; border-spacing:10px;">
	    	<tr>
	    	<c:forEach items="${house.imglst}" var="img" begin="${3*index}" end="${3*index+2}">
	    	<td><img src="${pageContext.request.contextPath}/houseImg/${img.imgpath}" width="550" height="430" class="d-block w-200" alt="..."></td>
	    	</c:forEach>
	        </tr>
	    </table>
	    </div>
    </c:forEach>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
	<!--end 图片列表-->
    
    <!--基本信息-->
    <div id="houseInfo">
    	<div class="hotel-info">
        	<div class="hotel-cont">
            	<div class="room-info">
                	<div class="house-name">
                    <span class="house-room-name">${house.housename}</span>
                    </div>
                    <div class="district-info">
                        <i class="icon-area"></i>
                        <span>${house.location}(${house.locatremark})(${house.doorid})</span>
                    </div>
                    <ul class="clearfix">
                    	<li><span id="isDecoration">${house.housetype}</span></li>
                        <li><span id="isDecoration">${house.bedr_num}卧室${house.wcr_num}卫生间${house.livr_num}客厅${house.kit_num}厨房${house.bkr_num}书房${house.bal_num}阳台</span></li>
                        <li><span id="isDecoration">宜住${house.live_peo_num}人</span></li>
                    </ul>
                </div>
                <div class="hotel-sidebar">
                	<div class="book-info ">
                    	<div class="price-info">
                        	<div class="room-price">
                            	<p class="room-price-box">
                                <span class="staring-price" id="present-price-box"><dfn>¥</dfn><a href="#date-cont-box" class="present-price" style="margin: 0px 6px;">${house.house_price}</a></span></p>
                            </div>
                        </div>
                        <div class="comment-info">
                        <a class="comments-area" href="#comment" id="comments">
                        <span class="comments-count">${fn:length(house.commlst)}</span>条点评</a>
                        </div>
                        
                       	<div class="comment-info" id="addfav" <c:if test="${flag==1}"> style="display:none" </c:if>>
                        	<a href="javascript:;" onclick="joinFavor()">☆加入收藏</a>
                        </div>
                        
                       	<div class="comment-info" id="cancelfav" <c:if test="${flag==0}"> style="display:none" </c:if>>
                        	<a href="javascript:;" onclick="cancelFavor()">★取消收藏</a>
                        </div>
                        <input type="hidden" value="${sessionScope.user.uid}" id="uid">
                        <input type="hidden" value="${house.hid}" id="hid"> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--end 基本信息-->
    
    <!--主体信息-->
    <div class="wrap-box clearfix">
    
    	<!--左侧-->
    	<div class="main-cont">
        	<!--日期选择-->
        	<div id="product-date" class="product-date">
            	<div class="date-box">
                	<div class="date-change-box"><div class="change-control-group" id="wrapper"><label for="" class="calender"><span><i class="icon-cal iconfont"></i> </span><img src="https://staticfile.tujia.com/portalsite2/images/loading.gif" alt="" class="unit-loading" style="display: none;"> <input type="text" name="startDate" id="startDate" value="2019-02-11" readonly class="calender-input">至 <input type="text" name="endDate" id="endDate" value="2019-02-13" readonly class="calender-input-end"></label></div><p class="search-btn">重新搜索</p><p class="preferential"></p></div>
                </div>
            </div>
            <!--套餐选择-->
            <div class="product-content">
                                <div class="product-con">
                                <div class="product-box">
                    <div class="date-change-box">
                      <div class="total-price">
                        <p class="product-name" title="基础价">基础价</p>
                      </div>
                      
                      <p class="sure-order" title="支付订单后，需要商户确认接单后，才能入住">订单需确认</p>
                       
                      <div class="price">
                        <span class="symbol">￥ </span> <span class="price-count">${house.house_price}</span>
                      </div>
                      <div class="price price-product">
                        <div class="price-float" style="display: none;">
                          <div class="triangle-border tb-border"></div>
                          <div class="triangle-border tb-background"></div>
                        </div>
                      </div>
                       <button class="order-btn" onclick="javascript:location='${pageContext.request.contextPath}/findHouseById?hid=${house.hid}&gopage=0'" >立即预订</button>
                    </div>
                  </div>
                </div>
            </div>
            <!--详情菜单-->
            <div class="unitDetailInfo clearfix" id="unitdetailinfo">
            	<div class="house-tab-box">
    				<div class="house-tab" id="contentTab">
        				<ul class="clearfix">
                            <li class="item-first current">
                                <a href="#unitdetailinfo">房屋详情</a>
                            </li>
                            <li class="">
                                <a href="#unitcheckinneedtoknow">预订须知</a>
                            </li>
                            <li>
                                <a href="#unitmap">位置地图</a>
                            </li>
                            <li>
                                <a href="#comment">房屋点评</a>
                            </li>
                        </ul>
                    </div>
    			</div>
                
                <!--设施服务-->
                <div class="unit-cont facility-cont">
        <div class="side-box">
            <i class="iconfont"></i>
            <h3>设施服务</h3>
        </div>
        <div class="content-box">
            <div class="facility-list" id="listWrap">
                <h5>基础设施</h5>
                <ul class="clearfix">
                	<c:if test="${house.ty1lst==null || fn:length(house.ty1lst)==0}">无</c:if>
                     <c:forEach items="${house.ty1lst}" var="item">
                     	<li style="font-size: 12px">${item.itemname}</li>
                     </c:forEach>
                </ul>
                <h5>卫浴设施</h5>
                <ul class="clearfix">
                	<c:if test="${house.ty2lst==null || fn:length(house.ty2lst)==0}">无</c:if>
                     <c:forEach items="${house.ty2lst}" var="item">
                     	<li style="font-size: 12px">${item.itemname}</li>
                     </c:forEach>
                </ul>
                <h5>厨房设施</h5>
                <ul class="clearfix">
                	<c:if test="${house.ty3lst==null || fn:length(house.ty3lst)==0}">无</c:if>
                     <c:forEach items="${house.ty3lst}" var="item">
                     	<li style="font-size: 12px">${item.itemname}</li>
                     </c:forEach>
                </ul>
                <h5>娱乐</h5>
                <ul class="clearfix">
                	<c:if test="${house.ty4lst==null || fn:length(house.ty4lst)==0}">无</c:if>
                	<c:forEach items="${house.ty4lst}" var="item">
                     	<li style="font-size: 12px">${item.itemname}</li>
                     </c:forEach>
                </ul>
                
                <h5>周边500米</h5>
                <ul class="clearfix">
                	<c:if test="${house.ty7lst==null || fn:length(house.ty7lst)==0}">无</c:if>
                    <c:forEach items="${house.ty7lst}" var="item">
                     	<li style="font-size: 12px">${item.itemname}</li>
                     </c:forEach>
                </ul>
                <h5>特色及其他</h5>
                <ul class="clearfix">
                	<c:if test="${(house.ty5lst==null || fn:length(house.ty5lst)==0) || (house.ty6lst==null || fn:length(house.ty6lst)==0) || (house.ty8lst==null || fn:length(house.ty8lst)==0)}">无</c:if>
                	<c:forEach items="${house.ty5lst}" var="item">
                     	<li style="font-size: 12px">${item.itemname}</li>
                     </c:forEach>
                     <c:forEach items="${house.ty6lst}" var="item">
                     	<li style="font-size: 12px">${item.itemname}</li>
                     </c:forEach>
                	<c:forEach items="${house.ty8lst}" var="item">
                     	<li style="font-size: 12px">${item.itemname}</li>
                     </c:forEach>
                </ul>
            </div>
        </div>
    </div>
                <!--end 设施服务-->
                
                <!--房屋描述-->
                <div class="unit-cont intro-cont line-dashed">
                    <div class="side-box">
                        <i class="iconfont"></i>
                        <h3>房屋描述</h3>
                    </div>
                    <div class="content-box">
                        <div class="desc-info">${house.house_feature}</div>
                        <div class="desc-info">
                            <p>周边描述</p>
                            ${house.house_arround}
                        </div>
                        <div class="desc-info"> 
                            <p>交通描述</p>
                            ${house.house_traffic}
                        </div>
                    </div>
                </div>
                <!--end房屋描述-->
            </div>
            <!--end 详情菜单-->
            
            <!--预定须知-->
            <div class="unitCheckinTips" id="unitcheckinneedtoknow">
            	<div class="unitIntro clearfix">
                  <h2>预订须知</h2>
                  <span>（房屋编号：6850125)</span>
                </div>
            	<!-- 入住须知-->
                <div class="resident-cont clearfix">
                  <div class="side-box">
                    <i class="iconfont icon-resident"></i>
                    <h3>入住须知</h3>
                  </div>
                  <div class="content-box">
                    <div class="pre-mod fold">
                      <p>入住时间：</p>
                        <span>${house.enterlive_time}</span>    
                    </div>
                    <div class="pre-mod fold">
                      <p>退房时间：</p>
                        <span>${house.leavelive_time}</span>    
                    </div>
                    <div class="pre-mod">
                      <p>房屋守则：</p>
                      <ol class="rules-list clearfix">
                        <li>途家开票</li>
                        <c:forEach items="${house.noticelst}" var="notice">
                        	<li>${notice.itemname}</li>
                        </c:forEach>
                      </ol>
                    </div>
                  </div>
                </div>
                <!--额外费用-->
                <div class="extracost-cont clearfix line-dashed">
                  <div class="side-box">
                    <i class="iconfont icon-service"></i>
                    <h3>额外费用</h3>
                  </div>
                  <div class="content-box">
                    <div class="pre-mod fold">
                      <ol class="alowed">
                      	<c:forEach items="${house.costlst}" var="cost">
                        	<li><em>${cost.itemname}</em></li>
                        </c:forEach>
                      </ol>
                    </div>
                    <div class="pre-mod">
                      <p>其他：</p>
                      <div class="desc">${house.otherdesc}</div>
                    </div>
                  </div>
                </div>
            </div>
            <!--end 预定须知-->
            
            <!--位置地图-->
            <div id="unitmap">
            <div class="map-title-box">
                  <h2 class="map-title">
                      位置地图
                    </h2>
                </div>
            <div id="baidumap"></div>
            </div> 
            <!--end 位置地图-->
            
            <script type="text/javascript">
            	var point = new BMap.Point(${house.lng},${house.lat});
				var map = new BMap.Map("baidumap");
				map.centerAndZoom(point,12);                   // 初始化地图,设置城市和地图级别。
				var marker = new BMap.Marker(point);
				map.addOverlay(marker);
            </script>
            
            <!--入住点评-->
            <div id="comment" class="commentArea">
            	<div class="comment-container">
                	<div class="comment-summary" id="comment-summary">
                        <div class="comment-summary-header">
                          <span class="comment-summary-title">入住点评</span><span class="gray-text">(${fn:length(house.commlst)})</span>
                        </div>
                    </div>
                    <br>
                	<div class="cont-info">
                    
                    	<ul class="comment-filter" id="comment_filter">
                            <li class="current" _twi="0">全部<span>(${fn:length(house.commlst)})</span></li>
                        </ul>
                        
                        <ul class="comment-list" id="comment_list">
                        	<li>
                        	
                            	<div class="comment-group">
                                	<ul>
                                	<c:forEach items="${house.commlst}" var="comm">
                                		<li class="list-group clearfix" style="display:block;">
	                                      <div class="user-avatar">
	                                          <img class="CommentAvatarUrl" alt="" width="40" height="40" src="${pageContext.request.contextPath}/userIcon/${comm.cust.uimg}" style="display: block;">
	                                      </div>
	                                      <div class="comment-main">
	                                          <div class="comment-tit">
	                                              <div class="comment-info">
	                                                  <span class="name-box">${comm.cust.uname}</span>
	                                                  <span class="booking-info">
	                                                      <b><fmt:formatDate value="${comm.commdate}" pattern="yyyy-MM-dd"/>点评</b>
	                                                  </span>
	                                              </div>
	                                          </div>
	                        <div class="comment-detail"><span>${comm.content}</span></div>
	                                      </div>
	                                    </li>
                                	</c:forEach>
                                    </ul>
                                </div>
                                
                                <!--页码-->
                                <!-- <div class="pagination"><ul><li class="pageItemActive" page-data="1" page-rel="itempage">1</li><li class="pageItem" page-data="2" page-rel="itempage">2</li><li class="pageItem" page-data="2" page-rel="nextpage">下一页</li><li class="pageItem" page-data="2" page-rel="prepage">尾页</li></ul>
                                </div> --> 
                                
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--end 入住点评-->
        </div>
        <!--end 左侧-->
        
        <!--右侧-->
        <div class="sidebar-cont">
        	<!--店家信息-->
        	<div id="landlordInfo">
            	<div class="m-column-box">
                	<div class="sidebar-hd-new"><h2>房东信息</h2></div>
                    <div class="m-listing-cont">
    					<div class="hotel-info">
      						<div class="photo-cont">
        						<img src="${pageContext.request.contextPath}/userIcon/${house.user.uimg}" alt="" width="100" height="100" class="photo-img">
        					</div>
      						<h2 class="name-box">
						        <a class="listing-name" href="javascript:;">${house.user.uname}</a>
        						<span style="background: #62c4a5;font-size:15px;width: 64px;height: 19px;">商户经营</span>
        						</h2>
        						<div class="shop-tag" style="height: 10%"><p class="lab-box"><i class="icon-verified"></i>实名认证</p></div>
								<div class="shop-rate">
                                <p class="contact-info">联系电话：
                                <span class="tel-box tel-btn">${house.user.tel}</span>
                                 </p>
                           </div>
                        </div>
                    </div>
                    </div>
            </div>
        </div>
        <!--end 右侧-->
    </div>
    <!--end 主体信息-->
</body>
</html>
