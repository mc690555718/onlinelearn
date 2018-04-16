//ztree start
	var setting = {
		data: {
			simpleData: {
				enable: true,
				idKey:'id',
				pIdKey:'parentId',
				rootPid:''
			},
			key:{
				name:'name',
				title:'title'
			}
		},
		callback: {
			onClick: onClick,
			onAsyncSuccess: zTreeOnAsyncSuccess//异步加载完的回调
		},
		view: {
			addDiyDom: addDiyDom,
			dblClickExpand: false,
			showLine: false,
			nameIsHTML: true
		},
		async: {
			enable: true,
			type: "post",
			url:baselocation+"/point/queryPointList",
			otherParam: [],
			dataFilter: ajaxDataFilter
		}
	};
	function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
		heightAdjust();//调整谈框高度
		$(".loading").remove();
		$.fn.zTree.getZTreeObj("treeDemo").expandAll(true);//展开全部节点
		var ZTreeObj = $.fn.zTree.getZTreeObj("treeDemo");
		if(ZTreeObj.getNodes()==""){
			$("#treeDemo").html("暂无数据，请等待上传");
		}
	}
function onClick(e,treeId, treeNode) {
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		treeObj.expandNode(treeNode);
	}
	var IDMark_Span = "_span",IDMark_A = "_a";
	function addDiyDom(treeId, treeNode) {
		var aObj = $("#" + treeNode.tId + IDMark_A);
			if ($("#diyBtn_"+treeNode.id).length>0) return;
			if(treeNode && !treeNode.isParent){
				var str='<input type="button" treeId="'+treeNode.id+'" value="随机15道" onclick="randomPointIds(this,15,1,\''+treeNode.needPay+'\')"/>';
				var str1='<input type="button" treeId="'+treeNode.id+'" value="30" onclick="randomPointIds(this,30,1,\''+treeNode.needPay+'\')"/>';
				var str2='<input type="button" treeId="'+treeNode.id+'" value="60道" onclick="randomPointIds(this,60,1,\''+treeNode.needPay+'\')"/>';
				var str3='<input type="button" treeId="'+treeNode.id+'" value="顺序" onclick="randomPointIds(this,30,2,\''+treeNode.needPay+'\')"/>';
				//var needpay=treeNode.needPay;
				var editStr = "<span id='diyBtn_space_" +treeNode.id+ "' class='ztree-right-btn'>" +
						"<label>"+str+"</label>" +
						"<label>"+str1+"</label>"+
						"<label>"+str2+"</label>"+
						"<label>"+str3+"</label></span>";
				aObj.append(editStr);
				$("#diyBtn_space_"+treeNode.id).prev().addClass("ztreeNameTxt");
				$("#diyBtn_space_"+treeNode.id).parent("a").css("height","auto");
			}
		}
	
	//ztree end
	var pointIds="";//随机组题的考点 全局变量
	function randomPointIds(obj,num,flag,needPay){
		if (!isLogin()) {
			dialog(10);
			return;
		}
		pointIds="";
		var dteeId = $(obj).attr("treeid");
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		var node = treeObj.getNodeByParam("id", dteeId, null);
		getPointIds(node);
		$("#randompointIds").val(pointIds);
		$("#randomnum").val(num);
		$("#flag").val(flag);
		$("#needPay").val(needPay);
		$("#randomtest").submit();
	}
	
	function getPointIds(treeNode){
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		treeNode = treeObj.getNodeByParam("id", treeNode.id, null);
		var childrenNode = treeNode.children;
		if(childrenNode==undefined){
			pointIds+=treeNode.id+",";
		}
		$.each($(childrenNode), function () {
			getPointIds(this);
		});
		} 
	function ajaxDataFilter(treeId, parentNode, responseData) {
		responseData = responseData.entity;
	   if (responseData) {
	      for(var i =0; i < responseData.length; i++) {
	    	  responseData[i].title = (responseData[i].name);
	    	  responseData[i].name += " (共"+responseData[i].qstCount+"道题)";
	      }
	    } 
	    return responseData;
	}
