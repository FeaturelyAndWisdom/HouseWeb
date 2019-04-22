<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商户系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_index_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_index_css2.css"/>
	
	
  </head>
  <body>	
  	<div data-v-166a34a6 id="app">
    	<jsp:include page="seller_common.jsp"></jsp:include>
        <!--center-->
        <article data-v-166a34a6 class="m-view">
        <section data-v-708f510d id="todo_main" class="todo_main">
        <nav data-v-708f510d>待办事项</nav> 
        <section data-v-708f510d class="todo_content">
            <ul data-v-708f510d>
            <li data-v-708f510d>
            <a data-v-708f510d href="${pageContext.request.contextPath}/findOrders?uid=${sessionScope.user.uid}&type=1"><p data-v-708f510d class="icon-1"></p> 
            <p data-v-708f510d><span data-v-708f510d>${item1_num}</span>个</p><p data-v-708f510d>待确认订单</p></a>
            <a data-v-708f510d href="${pageContext.request.contextPath}/findOrders?uid=${sessionScope.user.uid}&type=1"><p data-v-708f510d class="icon-5"></p>
            <p data-v-708f510d><span data-v-708f510d>${item2_num}</span>个</p><p data-v-708f510d>待点评订单</p></a>
            <a data-v-708f510d href="${pageContext.request.contextPath}/findOrders?uid=${sessionScope.user.uid}&type=1"><p data-v-708f510d class="icon-3"></p> 
            <p data-v-708f510d><span data-v-708f510d>${item3_num}</span>个</p><p data-v-708f510d>已点评订单</p></a> 
            <a data-v-708f510d href="${pageContext.request.contextPath}/user/readmes?uid=${sessionScope.user.uid}&type=1"><p data-v-708f510d class="icon-2"></p> 
            <p data-v-708f510d><span data-v-708f510d>${item4_num}</span>个</p><p data-v-708f510d>未读消息</p></a>
            </li> 
            <li data-v-708f510d>
            <a data-v-708f510d href="${pageContext.request.contextPath}/findHousesByuid?uid=${sessionScope.user.uid}"><p data-v-708f510d class="icon-6"></p> 
           <p data-v-708f510d><span data-v-708f510d>${item5_num}</span>套</p><p data-v-708f510d>审核失败的房屋</p></a>
            <a data-v-708f510d href="${pageContext.request.contextPath}/findHousesByuid?uid=${sessionScope.user.uid}"><p data-v-708f510d class="icon-7"></p> 
            <p data-v-708f510d><span data-v-708f510d>${item6_num}</span>套</p><pdata-v-708f510d >审核中的房屋</p></a>
            <a data-v-708f510d href="${pageContext.request.contextPath}/findHousesByuid?uid=${sessionScope.user.uid}"><p data-v-708f510d class="icon-7"></p> 
            <p data-v-708f510d><span data-v-708f510d>${item7_num}</span>套</p><pdata-v-708f510d >审核通过的房屋</p></a>  
            <a data-v-708f510d href="${pageContext.request.contextPath}/serviceInit" class="" style="padding-top: 17px;">
            <p data-v-708f510d class="index_point">
           <i data-v-708f510d class="ivu-icon ivu-icon-ios-plus-empty" style="font-size: 50px;"></i></p> 				    
           <span data-v-708f510d class="point-desc">发布房屋</span></a>
            </li>
            </ul>
        </section>
        </section>
        
        <!-- <section data-v-3d3767be id="notice_main" class="notice_main" >
        <nav data-v-3d3767be>通知
        <a data-v-3d3767be href="javascript:;" class="text-link floatR">查看更多</a></nav> 
        <section data-v-3d3767be class="notice_content">
        <ul data-v-3d3767be>
            <li data-v-3d3767be><a data-v-3d3767be href="javascript:;" target="_black">尊敬的商户您好：由于部分指标未达到超赞房东考核标准，您本次未能获得超赞房东称号，请您继续努力。您可以通过【途家app】-【途家超赞房东】了解详情。</a> 
            <span data-v-3d3767be="">2019-02-10 16:11:10</span></li>
        </ul>
        </section>
        </section> --> 
      </article>
        <!--end center-->
</div>
</div>
  </body>
</html>
