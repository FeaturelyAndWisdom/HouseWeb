<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  </head>
  
  <body>
  <div class="floor5" style="display:none" id="floor5">
						<div class="title-con">
							<h1>入住规则</h1>
							<h2>请注明您的房屋入住相关说明，以保证能收到合适的订单。</h2>
						</div>
						<div class="reject-tips-wrapper" style="display: none;">
							<div data-v-579995ed="" class="reject-tips">
								<p data-v-579995ed="" class="reject-text"></p>
							</div>
						</div>
						<div class="describe-floor">
							<form autocomplete="off" class="ivu-form ivu-form-label-right">
								<div class="ivu-form-item" style="margin-top: 20px;">
									<!---->
									<div class="ivu-form-item-content">
										<div class="checkTime">
											<p>房客入住时间</p>
											<div class="ivu-select ivu-select-single"
												style="width: 200px;">
												<select style="width:150px;height:30px" id="enterlive_time">
													<c:forEach begin="0" end="23" var="index">
														<c:if test="${index<10}">
															<option value="0${index}:00">0${index}:00</option>
														</c:if>
														<c:if test="${index>9}">
															<option value="${index}:00">${index}:00</option>
														</c:if>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="leaveTime">
											<p>房客退房时间</p>
											<div class="ivu-select ivu-select-single"
												style="width: 200px;">
												<select style="width:150px;height:30px" id="leavelive_time">
													<c:forEach begin="0" end="23" var="index">
														<c:if test="${index<10}">
															<option value="0${index}:00">0${index}:00</option>
														</c:if>
														<c:if test="${index>9}">
															<option value="${index}:00">${index}:00</option>
														</c:if>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="ivu-form-item">
									<!---->
									<div class="ivu-form-item-content">
										<p>接待特殊人群</p>
										<div class="ivu-checkbox-group">
											<label class="ivu-checkbox-wrapper ivu-checkbox-group-item ivu-checkbox-wrapper-checked">
												<span class="ivu-checkbox ivu-checkbox-checked"> 
												<input type="checkbox" name="notice" value="1"> <!----></span> 儿童（0-12岁）
											</label> 
											<label class="ivu-checkbox-wrapper ivu-checkbox-group-item ivu-checkbox-wrapper-checked">
												<span class="ivu-checkbox ivu-checkbox-checked"> 
												<input type="checkbox" name="notice" value="2"> <!----></span> 老人（65岁以上）
											</label>
											<label class="ivu-checkbox-wrapper ivu-checkbox-group-item ivu-checkbox-wrapper-checked">
												<span class="ivu-checkbox ivu-checkbox-checked"> 
												<input type="checkbox" name="notice" value="3"> <!----></span> 外宾
											</label>
										</div>
									</div>
								</div>
								<!---->
								<div class="ivu-form-item"
									style="border-top: 1px solid rgb(238, 238, 238);">
									<div class="ivu-form-item-content">
										<p style="margin-top: 20px;">打扫换洗方式</p>
										<div class="clearHouse">
											<p>多久提供打扫卫生</p>
											<div class="ivu-select ivu-select-single" style="width: 200px;">
												<div class="ivu-select-selection">
													<select style="width: 198px;height: 30px" id="health_rate">
														<option value="4">1客1扫</option>
														<c:forEach begin="1" end="7" var="index">
															<option value="${index+4}">${index}天1扫</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<div class="clearHouse">
											<p>多久提供被单更换</p>
											<div class="ivu-select ivu-select-single"
												style="width: 200px;">
												<div class="ivu-select-selection">
													<select style="width: 198px;height: 30px" id="quilt_rate">
														<option value="12">1客1换</option>
														<c:forEach begin="1" end="7" var="index">
															<option value="${index+12}">${index}天1换</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="ivu-form-item"
									style="border-top: 1px solid rgb(238, 238, 238);">
									<div class="ivu-form-item-content">
										<p style="margin-top: 20px;">对房客的要求</p>
										<div class="ivu-checkbox-group">
											<label class="ivu-checkbox-wrapper ivu-checkbox-group-item" style="display: block; width: 160px;"> 
											<span class="ivu-checkbox"> 
												<input type="checkbox" name="notice" value="20"></span>允许吸烟<br></label> 
											<label class="ivu-checkbox-wrapper ivu-checkbox-group-item" style="display: block; width: 160px;"> 
												<span class="ivu-checkbox"> 
												<input type="checkbox" name="notice" value="21"></span>允许携带宠物<br></label> 
											<label class="ivu-checkbox-wrapper ivu-checkbox-group-item" style="display: block; width: 160px;"> 
												<span class="ivu-checkbox"> 
												<input type="checkbox" name="extracost" value="1"></span>允许做饭<br></label> 
											<label class="ivu-checkbox-wrapper ivu-checkbox-group-item" style="display: block; width: 160px;"> 
												<span class="ivu-checkbox"> 
												<input type="checkbox" name="extracost" value="2"></span>允许聚会<br></label> 
											<label class="ivu-checkbox-wrapper ivu-checkbox-group-item" style="display: block; width: 160px;"> 
												<span class="ivu-checkbox"> 
												<input type="checkbox" name="extracost" value="3"></span>允许加人<br></label> 
											<label class="ivu-checkbox-wrapper ivu-checkbox-group-item" style="display: block; width: 160px;"> 
												<span class="ivu-checkbox"> 
												<input type="checkbox" name="extracost" value="4"></span>允许商业拍摄<br></label>
										</div>
										<label class="ivu-checkbox-wrapper"> 
											<span class="ivu-checkbox">
											<input type="checkbox" name="extracost" value="5"></span>允许房客加床</label> <br>
									</div>
								</div>
								<div class="ivu-form-item"
									style="border-top: 1px solid rgb(238, 238, 238);">
									<!---->
									<div class="ivu-form-item-content">
										<p style="margin-top: 20px;">其他入住提示（选填）</p>
										<div class="ivu-input-wrapper ivu-input-type"
											style="width: 400px; margin-top: 10px;">
											<textarea autocomplete="off" spellcheck="false" id="otherdesc"
												placeholder="不可录入“发票”“押金”等信息，不可与已录入信息矛盾，否则不会审核通过哦~若对客有其他入住要求，请说明。例如：水电燃气费、额外打扫费用、入住所需证件等。"
												rows="6" maxlength="500" class="ivu-input"></textarea>
										</div>
										<div class="text-msg-long">
											<span class="check-sensitive-words" style="display: none;"></span>
										</div>
										<!---->
									</div>
								</div>
								<div class="ivu-form-item">
									<!---->
									<div class="ivu-form-item-content">
										<div class="nextStep">
											<button type="button" onclick="enterNext(6)"
												class="nextStep-btn ivu-btn ivu-btn-primary">
												<span>下一步</span>
											</button>
										</div>
										<!---->
									</div>
								</div>
							</form>
						</div>
					</div>
  </body>
</html>
