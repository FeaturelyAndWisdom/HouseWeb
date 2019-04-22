<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>民宿列表</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index_css.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/houseList_css.css"/>

<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javaScript" src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>

<script type="text/javaScript" src="${pageContext.request.contextPath}/js/searchMenu.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css" /> 


<style type="text/css">
	ul{
		padding-left:0px;
		margin-top:0px;
		margin:0;
	}
	
	.unrestricted-content a{
		margin-left: 30px;
	}
	
	.unrestricted-content{
		width: 90px;
	}
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
	                  	<li class="m-login">欢迎您！${sessionScope.user.uname}</li>
						<li class="m-login m-tujing-user">
						<a class="t-lk-log" target="_blank" href="${pageContext.request.contextPath}/front/userInfo/userinf_order.jsp?type=订单管理">我的途家</a></li>
						<li class="m-login"><a class="t-lk-log" href="${pageContext.request.contextPath}/user/userlogout">[退出]</a></li>
						<li class="m-tujing m-tujing-merchant-system">
						<a class="t-lk-log" target="_blank" href="${pageContext.request.contextPath}/front/sellerSys/seller_index.jsp?type=">商户系统</a></li>
	              </c:otherwise>
              </c:choose>
              </ul>
        </div></div>
    </div>
	<!--end header-->
    <div id="app">
    	<!--向导-->
        <div class="breadcrumb">     
        	<a data-ssr="true" href="https://www.tujia.com" target="_blank">途家网</a> 
        	<span class="breadcrumb-item-separator">&gt;</span>  
        	<a data-ssr="true" href="javascript:;" target="_blank">${requestScope.city.cname}公寓住宿</a>  
        </div>
        <!--end 向导-->
        
        <!--搜索-->
        <div class="t-search" style="display: block;">
        	<form class="booking-search" name="bookingSearch" method="get" style="width: 100%">
            	<ul class="clearfix">
                	<li class="lst-item clearfix">
	                    <label for="cityBooking" class="icon icon-loc"></label>
                    	<input type="hidden" value="" id="cityBookingId"/>
		       			<input autocomplete="off" type="text" name="city" id="cityBooking" onclick="openCityList()" readonly="readonly" placeholder="目的地/景点/关键词" value="">
                    </li>
                    <li class="lst-item lst-item-sep clearfix">
                    	<label for="checkInOutBooking" class="icon icon-date"></label>
                        <input readonly="readonly" style="background-color: white;" type="text" class="check-io" placeholder="入住日期" name="checkInOut" id="checkInOutBooking" value="">
                        <script>
				$(function() {
				    var nowTemp = new Date();
				    var nowDay = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0).valueOf();
				    var nowMoth = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), 1, 0, 0, 0, 0).valueOf();
				    var nowYear = new Date(nowTemp.getFullYear(), 0, 1, 0, 0, 0, 0).valueOf();
				    var $myStart2 = $('#checkInOutBooking');
				
				    var checkin = $myStart2.datepicker({
				      onRender: function(date, viewMode) {
				        // 默认 days 视图，与当前日期比较
				        var viewDate = nowDay;
				
				        switch (viewMode) {
				          // moths 视图，与当前月份比较
				          case 1:
				            viewDate = nowMoth;
				            break;
				          // years 视图，与当前年份比较
				          case 2:
				            viewDate = nowYear;
				            break;
				        }
				        return date.valueOf() < viewDate ? 'am-disabled' : '';
				      }
				    }).on('changeDate.datepicker.amui', function(ev) {
				        checkin.close();
				    }).data('amui.datepicker');
				  });
							</script>
                    </li>
                    <li class="lst-item lst-item-sep clearfix">
                    <label for="count" class="icon icon-hc"></label>
                    <input type="hidden" id="peonum" value=""/>
                    <input readonly="readonly" type="text" class="count" name="count" onclick="openPerslst()" id="count" value="不限">
                    <label for="count" class="icon icon-dd"></label>
                    </li>
                    <li class="lst-item btn-lst-item clearfix">
                    <a href="javascript:;" class="btn-med" onclick="searchIndex()" id="performSearch">搜索</a>
                    </li>
                </ul>
                <div class="t-layer t-layer-city clearfix hide" id="citylst" style="display: none;width: 600px;height: 215px">
		       		<ul class="t-tab-ver-con" id="outerTabContent" style="width:600px">
		       			<li class="t-tab-ver-con-item" id="intBox" style="display: list-item;">
		       				<ul class="t-tab-hor clearfix" id="intCityTab">
								<li class="t-tab-hor-item" style="float: left;"><a href="javascript:;" onclick="cityPageUp()">上一页</a></li>
								<li class="t-tab-hor-item" style="float: right;"><a href="javascript:;" onclick="cityPageDown()">下一页</a></li>
						    </ul>
						    <ul class="t-tab-hor-con" id="intCityContent">
						    	<c:set var="pagesize" value="3"></c:set>
						    	<c:forEach begin="1" end="11" var="index">
						    		<c:if test="${index==1}">
						    			<li class="t-tab-hor-con-item" id="citypage1" style="display:list-item;width:600px">
						    		</c:if>
						    		<c:if test="${index!=1}">
						    			<li class="t-tab-hor-con-item" id="citypage${index}" style="display: none;">
						    		</c:if>
						    		<c:forEach items="${requestScope.provlst}" begin="${(index-1)*4}" end="${index*4-1}" var="prov">
						    			<dl class="t-layer-city-group-sec clearfix">
							    			<dt>${prov.pname}</dt>
							    			<dd class="clearfix" style="margin-left: 34px;">
							    				<c:forEach items="${prov.citylst}" var="city">
							    				<a class="t-city-item" href="javascript:;" onclick="cityClick('${city.cid}','${city.cname}')">${city.cname}</a>
							    				</c:forEach>
							    			</dd>
							    		</dl>
						    		</c:forEach>
						    	</li>
						    	</c:forEach>
						    </ul>
		       			</li>
		       		</ul>
		       </div>
		       
		       <!-- 人数选择 -->
		       <div class="t-layer t-layer-pc clearfix hide" id="perslst" style="left: 635px; display: none;">
		       	<ul class="t-pc-opt" id="peo_nums">
		       		<li><a class="t-sel-row" href="javascript:;">不限</a></li>
		       		<li><a class="t-sel-row" href="javascript:;" data-num="1">1人</a></li>
		       		<li><a class="t-sel-row" href="javascript:;" data-num="2">2人</a></li>
		       		<li><a class="t-sel-row" href="javascript:;" data-num="3">3人</a></li>
		       		<li><a class="t-sel-row" href="javascript:;" data-num="4">4人</a></li>
		       		<li><a class="t-sel-row" href="javascript:;" data-num="5">5-10人</a></li>
		       		<li><a class="t-sel-row" href="javascript:;" data-num="10">10人以上</a></li>
		       		</ul>
		       	</div>
		       <!--end 人数选择 -->
		       
            </form>
        </div>
        <!--end 搜索-->
        
        <!--筛选条件-->
        <div id="g-filters-layout">
        	<div id="screen-container">
            	<div class="screen-content">
            	<script type="text/javascript">
            		function checkselection(){
            			var num = $("#selectitem").children("a").length;
            			/*.childElementCount;  */
            			if(num==0){
            				$("#have-chosen").css("display","none");
            			}else{
            				$("#have-chosen").css("display","block");
            			}
            		}
            		
            		function nolimit(type){
            			if(type==1){
            				$("a[name='hlevel_item']").each(function(){
            					$(this).removeClass("selected");
	            			});
	            			$("a[data-flag='nolimit_hlevel']").attr("class","selected-limit");
	            			$("#selectitem a[title='hlevel_filter']").remove();
            			}else if(type==2){
            				$("a[name='price_item']").each(function(){
            					$(this).removeClass("selected");
	            			});
	            			$("a[data-flag='nolimit_price']").attr("class","selected-limit");
	            			$("#selectitem a[title='price_filter']").remove();
            			}else if(type==3){
            				$("a[name='bednum_item']").each(function(){
            					$(this).removeClass("selected");
	            			});
	            			$("a[data-flag='nolimit_bednum']").attr("class","selected-limit");
	            			$("#selectitem a[title='bednum_filter']").remove();
            			}else if(type==4){
            				$("a[name='htype_item']").each(function(){
            					$(this).removeClass("selected");
	            			});
	            			$("a[data-flag='nolimit_htype']").attr("class","selected-limit");
	            			$("#selectitem a[title='htype_filter']").remove();
            			}else if(type==5){
            				$("a[name='sitem_item']").each(function(){
            					$(this).removeClass("selected");
	            			});
	            			$("a[data-flag='nolimit_sitem']").attr("class","selected-limit");
	            			$("#selectitem a[title='sitem_filter']").remove();
            			}else if(type==6){
            				$("a[name='feature_item']").each(function(){
            					$(this).removeClass("selected");
	            			});
	            			$("a[data-flag='nolimit_feature']").attr("class","selected-limit");
	            			$("#selectitem a[title='feature_filter']").remove();
            			}else if(type==7){
            				$("a[name='peonum_item']").each(function(){
            					$(this).removeClass("selected");
	            			});
	            			$("a[data-flag='nolimit_peonum']").attr("class","selected-limit");
	            			$("#selectitem a[title='peonum_filter']").remove();
            			}
            			checkselection();
            		}
            		
            		//房屋级别
            		function onchangeHlevel(min,max,x){
            			if(x.classList.contains("selected")){ 
            				x.classList.remove("selected");
            				$("#selectitem a[title='hlevel_filter']").remove();
            				$("a[data-flag='nolimit_hlevel']").attr("class","selected-limit");
            			}else{
            				$("a[data-flag='nolimit_hlevel']").attr("class","");
            				$("a[name='hlevel_item']").each(function(){
            					$(this).removeClass("selected");
            				});
							x.classList.add("selected");    
							$("#selectitem a[title='hlevel_filter']").remove();
							$("#selectitem").append("<a onclick='cancel(this)' title='hlevel_filter'>"+x.childNodes[0].data+"</a>");
            			} 
            			checkselection();
            		}
            		//房屋价格
            		function onchangePrice(min,max,x){
            			if(x.classList.contains("selected")){ 
            				x.classList.remove("selected");
            				$("#selectitem a[title='price_filter']").remove();
            				$("a[data-flag='nolimit_price']").attr("class","selected-limit");
            			}else{
            				$("a[data-flag='nolimit_price']").attr("class","");
            				$("a[name='price_item']").each(function(){
            					$(this).removeClass("selected");
            				});
							x.classList.add("selected");    
							$("#selectitem a[title='price_filter']").remove();
							$("#selectitem").append("<a onclick='cancel(this)' title='price_filter'>"+x.childNodes[0].data+"</a>");
            			} 
            			checkselection();
            		}
            		//房屋户型
            		function onchangeBednum(num,x){
            			if(x.classList.contains("selected")){ 
            				x.classList.remove("selected");
            				$("#selectitem a[title='bednum_filter']").remove();
            				$("a[data-flag='nolimit_bednum']").attr("class","selected-limit");
            			}else{
            				$("a[data-flag='nolimit_bednum']").attr("class","");
            				$("a[name='bednum_item']").each(function(){
            					$(this).removeClass("selected");
            				});
							x.classList.add("selected");    
							$("#selectitem a[title='bednum_filter']").remove();
							$("#selectitem").append("<a onclick='cancel(this)' title='bednum_filter'>"+x.childNodes[0].data+"</a>");
            			} 
            			checkselection();
            		}
            		//房屋类型
            		function onchangeHtype(type,x){
            			if(x.classList.contains("selected")){ 
            				x.classList.remove("selected");
            				$("#selectitem a[title='htype_filter']").remove();
            				$("a[data-flag='nolimit_htype']").attr("class","selected-limit");
            			}else{
            				$("a[data-flag='nolimit_htype']").attr("class","");
            				$("a[name='htype_item']").each(function(){
            					$(this).removeClass("selected");
            				});
							x.classList.add("selected");    
							$("#selectitem a[title='htype_filter']").remove();
							$("#selectitem").append("<a onclick='cancel(this)' title='htype_filter'>"+x.childNodes[0].data+"</a>");
            			} 
            			checkselection();
            		}
            		//服务设施
            		function onchangeSitem(type,x){
            			if(x.classList.contains("selected")){ 
            				x.classList.remove("selected");
            				$("#selectitem a[data-stype='"+type+"']").remove();
            				if($("a[title='sitem_filter']").length==0){
            					$("a[data-flag='nolimit_sitem']").attr("class","selected-limit");
            				}
            			}else{
            				$("a[data-flag='nolimit_sitem']").attr("class","");
							x.classList.add("selected");    
							$("#selectitem").append("<a onclick='cancel(this)' title='sitem_filter' data-stype='"+type+"'>"+x.childNodes[0].data+"</a>");
            			} 
            			checkselection();
            		}
            		//房屋特色
            		function onchangeFeature(type,x){
            			if(x.classList.contains("selected")){ 
            				x.classList.remove("selected");
            				$("#selectitem a[data-ftype='"+type+"']").remove();
            				if($("a[title='feature_filter']").length==0){
            					$("a[data-flag='nolimit_feature']").attr("class","selected-limit");
            				}
            			}else{
            				$("a[data-flag='nolimit_feature']").attr("class","");
							x.classList.add("selected");    
							$("#selectitem").append("<a onclick='cancel(this)' title='feature_filter' data-ftype='"+type+"'>"+x.childNodes[0].data+"</a>");
            			} 
            			checkselection();
            		}
            		//宜住人数
            		function onchangePeonum(type,x){
            			if(x.classList.contains("selected")){ 
            				x.classList.remove("selected");
            				$("#selectitem a[title='peonum_filter']").remove();
            				$("a[data-flag='nolimit_peonum']").attr("class","selected-limit");
            			}else{
            				$("a[data-flag='nolimit_peonum']").attr("class","");
            				$("a[name='peonum_item']").each(function(){
            					$(this).removeClass("selected");
            				});
							x.classList.add("selected");    
							var temp = $("#selectitem");
							$("#selectitem a[title='peonum_filter']").remove();
							$("#selectitem").append("<a onclick='cancel(this)' title='peonum_filter'>"+x.childNodes[0].data+"</a>");
            			} 
            			checkselection();
            		}
            		
            		
            	</script>
            	
                <!--房屋级别-->
                <div class="filter-type-HX"><div class="header-item">房屋级别</div>
                <div class="filter-item-container">
                <div class="unrestricted-content">
                <a class="selected-limit" onclick="nolimit(1)" data-flag="nolimit_hlevel">不限</a></div>
                <ul class="clearfix"> 
                <li><a class="checkbox-flag " name="hlevel_item" onclick="onchangeHlevel(1000,0,this)" href="javascript:;" >豪华</a></li>  
                <li><a class="checkbox-flag " name="hlevel_item" onclick="onchangeHlevel(200,500,this)" href="javascript:;" >精品</a></li>  
                <li><a class="checkbox-flag " name="hlevel_item" onclick="onchangeHlevel(0,200,this)" href="javascript:;" >舒适</a></li>  
                </ul></div>
                </div>
                <!--end 房屋级别-->
                
                <!--房价-->
                <div class="filter-type-HX">
                <div class="header-item">房价</div>
                <div class="filter-item-container">
                <div class="unrestricted-content"><a class="selected-limit" data-flag="nolimit_price" onclick="nolimit(2)">不限</a></div>
                <ul class="clearfix"> 
                <li><a class="checkbox-flag" name="price_item" onclick="onchangePrice(0,200,this)" href="javascript:;">￥0-200</a></li>  
                <li><a class="checkbox-flag" name="price_item" onclick="onchangePrice(200,400,this)" href="javascript:;">￥200-400</a></li>  
                <li><a class="checkbox-flag" name="price_item" onclick="onchangePrice(400,600,this)" href="javascript:;">￥400-600</a></li>  
                <li><a class="checkbox-flag" name="price_item" onclick="onchangePrice(600,800,this)" href="javascript:;">￥600-800</a></li>  
                <li><a class="checkbox-flag" name="price_item" onclick="onchangePrice(800,1000,this)" href="javascript:;">￥800-1000</a></li>  
                <li><a class="checkbox-flag" name="price_item" onclick="onchangePrice(1000,-1,this)" href="javascript:;">￥1000以上</a></li>  
                </ul></div></div>
                <!--end 房价-->
                
                <!--户型-->
                <div class="filter-type-HX">
                <div class="header-item">户型</div>
                <div class="filter-item-container">
                <div class="unrestricted-content">
                <a class="selected-limit" onclick="nolimit(3)" data-flag="nolimit_bednum">不限</a></div>
                <ul class="clearfix"> 
                <li><a class="checkbox-flag " onclick="onchangeBednum(1,this)" name="bednum_item" href="javascript:;">一居</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeBednum(2,this)" name="bednum_item" href="javascript:;">二居</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeBednum(3,this)" name="bednum_item" href="javascript:;">三居</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeBednum(4,this)" name="bednum_item" href="javascript:;">四居及以上</a></li>  
                </ul></div></div>
                <!--end 户型-->
                
                <!--房型-->
                <div class="filter-type-HX unfold">
                <div class="header-item">房型</div>
                <div class="filter-item-container">
                <div class="unrestricted-content">
                <a class="selected-limit" onclick="nolimit(4)" data-flag="nolimit_htype">不限</a></div>
                <ul class="clearfix"> 
                <li><a class="checkbox-flag " onclick="onchangeHtype(1,this)" name="htype_item" href="javascript:;">公寓</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeHtype(2,this)" name="htype_item" href="javascript:;">别墅</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeHtype(3,this)" name="htype_item" href="javascript:;">复式</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeHtype(4,this)" name="htype_item" href="javascript:;">渔家乐</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeHtype(5,this)" name="htype_item" href="javascript:;">农家乐</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeHtype(6,this)" name="htype_item" href="javascript:;">木屋</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeHtype(7,this)" name="htype_item" href="javascript:;">四合院</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeHtype(8,this)" name="htype_item" href="javascript:;">老洋房</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeHtype(9,this)" name="htype_item" href="javascript:;">客栈</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeHtype(10,this)" name="htype_item" href="javascript:;">房车营地</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeHtype(11,this)" name="htype_item" href="javascript:;">游艇</a></li>  
                </ul>
                </div></div>
                <!--end 房型-->
                
                <!--配套-->
                <div class="filter-type-HX">
                <div class="header-item">配套</div>
                <div class="filter-item-container">
                <div class="unrestricted-content">
                <a class="selected-limit" onclick="nolimit(5)" data-flag="nolimit_sitem">不限</a></div>
                <ul class="clearfix"> 
                <li><a class="checkbox-flag " onclick="onchangeSitem(1,this)" name="sitem_item" href="javascript:;">无线网络</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeSitem(2,this)" name="sitem_item" href="javascript:;">全天热水</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeSitem(3,this)" name="sitem_item" href="javascript:;">电梯</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeSitem(4,this)" name="sitem_item" href="javascript:;">洗衣机</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeSitem(5,this)" name="sitem_item" href="javascript:;">电视</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeSitem(6,this)" name="sitem_item" href="javascript:;">空调</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeSitem(7,this)" name="sitem_item" href="javascript:;">冰箱</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeSitem(8,this)" name="sitem_item" href="javascript:;">微波炉</a></li>  
                </ul></div></div>
                <!--end 配套-->
                
                <!--特色-->
                <div class="filter-type-HX">
                <div class="header-item">特色</div>
                <div class="filter-item-container">
                <div class="unrestricted-content">
                <a class="selected-limit" onclick="nolimit(6)" data-flag="nolimit_feature">不限</a></div>
                <ul class="clearfix"> 
                <li><a class="checkbox-flag " onclick="onchangeFeature(1,this)" name="feature_item" href="javascript:;">做饭方便</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeFeature(2,this)" name="feature_item" href="javascript:;">长租首选</a></li> 
                <li><a class="checkbox-flag " onclick="onchangeFeature(3,this)" name="feature_item" href="javascript:;">宠物同行</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeFeature(4,this)" name="feature_item" href="javascript:;">聚会轰趴</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeFeature(5,this)" name="feature_item" href="javascript:;">海景房</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeFeature(6,this)" name="feature_item" href="javascript:;">湖景房</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeFeature(7,this)" name="feature_item" href="javascript:;">江景房</a></li>  
                <li><a class="checkbox-flag " onclick="onchangeFeature(8,this)" name="feature_item" href="javascript:;">山景房</a></li>  
                </ul></div></div>
                <!--end 特色-->
                
                <!--宜住人数-->
                <div class="filter-type-HX">
                <div class="header-item">人数</div>
                <div class="filter-item-container">
                <div class="unrestricted-content">
                <a class="selected-limit" onclick="nolimit(7)" data-flag="nolimit_peonum">不限</a></div>
                <ul class="clearfix"> 
                <li><a class="checkbox-flag " onclick="onchangePeonum(1,this)" name="peonum_item" href="javascript:;">1人</a></li>  
                <li><a class="checkbox-flag " onclick="onchangePeonum(2,this)" name="peonum_item" href="javascript:;">2人</a></li>
                <li><a class="checkbox-flag " onclick="onchangePeonum(3,this)" name="peonum_item" href="javascript:;">3人</a></li>
                <li><a class="checkbox-flag " onclick="onchangePeonum(4,this)" name="peonum_item" href="javascript:;">4人</a></li>
                <li><a class="checkbox-flag " onclick="onchangePeonum(5,this)" name="peonum_item" href="javascript:;">5-10人</a></li>
                <li><a class="checkbox-flag " onclick="onchangePeonum(6,this)" name="peonum_item" href="javascript:;">10人以上</a></li>
                </ul></div></div>
                <!--end 宜住人数-->
				<div id="have-chosen" style="display: none;"><div class="have-chosen">
				  	<div class="header-item" style="width: 100px;">您已选择：</div>
					  <div class="selected-conditions clearfix" id="selectitem">
					  </div>
					</div>
				</div>                
                
                </div>
            </div>
        </div>
        <!--end 筛选条件-->
        
        <div id="sortBar" class="sortBar" style="display: block;">
        <a class="changeFilter active" href="javascript:;">推荐排序</a> 
        </div>
        
        <!--结果-->
        <section class="main-con gaStyleBox" width="auto">
        	<div class="unitList-con unitLattice-con">
            	<div id="unitList-container">
                <div class="searchresult-cont lattice-con">
                	<ul class="nineLattice clearfix">
                	<c:if test="${fn:length(houselst.list)==0}">
                		<font style="font-size: 18px">本城市暂无房源</font>
                	</c:if>
                	<c:forEach items="${requestScope.houselst.list}" var="house">
                		<li class="listLi">
	                    	<div class="topImg">
	                        	<a class="house-detail-link" target="_blank" href="${pageContext.request.contextPath}/findHouseById?hid=${house.hid}&gopage=1">
	                            <img class="lazy" width="370px" height="232px" src="${pageContext.request.contextPath}/houseImg/${house.imglst[0].imgpath}" style="display: inline;" />
	                            </a>
	                        </div>
	                        
	                        <div class="house-title">
	                        <div class="house-name">
	                        <a class="house-detail-link" target="_blank" href="${pageContext.request.contextPath}/findHouseById?hid=${house.hid}&gopage=1">${house.housename}</a>
	                        </div>
	                        	<div class="price"><a>￥${house.house_price}</a></div>
	                        </div>
	                        
	                        <div class="house-address">
	                        <div class="region"><a>${house.province.pname}/${house.city.cname}</a></div>
	                        </div>
	                        
	                        <div class="house-detail">${house.bedr_num}居/${house.housearea}平米/宜住${house.live_peo_num}人  ${fn:length(house.commlst)}条点评</div>
	                    </li>
                	</c:forEach>
                    
                    </ul>
                </div>
                </div>
            </div>
            <!--分页-->
            <c:if test="${fn:length(houselst.list)!=0}">
            <div class="pagination clearfix">
            <c:set var="pages" value="${houselst.pages}"></c:set>
            <ul>   
	            <c:if test="${houselst.pageNum!=1}">
	            	<li class="pageItem" page-rel="prepage">
	            		<a href="${pageContext.request.contextPath}/gethousebycity?nowpage=1&cityid=${requestScope.city.cid}">首页</a>
					</li>
	            	<li class="pageItem" page-rel="prepage">
						<a href="${pageContext.request.contextPath}/gethousebycity?nowpage=${houselst.pageNum-1}&cityid=${requestScope.city.cid}">上一页</a>
					</li>
	            </c:if>
	            <c:forEach begin="1" end="${pages}" var="page">
	            	<c:if test="${houselst.pageNum==page}">
	            		<li class="pageItemActive">
	            			${page}
	            		</li>
	            	</c:if>
	            	<c:if test="${houselst.pageNum!=page}">
	            		<li class="pageItem">
	            			<a href="${pageContext.request.contextPath}/gethousebycity?nowpage=${page}&cityid=${requestScope.city.cid}">${page}</a> 
						</li>  
	            	</c:if>
	            	<c:if test="${page>9}">
	            		<li class="pageItem">...</li>
	            		<c:set var="pages" value="0"></c:set>  
	            	</c:if>
	            </c:forEach>
	            <c:if test="${houselst.pageNum!=houselst.pages}">
	            	<li class="pageItem">
	            		<a href="${pageContext.request.contextPath}/gethousebycity?nowpage=${houselst.pageNum+1}&cityid=${requestScope.city.cid}">下一页</a>
					</li>
	            	<li class="pageItem">
						<a href="${pageContext.request.contextPath}/gethousebycity?nowpage=${houselst.pages}&cityid=${requestScope.city.cid}">末页</a>
					</li>
	            </c:if>
            </ul></div>
            </c:if>
            <!--end 分页-->
        </section>
        <!--end 结果-->
    </div>
    <!--尾页-->
     <div class="t-module g-footer">
     <div class="g-user-helper"><div class="g-content"><div class="g-left"><span class="u-text">国内客服</span> <span class="u-phone">400-188-1234</span> <span class="u-text u-haiwai">海外客服</span> <span class="u-phone">400-188-1234转2</span> <span class="u-phone-desc">86-10-80697258转2（境外拨打）</span></div><div class="g-middle"><div><span class="u-text">下载APP</span>
     <div class="u-icon-app-down dynamic_QRcode" title="http://go.tujia.com/1039/?code=downapp&amp;link=sempchome" style="background: rgb(255, 255, 255); padding: 7px;"><canvas width="98" height="98" style="display: none;"></canvas>
     <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGIAAABiCAYAAACrpQYOAAAG2UlEQVR4Xu2d0XYbIQxE7f//6PQ4jWOWFaM7wNZpqzzaLAaNpBkJ7Nxvt9vHbeHv4+P8+P1+P80YjVMfq+aI3pvdgloX3ceO9TwsVkAMUHwLELMeO/vcY+/PZ58bbueKXuvt1RqqX0f0Hh0f4bK61mjOdj3fETFr0NnnCojbTQKh8h31WOXNmaeqXN97JRmbcYfLRYoTI/uQ6HqMOUVEAXFOma0xC4iAUyoiHqH0JVGpfM1SRMsZ7VhKsIpMFVFS+eqSNcksf4wjiPFp2EdAKb7JRMSsKqMK761AkCihHvgEyB2vyHEUaf0zJMoz4VJABEgQwzqR2UenipJp1UTTiev9O9oAqmhzI2g10rKIIHa8vKBzPYQsOuOIAkI0/WiBU0A0BR01hiK2PhKyKnpWEkYV9pVz0XbMrA0PlfXsJCpXFhDcqvePTHDzuQ5NLEcS0iUQgUCX6/StqCSmnx0WmAXE+RCLGJQ6D5nrMzUVED8UiB2nUoRMswKKelI/jrQuZipsJUQi6Wyvo4+IAuIFExUilwAReYubD93GmCJOWsGSyt017GxURtGerU9yhBtezwUUEOeoSoHob3Gs9mCi4mfEB64cVb2m1T7Ujkyg5shS/uk6TQGhD71ourLJvSLibNrZlLwUEU/VRA4ywopQ3OrL8iI53lQhHbVQep7KZLI7vzte2ewgHgqI8fXQrFfWy1blGBkHnVQT/fBIO6v8uSPiiMyd9VgavZQjVGSGdYcq6EhjjNYYBcQZwjA1RQgWEHGV7UQFdUB591VJMNVPoqC6qcY9/HGJ2y1IyfyquD3wxlO+RimmgHh9Y2G2+NwCBCHfHefSJAW2FTtJDZnoWC1clePS7kK7xq3X8jPlMTJgAdEcDBEjZl6gPHXWA92I2/E5lOPIfmmV/l1HFBD6u4A0akdFXibzC4gvy2XRfjkQVzT93KqbpgLHGJkHuoTv7omorEPaLSDGkGRnCK6qlHWKusVBiWa0oIx3dngt8exoTL+2SBSQ2op+ftYQvOSolDS83LqAbpiOKyAaS1VEvIwhj0qJ17QeSHpBanz03qEfExxCOXJRVds0Nak0p2qebP4CIvhSpsuNpJ+UAuFcuUwJB3hs5OGUFF1JqLiKdH4Jya+0bQ7gFBDeL+lkSnCUKiPAcB1BPpT2gqjXE8WVVcH9pp1CsFVz+FBHpDcFQNh9jSrHAmJ8UzzN+SBNFxBJsUEiaDsQpLJWfRbVBth9OOMaiJA1SYUrsppmGlRZFxAvKFx+wkCoM+tVbyEcs+JtVCioTBRFGX3NnXckIh6vo6NSatDeW+hzbsRRL0uo4PNtanSSFiOnwspLXblULYuVYkd5Rh+Fs/2orPh0+OPTY8XPIhHA2zEROPKEroB4ma+ACH5ignjgXxcRsxfMZokq09/9vMqg1NhEdLjrylKz4stQeRUQv036diDI9yOUqolIiGpt12sIkZOWdJba3M4s6Qpnn7l8naaA2PNDkwVE4KpviQjnR9ppHqX9J5LycEHU6XyXyDOd79Q+URrKugDWr+UXEC8TUx6MnC0s6NQFs9UixvXKHS0RIlUz4pw1suo2Zx0CdHkgm2S0sQKCt0YuSU2RV7pNMxrS/bhZTsmihMxLxrR9qwMvXUHWBcQZ1reQdQExAQT54SwlMykPEOJXsncU0iNZmR3T0j2NUl9G6HbnuoDw/msYbWfYQPRNv5VirH82U1v9prKIWJWm2Xoywm6jMsv5dnVeQBDzv8bQpmIBIez6oyOC3H1105VLhKo3Q6tt1VL3fD5uY7hplNYU3+m2gBjDpHprGZ9NA0FyH236KQ+kC3TXo4h8tqpv97FjDmmX/oROqYEC4vjfFGdTXvTcJb8NnhU7ow3Q51xFEm4cnF/Q6FXzR3wZtsEJR1DkabFTQJyv+1dEfN2boi0RpQhbB1PFbRgRTvdVycyo6sw2R9oA2Rwkuq7oc2V8acvdAuI3lK4cvQwIt+okfOCSrwrtLBr796lhI+Inr2X2IvY57Jd8P4KojsiIBcTxBqGqddD3IwqI8/coLo8Iqp3d0HMr053jVWQqg84KhZmK/NL/8D6zoF4euk2/jBv69PBPArHzYEgRJi0wFYG7EdfPRVMTrqzJwZCajPamCM9kqSDbfAZQNn/2fBTho2emCzriIVQ7q+qTGoOmDMdTo89WxqdpLlJDxGna+bdyBElNBcQL+gKi+4YQTS+PcTRSlyOC5km3f+OSL5HRK6mmNxSNVFrhE444pPorKmuVM6nx/lsgaCQQcqQkR4pCV5WRObO9kl4TVVDResLXdnZfVS/FrW7VBogqo30ulWpouiK8kSrOAuIMxTsi4hcZ4M8fU017aQAAAABJRU5ErkJggg==" style="display: block;"></div></div><div><span class="u-text">关注微信小程序</span><div class="u-icon-wechat-down"></div></div><div class="m-tujia-follow"><span class="u-text">关注途家</span> <a href="http://e.weibo.com/bjtujia" class="u-icon-sina" target="_blank"></a> <span href="javascript:;" class="u-icon-wechat" target="_blank"><div class="m-wechat-qc"><div class="m-qc"><p class="u-title">了解不一样的住宿</p><div class="u-icon-qc-1"></div><p class="u-desc">途家民宿官网</p></div><div class="m-qc"><p class="u-title">预订服务、优惠活动</p><div class="u-icon-qc-2"></div><p class="u-desc">途家民宿预订</p></div></div></span></div></div><div class="g-right"><div><a href="https://content.tujia.com/Help/Index.htm" target="_blank">我是房客</a> <a href="https://content.tujia.com/About/Index.htm" target="_blank">关于途家</a></div><div><a href="http://goto.tujia.com" target="_blank">加入途家</a></div></div></div></div>
     </div>
     <!--end尾页-->
</body>
</html>