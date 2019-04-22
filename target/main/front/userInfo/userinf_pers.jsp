<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>常用入住人管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInf_pers_css.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInf_css.css"/> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member_common_css.css"/>
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/usualPer.js"></script>
  </head>
  
  <body>
    <jsp:include page="userinf_common.jsp">
    	<jsp:param value="常用入住人" name="type"></jsp:param>
    </jsp:include>
    <input type="hidden" id="uid" value="${sessionScope.user.uid}">
    <div class="grid_19" style="width:750px" id="order">

	    <div class="orderHead" style="border-bottom:2px solid #f60">
	        <h4>常用入住人</h4>
	    </div>
	    
	    <div class="pb-tab">
        <table>
            <thead>
                <tr> 
                    <th class="tr-td1">
                        <input id="checkAll" type="checkbox" onclick="selectA()" id="selectAll" class="ck-box">全选
                    </th>
                    <th>入住人姓名</th>
                    <th>性别</th>
                    <th>证件类型</th>
                    <th>证件号</th>
                    <th>出生日期</th>
                    <th>手机号</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${sessionScope.user.plst}" var="per">
            		<tr>
	                    <td class="tr-td1">
	                        <input type="checkbox" name="checks" value="${per.pid}" class="ck-box" >
	                    </td>
	                    <td>${per.name}</td>
	                    <td>${per.sex}</td>
	                    <td>${per.cardtype}</td>
	                    <td>${per.cardid}</td>
	                    <td><fmt:formatDate value="${per.birthday}" pattern="yyyy/MM/dd"/> </td>
	                    <td>${per.tel}</td>
	                    <td>
	                        <a href="javascript:;" onclick="editPer(${per.pid})" class="alink edit-alink">编辑</a>
	                        <a href="javascript:;" onclick="openPop(${per.pid},'${per.name}')" class="alink">删除</a>
	                    </td>
	                </tr>
            	</c:forEach>
            </tbody>
        </table>
        <div class="pb-btn">
            <a href="javascript:;" onclick="openNewPush()" class="add-btn"><i class="as">+</i>新增入住人</a>
            <a href="javascript:;" onclick="batchDel()"><i class="as">x</i>批量删除</a>
        </div>
        <!--新增弹窗  -->
        	<div id="editPop" class="pop-outer" style="display: none"></div>
        	<div id="editPopInner" class="pop-inner" style="display: none;bottom:20%;">
            <div class="w410">
                <div class="pop-tit"><span id="opTypeName">新增</span>入住人<i class="close-btn" onclick="closePush()">×</i></div>
                <div class="pop-body">
                        <div>
                        	<input type="hidden" id="pid" value="">
                            <label class="lb-box">
                            	真实姓名：</label>
                            	<input id="name" type="text" class="input-box active" value="">
                            	<span class="field-validation-error" id="name_ver" style="display:none">
								</span>
                        </div>
                        <div class="mtop">
                            <label class="lb-box">
                            	手机号：</label><input id="tel" type="text" value="" class="input-box" height="30px">
                            	<span class="field-validation-error" id="tel_ver" style="display:none">
								</span>
                        </div>
                        <div class="mtop" align="center">
                            <label class="lb-box">性别：</label>
                            <span>
                                <input type="radio" name="sex" value="男" checked="checked" id="man" style="width: 30px;">
                                <label>男</label>
                            </span>
                            <span class="rd-pos">
                                <input type="radio" name="sex" id="woman" value="女" style="width: 30px;">
                                <label>女</label>
                            </span>
                        </div>
                        <div class="mtop">
                            <label class="lb-box">证件类型：</label>
                            <select id="cardtype" style="width: 246px;height: 30px">
                            	<option>身份证</option>
                            </select>
                        </div>
                        <div class="mtop">
                            <label class="lb-box">证件号：</label>
                            <input id="cardid" type="text" class="input-box" onblur="madeBir(this.value)" value="" maxlength="18">
                            <span class="field-validation-error" id="cid_ver" style="display:none">
								</span>
                        </div>
                        <div class="mtop">
                            <label class="lb-box">出生日期：</label>
                            <input id="birth" type="text" readonly="readonly" class="input-box" value="">
                            <span class="field-validation-error" id="bir_ver" style="display:none">
								</span>
                        </div>
                        <div class="mtop">
                            <a href="javascript:;" onclick="saveCommonContact();" class="u-btn y-btn save-btn">保存</a>
                        </div>
                </div>
            </div>
        </div>
        <!--end 新增弹窗  -->
        
        <!--删除弹窗  -->
        	<div id="deletePop" class="pop-outer" style="display: none;"></div>
        	
        	<div class="pop-inner" id="deletePopInner" style="display: none;">
            <div class="w410">
                <div class="pop-tit">删除入住人<i class="close-btn" onclick="closePop();">×</i></div>
                <div class="pop-body">
                    <div class="del-wrap">
                    	<input type="hidden" id="dele_id" value="">
                        <p class="del-info">是否确定删除<strong class="del-user" id="dele_user"></strong>的入住人信息？</p>
                        <div>
                            <a href="javascript:;" onclick="deleteByPid()" class="u-btn y-btn ok-btn">确定</a>
                            <a href="javascript:;" onclick="closePop();" class="u-btn d-btn">取消</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end 删除弹窗  -->
    </div>
	</div>
  </body>
</html>
