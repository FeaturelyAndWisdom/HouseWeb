<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jrSiYaOGOCtv2DXMv5xaLYfMdxOhTCOW"></script>
  </head>
  
  <body>
    				<!-- floor1  -->
					<div data-v-187027f4 class="floor1" id="floor1"
						style="display:block">
						<div data-v-187027f4="" class="title-con">
							<h1 data-v-187027f4="">房屋位置</h1>
							<h2 data-v-187027f4="">房客会使用位置信息来找到您的房子</h2>
						</div>

						<div class="position-floor" data-v-187027f4>
							<br />
							<form data-v-187027f4 autocomplete="off"
								class="ivu-form ivu-form-label-top">
								<label class="ivu-form-item-label"><span
									data-v-187027f4="">地区/城市</span></label><br /> <select
									disabled="disabled" style="width:180px;height:30px"><option>中国大陆</option></select>
								&nbsp;&nbsp;&nbsp; 
								<select id="select_Province" onchange="provChange(this.value)" style="width:100px;height:30px">
		                        	<option value="">请选择省份</option>
		                        </select>
		                        <select id="select_City" onchange="cityFind(this.title)" style="width:100px;height:30px">
		                        	<option value="">请选择城市</option>
		                        </select>
		                        <span class="field-validation-error" id="part1_city_ver" style="display:none;">
		                        	<span>城市选择错误</span>
								</span>
								<p style="color: rgb(153, 153, 153); font-size:12px">该信息审核通过后不可修改</p>
								<br /> <label class="ivu-form-item-label"><span
									data-v-187027f4="">地址</span></label><br /> 
									<input type="text" placeholder="请输入街道、小区等信息" id="part1_location" style="width:400px;height:30px" />
									<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
									<span class="field-validation-error" id="part1_locat_ver" style="display:none;">
										<span>地址信息不能为空</span>
									</span>
								<p style="color: rgb(153, 153, 153); font-size:12px">该信息审核通过后不可修改</p>
								<br /> <label class="ivu-form-item-label"><span
									data-v-187027f4="">补充信息（选填）</span></label><br /> 
									<input type="text" placeholder="最好不要与地址重复（例：万达广场对面）" id="part1_remark" style="width:400px;height:30px" />
									<span class="field-validation-error" id="part1_remark_ver" style="display:none;">
										<span>请对地址信息进行备注描述</span>
									</span>
								<br />
								<br /> <label class="ivu-form-item-label"><span
									data-v-187027f4="">门牌号（选填）</span></label><br /> 
									<input type="text" placeholder="房客预订成功后才显示此信息" id="part1_doorid" style="width:400px;height:30px" />
									<span class="field-validation-error" id="part1_doorid_ver" style="display:none;">
										<span>请填写门牌号</span>
									</span>
								<br /><br /> 
								<label class="ivu-form-item-label">
								<span data-v-187027f4="">地图定位</span></label><br />
								<p data-v-187027f4="" class="position-tips" style="">审核通过后不可修改。房客会根据此位置来找到您，拖动地图完成精准定位，不可定位在水里、路上等。</p>
								<input type="hidden" id="lng" value="">
								<input type="hidden" id="lat" value="">
	 <!--百度地图  -->			<div id="baidumap"></div>
								<br /><br /><br /><br /><br /><br />
								<div data-v-187027f4="" class="ivu-form-item">
									<!---->
									<div class="ivu-form-item-content">
										<div data-v-187027f4="" class="nextStep"
											style="margin-top: 20px;">
											<button data-v-187027f4="" type="button"
												onclick="gofloor2()"
												class="nextStep-btn ivu-btn ivu-btn-primary">
												<span>下一步</span>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<script type="text/javascript">
		// 百度地图API功能
		function G(id) {
			return document.getElementById(id);
		}
		var point = new BMap.Point(116.400244,39.92556);
		var map = new BMap.Map("baidumap");
		map.centerAndZoom(point,12);                   // 初始化地图,设置城市和地图级别。
		var marker = new BMap.Marker(point);
		map.addOverlay(marker);
		
		map.addEventListener("click",function(e){
			map.clearOverlays();
			point = new BMap.Point(e.point.lng,e.point.lat);
			marker = new BMap.Marker(point);
			map.addOverlay(marker);
			$("#lng").val(e.point.lng);
			$("#lat").val(e.point.lat);
		});
	
		var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
			{"input" : "part1_location"
			,"location" : map
		});
	
		ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
			var aimcity = $("#select_City").find("option:selected").text();
			if(aimcity=="请选择城市"){
				$("#part1_city_ver").css("display","block");
				return;
			}else{
				$("#part1_city_ver").css("display","none");
			}
			var str = "";
			var _value = e.fromitem.value;
			var value = "";
			if (e.fromitem.index > -1) {
				value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
			}    
			str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
			
			value = "";
			if (e.toitem.index > -1) {
				_value = e.toitem.value;
				value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
			}    
			str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
			G("searchResultPanel").innerHTML = str;
		});
	
		var myValue;
		ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
		var _value = e.item.value;
			myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
			G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
			
			setPlace();
		});
	
		function setPlace(){
			map.clearOverlays();    //清除地图上所有覆盖物
			function myFun(){
				var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
				$("#lng").val(pp.lng);
				$("#lat").val(pp.lat);
				map.centerAndZoom(pp, 18);
				map.addOverlay(new BMap.Marker(pp));    //添加标注
			}
			var local = new BMap.LocalSearch(map, { //智能搜索
			  onSearchComplete: myFun
			});
			local.search(myValue);
		}
	</script>
  </body>
</html>
