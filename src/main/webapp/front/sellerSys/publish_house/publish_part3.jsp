<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
    <div data-v-5fa33f38="" class="floor3" id="floor3" floor2formvalidate="[object Object]" style="display:none">
						<div data-v-5fa33f38="" class="title-con">
							<h1 data-v-5fa33f38="">房屋描述</h1>
						</div>
						<div data-v-5fa33f38="" class="reject-tips-wrapper" style="display: none;">
							<div data-v-579995ed="" data-v-5fa33f38="" class="reject-tips">
								<p data-v-579995ed="" class="reject-text"></p>
							</div>
						</div>
						<div data-v-5fa33f38="" class="describe-floor">
							<form autocomplete="off" class="ivu-form ivu-form-label-right" style="margin-top: 20px; position: relative;">
								<div data-v-5fa33f38=""
									class="ivu-form-item ivu-form-item-required"
									style="width: 500px;">
									<label class="ivu-form-item-label">房屋名称</label>
									<div class="ivu-form-item-content">
										<div data-v-5fa33f38="" class="ivu-input-wrapper ivu-input-wrapper-large ivu-input-type">
											<input autocomplete="off" spellcheck="false" id="housename" type="text" placeholder="建议：地标+特色/亮点+你的文采+户型" maxlength="20" class="ivu-input ivu-input-large">
										</div>
										<span class="field-validation-error" id="part3_hname_ver" style="display:none;">
				                        	<span>名称不能为空</span>
										</span>
									</div>
								</div>
								<div data-v-5fa33f38="" class="ivu-form-item ivu-form-item-required" style="margin-top: 30px; width: 500px;">
									<label class="ivu-form-item-label">房屋特色</label>
									<div class="ivu-form-item-content">
										<div data-v-5fa33f38="" class="ivu-input-wrapper ivu-input-type" style="width: 500px;">
											<textarea autocomplete="off" spellcheck="false" id="house_feature" placeholder="可描述房屋软装风格，家居配套，小区环境，物业管理等" rows="6" maxlength="1000" class="ivu-input"></textarea>
										</div>
										<span class="field-validation-error" id="part3_feat_ver" style="display:none;">
				                        	<span>特色描述不能为空</span>
										</span>
									</div>
								</div>
								<div data-v-5fa33f38="" class="ivu-form-item" style="margin-top: 20px; width: 500px;">
									<div class="ivu-form-item-content">
										<p data-v-5fa33f38="">交通位置（选填）</p>
										<div data-v-5fa33f38="" class="ivu-input-wrapper ivu-input-type" style="width: 500px;">
											<textarea autocomplete="off" spellcheck="false" id="house_traffic" placeholder="位于朝阳门外大街，从朝阳门地铁站A口5分钟到达。楼下有38路、101路等多条公交线路，十分方便。" 
												rows="6" maxlength="500" class="ivu-input"></textarea>
										</div>
									</div>
								</div>
								<div data-v-5fa33f38="" class="ivu-form-item" style="width: 500px;">
									<div class="ivu-form-item-content">
										<p data-v-5fa33f38="">周边介绍（选填）</p>
										<div data-v-5fa33f38="" class="ivu-input-wrapper ivu-input-type" style="width: 500px;">
											<textarea autocomplete="off" spellcheck="false" id="house_arround" placeholder="小区东侧有条美食街，特别推荐冒牌火锅菜、海鲜烧烤；附近配有超市便利店、辉煌量贩式KTV、24小时药店、建行ATM，生活便利；最近的医院是**医院，距离2公里，车程仅5分钟，出租车起步价就到。"
												rows="6" maxlength="500" class="ivu-input"></textarea>
										</div>
									</div>
								</div>
								<div data-v-5fa33f38="" class="ivu-form-item">
									<div class="ivu-form-item-content">
										<div data-v-5fa33f38="" class="nextStep">
											<button data-v-5fa33f38="" type="button" onclick="gofloor4()"
												class="nextStep-btn ivu-btn ivu-btn-primary">
												<span>下一步</span>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
  </body>
</html>
