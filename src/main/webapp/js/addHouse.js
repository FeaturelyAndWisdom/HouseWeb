		var localObj = window.location;
		var protocol = location.protocol;
		var host = localObj.host;
		var contextPath = localObj.pathname.split("/")[1]; 
		var basePath = protocol +"//"+host+"/"+contextPath;
		var prinInf;

		function cityFind(title){
			var city = $("#select_City").find("option:selected").text();
			if(city==0){
				return;
			}
			map.centerAndZoom(city,11);      // 用城市名设置地图中心点
		}
		
		function enterNext(no){
			var y = Number(no);
			var lst=$("#guide li");
			var li = lst[y-1];
			var temp;
			for(var i=0;i<lst.length;i++){
				temp = lst[i];
				temp.className="";
			}
			temp = lst[y-2];
			temp.children[3].style.display="block";
			li.className="active";
			li.children[1].className=""
			$("#floor1").css("display","none");
			$("#floor2").css("display","none");
			$("#floor3").css("display","none");
			$("#floor4").css("display","none");
			$("#floor5").css("display","none");
			$("#floor6").css("display","none");
			$("#floor7").css("display","none");
			$("#floor"+no).css("display","block");
			$("#step").text(8-y);
		}
		
		function guideChange(no){
			var y = Number(no);
			var lst=$("#guide li");
			var li = lst[y-1];
			if(li.children[3].style.display=="none" && li.children[1].className=="nowrite"){
				return;
			}
			var temp;
			for(var i=0;i<lst.length;i++){
				temp = lst[i];
				temp.className="";
			}
			li.className="active";
			li.children[1].style=""
			$("#floor1").css("display","none");
			$("#floor2").css("display","none");
			$("#floor3").css("display","none");
			$("#floor4").css("display","none");
			$("#floor5").css("display","none");
			$("#floor6").css("display","none");
			$("#floor7").css("display","none");
			$("#floor"+no).css("display","block");
		}
		
		$(function(){
			//初始化省份
			$.ajax({
				type:'get',
				url:basePath+'/user/provInit',
				data:"",
				success:function(data){
					var res = '<option value="0">请选择城市</option>';
					$("#select_City").html(res);
					/* <option value="">请选择城市</option> */
					prinInf = data;
					for(var i=0;i<data.length;i++){
						var temp = data[i];
						res += "<option value=\""+temp.pid+"\">"+temp.pname+"</option>";
					}
					$("#select_Province").html(res);
				}
			})
		})
		
		function provChange(val){
			var res = '<option value="0">请选择城市</option>';
			if(val=="0"){
				$("#select_City"+id).html(res);
				return;
			}
			for(var i=0;i<prinInf.length;i++){
				var temp = prinInf[i];
				if(temp.pid==val){
					temp = temp.citylst;
					for(var j=0;j<temp.length;j++){
						var t = temp[j];
						res += "<option title='"+t.cname+"' value="+t.cid+">"+t.cname+"</option>";
					}
					$("#select_City").html(res);
					break;
				}
			}
		}
		
		//floor4
		var items = []													//设施服务
		
		//floor6	
		var files = {};													//相关房屋文件
		
		var notices = [];												//住房须知
		var extracosts = [];												//额外费用
		
		var housetype;													//房屋类型
		
    	function submitInfo(){
    		//floor1
    		var prov = $("#select_Province").val(); 						//省份
    		var city = $("#select_City").val();     						//城市
    		var locat = $("#part1_location").val(); 						//地址
    		var remark = $("#part1_remark").val();  						//补充信息
    		var doorid = $("#part1_doorid").val();  						//门牌号
    		var lng = $("#lng").val();										//地图 lng坐标
    		var lat = $("#lat").val();										//地图lat坐标
    		//floor2
    		var renttype = $("input[name='rentType']:checked").val();     //出租方式
    		
    		var housearea = $("#harea").val();								//房屋面积
    		var housesight = $("#hsight").val();							//房屋景观
    		var bedr_num = $("#bedr_num").val();							//房屋户型：卧室数量
    		var wcr_num = $("#wcr_num").val();								//房屋户型：卫生间
    		var livr_num = $("#livr_num").val();							//房屋户型：客厅
    		var kit_num = $("#kit_num").val();								//房屋户型：厨房
    		var bkr_num = $("#bkr_num").val();								//房屋户型：书房
    		var bal_num = $("#bal_num").val();								//房屋户型：阳台
    		var live_peo_num = $("#live_peo_num").val();					//宜住人数
    		//floor3
    		var housename = $("#housename").val();							//房屋名称
    		var house_feature = $("#house_feature").val();					//房屋特点
    		var house_traffic = $("#house_traffic").val();					//交通情况
    		var house_arround = $("#house_arround").val();					//周边介绍
    		
    		//floor5
    		var enterlive_time = $("#enterlive_time").val();				//入住时间
    		var leavelive_time = $("#leavelive_time").val();				//退房时间
    		
    		var otherdesc = $("#otherdesc").val();							//其他描述
    		
    		//floor7
    		var house_price = $("#house_price").val();						//价格
        	var least_day = $("#least_day").val();							//起租天数
        	
        	getPart4Data();
        	getPart5Data(); 
    		
    		var houseinf = {"housename":housename,"provid":prov,"cityid":city,"location":locat,"locatremark":remark,"doorid":doorid,"lng":lng,"lat":lat,
    				   "renttype":renttype,"housetype":housetype,"housearea":housearea,"housesight":housesight,"bedr_num":bedr_num,
    				   "wcr_num":wcr_num,"livr_num":livr_num,"kit_num":kit_num,"bkr_num":bkr_num,"bal_num":bal_num,"live_peo_num":live_peo_num,
    					"house_feature":house_feature,"house_traffic":house_traffic,"house_arround":house_arround,"enterlive_time":enterlive_time,
    					"leavelive_time":leavelive_time,"otherdesc":otherdesc,"house_price":house_price,"least_day":least_day};
    		var photos = [];
    		var photoname = [];
    		for (var photo in files){
    			var temp = files[photo];
    			photos.push(temp);
    			photoname.push(temp.name);
    		}
    		var inf = {"house":houseinf,"notices":notices,"extracosts":extracosts,"sitems":items,"photos":photoname};
    		$.ajax({
				type:'post',
				url:basePath+'/savehouse',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(inf),
				success:function(data){
					if(data=='fail'){
						alert('保存房屋失败，请稍后再试');
					}
					if(data=='success'){
						var formData = new FormData();
			    		photos.forEach(function (file) {
			                formData.append('files', file, file.name);
			            })
						$.ajax({
							type:'post',
							url:basePath+'/uploadimg',
							data:formData,
							cache: false,
			                processData: false,
			                contentType: false,
							success:function(data){
								alert('保存成功');
								location=basePath+"/front/sellerSys/seller_index.jsp";
							}
						})
						
					}
				}
			})
    		
    		
    		
    		
    	}
    	
    	function finallyVali(){
    		var flag = false;
    		flag = valiPart1();
    		if(flag){
    			alert("【房屋位置】信息有误，请核对后提交");
    			return;
    		}
    		flag = valiPart2();
    		if(flag){
    			alert("【房屋详情】信息有误，请核对后提交");
    			return;
    		}
    		flag = valiPart3();
    		if(flag){
    			alert("【房屋描述】信息有误，请核对后提交");
    			return;
    		}
    		flag = valiPart6();
    		if(flag){
    			alert("【房屋照片】信息有误，请核对后提交");
    			return;
    		}
    		flag = valiPart7();
    		if(flag){
    			alert("【价格】信息有误，请核对后提交");
    			return;
    		}
    		submitInfo();
    	}
    	
    	function valiPart1(){
			var flag = false;
			
			//floor1
			var prov = $("#select_Province").val(); 						//省份
			var city = $("#select_City").val();     						//城市
			var locat = $("#part1_location").val(); 						//地址
			var remark = $("#part1_remark").val();  						//补充信息
			var doorid = $("#part1_doorid").val();  						//门牌号
			var lng = $("#lng").val();										//地图 lng坐标
			var lat = $("#lat").val();										//地图lat坐标
			
			if(prov=="0" || city=="0"){
				$("#part1_city_ver").css("display","block");
				flag = true;
			}else{
				$("#part1_city_ver").css("display","none");
			}
			if(locat==""){
				$("#part1_locat_ver").css("display","block");
				flag = true;
			}else{
				$("#part1_locat_ver").css("display","none");
			}
			if(remark==""){
				$("#part1_remark_ver").css("display","block");
				flag = true;
			}else{
				$("#part1_remark_ver").css("display","none");
			}
			if(doorid==""){
				$("#part1_doorid_ver").css("display","block");
				flag = true;
			}else{
				$("#part1_doorid_ver").css("display","none");
			}
			return flag;
		}
    	
    	function gofloor2(){
    		var flag = valiPart1();
    		if(!flag){
    			enterNext(2);
    		}
    	}
    	
    	function gofloor3(){
    		var flag = valiPart2();
    		if(!flag){
    			enterNext(3);
    		}
    	}
    	
    	function gofloor4(){
    		var flag = valiPart3();
    		if(!flag){
    			enterNext(4);
    		}
    	}
    	
    	function gofloor7(){
    		var flag = valiPart6();
    		if(!flag){
    			enterNext(7);
    		}
    	}
		
		function htypeChange(){
			if($('#otype').is(':checked')){
				$("#otherhtype").css("display","block");
			}else{
				$("#otherhtype").css("display","none");				
			}
		}
		
		function numadd(id){
			var i = Number($("#"+id).val())+1;
			$("#"+id).val(i);
		}
		
		function numdown(id){
			var i = Number($("#"+id).val())-1;
			if(i<0) i=0;
			$("#"+id).val(i);
		}	
		
		function valiPart2(){
			var flag = false;
			
			var renttype = $("input[name='rentType']:checked").val();     //出租方式
			var housearea = $("#harea").val();								//房屋面积
			var housesight = $("#hsight").val();							//房屋景观
			var bedr_num = $("#bedr_num").val();							//房屋户型：卧室数量
			var wcr_num = $("#wcr_num").val();								//房屋户型：卫生间
			var livr_num = $("#livr_num").val();							//房屋户型：客厅
			var kit_num = $("#kit_num").val();								//房屋户型：厨房
			var bkr_num = $("#bkr_num").val();								//房屋户型：书房
			var bal_num = $("#bal_num").val();								//房屋户型：阳台
			var live_peo_num = $("#live_peo_num").val();					//宜住人数
			
			if($('#otype').is(':checked')){
				var temp = $("#otherhtype").val();
				if(temp==""){
					$("#part2_htype_ver").css("display","block");
					flag = true;
				}else{
					$("#part2_htype_ver").css("display","none");
				}
				housetype = temp;
			}else{
				$("#part2_htype_ver").css("display","none");
				housetype = $("input[name='housetype']:checked").val();
			}
			if(!(/\d{1,4}/.test(housearea))){
				$("#part2_harea_ver").css("display","block");
				flag = true;
			}else{
				$("#part2_harea_ver").css("display","none");
			}
			return flag;
		}
		
		function valiPart3(){
			var flag = false;
			
			var housename = $("#housename").val();							//房屋名称
			var house_feature = $("#house_feature").val();					//房屋特点
			var house_traffic = $("#house_traffic").val();					//交通情况
			var house_arround = $("#house_arround").val();					//周边介绍
			
			if(housename==""){
				$("#part3_hname_ver").css("display","block");
				flag = true;
			}else{
				$("#part3_hname_ver").css("display","none");
			}
			if(house_feature==""){
				$("#part3_feat_ver").css("display","block");
				flag = true;
			}else{
				$("#part3_feat_ver").css("display","none");
			}
			return flag;
		}
		
		function getPart4Data(){
			$("input[name='serviceitems']:checked").each(function(){
				var temp = $(this).val();
				items.push(temp);
			})
		}
		
		function getPart5Data(){
			
			$("input[name='notice']:checked").each(function(){
				notices.push($(this).val());
			})
			notices.push($("#health_rate").val());
			notices.push($("#quilt_rate").val());
			
			$("input[name='extracost']:checked").each(function(){
				extracosts.push($(this).val());
			})
			
		}
		
		//floor6 图片
	  	
	  	function randomName(len) {
		    len = len || 23;
		    var chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';
		    var maxPos = chars.length;
		    var str = '';
		    for (i = 0; i < len; i++) {
		        str += chars.charAt(Math.floor(Math.random() * maxPos));
		    }
		    return new Date().getTime() + str;
		}
		
		function delimg(id){
			$("#"+id).css("display","none");
			delete files[id];
		}
	  	
	    function addimg(showid,file) {
	        if (!file.files || !file.files[0]) {
	        	alert("请导入图片文件");
	            return;
	        }
	        var id = randomName(5);
	        var f = file.files[0];
	        var fileName = f.name;
			var pos = fileName.lastIndexOf(".");
			var lastName = fileName.substring(pos, fileName.length);
			if((lastName.toLowerCase() != ".jpg") && (lastName.toLowerCase() != ".png")){
				alert("请导入图片文件");
				return;
			}
/*			f["name"] = new Date().getTime() + "_pic" + "lastName"; 
*/			var img = new File([f],new Date().getTime() + "_pic" + lastName,{type:f.type});
	        files[id] = img;
	        var reader = new FileReader();
	        reader.onload = function (evt) {
	        	$("#showimg"+showid).append('<div data-v-3f02e12f="" class="photo-List photo-item" id="'+id+'">'+
																'<div data-v-3f02e12f="" class="img-con">'+
																'<div data-v-3f02e12f="" class="del-img" onclick=\'delimg("'+id+'")\'></div>'+
																'<img data-v-3f02e12f="" src="'+evt.target.result+'" class="uploadImg">'+ 
																'</div>'+
															'</div>');
	        }
	        reader.readAsDataURL(file.files[0]);
	    }
	    
	    function valiPart6(){
	    	var index = 0;
	    	var flag = false;
	    	for (var v in files) {
	    		index += 1;
	    	}
	    	if(index<3){
	    		alert("请至少上传三张图片");
	    		flag = true;
	    	}
	    	return flag;
	    }
	    
	    function valiPart7(){
	    	var flag = false;
	    	
	    	var house_price = $("#house_price").val();						//价格
	    	var least_day = $("#least_day").val();							//起租天数
	    	
	    	if(!(/^\d{1,4}$/).test(house_price)){
	    		$("#part7_price_ver").css("display","block");
	    		$("#part7_price_ver").html("<span>请正确输入价格</span>")
	    		flag = true;
	    	}else{
	    		$("#part7_price_ver").css("display","block");
	    	}
	    	if(!(/^\d{1,2}$/).test(least_day)){
	    		$("#part7_day_ver").css("display","block");
	    		$("#part7_price_ver").html("<span>请正确输入起订天数</span>")
	    		flag = true;
	    	}else{
	    		$("#part7_day_ver").css("display","block");
	    	}
	    	return flag;
	    }
		