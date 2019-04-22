<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${requestScope.provlst==null}">
	<c:redirect url="/pageInit"></c:redirect>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index_css.css"/>
<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javaScript" src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>

<script type="text/javaScript" src="${pageContext.request.contextPath}/js/searchMenu.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css" /> 
</head>

<body class="page-fluid" data-server-domain="tujia.com" style="background-color:#FFF">

<article class="g-page">
    	<!--网站页头-->
        <div id="tujia_page_navbar" class="t-navbar-container rel z-navbar-flow">
        <div class="t-navbar-bg"></div>
        <div class="fluid-content">
        	<div class="t-navbar clearfix">
            <a class="t-logo t-fl" href="/">
                <img src="${pageContext.request.contextPath}/img/tujia-logo-1.f9cc087.png" style="padding-top:9px" alt/>
            </a>
            <ul class="t-fl" style="margin: 0;">
                <li><a class="t-nav-cata t-nav-cata-on" href="${pageContext.request.contextPath}/front/index.jsp">首页</a></li>
            </ul>
            <ul class="g-login log t-fr" style="margin: 0;">
              <c:choose>
	              <c:when test="${sessionScope.user==null}">
		              <li class="m-unlogin"><a class="t-lk-log t-lk-log-reg" href="${pageContext.request.contextPath}/front/register.jsp">注册</a></li>
		              <li class="m-unlogin"><a class="t-lk-log" href="${pageContext.request.contextPath}/front/login.jsp">登录</a></li>
	              </c:when>
	              <c:otherwise>
	                  <li class="m-login" style="color: #fff">欢迎您！${sessionScope.user.uname}</li>
		              <li class="m-login m-tujing-user"><a class="t-lk-log" target="_blank" href="${pageContext.request.contextPath}/findOrders?uid=${sessionScope.user.uid}&type=0">我的途家</a></li>
		              <li><a class="t-lk-log" target="_blank" href="${pageContext.request.contextPath}/sellerpageInit">商户系统</a></li>
		              <li class="m-login"><a class="t-lk-log" href="${pageContext.request.contextPath}/user/userlogout">[退出]</a></li>
	              </c:otherwise>
              </c:choose>
            </ul>
            </div>
        </div>
        </div>
        <!--主体-->
   <div id="app">
        
        <!--页头图片及搜索-->
        <div class="fluid booking rel t-navbar-fixed">
           <ul class="slider clearfix" id="sliderBanner">
	        <li class="slider-item" style="display: list-item;">
	          <a target="_blank" href="#">
	          <img src="${pageContext.request.contextPath}/img/201711301813379441.jpg"></a>
	        </li>
       <div class="booking-widget">
       <div class="fluid-content tc">
       <form class="booking-search rel" action="" name="" method="get">
	       <input type="hidden" name="startDate" id="startDate" value="2019-01-19"> 
	       <input type="hidden" name="endDate" id="endDate" value="2019-01-20"> 
	       <input type="hidden" name="hc" id="hc" value="0">
       	   <ul class="clearfix" style="margin:0; padding-left:0px;">
		       <li class="lst-item clearfix">
		       <label for="cityBooking" class="icon icon-loc"></label>
		       <input type="hidden" value="" id="cityBookingId"/>
		       <input autocomplete="off" type="text" name="city" id="cityBooking" onclick="openCityList()" readonly="readonly" placeholder="目的地/景点/关键词" value="">
		       </li>
		       <li class="lst-item lst-item-sep clearfix" id="checkInOutWrapper">
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
       		   <li class="lst-item btn-lst-item clearfix"><a href="javascript:;" onclick="searchIndex()" class="btn-med" id="performSearch">搜索</a>
       		   </li>
       		   <li class="lst-item btn-lst-item clearfix" style="margin-left: 2px;"><a href="${pageContext.request.contextPath}/front/mapseek.jsp" target="_blank" class="btn-med" id="performSearch">地图搜索</a>
       		   </li>
       	   </ul>
       <!-- 城市选择  -->
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
       
       <!--日期选择  -->
       
       <!-- end日期选择 -->
       <!-- 人数选择 -->
       <div class="t-layer t-layer-pc clearfix hide" id="perslst" style="left: 613px; display: none;">
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
    </ul>
  </div>
  
  </div>
  
  <!--玩转公寓-->
  <div class="t-module">
  	<div class="fluid-content">
    	<h3 class="t-mod-tit">玩转公寓</h3>
        	<div class="user-renting-story" style="width: 1260px;">
            <ul style="margin:0;">
            <li class="item01">
            <a href="#" target="_blank">
            <img class="lazy" src="${pageContext.request.contextPath}/img/sy1.c2a67b9.jpg" style="display: inline;">				            		            <div class="info-box">
                <p class="tit-cont">轰趴聚会</p>
                <p class="txt-cont">私密空间 亲朋好友尽兴玩</p>
            </div></a>
            </li>
            <li class="item02">
            <a href="#" target="_blank">
            <img class="lazy" src="${pageContext.request.contextPath}/img/sy2.37692a8.jpg" style="display: inline;">		            
            <div class="info-box">
                <p class="tit-cont">家庭出游</p>
                <p class="txt-cont">一房多卧 家人合住好照看</p>
            </div></a></li>
            <li class="item03">
            <a href="#" target="_blank">
            <img class="lazy" src="${pageContext.request.contextPath}/img/sy3.50a66e6.jpg" style="display: inline;">            
            <div class="info-box">
                <p class="tit-cont">实惠长住</p>
                <p class="txt-cont">洗衣做饭 设施齐全又省钱</p>
            </div></a></li>
            <li class="item04">
            <a href="#" target="_blank">
            <img class="lazy" src="${pageContext.request.contextPath}/img/sy4.3bcbca2.jpg" style="display: inline;">            
            <div class="info-box">
                <p class="tit-cont">新奇体验</p>
                <p class="txt-cont">房型丰富 风格迥异更养眼</p>
            </div></a>
            </li></ul></div></div>
  	</div>
    <!--end玩转公寓-->
            <br />
     <!--热门城市-->    
     <div class="s_mn_hotcitybox">
        <div class="s_mn_center2">
            <div class="s_mn_hotcity_title">
                <h2>寻找你未曾相遇的风景</h2>
                <span>热门城市</span>
            </div>
            <div class="s_mn_hotcity_main">
                <div class="s_mn_module">
                    
                    <div class="s_mn_module1x">
                        <a href="${pageContext.request.contextPath}/gethousebycity?cityid=51&nowpage=1" class="s_mn_place1">
                            <img src="${pageContext.request.contextPath}/img/beijing_img.jpg" width="380" height="280" alt="北京">
                            <div class="s_mn_module_textbox">
                                <div class="s_mn_module_label"> <span class="s_mn_module_name">北京</span> <span class="s_mn_module_describe">京戏胡同豆汁酸</span> </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="s_mn_module1x">
                        <a href="${pageContext.request.contextPath}/gethousebycity?cityid=6&nowpage=1" target="_blank" class="s_mn_place1" data-nameen="shanghai">
                            <img src="${pageContext.request.contextPath}/img/2015110248950057.jpg" width="380" height="280" alt="上海">
                            <div class="s_mn_module_textbox">
                                <div class="s_mn_module_label"> <span class="s_mn_module_name">上海</span> <span class="s_mn_module_describe">吴语 弄堂 城隍庙</span> </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="s_mn_module1x">
                        <a href="${pageContext.request.contextPath}/gethousebycity?cityid=3&nowpage=1" target="_blank" class="s_mn_place1" data-nameen="sanya">
                            <img src="${pageContext.request.contextPath}/img/hot_sanya.png" width="380" height="280" alt="三亚">
                            <div class="s_mn_module_textbox">
                                <div class="s_mn_module_label"> <span class="s_mn_module_name">三亚</span> <span class="s_mn_module_describe">天涯海角椰风海韵</span> </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="s_mn_module1x">
                        <a href="${pageContext.request.contextPath}/gethousebycity?cityid=143&nowpage=1" target="_blank" class="s_mn_place1" data-nameen="sanya">
                            <img src="${pageContext.request.contextPath}/img/guangzhou_img.jpg" width="380" height="280" alt="广州">
                            <div class="s_mn_module_textbox">
                                <div class="s_mn_module_label"> <span class="s_mn_module_name">广州</span> <span class="s_mn_module_describe">骑楼老屋潮汕人家</span> </div>s
                            </div>
                        </a>
                    </div>
                    
                    <div class="s_mn_module1x">
                        <a href="${pageContext.request.contextPath}/gethousebycity?cityid=86&nowpage=1" target="_blank" class="s_mn_place1" data-nameen="haerbin">
                            <img src="${pageContext.request.contextPath}/img/hot_haerbin.png" width="380" height="280" alt="哈尔滨">
                            <div class="s_mn_module_textbox">
                                <div class="s_mn_module_label"> <span class="s_mn_module_name">哈尔滨</span> <span class="s_mn_module_describe">北国风光冰雪之城</span> </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="s_mn_module1x">
                        <a href="${pageContext.request.contextPath}/gethousebycity?cityid=164&nowpage=1" target="_blank" class="s_mn_place1" data-nameen="chengdu">
                            <img src="${pageContext.request.contextPath}/img/2015102234339797.jpg" width="380" height="280" alt="成都">
                            <div class="s_mn_module_textbox">
                                <div class="s_mn_module_label"> <span class="s_mn_module_name">成都</span> <span class="s_mn_module_describe">宽窄巷子慢生活</span> </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="s_mn_module1x">
                        <a href="${pageContext.request.contextPath}/gethousebycity?cityid=194&nowpage=1" target="_blank" class="s_mn_place1" data-nameen="hangzhou">
                            <img src="${pageContext.request.contextPath}/img/2015102234254437.jpg" width="380" height="280" alt="杭州">
                            <div class="s_mn_module_textbox">
                                <div class="s_mn_module_label"> <span class="s_mn_module_name">杭州</span> <span class="s_mn_module_describe">断桥边的千年之恋</span> </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="s_mn_module1x">
                        <a href="${pageContext.request.contextPath}/gethousebycity?cityid=311&nowpage=1" target="_blank" class="s_mn_place1" data-nameen="hangzhou">
                            <img src="${pageContext.request.contextPath}/img/xian_img.jpg" width="380" height="280" alt="西安">
                            <div class="s_mn_module_textbox">
                                <div class="s_mn_module_label"> <span class="s_mn_module_name">西安</span> <span class="s_mn_module_describe">凉皮 冰峰 肉夹馍</span> </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="s_mn_module1x">
                        <a href="${pageContext.request.contextPath}/gethousebycity?cityid=351&nowpage=1" target="_blank" class="s_mn_place1" data-nameen="hangzhou">
                            <img src="${pageContext.request.contextPath}/img/changsha_img.jpg" width="380" height="280" alt="长沙">
                            <div class="s_mn_module_textbox">
                                <div class="s_mn_module_label"> <span class="s_mn_module_name">长沙</span> <span class="s_mn_module_describe">断桥边的千年之恋</span> </div>
                            </div> 
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <!--热门城市end-->   
     
     <!--安全保障-->
     <div class="t-module">
     	<div class="fluid-content"><h3 class="t-mod-tit">安心住保障</h3><ul class="user-guarantee">
        <li>
     	<div class="guarantee-1"></div><p class="user-guarantee-text">先行赔付<span>1000万保障金</span></p></a>
        </li>
        <li>
        <div class="guarantee-2"></div>
        <p class="user-guarantee-text">赠送保险<span>21万人身保险</span></p>
        </li>
        <li><div class="guarantee-3"></div>
        <p class="user-guarantee-text">贴心客服<span>7*24小时在线</span></p>
        </li>
        <li>
        <div class="guarantee-4"></div>
        <p class="user-guarantee-text">房屋保真<span>4项上房审核</span></p>
        </li></ul></div>
     </div>
     <!--end安全保障-->
     
     <!--尾页-->
     <div class="t-module g-footer">
     <div class="g-user-helper"><div class="g-content"><div class="g-left"><span class="u-text">国内客服</span> <span class="u-phone">400-188-1234</span> <span class="u-text u-haiwai">海外客服</span> <span class="u-phone">400-188-1234转2</span> <span class="u-phone-desc">86-10-80697258转2（境外拨打）</span></div><div class="g-middle"><div><span class="u-text">下载APP</span>
     <div class="u-icon-app-down dynamic_QRcode" title="http://go.tujia.com/1039/?code=downapp&amp;link=sempchome" style="background: rgb(255, 255, 255); padding: 7px;"><canvas width="98" height="98" style="display: none;"></canvas>
     <img src="data:image/png;base64,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" style="display: block;"></div></div><div><span class="u-text">关注微信小程序</span><div class="u-icon-wechat-down"></div></div><div class="m-tujia-follow"><span class="u-text">关注途家</span> <a href="http://e.weibo.com/bjtujia" class="u-icon-sina" target="_blank"></a> <span href="javascript:;" class="u-icon-wechat" target="_blank"><div class="m-wechat-qc"><div class="m-qc"><p class="u-title">了解不一样的住宿</p><div class="u-icon-qc-1"></div><p class="u-desc">途家民宿官网</p></div><div class="m-qc"><p class="u-title">预订服务、优惠活动</p><div class="u-icon-qc-2"></div><p class="u-desc">途家民宿预订</p></div></div></span></div></div><div class="g-right"><div><a href="https://content.tujia.com/Help/Index.htm" target="_blank">我是房客</a> <a href="https://content.tujia.com/About/Index.htm" target="_blank">关于途家</a></div><div><a href="http://goto.tujia.com" target="_blank">加入途家</a></div></div></div></div>
     </div>
     <!--end尾页-->
</div>
</article>
</body>
</html>