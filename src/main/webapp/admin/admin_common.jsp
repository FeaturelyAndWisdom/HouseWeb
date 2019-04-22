<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rentHouse_css2.css"/>
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<style type="text/css">
		.container_24 {
		    margin-left: auto; 
		    margin-right: auto;
		    width: 960px;
		    margin-top:25px
		}
		.m-directory {
		    line-height: 24px;
		    margin: 10px 0 10px -10px;
		    padding: 0;
		    overflow: hidden;
		    text-align: left;
		    color: #333;
		}
	</style>
	
  </head>
  
  <body>
  	<header data-v-166a34a6="" class="g-header">
        <div class="g-content">
            <span class="icon logo icon-logo"></span> 
            <span class="g-merchant">
            <span class="m-merchant-list-text m-merchant-list-sigo" style="cursor: text;">
            【管理员】${sessionScope.admin.account}</span></span> 
            <ul class="g-right">
                <li><a class="u-opertion-item" href="${pageContext.request.contextPath}/">【退出】</a></li>
            </ul> 
        </div>
    </header>
    
   <div data-v-166a34a6 class="g-content clearfix zh-CN">
        <!--left style="float:left;margin-left:240px;margin-top:30px;margin-right:25px;"-->
        <nav data-v-306fd360 data-v-166a34a6 class="g-nav m-menu zh-CN">
            <ul data-v-306fd360>
                <li data-v-306fd360 class="m-menu">
                    <h5 data-v-306fd360>
                    <span data-v-306fd360 class="m-img">
                    <i data-v-306fd360 class="u-img icon-1000"></i></span>
                    <span data-v-306fd360>交易管理</span></h5> 
                    <div data-v-306fd360 class="g-menu-layout">
                    <a data-v-306fd360 href="${pageContext.request.contextPath}/admin/findAllOrder" class="m-menu-item">订单管理</a>
                    <a data-v-306fd360 href="${pageContext.request.contextPath}/admin/findsayOrders" class="m-menu-item">点评管理</a>
                    </div>
                </li>
                <li data-v-306fd360 class="m-menu">
                    <h5 data-v-306fd360>
                    <span data-v-306fd360 class="m-img">
                    <i data-v-306fd360 class="u-img icon-2000"></i></span>
                    <span data-v-306fd360>房源管理</span></h5> 													
                    <div data-v-306fd360 class="g-menu-layout">
                        <a data-v-306fd360 href="${pageContext.request.contextPath}/admin/findAllHouse" class="m-menu-item">房屋管理</a>
                        <%-- <a data-v-306fd360 href="${pageContext.request.contextPath}/front/sellerSys/seller_homeStat.jsp" class="m-menu-item">房屋审批</a> --%>
                    </div>
                </li>
                <li data-v-306fd360 class="m-menu">
                    <h5 data-v-306fd360><span data-v-306fd360 class="m-img">
                    <i data-v-306fd360 class="u-img icon-4000"></i></span>
                    <span data-v-306fd360>账户管理</span></h5> 
                    <div data-v-306fd360 class="g-menu-layout">
                    <a data-v-306fd360 href="${pageContext.request.contextPath}/user/admin/findAllUsers" class="m-menu-item">用户账号管理</a>
                    <a data-v-306fd360 href="${pageContext.request.contextPath}/admin/admin_add.jsp" class="m-menu-item">添加管理员账号</a>
                    <a data-v-306fd360 href="${pageContext.request.contextPath}/admin/admin_changepwd.jsp" class="m-menu-item">修改密码</a>
                    </div>
                </li>
                <li data-v-306fd360 class="m-menu">
                    <h5 data-v-306fd360><span data-v-306fd360 class="m-img">
                    <i data-v-306fd360 class="u-img icon-9000"></i></span>
                    <span data-v-306fd360>消息通知</span></h5> 
                    <div data-v-306fd360 class="g-menu-layout">
                    	<a data-v-306fd360 href="${pageContext.request.contextPath}/admin/admin_sendmes.jsp" class="m-menu-item">发送通知</a>	
                    </div>
                </li>
            </ul>
        </nav>
        <!--end left-->
  </body>
</html>
