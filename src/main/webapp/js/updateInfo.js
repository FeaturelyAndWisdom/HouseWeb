		var localObj = window.location;
		var protocol = location.protocol;
		var host = localObj.host;
		var contextPath = localObj.pathname.split("/")[1]; 
		var basePath = protocol +"//"+host+"/"+contextPath;
		var prinInf;
		
		function chanageicon(file){
			if (!file.files || !file.files[0]) {
	        	alert("请导入图片文件");
	            return;
	        }
	        var f = file.files[0];
	        var fileName = f.name;
			var pos = fileName.lastIndexOf(".");
			var lastName = fileName.substring(pos, fileName.length);
			if((lastName.toLowerCase() != ".jpg") && (lastName.toLowerCase() != ".png")){
				alert("请导入图片文件");
				return;
			}
			var img = new File([f],new Date().getTime() + "_icon" + lastName,{type:f.type});
	        var formData = new FormData();
            formData.append('uicon', img, img.name);
			$.ajax({
				type:'post',
				url:basePath+'/user/changeIcon',
				data:formData,
				cache: false,
                processData: false,
                contentType: false,
				success:function(data){
					if(data=="success"){
						alert('头像上传成功');
						history.go(0);
					}else{
						alert('头像上传失败，请稍后再试');
					}
				}
			})
		}
		
		function starSign(){
			var month = $("#month").val();
			var day = $("#day").val();
			var s = "魔羯水瓶双鱼牡羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
			var arr2 = [20,19,21,21,21,22,23,23,23,23,22,22];
			var result2 = s.substr(month*2-(day<arr2[month-1]?2:0),2)+"座";
			$("#strong_Birthday").text(result2);
		}
		
		function getDaysInMonth(month,year) { //年月对应的日数算法
				var days;
				if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
					days = 31; 
				} else if (month == 4 || month == 6 || month == 9 || month == 11) {
					days = 30; //固定30
				} else {
					if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) { //排除百年，每四年一闰；每四百年一闰；
						days = 29; //闰年29
					} else {
						days = 28; //平年28
					}
				}
				return days; //返回该年月的日数
		}
		
		function getDays(){
	        var year = $("#year").val();
	        var month = $("#month").val();
	        var days = getDaysInMonth(month,year);
	        $("#day").empty();
	        for(var i=1;i<=days;i++){
	        	$("#day").append("<option value=\""+i+"\">"+i+"</option>");
	        }
	        starSign();
        }
		
		$(function(){
			/*初始化家乡、所在城市的select  */
			$.ajax({
				type:'get',
				url:basePath+'/user/provInit',
				data:"",
				success:function(data){
					var res = '<option value="0">请选择城市</option>';
					var res2 = '<option value="0">请选择城市</option>';
					$("#select_City1").html(res);
					$("#select_City2").html(res);
					/* <option value="">请选择城市</option> */
					prinInf = data;
					for(var i=0;i<data.length;i++){
						var temp = data[i];
						if($("#temp_hp_id").val()==temp.pid){
							res += "<option value=\""+temp.pid+"\" selected='selected'>"+temp.pname+"</option>";
						}else{
							res += "<option value=\""+temp.pid+"\">"+temp.pname+"</option>";
						}
						if($("#temp_lp_id").val()==temp.pid){
							res2 += "<option value=\""+temp.pid+"\" selected='selected'>"+temp.pname+"</option>";
						}else{
							res2 += "<option value=\""+temp.pid+"\">"+temp.pname+"</option>";
						}
					}
					if($("#temp_hc_id").val()!=0){
						$("#select_City1").html('<option value="'+$("#temp_hc_id").val()+'">'+$("#temp_hc_name").val()+'</option>');
					}
					if($("#temp_lc_id").val()!=0){
						$("#select_City2").html('<option value="'+$("#temp_lc_id").val()+'">'+$("#temp_lc_name").val()+'</option>');
					}
					$("#select_Province").html(res);
					$("#select_Province2").html(res2);
				}
			})
			
			/*初始化出生日期组件  */
			var date=new Date();//创建日期对象
            var year=date.getFullYear();
            for(var i=year-100;i<=year;i++){
                $("#year").append("<option value=\""+i+"\">"+i+"</option>");
            }
            for(var i=1;i<=12;i++){
                $("#month").append("<option value=\""+i+"\">"+i+"</option>");
            }
            getDays($("#month").val(),$("#year").val());
            
            /* 初始化用户属性 */
			$("#Education").find("option[value='"+$("#temp_edu").val()+"']").attr("selected","selected");
			$("#Job").find("option[value='"+$("#temp_job").val()+"']").attr("selected","selected");
		    $("[name='sex'][value='"+$("#temp_sex").val()+"']").prop("checked", "checked");
			
			var bir = $("#temp_bir").val();
			var parts = bir.split("-");
			$("#year").find("option[value='"+Number(parts[0])+"']").attr("selected","selected");
			$("#month").find("option[value='"+Number(parts[1])+"']").attr("selected","selected");
			$("#day").find("option[value='"+Number(parts[2])+"']").attr("selected","selected");
		})
		
		function provChange(id,val){
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
						res += "<option value="+t.cid+">"+t.cname+"</option>";
					}
					$("#select_City"+id).html(res);
					break;
				}
			}
		}
		
		function openChangeUname(){
			$("#maskWrap_uname").css("display","block");
			$("#maskWrap_uname").css("z-index","9999");
			$("#exposeMask").css("display","block");
		}
		
		function closeChangeUname(){
			$("#exposeMask").css("display","none");
			$("#maskWrap_uname").css("z-index","auto");
			$("#maskWrap_uname").css("display","none")
		}
		
		function openChangeEmail(){
			$("#exposeMask").css("display","block");
			$("#maskWrap_email").css("display","block");
			$("#maskWrap_email").css("z-index","9999");
		}
		
		function closeChangeEmail(){
			$("#exposeMask").css("display","none");
			$("#maskWrap_email").css("display","none")
			$("#maskWrap_email").css("z-index","auto");
		}
		
		function changeName(){
			var uname = $("#uname").val();
			if(uname==""){
				$("#uname_ver").css("display","block");
				return;
			}else{
				$("#uname_ver").css("display","none");
			}
			var pwd = $("#uname_pwd").val();
			if(pwd==""){
				$("#uname_pwd_ver").css("display","block");
				return;
			}else{
				$("#uname_pwd_ver").css("display","none");
			}
			var uid = $("#uid").val();
			var inf = {"uid":uid,"uname":uname,"pwd":pwd};
			$.ajax({
				type:'post',
				url:basePath+'/user/changeuname',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(inf),
				success:function(data){
					if(data=='pwd error'){
						alert('密码输入错误');
					}
					if(data=='fail'){
						alert('更改失败，请稍后再试！');
					}
					if(data=='success'){
						alert('更新成功');
						history.go(0);
					}
				}
			})
		}
		
		function changeEmail(){ 
			var uid = $("#uid").val();
			var pwd = $("#email_pwd").val();
			if(pwd==""){
				$("#email_pwd_ver").css("display","block");
				return;
			}else{
				$("#email_pwd_ver").css("display","none");
			}
			var email = $("#newEmail").val();
			if(!(/\w+@\w+(\.\w+)+/.test(email))){
				$("#email_ver").html("<span>邮箱格式错误</span>");
				$("#email_ver").css("display","block");
				return;
			}else if(email==""){
				$("#email_ver").html("<span>邮箱不能为空</span>");
				$("#email_ver").css("display","block");
				return;
			}else{
				$("#email_ver").css("display","none");
			}
			var inf = {"uid":uid,"email":email,"pwd":pwd};
			$.ajax({
				type:'post', 
				url:basePath+'/user/changeemail',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(inf),
				success:function(data){
					if(data=='pwd error'){
						alert('密码输入错误');
					}
					if(data=='fail'){
						alert('更改失败，请稍后再试！');
					}
					if(data=='success'){
						alert('更新成功');
						history.go(0);
					}
				}
			})
		}
		
		function submit(){
			var uid = $("#uid").val();
			var rname = $("#realname").val();
			var home_prov = $("#select_Province").val();
			var home_city = $("#select_City1").val();
			var live_prov = $("#select_Province2").val();
			var live_city = $("#select_City2").val();
			var edu = $("#Education").val();
			var job = $("#Job").val();
			var sex =$('input:radio[name="sex"]:checked').val();
			
			var year = $("#year").val();
			var month = $("#month").val();
			var day = $("#day").val();
			var inf = {"user":{"uid":uid,"realname":rname,"home_prov":home_prov,"home_city":home_city,"live_prov":live_prov,"live_city":live_city,"edu":edu,"job":job,"sex":sex},"year":year,"month":month,"day":day};
			$.ajax({
				type:'post',
				url:basePath+'/user/updateInfo',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(inf),
				success:function(data){
					if(data=='fail'){
						alert('更新失败，请稍后再试！');
						$("#mykaptcha").click();
					}
					if(data=='success'){
						$("#info_content").css("display","none");
						$("#successInf").css("display","block");
					}
				}
			})
		}