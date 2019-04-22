<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  </head>
  
  <body>
    <div data-v-6fa69ce3="" id="floor2" class="floor2" style="display:none;">
		<div data-v-6fa69ce3="" class="title-con">
			<h1 data-v-6fa69ce3="">房屋详情</h1>
			<h2 data-v-6fa69ce3="">客房一般根据房型、户型等信息，选择合适的房屋。</h2>
		</div>
		<div data-v-6fa69ce3="" class="reject-tips-wrapper"
			style="display: none;">
			<div data-v-579995ed="" data-v-6fa69ce3="" class="reject-tips">
				<i data-v-579995ed=""
					class="reject-icon ivu-icon ivu-icon-android-alert"
					style="font-size: 17px; color: rgb(255, 87, 86);"></i>
				<p data-v-579995ed="" class="reject-text"></p>
			</div>
		</div>
		<div data-v-6fa69ce3="" class="detail-floor">
			<form data-v-6fa69ce3="" autocomplete="off"
				class="ivu-form ivu-form-label-top">
				<div data-v-6fa69ce3="" class="ivu-form-item"
					style="margin-top: 20px;">
					<!---->
					<div class="ivu-form-item-content">
						<p data-v-6fa69ce3="">出租方式</p>
						<input type="radio" name="rentType" value="整套房屋" checked="checked" />整套房屋&nbsp;&nbsp;&nbsp; 
						<input type="radio" name="rentType" value="独立房间"/>独立房间
						<p data-v-59415431="" class="tips" style="font-size:12px">该信息审核通过后不可修改</p>
					</div>
				</div>
				<div data-v-6fa69ce3="" class="ivu-form-item">
					<!---->
					<div class="ivu-form-item-content">
						<p data-v-6fa69ce3="">房屋类型</p>
						<div data-v-6fa69ce3="" class="ivu-radio-group">
							<span class="ivu-radio"><input type="radio" onchange="htypeChange()" checked="checked" value="公寓" name="housetype"/></span>公寓 &nbsp;
							<span class="ivu-radio"><input type="radio" onchange="htypeChange()" value="客栈" name="housetype"></span>客栈 &nbsp;
							<span class="ivu-radio"><input type="radio" onchange="htypeChange()" value="别墅" name="housetype"></span>别墅 &nbsp;
							<span class="ivu-radio"><input type="radio" onchange="htypeChange()" value="别墅" name="housetype"></span>复试&nbsp;
							<span class="ivu-radio"><input type="radio" onchange="htypeChange()" value="别墅" name="housetype"></span>农家乐 &nbsp;
							<span class="ivu-radio"><input type="radio" onchange="htypeChange()" value="别墅" name="housetype"></span>渔家乐&nbsp;
							<span class="ivu-radio"><input type="radio" onchange="htypeChange()" value="别墅" name="housetype"></span>木屋&nbsp;
							<span class="ivu-radio"><input type="radio" onchange="htypeChange()" value="别墅" name="housetype"></span>四合院 &nbsp;
							<span class="ivu-radio"><input type="radio" onchange="htypeChange()" value="别墅" name="housetype"></span>洋房 &nbsp;
							<span class="ivu-radio"><input type="radio" onchange="htypeChange()" value="别墅" name="housetype"></span>房车&nbsp;
							<span class="ivu-radio"><input type="radio" onchange="htypeChange()" value="别墅" name="housetype"></span>游艇  &nbsp;
							<span class="ivu-radio"><input type="radio" onchange="htypeChange()" id="otype" name="housetype"></span>其他/特色
							<input type="text" id="otherhtype" style="display:none;width: 100px;height: 30px;" value="" >
							<span class="field-validation-error" id="part2_htype_ver" style="display:none;">
		                        	<span>请填写房屋类型</span>
							</span>
						</div>
					</div>
				</div>
				<div data-v-6fa69ce3="" class="ivu-form-item">
					<label class="ivu-form-item-label">房屋面积</label>
					<div class="ivu-form-item-content">
						<div data-v-6fa69ce3="" class="ivu-input-wrapper ivu-input-type" style="width: 200px;">
							<i class="ivu-icon ivu-icon-load-c ivu-load-loop ivu-input-icon ivu-input-icon-validate"></i>
							<input autocomplete="off" spellcheck="false" id="harea" type="text" placeholder="整套房屋的使用面积" maxlength="4" class="ivu-input">
							<span class="field-validation-error" id="part2_harea_ver" style="display:none;">
		                        	<span>输入错误，请重新输入</span>
							</span>
						</div>
						<span data-v-6fa69ce3="">平米</span>
						<!---->
					</div>
				</div>
				<div data-v-6fa69ce3="" class="ivu-form-item">
					<!---->
					<div class="ivu-form-item-content">
						<p data-v-6fa69ce3="">房屋景观</p>
						<div data-v-6fa69ce3="" class="ivu-select ivu-select-single" style="width: 200px;">
							<div class="ivu-select-selection">
								<select style="width: 198px;height: 30px" id="hsight">
									<option value="无">无</option>
									<option value="海景">海景</option>
									<option value="江景">江景</option>
									<option value="山景">山景</option>
									<option value="湖景">湖景</option>
								</select>
							</div>
						</div>
						<br data-v-6fa69ce3="">
					</div>
				</div>
				<div data-v-6fa69ce3="" class="ivu-form-item">
					<!---->
					<div class="ivu-form-item-content">
						<p data-v-6fa69ce3="">房屋户型</p>
						<span data-v-6fa69ce3=""
							style="color: rgb(0, 0, 0); margin-top: 100px;">卧室</span>
						<div data-v-6fa69ce3="" class="ivu-input-number" style="width: 100px; margin-right: 15px;">
							<div class="ivu-input-number-handler-wrap">
								<a class="ivu-input-number-handler ivu-input-number-handler-up" onclick="numadd('bedr_num')">
								<span class="ivu-input-number-handler-up-inner ivu-icon ivu-icon-ios-arrow-up"></span></a> 
								<a class="ivu-input-number-handler ivu-input-number-handler-down" onclick="numdown('bedr_num')"> 
								<span class="ivu-input-number-handler-down-inner ivu-icon ivu-icon-ios-arrow-down"></span></a>
							</div>
							<div class="ivu-input-number-input-wrap">
								<input autocomplete="off" readonly="readonly" spellcheck="false" id="bedr_num" value="0" class="ivu-input-number-input">
							</div>
						</div>
						<span data-v-6fa69ce3="" style="color: rgb(0, 0, 0);">卫生间</span>
						<div data-v-6fa69ce3="" class="ivu-input-number" style="width: 100px; margin-right: 15px;">
							<div class="ivu-input-number-handler-wrap">
								<a class="ivu-input-number-handler ivu-input-number-handler-up" onclick="numadd('wcr_num')">
								<span class="ivu-input-number-handler-up-inner ivu-icon ivu-icon-ios-arrow-up"></span></a> 
								<a class="ivu-input-number-handler ivu-input-number-handler-down" onclick="numdown('wcr_num')"> 
								<span class="ivu-input-number-handler-down-inner ivu-icon ivu-icon-ios-arrow-down"></span></a>
							</div>
							<div class="ivu-input-number-input-wrap">
								<input autocomplete="off" readonly="readonly" value="0" spellcheck="false" id="wcr_num" class="ivu-input-number-input">
							</div>
						</div>
						<span data-v-6fa69ce3="" style="color: rgb(0, 0, 0);">客厅</span>
						<div data-v-6fa69ce3="" class="ivu-input-number" style="width: 100px; margin-right: 15px;">
							<div class="ivu-input-number-handler-wrap">
								<a class="ivu-input-number-handler ivu-input-number-handler-up" onclick="numadd('livr_num')">
								<span class="ivu-input-number-handler-up-inner ivu-icon ivu-icon-ios-arrow-up"></span></a> 
								<a class="ivu-input-number-handler ivu-input-number-handler-down" onclick="numdown('livr_num')"> 
								<span class="ivu-input-number-handler-down-inner ivu-icon ivu-icon-ios-arrow-down"></span></a>
							</div>
							<div class="ivu-input-number-input-wrap">
								<input autocomplete="off" readonly="readonly" value="0" spellcheck="false" id="livr_num" class="ivu-input-number-input">
							</div>
						</div>
						<span data-v-6fa69ce3="" style="color: rgb(0, 0, 0);">厨房</span>
						<div data-v-6fa69ce3="" class="ivu-input-number" style="width: 100px; margin-right: 15px;">
							<div class="ivu-input-number-handler-wrap">
								<a class="ivu-input-number-handler ivu-input-number-handler-up" onclick="numadd('kit_num')">
								<span class="ivu-input-number-handler-up-inner ivu-icon ivu-icon-ios-arrow-up"></span></a> 
								<a class="ivu-input-number-handler ivu-input-number-handler-down" onclick="numdown('kit_num')"> 
								<span class="ivu-input-number-handler-down-inner ivu-icon ivu-icon-ios-arrow-down"></span></a>
							</div>
							<div class="ivu-input-number-input-wrap">
								<input autocomplete="off" readonly="readonly" value="0" spellcheck="false" id="kit_num" class="ivu-input-number-input">
							</div>
						</div>
						<span data-v-6fa69ce3="" style="color: rgb(0, 0, 0);">书房</span>
						<div data-v-6fa69ce3="" class="ivu-input-number" style="width: 100px; margin-right: 15px;">
							<div class="ivu-input-number-handler-wrap">
								<a class="ivu-input-number-handler ivu-input-number-handler-up" onclick="numadd('bkr_num')">
								<span class="ivu-input-number-handler-up-inner ivu-icon ivu-icon-ios-arrow-up"></span></a> 
								<a class="ivu-input-number-handler ivu-input-number-handler-down" onclick="numdown('bkr_num')"> 
								<span class="ivu-input-number-handler-down-inner ivu-icon ivu-icon-ios-arrow-down"></span></a>
							</div>
							<div class="ivu-input-number-input-wrap">
								<input autocomplete="off" spellcheck="false" value="0" readonly="readonly" id="bkr_num" class="ivu-input-number-input">
							</div>
						</div>
						<span data-v-6fa69ce3="" style="color: rgb(0, 0, 0);">阳台</span>
						<div data-v-6fa69ce3="" class="ivu-input-number" style="width: 100px;">
							<div class="ivu-input-number-handler-wrap">
								<a class="ivu-input-number-handler ivu-input-number-handler-up" onclick="numadd('bal_num')">
								<span class="ivu-input-number-handler-up-inner ivu-icon ivu-icon-ios-arrow-up"></span></a> 
								<a class="ivu-input-number-handler ivu-input-number-handler-down" onclick="numdown('bal_num')"> 
								<span class="ivu-input-number-handler-down-inner ivu-icon ivu-icon-ios-arrow-down"></span></a>
							</div>
							<div class="ivu-input-number-input-wrap">
								<input autocomplete="off" spellcheck="false" value="0" readonly="readonly" id="bal_num" class="ivu-input-number-input">
							</div>
						</div>
					</div>
				</div>
				<div data-v-6fa69ce3="" class="ivu-form-item">
					<div class="ivu-form-item-content">
						<p data-v-6fa69ce3="">宜住人数</p>
						<div data-v-6fa69ce3="" class="ivu-input-number" style="width: 120px;">
							<div class="ivu-input-number-handler-wrap">
								<a class="ivu-input-number-handler ivu-input-number-handler-up" onclick="numadd('live_peo_num')">
								<span class="ivu-input-number-handler-up-inner ivu-icon ivu-icon-ios-arrow-up"></span></a> 
								<a class="ivu-input-number-handler ivu-input-number-handler-down" onclick="numdown('live_peo_num')"> 
								<span class="ivu-input-number-handler-down-inner ivu-icon ivu-icon-ios-arrow-down"></span></a>
							</div>
							<div class="ivu-input-number-input-wrap">
								<input autocomplete="off" spellcheck="false" id="live_peo_num" value="0" readonly="readonly" class="ivu-input-number-input">
							</div>
						</div><span data-v-6fa69ce3="" style="color: rgb(0, 0, 0);margin-left: 3px">人</span>
					</div>
				</div>
				<div data-v-6fa69ce3="" class="ivu-form-item">
					<div class="ivu-form-item-content">
						<div data-v-6fa69ce3="" class="nextStep">
							<button data-v-6fa69ce3="" type="button" onclick="gofloor3()" class="nextStep-btn ivu-btn ivu-btn-primary">
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
