<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  </head>
  
  <body>
  <div data-v-563d3372="" class="floor7" id="floor7" style="display:none">
						<div data-v-563d3372="" class="title-con">
							<h1 data-v-563d3372="">价格设置</h1>
						</div>
						<div data-v-563d3372="" class="price-floor">
							<form data-v-563d3372="" autocomplete="off"
								class="ivu-form ivu-form-label-top">
								<div data-v-563d3372="" class="ivu-form-item"
									style="margin-top: 20px;">
									<div class="ivu-form-item-content">
										<p data-v-563d3372=""
											style="font-weight: bold; color: rgb(51, 51, 51);">基础价</p>
										<span data-v-563d3372="" class="explain">基础价是基本售卖价格，长期有效，如果您在房态日历中修改了特定日期的价格，则特定日期之外的所有日期按照此价格售卖</span>
									</div>
								</div>
								<div data-v-563d3372="" class="ivu-form-item">
									<div class="ivu-form-item-content">
										<div data-v-563d3372="" class="sale-con">
											<div data-v-563d3372="" class="currency-con">
												<p data-v-563d3372="">售卖币种</p>
												<div data-v-563d3372="" class="ivu-select ivu-select-disabled ivu-select-single"
													style="width: 200px;">
													<div class="ivu-select-selection">
														<span class="ivu-select-placeholder" style="display: none;">请选择售卖币种</span> <span
															class="ivu-select-selected-value" style="">人民币</span>
													</div>
												</div>
											</div>
										</div>
										<span data-v-563d3372="" class="explain">国内房屋只能通过人民币售卖，不可更改</span>
									</div>
								</div>
								<div data-v-563d3372="" class="ivu-form-item">
									<div class="ivu-form-item-content">
										<div data-v-563d3372="">
											<div data-v-563d3372=""
												class="ivu-form-item ivu-form-item-required">
												<label class="ivu-form-item-label"> <span
													data-v-563d3372=""
													style="font-size: 14px; color: rgb(102, 102, 102);">售卖价格</span></label>
												<div class="ivu-form-item-content">
													<div data-v-563d3372=""
														class="ivu-input-wrapper ivu-input-type" min="0"
														style="width: 120px;">
														<input autocomplete="off" spellcheck="false" type="text" id="house_price"
															placeholder="请输入价格..." maxlength="9" class="ivu-input">
													<span class="field-validation-error" id="part7_price_ver" style="display:none;">
														
													</span>
													</div>
													元
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>

							<form data-v-563d3372="" autocomplete="off"
								class="ivu-form ivu-form-label-top">
								<div data-v-563d3372=""
									class="ivu-form-item ivu-form-item-required"
									style="border-top: 1px solid rgb(221, 221, 221); padding-top: 20px;">
									<label class="ivu-form-item-label"> <span
										data-v-563d3372="" class="explain" style="font-size: 14px;">最少起订天数
											<span data-v-563d3372="" style="font-size: 12px;">
												起订天数越少，越能满足更多人预订</span>
									</span></label>
									<div class="ivu-form-item-content">
										<div data-v-563d3372="" class="ivu-input-number"
											placeholder="请输天数..." style="width: 200px;">
											<div class="ivu-input-number-input-wrap">
												<input autocomplete="off" spellcheck="false" id="least_day"
													class="ivu-input-number-input">
												<span class="field-validation-error" id="part7_day_ver" style="display:none;">
													
												</span>
											</div>
										</div>
										天
									</div>
								</div>

								<p data-v-563d3372="" style="height: 37px; display: none;"></p>
								<div data-v-563d3372="" class="ivu-form-item">
									<div class="ivu-form-item-content">
										<div data-v-563d3372="" class="nextStep">
											<button data-v-563d3372="" type="button" onclick="finallyVali()"
												class="nextStep-btn ivu-btn ivu-btn-primary">
												<span>提交</span>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
  </body>
</html>
