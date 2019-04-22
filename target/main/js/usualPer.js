var localObj = window.location;
		var protocol = location.protocol;
		var host = localObj.host;
		var contextPath = localObj.pathname.split("/")[1]; 
		var basePath = protocol +"//"+host+"/"+contextPath;
		
		function openNewPush(){
			$("#pid").val("");
			$("#name").val("");
			$("#tel").val("");
			$("#man").attr("checked","checked");
			$("#cardid").val("");
			$("#birth").val("");
			openPush();
		}
	
		//弹出编辑/更新窗口
		function openPush(){
			$("#editPop").css("display","block");
			$("#editPopInner").css("display","block");
		}
		//关闭编辑/更新窗口
		function closePush(){
			$("#editPop").css("display","none");
			$("#editPopInner").css("display","none");
		}
		//弹出删除窗口
		function openPop(pid,name){
			$("#deletePop").css("display","block");
			$("#deletePopInner").css("display","block");
			$("#dele_user").text(name);
			$("#dele_id").val(pid);
		}
		//关闭删除窗口
		function closePop(){
			$("#deletePop").css("display","none");
			$("#deletePopInner").css("display","none");
		}
		
		//确定删除
		function deleteByPid(){
			var pid = $("#dele_id").val();
			$.ajax({
				type:'get',
				url:basePath+'/person/deleteByPid?pid='+pid,
				data:"",
				success:function(data){
					if(data=="fail"){
						alert("删除失败，请稍后再试");
					}
					if(data=="success"){
						alert("删除成功");
						history.go(0);
					}
				}
			})
		}
		
		function madeBir(cid){
			var year = cid.substr(6, 4);
			var month = cid.substr(10,2);
			var day = cid.substr(12,2);
			$("#birth").val(year+"/"+month+"/"+day)
		}
		
		function editPer(pid){
			$.ajax({
				type:'get',
				url:basePath+'/person/findPerByPid',
				data:"pid="+pid,
				success:function(data){
					openPush();
					$("#name").val(data.name);
					$("#tel").val(data.tel);
					if(data.sex=="男"){
						$("#man").attr("checked","checked");
					}else{
						$("#woman").attr("checked","checked");
					}
					$("#cardid").val(data.cardid);
					$("#pid").val(data.pid);
					madeBir(data.cardid);
				}
			})
		}
		
		function validate(name,tel,cid,temp){
			var flag = false;
			var vali = "";
			if(name==""){
				$("#name_ver").html("<span>姓名不能为空</span>");
				$("#name_ver").css("display","block");
				flag = true;
			}else{
				$("#name_ver").css("display","none");
			}
			if(!(/^1[3|4|5|8][0-9]\d{8}$/.test(tel))){
				$("#tel_ver").html("<span>手机号码格式错误</span>");
				$("#tel_ver").css("display","block");
				flag = true;
			}else{
				$("#tel_ver").css("display","none");
			}
			if(cid==""){
				$("#cid_ver").html("<span>证件号不能为空</span>");
				$("#cid_ver").css("display","block");
				flag = true;
			}else if(!(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(cid))){
				$("#cid_ver").text("<span>证件号格式错误</span>");
				$("#cid_ver").css("display","block");
				flag = true;
			}else{
				$("#cid_ver").css("display","none");
				madeBir(cid);
			}
			var myDate = new Date();
			var res = Number(temp.substring(0,4))-myDate.getFullYear();
			if(Number(temp.substring(5,2))>12 || Number(temp.substring(8,2)>31) || Math.abs(res)>120){
				$("#bir_ver").html("<span>出生日期超限，重新输入</span>");
				$("#bir_ver").css("display","block");
				flag = true;
			}else{
				$("#bir_ver").css("display","none");
			}
			return flag;
		}
		
		function addPer(){
			var name = $("#name").val();
			var tel = $("#tel").val();
			var sex = $('input:radio[name="sex"]:checked').val();
			var ctype = $("#cardtype").val();
			var cid = $("#cardid").val();
			var temp = $("#birth").val();
			var uid = $("#uid").val();
			var flag = validate(name,tel,cid,temp);
			if(flag){
				return;
			}
			var inf = {"person":{"name":name,"tel":tel,"sex":sex,"cardtype":ctype,"cardid":cid,"uid":uid},"bir":temp};
			$.ajax({
				type:'post',
				url:basePath+'/person/addPer',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(inf),
				success:function(data){
					if(data=="fail"){
						alert("添加失败，请稍后再试");
					}
					if(data=="success"){
						alert("添加成功");
						history.go(0);
					}
				}
			})
		}
		
		function updatePer(){
			var pid = $("#pid").val();
			var name = $("#name").val();
			var tel = $("#tel").val();
			var sex = $('input:radio[name="sex"]:checked').val();
			var ctype = $("#cardtype").val();
			var cid = $("#cardid").val();
			var temp = $("#birth").val();
			var flag = validate(name,tel,cid,temp);
			if(flag){
				return;
			}
			var inf = {"person":{"pid":pid,"name":name,"tel":tel,"sex":sex,"cardtype":ctype,"cardid":cid},"bir":temp};
			$.ajax({
				type:'post',
				url:basePath+'/person/updatePer',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(inf),
				success:function(data){
					if(data=="fail"){
						alert("更新失败，请稍后再试");
					}
					if(data=="success"){
						alert("更新成功");
						history.go(0);
					}
				}
			})
		}
		
		function saveCommonContact(){
			var pid = $("#pid").val();
			
			if(pid==""){
				addPer();
			}else{
				updatePer();
			}
			
		}
		var f = true;
		function selectA(){
			if(f){
				$("input:checkbox[name='checks']").each(function(){
					$(this).prop("checked",true);
				})
			}
			if(!f){
				$("input:checkbox[name='checks']").each(function(){
					$(this).prop("checked",false);
				})
			}
			f=!f;
		}
		
		function batchDel(){
			var dels = [];
			$("input:checkbox[name='checks']:checked").each(function(){
				dels.push(this.value);
			})
			$.ajax({
				type:'post',
				url:basePath+'/person/batchDel',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(dels),
				success:function(data){
					if(data=="fail"){
						alert("删除失败，请稍后再试");
					}
					if(data=="success"){
						alert("删除成功");
						history.go(0);
					}
				}
			})
		}