<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人资料</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInf_perInfo.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInf_css.css"/> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member_common_css.css"/>
	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/updateInfo.js"></script>
	</head>
  
  <body>
    <jsp:include page="userinf_common.jsp">
    	<jsp:param value="个人资料" name="type"></jsp:param>
    </jsp:include>
    <div class="grid_19" style="width:750px" id="order">

	    <div class="orderHead" style="border-bottom:2px solid $f60">
	        <h4>个人资料</h4>
	    </div>
	    
	    <p class="text" id="successInf" style="display:none"><span>修改成功!</span><br>尊敬的用户 ，恭喜您个人资料修改成功 。</p>
	    
	    <div id="info_content">
	    <div class="column-cont">
        <div class="m-column-hd">
            <h2>资料</h2>
        </div>
        
        <div class="m-column-bd">
            <div class="user-cont">
            	<input type="file" id="usericon" accept="image/jpg, image/jpeg, image/png" style="display:none" onchange="chanageicon(this)" />
                <img id="usp-bg" src="${pageContext.request.contextPath}/userIcon/${sessionScope.user.uimg}" onclick="javascript:$('#usericon').click()" class="user-pic">
                <div class="info-group group-cont">
                    <div class="item-box">
                    	<input type="hidden" id="uid" value="${sessionScope.user.uid}"> 
                    	<input type="hidden" id="temp_hc_id" value="${sessionScope.user.hcity.cid}"> 
                    	<input type="hidden" id="temp_hc_name" value="${sessionScope.user.hcity.cname}"> 
                    	<input type="hidden" id="temp_lc_id" value="${sessionScope.user.lcity.cid}"> 
                    	<input type="hidden" id="temp_hp_id" value="${sessionScope.user.hprov.pid}">
                    	<input type="hidden" id="temp_lp_id" value="${sessionScope.user.lprov.pid}">
                    	<input type="hidden" id="temp_lc_name" value="${sessionScope.user.lcity.cname}">
                    	<input type="hidden" id="temp_sex" value="${sessionScope.user.sex}">
                    	<input type="hidden" id="temp_edu" value="${sessionScope.user.edu}">
                    	<input type="hidden" id="temp_job" value="${sessionScope.user.job}">
                    	<input type="hidden" id="temp_bir" value="<fmt:formatDate value='${sessionScope.user.birthday}' pattern='yyyy-MM-dd'/>"> 
                    	
                        <font style="letter-spacing:4.5px">用户名</font>：
                        <span class="emphasize-text">${sessionScope.user.uname}</span>
                		<a href="javascript:;" onclick="openChangeUname()" class="link-btn">填写</a>
                    </div>
                    <div class="item-box">
                        <font style="letter-spacing:13.7px">邮箱</font>：
                        <span class="emphasize-text">${sessionScope.user.email}</span>
                        
                        <a href="javascript:;" onclick="openChangeEmail()" class="link-btn">修改</a>
                        
                    </div>
                    <div class="item-box">
                      绑定手机：<span class="emphasize-text" style="margin-left:3px">${sessionScope.user.tel}</span>
                    </div>
                    <div class="item-box">
                    注册时间：<span class="emphasize-text" >
						<fmt:formatDate value="${sessionScope.user.regdate}" pattern="yyyy年MM月dd日"/>
					</span></div>
                </div>
            </div>
        </div>
        
        </div>
        <br/>
        <div class="m-column-bd">
        	<div class="m-form info-form">
            	<div class="control-group">
                    <label for="" class="controls-label">真实姓名：</label>
                    <div class="controls">
                        <input id="realname" maxlength="8" name="realname" style="height: 30px" type="text" value="${sessionScope.user.realname}">
                    </div>
                </div>
                
                <div class="control-group city-group">
                	<label for="" class="controls-label">家乡：</label>
                    <div class="controls">
                    	<select id="select_Province" onchange="provChange(1,this.value)" style="width:150px;height:30px"> </select>
                        &nbsp;
                        <select id="select_City1" style="width:130px;height:30px">
                        </select>
                    </div>
                </div>
                
                <div class="control-group sex-group">
                    <label for="" class="controls-label">性别：</label>
                    <div class="controls">
         		   <input type="radio" name="sex" value="男" id="SexMale" checked="checked" style="margin-left:30px">男
                   <input type="radio" name="sex" value="女" id="SexFeMale" style="margin-left:30px">女
                    </div>
                </div>
                
                <div class="control-group deta-group">
                    <label for="" class="controls-label">出生日期：</label>
                    <div class="controls">
                        <select class="oselectInput" id="year" onchange="getDays()" name="Year" style="width:80px;height:30px"></select>
                        <em>&nbsp;&nbsp;年&nbsp;&nbsp;</em>
                        <select class="oselectInput" id="month" onchange="getDays()" name="Month" style="width:80px;height:30px"></select>
                        <em>&nbsp;&nbsp;月&nbsp;&nbsp;</em>
                        <select class="oselectInput" id="day" name="Date" onchange="starSign()" style="width:80px;height:30px"></select>
                        <em>&nbsp;&nbsp;日</em>
                        <span id="strong_Birthday" class="age-info">
                           	 魔羯座
                        </span>
                    </div>
                </div>
                
                <div class="control-group city-group">
                	<label for="" class="controls-label">所在城市：</label>
                    <div class="controls">
                    	<select id="select_Province2" onchange="provChange(2,this.value)" style="width:150px;height:30px">
                        	<option value="">请选择省份</option>
                        </select>
                        <select id="select_City2" style="width:110px;height:30px">
                        	<option value="">请选择城市</option>
                        </select>
                    </div>
                </div>
                
                <div class="control-group">
                    <label for="" class="controls-label">教育：</label>
                    <div class="controls">
                  <select class="oselectInput" id="Education" name="Education" style="width:200px;height:30px">
                            <option value="">请选择教育</option>
                            <option value="博士">博士</option>
                            <option value="硕士">硕士</option>
                            <option value="本科">本科</option>
                            <option value="大专">大专</option>
                            <option value="高中">高中</option>
                            <option value="其他">其他</option>
						</select>
                    </div>
                </div>
                
                <div class="control-group">
                    <label for="" class="controls-label">行业：</label>
                    <div class="controls">
                        <select class="oselectInput" id="Job" name="Job" style="width:200px;height:30px">
                        	<option value="">请选择行业</option>
                            <option value="计算机/互联网/通讯/电子">计算机/互联网/通讯/电子</option>
                            <option value="会计/金融/银行/保险">会计/金融/银行/保险</option>
                            <option value="贸易/消费/制造/营运">贸易/消费/制造/营运</option>
                            <option value="制药/医疗">制药/医疗</option>
                            <option value="广告/媒体">广告/媒体</option>
                            <option value="房地产/建筑">房地产/建筑</option>
                            <option value="专业服务/教育/培训">专业服务/教育/培训</option>
                            <option value="服务业">服务业</option>
                            <option value="贸易/消费/制造/营运">贸易/消费/制造/营运</option>
                            <option value="物流/运输">物流/运输</option>
                            <option value="能源/原材料">能源/原材料</option>
                            <option value="政府/非盈利机构">政府/非盈利机构</option>
							<option value="其他">其他</option>
                        </select>
                    </div>
                </div>
                <br/>
                <div class="control-group button-group">
                        <div class="controls ">
                            <input type="button" onclick="submit()" value="修改并提交">
                        </div>
                    </div>
            </div>
        </div>
	</div>
	</div>
	
	<!-- 修改用户名 -->
	<div id="maskWrap_uname" class="m-pop  m-pop-lg" style="position: fixed; z-index: auto; top: 82.4px; left: 453.5px; display: none;">
		<div class="hd-box">
			<h2>设置用户名</h2>
			<a href="javascript:void(0);" class="close-btn" onclick="closeChangeUname()" title="关闭"></a>
		</div>
			<div class="body-box">
				<div class="m-form pop-form">
					<div class="control-group">
						<label for="" class="controls-label">用户名</label>
						<div class="controls">
							<input class="txtIpt" id="uname" maxlength="20"
								name="LoginName" type="text" value="" height="30px" style="height:30px">
								<span class="field-validation-error" id="uname_ver" style="display:none;">
									<span>用户名不可为空</span>
								</span>
						</div>

						<div class="control-group">
						<label for="" class="controls-label">密码</label>
						<div class="controls">
							<input class="txtIpt" id="uname_pwd" name="uname_pwd" type="password" value="" style="height:30px"/>
								<span class="field-validation-error" id="uname_pwd_ver" style="display:none;">
									<span>密码不能为空</span>
								</span>
						</div>
						
						<div class="control-group button-group">
							<div class="controls">
								<input type="button" onclick="changeName()" value="确定">
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改邮箱 -->
	<div id="maskWrap_email" class="m-pop  m-pop-lg" style="position: fixed; z-index: auto; top: 72.6px; left: 453.5px; display: none;">
		<div class="hd-box">
			<h2>修改邮箱</h2>
			<a href="javascript:;" class="close-btn" onclick="closeChangeEmail()" title="关闭"></a>
		</div>
			<div class="body-box">
				<div class="m-form pop-form">
					<div class="control-group">
						<label for="" class="controls-label">原邮箱</label>
						<div class="controls">
							<span class="current-value">${sessionScope.user.email}</span>
						</div>
					</div>

					<div class="control-group">
						<label for="" class="controls-label"> 新邮箱 </label>
						<div class="controls">
							<input class="txtIpt" id="newEmail" name="newEmail" type="text" value="" style="height: 30px">
								<span class="field-validation-error" id="email_ver" style="display:none">
									<span></span>
								</span>
						</div>
					</div>

					<div class="control-group">
						<label for="" class="controls-label">登录密码</label>
						<div class="controls">
							<input class="txtIpt" id="email_pwd" name="email_pwd" type="password" style="height: 30px">
								<span class="field-validation-error" id="email_pwd_ver" style="display:none">
									<span>密码不能为空</span>
								</span>
						</div>
					</div>

					<div class="control-group button-group">
						<div class="controls">
							<input type="button" onclick="changeEmail()" value="确定修改">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<!--幕布  -->
	<div id="exposeMask" style="position: absolute; top: 0px; left: 0px; width: 1519px; height: 970px; display: none; opacity: 0.5; z-index: 9998; background-color: rgb(0, 0, 0);"></div>
	
  </body>
</html>
