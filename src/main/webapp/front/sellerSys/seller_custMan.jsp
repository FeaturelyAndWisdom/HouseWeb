<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>宾客管理</title>
    
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seller_cust_css.css"/>
  </head>
  
  <body>
  <div id="app">
    <jsp:include page="seller_common.jsp">
    	<jsp:param value="宾客管理" name="type"/>
    </jsp:include>
    
    <!--center-->
    <div data-v-166a34a6 class="order-manager m-view">
        	<div class="main-operate">
            	<h4>宾客管理</h4>
                
                <div class="findcust">
                	姓名：<input type="text" id="rname" name="rname">
                	手机：<input type="text" id="tel" name="tel">
                	身份证：<input type="text" id="pid" name="pid">
                	<input class="btn-primary-s" id="btnSearch" value="查询" type="button">
                </div>
                <div style="font-size: 15;margin-bottom: 10px;">
                	全部宾客共<font style="color: blue;">0</font>位
                </div>
                <table class="table-style1" id="tbList" cellspacing="0">
				    <thead>
				        <tr>
				            <th>
				                <input type="checkbox" class="pageChkAll" style="margin-left: 9px;margin-right: 4px">姓名
				            </th>
				            <th>身份证号</th>
				            <th>手机号</th>
				            <th>最后入住时间</th>
				            <th class="center">操作</th>
				        </tr>
				    </thead>
				    <tbody>
				            <tr>
				                <td>
				                    <label for="" class="label-checkbox">
				                        <input type="checkbox" name="pageItemChk" style="margin-right: 3px" data-value="8328149"><span>第三位</span>
				                    </label>
				                </td>
				                <td class="nowrap">610103199702132817</td>
				                <td class="nowrap">15902923280</td>
				                <td>
				                    
				                <br>
				                
				            </td>
				            <td class="center nowrap">
				                <div class="grid-dist"><a href="/Guest/Detail/8328149" target="_blank" class="text-standOut">查看详情</a></div>
				                <div class="grid-dist"><a href="javascript:;" class="text-standOut">删除宾客</a></div>
				            </td>
				        </tr>
				    </tbody>
				</table>
				<div class="btn-barBox">
				    <a href="javascript:;" onclick="openAddCust()" style="margin-left: 20px;" class="btn-primary-m">添加新宾客</a>
				</div>
                <div class="page-box" style="overflow: hidden;"><!----></div>
            </div>
        </div>
    <!--end center-->
   </div>
  </div>
  <!--幕布  -->
  <div id="pms-dialog-overlay" style="display: none;"></div>
  <!--添加新宾客  -->
  <div id="pms-popup" class="popBox-m" style="z-index: 5000; max-width: 100%; position: absolute; display: none; top: 0px; left: 485px;">
  		<div class="pop-hd ui-draggable-handle">
            <span id="pms-popup-title">添加宾客</span>
            <span id="pms-popup-close-btn" onclick="closeAddCust()" class="closeBtn">×</span>
        </div>
        <div id="pms-popup-content" class="pop-bd">
        	<div class="form-content">
        		<div class="text-bold marginB10"><font style="font-size: 25">基本信息</font></div>
        		<div class="items">
        			<font style="font-size: 15">姓名：</font>
        			<input type="text" style="width: 120px;height: 25px"  placeholder="请输入姓名">
        		</div>
        		<br/>
        		<div class="items">
        			<font style="font-size: 15">证件类型：</font>
        			<select style="width: 120px;height: 25px"><option>身份证</option></select>
        			<input type="text" style="width: 120px;height: 25px" placeholder="请输入证件号码">
        		</div>
        		<br/>
        		<div class="items">
        			<font style="font-size: 15">性别：</font>
        			<input type="radio" name="sex" style="margin-left: 20px;" checked="checked">男
        			<input type="radio" name="sex" style="margin-left: 10px;">女
        		</div>
        		<br/>
        		<div class="items">
        			<font style="font-size: 15">出生日期：</font>
        			<select style="width: 100px;height: 25px;margin-left: 5px;margin-right: 5px">
        				<option>2019</option>
        			</select>年
        			<select style="width: 100px;height: 25px;margin-left: 5px;margin-right: 5px">
        				<option>2019</option>
        			</select>月
        			<select style="width: 100px;height: 25px;margin-left: 5px;margin-right: 5px">
        				<option>2019</option>
        			</select>日
        		</div>
        		<br/>
        		<div class="items">
        			<font style="font-size: 15">民族：</font>
        			<select style="width: 100px;height: 25px;margin-left: 5px;margin-right: 5px">
        				<option>汉族</option>
        			</select>
        		</div>
        		<br/>
        		<div class="items">
        			<font style="font-size: 15">户籍地：</font>
        			<select style="width: 100px;height: 25px;margin-left: 5px;margin-right: 10px">
        				<option>北京</option>
        			</select>
        			<select style="width: 100px;height: 25px;margin-right: 10px">
        				<option>请选择</option>
        			</select>
        			<select style="width: 100px;height: 25px;margin-right: 10px">
        				<option>请选择</option>
        			</select>
        		</div>
        		<br/>
        		<div class="items">
        			<font style="font-size: 15">家庭地址：</font>
        			<input type="text" style="width: 120px;height: 25px"  placeholder="请输入地址">
        		</div>
        		<br/>
        		<div class="items" style="margin-bottom: 20px;">
        			<font style="font-size: 15">手机号码：</font>
        			<input type="text" style="width: 120px;height: 25px"  placeholder="请输入手机">
        		</div>
        		<a href="save();" class="btn-primary-m">确定</a>
        		<a href="closeAddCust()" class="btn-default-m">取消</a>
        	</div>
        </div>
  </div>
  <script type="text/javascript">
  	function openAddCust(){
  		$("#pms-dialog-overlay").css("display","block");
  		$("#pms-popup").css("display","block");
  	}
  	function closeAddCust(){
  		$("#pms-dialog-overlay").css("display","none");
  		$("#pms-popup").css("display","none");
  	}
  </script>
  </body>
</html>

