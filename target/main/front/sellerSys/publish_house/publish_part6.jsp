<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  </head>
  
  <body>
  
  <div data-v-3f02e12f="" class="floor6" id="floor6" style="display:none">
						<div data-v-3f02e12f="" class="title-con">
							<h1 data-v-3f02e12f="">房屋照片</h1>
							<h2 data-v-3f02e12f="">上传真实、漂亮的房屋照片更能吸引房客</h2>
						</div>
						<div data-v-3f02e12f="" class="reject-tips-wrapper"
							style="display: none;">
							<div data-v-579995ed="" data-v-3f02e12f=""
								class="reject-tips reject-tips">
								<p data-v-579995ed="" class="reject-text"></p>
							</div>
						</div>
						<div data-v-3f02e12f="" class="photo-floor">
							<form data-v-3f02e12f="" autocomplete="off"
								class="ivu-form ivu-form-label-right">
								<div data-v-3f02e12f="" class="ivu-form-item">
									<!---->
									<div class="ivu-form-item-content">
										<div data-v-3f02e12f="" class="g-img-info">
											<h1 data-v-3f02e12f="">照片需上传6-140张且满足以下类型：</h1>
											<div data-v-3f02e12f="">
												<p data-v-3f02e12f="">
													<span data-v-3f02e12f="">客厅：1张</span> <span
														data-v-3f02e12f="">卧室：3张</span> <span data-v-3f02e12f="">厨房：1张</span>
													<span data-v-3f02e12f="">卫生间：1张</span>
												</p>
											</div>
											<div data-v-3f02e12f="" class="u-pic-size-info">
												<p data-v-3f02e12f="">
													请保证上传的图片高清、无水印、无logo和联系方式；为了避免房屋图片与户型不符产生客诉，请根据所选户型上传。</p>
												<p data-v-3f02e12f="">如未找到图片所属类型，可返回房屋详情修改户型信息</p>
											</div>
										</div>
									</div>
								</div>
								<ul data-v-3f02e12f="" class="upload-img-wrap">
									<li data-v-3f02e12f="">
										<div data-v-3f02e12f="" class="item-title">
											<div data-v-3f02e12f="" class="item-title-left">
												<h2 data-v-3f02e12f="">
													客厅
												</h2>
												<p data-v-3f02e12f="">至少上传1张，尽量显示配套设施（空调、电视等）及客厅全景</p>
											</div>
											<div data-v-3f02e12f="" class="item-title-right">
												<div data-v-cbedfb82="" data-v-3f02e12f="" class="enlarge-wrap">
													<div data-v-cbedfb82="" class="enlarge-image"
														style="display: none;">
														<div data-v-cbedfb82="" class="show-wrap">
															<div data-v-cbedfb82="">
																<span data-v-cbedfb82="" class="text">客厅</span> <span
																	data-v-cbedfb82="" class="close"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div data-v-3f02e12f="" class="upload-container">
											<div data-v-3f02e12f="" class="ivu-form-item">
												<div class="ivu-form-item-content">
												
													<div data-v-3f02e12f="" id="showimg1">
													</div>
													
													<div data-v-3f02e12f="" class="photo-List m-add-photo-list">
														<div data-v-0a22a07c="" data-v-3f02e12f="" class="update-wrap">
															<div data-v-0a22a07c="" class="ivu-upload" style="display: block; width: 100%;">
																<div class="ivu-upload ivu-upload-drag">
																	<input type="file" multiple="multiple" id="liveroom" accept="image/jpg, image/jpeg, image/png" onchange="addimg(1,this)" class="ivu-upload-input">
																	<div data-v-0a22a07c="" style="width: 100%; height: 143px;" onclick="javascript:$('#liveroom').click()">
																		<p data-v-0a22a07c="" class="add-symbol">+</p>
																		<p data-v-0a22a07c="" class="add-text">添加照片</p>
																	</div>
																	</input>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li data-v-3f02e12f=""><div data-v-3f02e12f=""
											class="item-title">
											<div data-v-3f02e12f="" class="item-title-left">
												<h2 data-v-3f02e12f="">
													卧室
												</h2>
												<p data-v-3f02e12f="">至少上传3张，展现完整床铺</p>
											</div>
											<div data-v-3f02e12f="" class="item-title-right">
												<div data-v-cbedfb82="" data-v-3f02e12f="" class="enlarge-wrap">
													<span data-v-cbedfb82="" class="enlarge-text">示例图</span>
													<div data-v-cbedfb82="" class="enlarge-image"
														style="display: none;">
														<div data-v-cbedfb82="" class="show-wrap">
															<div data-v-cbedfb82="">
																<span data-v-cbedfb82="" class="text">卧室</span> <span
																	data-v-cbedfb82="" class="close"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div data-v-3f02e12f="" class="upload-container">
											<div data-v-3f02e12f="" class="ivu-form-item">
												<div class="ivu-form-item-content">
													<div data-v-3f02e12f="" id="showimg2">
													</div>
													<div data-v-3f02e12f="" class="photo-List m-add-photo-list">
														<div data-v-0a22a07c="" data-v-3f02e12f="" class="update-wrap">
															<div data-v-0a22a07c="" class="ivu-upload" style="display: block; width: 100%;">
																<div class="ivu-upload ivu-upload-drag">
																	<input type="file" multiple="multiple" id="bedroom" onchange="addimg(2,this)" accept="image/jpg, image/jpeg, image/png" class="ivu-upload-input">
																	<div data-v-0a22a07c="" style="width: 100%; height: 143px;" onclick="javascript:$('#bedroom').click()">
																		<p data-v-0a22a07c="" class="add-symbol">+</p>
																		<p data-v-0a22a07c="" class="add-text">添加照片</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div></li>
									<li data-v-3f02e12f="">
										<div data-v-3f02e12f="" class="item-title">
											<div data-v-3f02e12f="" class="item-title-left">
												<h2 data-v-3f02e12f="">
													厨房
												</h2>
												<p data-v-3f02e12f="">至少上传1张，照片包含灶具和厨具</p>
											</div>
											<div data-v-3f02e12f="" class="item-title-right">
												<div data-v-cbedfb82="" data-v-3f02e12f="" class="enlarge-wrap">
													<span data-v-cbedfb82="" class="enlarge-text">示例图</span>
													<div data-v-cbedfb82="" class="enlarge-image" style="display: none;">
														<div data-v-cbedfb82="" class="show-wrap">
															<div data-v-cbedfb82="">
																<span data-v-cbedfb82="" class="text">厨房</span> <span
																	data-v-cbedfb82="" class="close"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div data-v-3f02e12f="" class="upload-container">
											<div data-v-3f02e12f="" class="ivu-form-item">
												<div class="ivu-form-item-content">
													<div data-v-3f02e12f="" id="showimg3">
													</div>
													<div data-v-3f02e12f="" class="photo-List m-add-photo-list">
														<div data-v-0a22a07c="" data-v-3f02e12f="" class="update-wrap">
															<div data-v-0a22a07c="" class="ivu-upload"
																style="display: block; width: 100%;">
																<div class="ivu-upload ivu-upload-drag">
																	<input type="file" multiple="multiple" id="kitchen"
																		accept="image/jpg, image/jpeg, image/png" onchange="addimg(3,this)"
																		class="ivu-upload-input">
																	<div style="width: 100%; height: 143px;" onclick="javascript:$('#kitchen').click()">
																		<p data-v-0a22a07c="" class="add-symbol">+</p>
																		<p data-v-0a22a07c="" class="add-text">添加照片</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li data-v-3f02e12f=""><div data-v-3f02e12f="" class="item-title">
											<div data-v-3f02e12f="" class="item-title-left">
												<h2 data-v-3f02e12f="">
													卫生间
												</h2>
												<p data-v-3f02e12f="">至少上传1张，卫浴设施完整，地面整洁</p>
											</div>
											<div data-v-3f02e12f="" class="item-title-right">
												<div data-v-cbedfb82="" data-v-3f02e12f="" class="enlarge-wrap">
													<span data-v-cbedfb82="" class="enlarge-text">示例图</span>
													<div data-v-cbedfb82="" class="enlarge-image"
														style="display: none;">
														<div data-v-cbedfb82="" class="show-wrap">
															<div data-v-cbedfb82="">
																<span data-v-cbedfb82="" class="text">卫生间</span> <span
																	data-v-cbedfb82="" class="close"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div data-v-3f02e12f="" class="upload-container">
											<div data-v-3f02e12f="" class="ivu-form-item">
												<div class="ivu-form-item-content">
													<div data-v-3f02e12f="" id="showimg4">
													</div>
													<div data-v-3f02e12f="" class="photo-List m-add-photo-list">
														<div data-v-0a22a07c="" data-v-3f02e12f=""
															class="update-wrap">
															<div data-v-0a22a07c="" class="ivu-upload"
																style="display: block; width: 100%;">
																<div class="ivu-upload ivu-upload-drag">
																	<input type="file" multiple="multiple" id="wcroom"
																		accept="image/jpg, image/jpeg, image/png" onchange="addimg(4,this)"
																		class="ivu-upload-input">
																	<div data-v-0a22a07c=""
																		style="width: 100%; height: 143px;" onclick="javascript:$('#wcroom').click()">
																		<p data-v-0a22a07c="" class="add-symbol">+</p>
																		<p data-v-0a22a07c="" class="add-text">添加照片</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div></li>
									<li data-v-3f02e12f="">
										<div data-v-3f02e12f="" class="item-title">
											<div data-v-3f02e12f="" class="item-title-left">
												<h2 data-v-3f02e12f="">
													阳台
												</h2>
												<p data-v-3f02e12f=""></p>
											</div>
											<div data-v-3f02e12f="" class="item-title-right">
												<div data-v-cbedfb82="" data-v-3f02e12f=""
													class="enlarge-wrap" style="display: none;">
													<span data-v-cbedfb82="" class="enlarge-text">示例图</span>
													<div data-v-cbedfb82="" class="enlarge-image"
														style="display: none;">
														<div data-v-cbedfb82="" class="show-wrap">
															<div data-v-cbedfb82="">
																<span data-v-cbedfb82="" class="text">阳台</span> <span
																	data-v-cbedfb82="" class="close"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div data-v-3f02e12f="" class="upload-container">
											<div data-v-3f02e12f="" class="ivu-form-item">
												<div class="ivu-form-item-content">
													<div data-v-3f02e12f="" id="showimg5">
													</div>
													<div data-v-3f02e12f="" class="photo-List m-add-photo-list">
														<div data-v-0a22a07c="" data-v-3f02e12f=""
															class="update-wrap">
															<div data-v-0a22a07c="" class="ivu-upload"
																style="display: block; width: 100%;">
																<div class="ivu-upload ivu-upload-drag">
																	<input type="file" multiple="multiple" id="balcony"
																		accept="image/jpg, image/jpeg, image/png" onchange="addimg(5,this)"
																		class="ivu-upload-input">
																	<div data-v-0a22a07c="" onclick="javascript:$('#balcony').click()"
																		style="width: 100%; height: 143px;">
																		<p data-v-0a22a07c="" class="add-symbol">+</p>
																		<p data-v-0a22a07c="" class="add-text">添加照片</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li data-v-3f02e12f="">
										<div data-v-3f02e12f="" class="item-title">
											<div data-v-3f02e12f="" class="item-title-left">
												<h2 data-v-3f02e12f="">
													其他
												</h2>
												<p data-v-3f02e12f=""></p>
											</div>
											<div data-v-3f02e12f="" class="item-title-right">
												<div data-v-cbedfb82="" data-v-3f02e12f=""
													class="enlarge-wrap" style="display: none;">
													<span data-v-cbedfb82="" class="enlarge-text">示例图</span>
													<div data-v-cbedfb82="" class="enlarge-image"
														style="display: none;">
														<div data-v-cbedfb82="" class="show-wrap">
															<div data-v-cbedfb82="">
																<span data-v-cbedfb82="" class="text">其他</span> <span
																	data-v-cbedfb82="" class="close"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div data-v-3f02e12f="" class="upload-container">
											<div data-v-3f02e12f="" class="ivu-form-item">
												<div class="ivu-form-item-content">
													<div data-v-3f02e12f="" id="showimg6">
													</div>
													<div data-v-3f02e12f="" class="photo-List m-add-photo-list">
														<div data-v-0a22a07c="" data-v-3f02e12f=""
															class="update-wrap">
															<div data-v-0a22a07c="" class="ivu-upload"
																style="display: block; width: 100%;">
																<div class="ivu-upload ivu-upload-drag">
																	<input type="file" multiple="multiple" id="otherimg"
																		accept="image/jpg, image/jpeg, image/png" onchange="addimg(6,this)"
																		class="ivu-upload-input">
																	<div data-v-0a22a07c="" onclick="javascript:$('#otherimg').click()"
																		style="width: 100%; height: 143px;">
																		<p data-v-0a22a07c="" class="add-symbol">+</p>
																		<p data-v-0a22a07c="" class="add-text">添加照片</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
								<div data-v-3f02e12f="" class="ivu-form-item">
									<div class="ivu-form-item-content">
										<div data-v-3f02e12f="" class="nextStep">
											<button data-v-3f02e12f="" type="button" onclick="gofloor7()"
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