function heightAdjust(){//谈框高度调整
		var dialogEle = $(".dialog-shadow");
		var dTop = (parseInt(document.documentElement.clientHeight, 10)/2) + (parseInt(document.documentElement.scrollTop || document.body.scrollTop, 10)),
		dH = dialogEle.height(),
		dW = dialogEle.width();
	dialogEle.css({"top" : (dTop-(dH/2)) , "margin-left" : -(dW/2)});
	}
	function toSelectExamMode(){
		if (!isLogin()) {
			lrFun();
			return;
		}
		window.open('/paper/paperTypeList/1');
	}
	
	function selectExamMode(mode){
		if(mode==1){
			$("#mode").val("exam");
		}else{
			$("#mode").val("exercises");
		}
		$("#dialog-shadow").remove();
		$("#bg-shadow").remove();
		
		zhuanxiang();
	}
	function zhuanxiang(){
		var subjectid =getCookie("e.subject");
		if(!isNull(subjectid)){
			$.ajax({
				type : "POST",
				dataType : "json",
				url:baselocation+"/subj/querySubjectById",
				data : {},
				cache : true,
				async : false,
				success : function(result) {
					if (result.success == true && result.entity!=null) {
							dialog(3);
							$.fn.zTree.init($("#treeDemo"), setting);
							heightAdjust();

					}
				}
			});
		}
		
	}
	
	var examtype;
	var examtitle;
	function zujuanmokao(type,title){
		if (!isLogin()) {
			lrFun();
			return;
		}
		window.open('/paper/queryExamPaperList?queryPaper.type='+type);
		/*if(title=='组卷模考'){
			dialog(9);
		}else if(title=='论述题自测'){
			getQuestionTestNum();
		}else{
			dialog(4);
			examtype=type;
			examtitle=title;
			queryPaperListByType(examtype,1,examtitle);
			heightAdjust();
		}*/
	}
	function queryAjaxPage(pageNum){
		queryPaperListByType(examtype,pageNum,examtitle);
	}
	function queryPaperListByType(Type,currentPage,title){
		$.ajax({
			type:"POST",
			dataType:"text",
			url:baselocation+"/paper/ajax/queryPaperListByType",
			data:{"queryPaper.type":Type,"page.currentPage":currentPage},
			async:false,
			success:function(result){
				$(".paperTypeName").html(title+"-试卷列表");
				$(".pageAfter").html(result);
			}
	});
	}
	
	function queryQuestionTestNum(){
		$.ajax({
			type:"POST",
			dataType:"json",
			url:baselocation+"/paper/ajax/queryQuestionNum",
			async:false,
			success:function(result){
				var num=result.entity;
				if(num=='0'){
					$("#quesButton").hide();
					$("#questionsTest").html("");
					$("#questionsTest").html("<span class='vam c-333 fsize14 f-fM'>暂无试题</span>");
				}else{
					$("#quesNum").html("-共("+num+")道");
				}
				
			}
		});
	}
	
	function getQuestionTestNum(){
		 /*var num = $("input[name='num']:checked").val();
		 if(num=="" || num==null){
			 $("#numMessage").html("请选择随机数量");
			 return;
		 }
		 $("#num").val(num);*/
		 $("#questionForm").submit();
	}
	function clearQuestionConditions(){
		$("input[name='num']").attr("checked",false);
		$("#num").val("");
	}
	function addPage(page,Type){
		str="";
		var currentPage = page.currentPage-1<1?1:page.currentPage;
    	var totalPage = page.totalPageSize;
		if(currentPage==1){
			str=str+'<li class="disabled"><a href="###">← 上一页</a></li>';
		}else{
			var num = page.currentPage-1;
			str=str+'<li><a href="javascript:queryPaperListByType('+Type+','+num+')">← 上一页</a></li>';
		}
    	var maxNum_new = currentPage>4?4:6-currentPage;//最大显示页码数
    	var discnt=1;
    	for(var i=3; i>0; i--) {
    		if(currentPage>i) {
    			str =str+ "<li><a href='javascript:queryPaperListByType("+Type+","+(currentPage-i)+")'>"+ (currentPage-i) +"</a></li>";
    			discnt++;
			}
		}
    	str = str + '<li class="active"><a href="javascript:void(0)">'+currentPage+'</a></li>';
    	for(var i=1; i<maxNum_new; i++) {
    		if(currentPage+i<=totalPage && discnt<5) {
    			str = str + "<li><a href='javascript:queryPaperListByType("+Type+","+(currentPage+i)+")'>"+ (currentPage+i) +"</a></li>";
    			discnt++;
    		} else {
    			break;
			}
		}
    	if(totalPage==currentPage){
    		str=str+'<li class="disabled"><a href="###">下一页 →</a></li>';
    	}else{
    		str=str+'<li><a href="javascript:queryPaperListByType('+Type+','+(page.currentPage+1)+')">下一页 →</a></li>';
    	}
		$("#pageFlag").html(str);
	}
	function kuaisuzhineng(num){
		if (!isLogin()) {
			lrFun();
			return;
		}
		window.open('/paper/paperTypeList/2');
	}
	
	function getZujuanConditions(){
		 var level = $("input[name='level']:checked").val();
		 if(level=="" || level==null){
			 $("#levelMessage").html("请选择难度");
			 return;
		 }
		 var section="";
		 $("input[name='section']:checked").each(function(){
			 section+="'"+$(this).val()+"',";
		 });
		 if(section=="" || section==null){
			 $("#sectionMessage").html("请选择版块");
			 return;
		 }
		/* var qstType="";
		 $("input[name='qstType']:checked").each(function(){
			 qstType+=$(this).val()+",";
		 });
		 if(qstType=="" || qstType==null){
			 $("#qstTypeMessage").html("请选择类型");
			 return;
		 }*/
		 
		 $("#level").val(level);
		 $("#sections").val(section);
		/* $("#qstTypes").val(qstType);*/
		 
		 $("#zujuanForm").submit();
	}
	
	function clearZujuanConditions(){
		$("input[name='level']").attr("checked",false);
		$("input[name='section']").attr("checked",false);
		$("input[name='qstType']").attr("checked",false);
		 
		$("#level").val("");
		$("#sections").val("");
		$("#qstTypes").val("");
		 
	}
	/**
	 * 公共ajax登录方法
	 * @param type 登录类型 1重新加载本页面,2跳转到首页，3跳转到传来的URL
	 * @param url 要转向的路径
	 */
	function pageLogin(type,url){
			var userName=$("#userEmail").val();
			var pwd = $("#userPassword").val();
			//var autoThirty=$("#autoThirty").prop("checked")
			$("#loginMsg").hide();
	       $("#loginError").html('');
			if(!isNotEmpty(userName)||!isNotEmpty(pwd)){
				$("#loginError").html('请输入用户名和密码');
				$("#loginMsg").show();
				return false;
			}
			$.ajax({
				url : baselocation + "/dologin",
				data : {'userForm.email':userName,'userForm.password':pwd,"autoThirty":true},
				type : "post",
				dataType : "json",
				cache : false,
				async : false,
				success : function(result) {
					if(result.success){
						if(type==1){
							window.location.reload();
						}else if(type==2){
							window.location.href = baselocation+'/uc/home';
						}else if(type==3){
							window.location=url;
						}
					}else{
						if(result.message=='formDataNot'){
							$("#loginError").html('用户不存在');
						}else if(result.message=='inputIllegal'){
							$("#loginError").html('请不要输入非法数据');
						}else if(result.message=='freezed'){
							$("#loginError").html('您的帐号已被冻结，请联系客服');
						}else if(result.message=='false'){
							$("#loginError").html('用户名或者密码不正确');
						}
						$("#loginMsg").show();
					}
				}
			});
		}



