<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>确认订单</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order_css.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index_css.css"/>
<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javaScript" src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css" />
</head>

<body class="page-fluid">
<article class="g-page">
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

	<div class="order-fill-page clear">
    	<!--右侧房屋信息-->
    	<aside class="order-aside">
            <div class="house-info-cont">
              <div class="house-img">
                <a href="javascript:;" target="_blank">
                  <img src="${pageContext.request.contextPath}/houseImg/${house.imglst[0].imgpath}">
                </a>
              </div>
              <h2 class="house-title">
                <a href="${pageContext.request.contextPath}/findHouseById?hid=${house.hid}&gopage=1" target="_blank">
                  ${house.housename}
                </a>
              </h2>
              <h4 class="house-type">
               ${house.renttype}
              </h4>
              <div class="house-info">
                <span class="label-text"> ${house.bedr_num}室${house.livr_num}厅 | 宜住${house.live_peo_num}人</span>
              </div>
            </div>
            <div class="payment-detail">
              <!-- 房费明细弹框 -->
              <div class="order-fee payment-group">
                <span class="title order-fee">线上支付</span>
                <span class="price">
                  <dfn>￥</dfn>
                 <span id="prc2">${house.house_price}</span>
                </span>
              </div>
              <div class="house-fee payment-group">
                <span class="title">
                  全部房费
                </span>
                <span class="price">
                  <dfn>¥</dfn><span id="prc">${house.house_price}</span></span>
              </div>
            </div>
            </aside>
            <!--左侧订单主体-->
            <div class="order-main">
            	<!--预订信息-->
                <div class="orderinfo-cont"><div class="col-header">
                      <span class="col-title">预订信息</span>
                      <span class="col-summary">
                      <input type="hidden" id="sellid" value="${house.user.uid}"/>
                      <input type="hidden" id="uid" value="${sessionScope.user.uid}"/>
                      <input type="hidden" id="hid" value="${house.hid}"/>
                         下单后需房东确认是否接单 
                      </span>
                    </div>
                    
                    <div class="orderinfo-main">
                      <fieldset>
                        <div class="check-date-cont clear">
                          <div class="check-date-main">
                            <label> 入住时段：
                             <input type="text" style="width:120px;height:30px" placeholder="入住日期" placeholder="今天之前的日期被禁用" id="livedate"/>
							<input type="text" style="width:120px;height:30px" placeholder="离开日期" id="leavedate" />
							<script>
							  $(function() {
							    var nowTemp = new Date();
							    var nowDay = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0).valueOf();
							    var nowMoth = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), 1, 0, 0, 0, 0).valueOf();
							    var nowYear = new Date(nowTemp.getFullYear(), 0, 1, 0, 0, 0, 0).valueOf();
							    var $myStart2 = $('#livedate');
							
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
							    	var sdate=new Date($("#livedate").val());
							    	var edate = ev.date;
							    	var temp = edate.valueOf()-sdate.getTime();
							    	var d = parseInt(temp / 1000 / 60 / 60 /24)+1;
						        	$("#days").text(d);
						        	var totalprc = parseInt(${house.house_price})*d;
						        	$("#prc").text(totalprc);
						        	$("#prc2").text(totalprc);
          							$('#leavedate').val(edate.getFullYear()+'-'+(edate.getMonth()+1)+'-'+edate.getDate());
							        if (ev.date.valueOf() > checkout.date.valueOf()) {
							          var newDate = new Date(ev.date)
							          newDate.setDate(newDate.getDate() + 1);
							          checkout.setValue(newDate);
							        }
							        checkin.close();
							        $('#leavedate')[0].focus();
							    }).data('amui.datepicker');
							
							    var checkout = $('#leavedate').datepicker({
							      onRender: function(date, viewMode) {
							        var inTime = checkin.date;
							        var inDay = inTime.valueOf();
							        var inMoth = new Date(inTime.getFullYear(), inTime.getMonth(), 1, 0, 0, 0, 0).valueOf();
							        var inYear = new Date(inTime.getFullYear(), 0, 1, 0, 0, 0, 0).valueOf();
							
							        // 默认 days 视图，与当前日期比较
							        var viewDate = inDay;
							
							        switch (viewMode) {
							          // moths 视图，与当前月份比较
							          case 1:
							            viewDate = inMoth;
							            break;
							          // years 视图，与当前年份比较
							          case 2:
							            viewDate = inYear;
							            break;
							        }
							
							        return date.valueOf() <= viewDate ? 'am-disabled' : '';
							      }
							    }).on('changeDate.datepicker.amui', function(ev) {
							    	var sdate=new Date($("#livedate").val());
							    	var edate = ev.date;
							    	var temp = edate.valueOf()-sdate.getTime();
							    	var d = parseInt(temp / 1000 / 60 / 60 /24)+1;
						        	$("#days").text(d);
						        	var totalprc = parseInt(${house.house_price})*d;
						        	$("#prc").text(totalprc);
						        	$("#prc2").text(totalprc);
          							$('#leavedate').val(edate.getFullYear()+'-'+(edate.getMonth()+1)+'-'+edate.getDate());
							      checkout.close();
							    }).data('amui.datepicker');
							  });
							</script>
                            </label>
                          </div>
                          <div class="check-date-tips">
                            <span class="night-num"> 共 <span id="days"></span> 晚</span>
                            <span class="checkin-time">
                              ${house.enterlive_time}以后办理入住 , 早到可能需要等待
                            </span>
                          </div>
                        </div>
                        <div class="room-num-cont clear">
                          <div class="room-num-main">
                            <div class="select-desc">预订数量：</div>
                            <select style="width:150px;height:30px;margin-top:8px;" id="orderhnum">
                              	<option value="1" selected="selected">1 套</option>
                            </select>
                        </div>
                        <br />
                        <div class="customer-num-cont clear">
                          <div class="customer-num-main">
                            <div class="select-desc">入住人数：</div>
                            <select name="customer-num" id="pernum" style="width:150px;height:30px;margin-top:8px;">
                              <option value="1" selected="selected">1 人</option>
                              <c:forEach begin="2" end="${house.live_peo_num+3}" var="peo">
                              	<option value="${peo}">${peo} 人</option>
                              </c:forEach>
                            </select>
                          </div>
                        </div>
                      </fieldset>
                    </div>
                    </div>
                <!--end预订信息-->
                <script type="text/javascript">
                	function livePeoCheck(pid,name,tel,cid,i){
	                	$("input:checkbox[name='passenger']").each(function(){
							$(this).prop("checked",false);
						})
						if($(i).attr("data-type")=="other"){
							$(i).prop("checked",true);
	                		$("#peo_id").val('');
	                		$("#peo_name").val('');
	                		$("#peo_tel").val('');
	                		$("#peo_cid").val('');
							return;
						}
						$(i).prop("checked",true);
                		$("#peo_id").val(pid);
                		$("#peo_name").val(name);
                		$("#peo_tel").val(tel);
                		$("#peo_cid").val(cid);
                	}
                </script>
                <!--入住人信息-->
                <div class="passenger-info"><div class="col-header">
                      <span class="col-title">入住人信息</span>
                    </div>
                    <div class="passenger-info-main">
                      <div class="passenger-check-cont">
                        <div class="legend">选择入住人</div>
                        <div class="passenger-opts">
                          <!-- 根据selectedIndex设置选中状态 -->
                            <c:forEach items="${sessionScope.user.plst}" var="peo">
                            	<label>
	                            	<input type="checkbox" name="passenger" onclick="livePeoCheck('${peo.pid}','${peo.name}','${peo.tel}','${peo.cardid}',this)"><span>${peo.name}</span>
	                            </label>
                            </c:forEach>
                            <label>
                            <input type="checkbox" name="passenger" data-type="other" checked="checked" onclick="livePeoCheck('0','0','0','0',this)"><span>其他</span>
                            </label>
                        </div>
                      </div>
                      <div class="create-passenger">
                        <div class="msg-unit-cont">
                          <label class="form-content">
                          	<input type="hidden" id="peo_id" value=""/>
                            <span class="msg-title"> 姓名：</span>
                            <input type="text" id="peo_name" class="passenger-name" value="">
                          </label>
                        </div>
                        <div class="msg-unit-cont">
                          <label class="form-content">
                            <span class="msg-title">手机：</span>
                            <input type="text" id="peo_tel" class="passenger-tel" value="">
                          </label>
                        </div>
                        <div class="msg-unit-cont paper clear">
                          <div class="msg-unit clear cert-cont form-content">
                            <span class="msg-title">证件：</span>
                            <div class="form-unit-cont">
                              <div class="nice-select" tabindex="0"><span class="current" style="margin-right: 5px;"> 身份证</span></div>
                              <input type="text" class="passenger-cert" id="peo_cid" name="cert-number" value="">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    </div>
                <!--end入住人信息-->
                <!--退订规则-->
                <div class="unsubscribe-rule-cont"><div class="unsubscribe-rule">
                  <div class="col-header">
                    <span class="col-title">退订规则</span>
                    <span class="col-summary"></span>
                  </div>
                  <div class="condition-cont  graph ">
                    <p>
                      未入住/提前离店 收取剩余房费的100%
                    </p>
                  </div>
                  <div class="text-supplement">
                    <p>全额预付：需预付全额房费</p>
                  </div>
                </div></div>
                <!--end退订规则-->
                <div class="submit-order-cont">
                <div class="submit-order-btn" onclick="submitInfo()">提交订单</div>
                <script>
                	function randomName(len) {
					    /* len = len || 23; */
					    var chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';
					    var maxPos = chars.length;
					    var str = '';
					    for (i = 0; i < len; i++) {
					        str += chars.charAt(Math.floor(Math.random() * maxPos));
					    }
					    return new Date().getTime() + str;
					}
                
                	function submitInfo(){
                		var livetime = $("#livedate").val();
                		var leavetime = $("#leavedate").val();
                		var housenum = $("#orderhnum").val();
                		var pernum = $("#pernum").val();
                		var pername = $("#peo_name").val();
                		var pertel = $("#peo_tel").val();
                		var percardid = $("#peo_cid").val();
                		var pernum = $("#pernum").val();
                		var totalprice = $("#prc").text();
                		var sellid = $("#sellid").val();
                		var uid = $("#uid").val();
                		var hid = $("#hid").val();
                		var ordernum = randomName(11);
                		
                		var localObj = window.location;
						var protocol = location.protocol;
						var host = localObj.host;
						var contextPath = localObj.pathname.split("/")[1]; 
						var basePath = protocol +"//"+host+"/"+contextPath;
                		
                		var inf = {"ordernum":ordernum,"uid":uid,"hid":hid,"livetime":livetime,"leavetime":leavetime,"housenum":housenum,
                			"pernum":pernum,"pername":pername,"pertel":pertel,"percardid":percardid,"sellid":sellid,"totalprice":totalprice};
                		
                		$.ajax({
                			type:"post",
                			url:basePath+"/saveOrder",
                			contentType:'application/json;charset=utf-8',
                			data:JSON.stringify(inf),
                			success:function(data){
                				if(data=="fail"){
                					alert("下订单失败，请稍后再试");
                					return;
                				}
                				if(data=="success"){
                					alert("下单成功，请及时入住，详情请到我的订单中查看");
                					window.close();
                				}
                			}
                		})
                	}
                </script>
               </div>
            </div>
            <!--end 主体-->
    </div>
</article>
</body>
</html>
