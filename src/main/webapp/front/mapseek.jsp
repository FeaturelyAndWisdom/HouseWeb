<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>地图搜索</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

	<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jrSiYaOGOCtv2DXMv5xaLYfMdxOhTCOW"></script>

	<style type="text/css">
		html{height:100%}  
        body{height:100%;margin:0px;padding:0px}
        #map {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";} 
        .ui_city_change_inner{
        	width:50px;height:25px;
        }
	</style>
  </head>
  
  <body>
    <div id="map"></div>
    
	<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
	
	<input type="hidden" id="lng" value="">
	<input type="hidden" id="lat" value="">
    
    <script type="text/javascript">
    	var flag = true;
    	
    	var localObj = window.location;
		var protocol = location.protocol;
		var host = localObj.host;
		var contextPath = localObj.pathname.split("/")[1]; 
		var basePath = protocol +"//"+host+"/"+contextPath;
		// 百度地图API功能
	  var map = new BMap.Map("map");
	  map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
	  // 添加带有定位的导航控件
	  var navigationControl = new BMap.NavigationControl({
	    // 靠左上角位置
	    anchor: BMAP_ANCHOR_TOP_LEFT,
	    // LARGE类型
	    type: BMAP_NAVIGATION_CONTROL_LARGE,
	    // 启用显示定位
	    enableGeolocation: true
	  });
	  map.addControl(navigationControl);
	  // 添加定位控件
	  var geolocationControl = new BMap.GeolocationControl();
	  geolocationControl.addEventListener("locationSuccess", function(e){
	    // 定位成功事件
	    var address = '';
	    address += e.addressComponent.province;
	    address += e.addressComponent.city;
	    address += e.addressComponent.district;
	    address += e.addressComponent.street;
	    address += e.addressComponent.streetNumber;
	  });
	  geolocationControl.addEventListener("locationError",function(e){
	    // 定位失败事件
	    alert(e.message);
	  });
	  map.addControl(geolocationControl);
	  
	  //城市切换
	  var size = new BMap.Size(100, 30);
	  map.addControl(new BMap.CityListControl({
	    anchor: BMAP_ANCHOR_TOP_LEFT,
	    offset: size,
	    // 切换城市之间事件
	    // onChangeBefore: function(){
	    //    alert('before');
	    // },
	    // 切换城市之后事件
	    // onChangeAfter:function(){
	    //   alert('after');
	    // }
	  }));
	  
	    //输入框事件
		function G(id) {
			return document.getElementById(id);
		}
		var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
			{"input" : "suggestId"
			,"location" : map
		});
		
		ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
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
		
		var opts = {
				width : 360,     // 信息窗口宽度
				height: 190,     // 信息窗口高度
			   };
		
		function addClickHandler(content,marker){
		marker.addEventListener("click",function(e){
			openInfo(content,e)}
		);
	  }
	  
	  function openInfo(content,e){
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	  }
		
		//添加搜索控件
		// 定义一个控件类,即function
		function ZoomControl(){
		  // 默认停靠位置和偏移量
		  this.defaultAnchor = BMAP_ANCHOR_TOP_LEFT;
		  this.defaultOffset = new BMap.Size(180, 30);
		}
		ZoomControl.prototype = new BMap.Control();
		ZoomControl.prototype.initialize = function(map){
		
	  var div = document.createElement("div");
	  
	  var input = document.createElement("input");
	  input.id = "suggestId";
	  // 设置样式
	  input.style.width = "200px";
	  input.style.height = "25px";
	  input.style.marginRight = "15px";
	  input.placeholder = "请输入查询的地方";
	  
	  var select = document.createElement("select");
	  var opt = document.createElement("option");
	  opt.value = "0";
	  opt.appendChild(document.createTextNode("请选择范围"))
	  select.appendChild(opt);
	  for(var i=1;i<11;i++){
	  	opt = document.createElement("option");
	  	opt.value=i;
	  	opt.textContent=i+"公里";
	  	select.appendChild(opt);
	  }
	  select.id = "size";
	  // 设置样式
	  select.style.width = "110px";
	  select.style.height = "25px";
	  select.style.marginRight = "15px";
	  
	  var reset = document.createElement("input");
	  reset.type = "button";
	  reset.style.width = "80px";
	  reset.style.height = "25px";
	  reset.value = "重置搜索";
	  reset.onclick = function(e){
	  		$("#lng").val("");
			$("#lat").val("");
			$("#size").val("0");
			flag = true;
			$("#suggestId").val("");
			map.clearOverlays();
	  }
	  
	  var btn = document.createElement("input");
	  btn.type = "button";
	  btn.style.width = "100px";
	  btn.style.height = "25px";
	  btn.style.marginRight = "15px";
	  btn.value = "查询附近民宿";
	  btn.onclick = function(e){
	  	var lng = $("#lng").val();
		var lat = $("#lat").val();
		var size = $("#size").val();
		if(lng=="" || lat==""){
			alert("请单击地图定位");
			return;
		}
		if(size==0){
			alert("请选择范围");
			return;
		}
		$.ajax({
			type:"get",
			url:basePath+"/findArroundHouse",
			data:"lng="+lng+"&lat="+lat+"&size="+size,
			success:function(data){
				if(data.length==0){
					alert("抱歉~附近没有发布房屋，要不扩大范围试试");
				}else{
					flag = false;
					for(var i=0;i<data.length;i++){
						var temp = data[i];
						var sContent =
						"<h4 style='margin:0 0 5px 0;padding:0.2em 0'><a target='_blank' href='${pageContext.request.contextPath}/findHouseById?hid="+temp.hid+"&gopage=1' style='text-decoration:none'>"+temp.housename+"</a></h4>" + 
						"<a target='_blank' href='${pageContext.request.contextPath}/findHouseById?hid="+temp.hid+"&gopage=1' style='text-decoration:none'>"+
						"<img style='float:right;margin:4px' id='imgDemo' src='${pageContext.request.contextPath}/houseImg/"+temp.imglst[0].imgpath+"' width='160' height='136' /></a>" +
						"<p style='margin:0;line-height:1.5;font-size:13px;'>"+temp.housetype+" "+temp.bedr_num+"室"+temp.livr_num+"厅"+temp.wcr_num+"卫  "+temp.housearea+"平米</p>" +
						"<p style='margin:0;line-height:1.5;font-size:13px;'>出租方式:"+temp.renttype+"</p>" +
						"<p style='margin:0;line-height:1.5;font-size:13px;'>房屋景观:"+temp.housesight+"</p>" +
						"<p style='margin:0;line-height:1.5;font-size:13px;'>价格:"+temp.house_price+"</p>" + 
						"</div>";
						var pt = new BMap.Point(temp.lng, temp.lat);
						var myIcon = new BMap.Icon("${pageContext.request.contextPath}/img/house_temp.jpg", new BMap.Size(60,50));
						var marker2 = new BMap.Marker(pt,{icon:myIcon});  // 创建标注
						
						addClickHandler(sContent,marker2);
						map.addOverlay(marker2);					
					}
				}
			}
		})
	  }
	  
	  div.appendChild(input);
	  div.appendChild(select);
	  div.appendChild(btn);
	  div.appendChild(reset);
	  
	  // 添加DOM元素到地图中
	  map.getContainer().appendChild(div);
	  
	  return div;
	  }
	  var myZoomCtrl = new ZoomControl();
	  // 添加到地图当中
	  map.addControl(myZoomCtrl);
	  //单击设置标记
	  map.addEventListener("click",function(e){
	  	if(flag){
	  		map.clearOverlays();
			point = new BMap.Point(e.point.lng,e.point.lat);
			marker = new BMap.Marker(point);
			map.addOverlay(marker);
			$("#lng").val(e.point.lng);
			$("#lat").val(e.point.lat);
	  	}
		});
	  
	</script>
  </body>
</html>