var isMobileVali=false;
var isEmailVali=false;
//注册新用户
function register() {
	$("#loginMsg").hide();

	if(isNotEmpty($("#regEmail").val())==false){//验证邮箱是否为空
		$("#loginMsg").show();
		$("#regError").html('请输入邮箱');
		return;
	}
	if(isEmailVali==false){//验证邮箱唯一
		$("#loginMsg").show();
		$("#regError").html('请输入正确的邮箱');
		return;
	}
	if(isNotEmpty($("#regPwd").val())==false){//判断密码是否为空
		$("#loginMsg").show();
		$("#regError").html('请输入密码');
		return;
	}
	if(isNotEmpty($("#cusPwdConfirm").val())==false){//判断再次输入密码是否为空
		$("#loginMsg").show();
		$("#regError").html('请再次输入密码');
		return;
	}

	if($("#regPwd").val()!=$("#cusPwdConfirm").val()){//判断两次密码是否正确
		$("#loginMsg").show();
		$("#regError").html('两次输入密码不同');
		return;
	}
	if(isNotEmpty($("#regMobile").val())==false){//判断单验证是否为空手机
		$("#loginMsg").show();
		$("#regError").html('请输入手机号');
		return;
	}
	var mobileVal=$("#regMobile").val();
	var reg=/^1{1}[0-9]{10}$/; //验证手机正则
	if(mobileRegex.test(mobileVal)==false){//格式不正确
		$("#loginMsg").show();
		$("#regError").html('请输入正确的手机号');
		return;
	}
	if(isMobileVali==false){//验证手机唯一
		$("#loginMsg").show();
		$("#regError").html('该手机已经注册过');
		return;
	}


		//序列化
		var params =$("#regForm input").serialize();
		$.ajax({
			url : baselocation + "/doregister",
			data : params,
			type : "post",
			dataType : "json",
			cache : false,
			async : false,
			success : function(result) {
				if(result.success==true) {
					var forwordURL=getCookie("forward");
					if (typeof(forwordURL) != "undefined" && forwordURL) {
						DeleteCookie("forward");
						window.location.href = forwordURL.replaceAll('"','');
						return;
					}
					window.location.href = baselocation + "/quest/toQuestionitemList";
				}else if(result.message == 'formDataIsNot'){
					$("#loginMsg").show();
					$("#regError").html('表单数据不为能为空');
				}else if(result.message == 'emailIsNot'){
					$("#loginMsg").show();
					$("#regError").html('请输入邮箱');
				}else if(result.message == 'emailFormatError'){
					$("#loginMsg").show();
					$("#regError").html('请输入正确的邮箱');
				}else if(result.message == 'pwdIsNull'){
					$("#loginMsg").show();
					$("#regError").html('请输入密码');
				}else if(result.message == 'pwdNotEqual'){
					$("#loginMsg").show();
					$("#regError").html('两次密码不一致');
				}else if(result.message == "regMobileFormError") {
					$("#loginMsg").show();
					$("#regError").html('手机号码格式不正确');
				}else if(result.message == "regMobileExist") {
					$("#loginMsg").show();
					$("#regError").html('手机号码已经注册');
				}else if(result.message == "regEmailExist") {
					$("#loginMsg").show();
					$("#regError").html('您的邮箱已经注册');
				}else if(result.message =="mobileCodeError"){
					$("#loginMsg").show();
					$("#regError").html('请输入正确的手机验证码');
				}else if(result.message == "regDangerWord") {
					$("#loginMsg").show();
					$("#regError").html('请不要输入非法关键字');
				}else {
					$("#loginMsg").show();
					$("#regError").html(result.message);
				}
			},
			error : function(error) {
				dialog('注册提示','系统繁忙，请稍后再操作',1);
			}
		});
}

function emailCheck(){//单独验证email
	var emailVal=$("#regEmail").val();
	if(isNotEmpty(emailVal)==false){//验证邮箱是否为空
		$("#regError").html('请输入邮箱');
		return;
	}
	if(emailRegex.test(emailVal)==false){//格式不正确
		$("#regError").html('请输入正确的邮箱');
		return;
	}
	//验证邮箱是否存在
	$.ajax({
		url: baselocation +"/checkEmail",
		type:"post",
		data:{"userForm.email":emailVal},
		dataType: "json",
		success:function(result){
			if(result==false){
				$("#regError").html('该邮箱已经注册过');

			}else{
				$("#regError").html('');
				isEmailVali=true;
			}
		}
	});
}

function mobileCheck(){//单独验证mobile
	var mobileVal=$("#regMobile").val();
	if(isNotEmpty(mobileVal)==false){//验证手机是否为空
		$("#regError").html('请输入手机号');
		return;
	}
	if(mobileRegex.test(mobileVal)==false){//格式不正确
		$("#regError").html('请输入正确的手机号');
		return;
	}
	//验证手机是否存在
	$.ajax({
		url: baselocation +"/checkRegMoblie",
		type:"post",
		data:{"mobile":mobileVal},
		dataType: "json",
		success:function(result){
			if(result==false){
				$("#regError").html('该手机已经注册过');

			}else{
				$("#regError").html('');
				isMobileVali=true;
			}
		}
	});
}