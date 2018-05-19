<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>课程添加</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link href="/js/utf8-jsp/themes/default/css/umeditor.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css"
	href="/common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
<link href="/js/utf8-jsp/themes/default/css/umeditor.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/validate/dist/validation.css" media="all">
<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
<script type="text/javascript" src="/common/layui/layui.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/js/utf8-jsp/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/js/utf8-jsp/umeditor.min.js"></script>
<script type="text/javascript" src="/js/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="/validate/lib/jquery.js"></script>
<script type="text/javascript" src="/validate/dist/jquery.validate.js"></script>
<script type="text/javascript"
	src="/validate/dist/localization/messages_zh.js"></script>
<style type="text/css">
#time1 {
	display: none
}

#tea1 {
	display: block;
	overflow: hidden;
	white-space: nowrap;
}

#tea1.li {
	list-style: none;
	display: inline-block; //
	使li对象显示为一行 width: 130px;
	border: 1px solid black;
}

#context {
	display: none;
}
</style>
<script type="text/javascript">
	
	var teas = new Array();
	var tean = new Array();

	//layui加载表单
	function renderForm() {
		layui.use('form', function() {
			var form = layui.form();//高版本建议把括号去掉，有的低版本，需要加()
			form.render();
		});
	}

	

	//子专业下拉框动态赋值
	layui.use('form', function() {
		var form = layui.form();
		form.on('select(subId)', function(data) {
			var parent_id = data.value;
			$("#subject_id").empty();
			$("#subject_id").append("<option value='-1'>--请选择--</option>");
			if (parent_id > 0) {
				$.post("/admin/cou/getSubject/" + parent_id, function(data) {
					for (var i = 0; i < data.length; i++) {
						$("#subject_id").append(
								"<option value='"+data[i].subject_id+"'>"
										+ data[i].subject_name + "</option>");
					}
					form.render();
				}, "json");
			}
			renderForm();
		});
		
		//结束时间下拉框变动
		form.on('select(loseTy)', function(data) {
			if (data.value == 0) {
				$("#day1").css("display", "none");
				$("#time1").css("display", "block");
			} else if (data.value == 1) {
				$("#day1").css("display", "block");
				$("#time1").css("display", "none");
			}
			form.render();
		});

	});
	
	//checkbox动态操作
	function addTeacher(){
		
		var html =  "     <div class='layui-form-item'>                                                           "
			+ "     <label class='layui-form-label'>选择教师</label>                                                 "
			+ "     <div class='layui-input-block' id='checkDiv'>                                                 "
			+ "     </div>                                                                                        "
			+ "     </div>                                                                                        ";
			

	layer.open({
				type : 1,
				title : '选择教师',
				skin : 'layui-layer-rim',
				offset : '150px',
				btnAlign : 'c', //按钮居中
				shade : 0, //不显示遮罩
				maxmin : true, //开启最大化最小化按钮
				area : [ '420px', 'auto' ],
				btn : '确定',
				content : html,
				yes : function() {
					//将选中的checkbox写入数组，并且进行数组中已存在的筛选
					 $.each($('input:checkbox:checked'),function(){
						 var tid = $(this).val();
						 var tname = $(this).next().html();
							teas.push(tid);
			            	tean.push(tname);
			            });
					layer.closeAll();
					
				    for(var i=0 ;i < teas.length;i++){
					    $("#tea1").append("<li value='"+teas[i]+"' c='"+tean[i]+"'>"+tean[i]+"<a href='javascript:;' onclick='removeTeacher(this)'><i class='layui-icon'>&#x1006;</i></a></li>");
				    }	
				}
			});
    //加载checkbox
	$.post("/admin/cou/getTeachers",function(data){
		for (var i = 0; i < data.length; i++) {
		    $("#checkDiv").append("<input name='teacher_ids' title='"+data[i].name+"' type='checkbox' value='"+data[i].id+"'/><span>"+data[i].name+"</span>");
		}
		//检查数组存在项在checkbox中处于选中状态
		if (teas.length>0){
			for(var i=0;i<teas.length;i++){  
		        $("input[name='teacher_ids']").each(function(){ 
		            if($(this).val()==teas[i]){  
		                $(this).attr("checked","checked");  
		            }  
		        })  
		    }  
			//清空数组和ul显示
			teas.length=0;
			tean.length=0;
			$("#tea1 li").remove();
		}

	},"json");
    
	}
	//删除ul 
	function removeTeacher(a){
		var tid = $(a).parent("li").attr("value");
		var tname = $(a).parent("li").attr("c");
		$(a).parent("li").remove();
		for(var i = 0;i<teas.length;i++){
			if(teas[i] == tid){
				teas.splice(i,1);
				tean.splice(i,1);
				break;
			}
		}
	}
	
			//清空输入框
			function cleanText(){
				$("#course_name").val("");
				$("#parent_id").val("-1");
				$("#is_avaliable").val("-1");
				$("#lession_num").val("");
				$("#source_price").val("");
				$("#current_price").val("");
				$("#loseType").val("1");
				$("#tea1").remove("li");
				$("#lose_time").val("");
				$("#end_time").val("");
				$("#title").val("");
				$("#logo").val("");
				$("#context").val("");
				teas.length=0;
				tean.length=0;
				$("#pic").attr("src","");
				$("#subject_id").empty();
				$("#subject_id").append("<option value='-1'>--请选择--</option>");
			}

			

</script>
</head>
<body>
	<section class="layui-larry-box">
		<div class="larry-personal">
			<header class="larry-personal-tit">
				<span id="sp1">编辑课程</span>
			</header>
			<!-- /header -->
			<div class="larry-personal-body clearfix">
				<form class="layui-form col-lg-6" action="#" method="post"
					id="courseUpdateForm">
					<input type="hidden" name="course_id" id="course_id"
						value="${course.course_id}" />
					<div class="layui-form-item">
						<label class="layui-form-label ">课程名称:</label>
						<div class="layui-input-block">
							<input type="text" id="course_name" name="course_name"
								autocomplete="off" class="layui-input"
								value="${course.course_name}">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">专业分类:</label>
						<div class="layui-input-inline">
							<select class="layui-input" width="150" lay-filter="subId"
								name="parent_id" id="parent_id">
								<option value="-1" selected="selected">--请选择--</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select class="layui-input" width="150" lay-filter="subjId"
								name="subject_id" id="subject_id">
								<option value="-1" selected="selected">--请选择--</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">状态:</label>
						<div class="layui-input-block">
							<select class="layui-input" width="150" name="is_avaliable"
								id="is_avaliable">
								<option value="1" selected="selected">上架</option>
								<option value="2">下架</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">总课时:</label>
						<div class="layui-input-block">
							<input type="text" id="lession_num" name="lession_num"
								autocomplete="off" class="layui-input "
								value="${course.lession_num}">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">课程原价格:</label>
						<div class="layui-input-block">
							<input type="text" id="source_price" name="source_price"
								autocomplete="off" class="layui-input "
								value="${course.source_price}">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">课程销售价格:</label>
						<div class="layui-input-block">
							<input type="text" id="current_price" name="current_price"
								autocomplete="off" class="layui-input"
								value="${course.current_price}" />
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">有效期类型:</label>
						<div class="layui-input-block">
							<select class="layui-input" width="150" lay-filter="loseTy"
								name="loseType" id="loseType">
								<option value="0">到期时间</option>
								<option value="1" selected="selected">按天数</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item" id="day1">
						<label class="layui-form-label">按天数:</label>
						<div class="layui-input-block">
							<input type="text" id="lose_time" name="lose_time"
								autocomplete="off" class="layui-input"
								value="${course.lose_time}" />天
						</div>
					</div>
					<div class="layui-form-item" id="time1">
						<label class="layui-form-label">有效结束时间:</label>
						<div class="layui-input-block">
							<c:if test="${course.end_time!=null}">
								<input type="date" id="end_time" name="endTime"
									autocomplete="off" class="layui-input"
									value="<fmt:formatDate value='${course.end_time}' pattern='yyyy-MM-dd'/>" />
							</c:if>
							<c:if test="${course.end_time==null}">
								<input type="date" id="end_time" name="endTime"
									autocomplete="off" class="layui-input" />
							</c:if>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label ">添加教师:</label>
						<div id="ddiv" class="layui-input-block">
							<input type="hidden" id="teacher_id" name="teacher_id">
							<ul id="tea1"></ul>
							<a href="javascript:;" onclick="addTeacher()"
								class="layui-btn layui-btn-sm layui-btn-primary"> <i
								class="layui-icon">&#xe608;</i>
							</a>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label ">课程简介:</label>
						<div class="layui-input-block">
							<input type="text" id="title" name="title" autocomplete="off"
								class="layui-input" value="${course.title}" />
						</div>
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label ">课程图片:</label>
						<div class="layui-input-block">
							<div class="site-demo-upload">
								<img id="pic" src="" alt="logo" /> <input type="hidden"
									id="logo" name="logo" />
								<div class="site-demo-upbar">
									<input name="logo1" class="layui-upload-file" id="logo1"
										type="file">
								</div>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label ">课程详情:</label>
						<div class="layui-input-block">
							<script type="text/plain" id="myEditor"
								style="width: 650px; height: 240px;">
                                <p>${course.context}</p>
                            </script>
							<textarea rows="5" id="context" name="context" cols="78"
								class="layui-textarea"></textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" id="btn_submit" type="button">立即提交</button>
							<button type="reset" onclick="cleanText()"
								class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<script type="text/javascript">

//验证课程名称
function bulr_courseName(){
	var courseName = $("#course_name").val();
	if(courseName == null || courseName.trim().length == 0){
		layer.msg('请输入课程名称', {icon: 5});
		layer.tips('请输入课程名称','#course_name');
		return false;
	}else{
		var checkCname =  /^[\u4E00-\u9FA5A-Za-z0-9]{3,20}$/;
		if(!checkCname.test(courseName)){
			layer.msg('请输入合法的课程名称', {icon: 5});
			layer.tips('请输入长度为3~20的字符','#course_name');
			return false;
		}else{
			return true;
		}
	}
}

//验证总课时
function bulr_LessNum(){
	var lessNum = $("#lession_num").val();
	if(lessNum == null || lessNum.trim().length == 0){
		layer.msg('请输入总课时', {icon: 5});
		layer.tips('请输入总课时','#lessNum');
		return false;
	}else{
		var checkNum = /^[1-9]\d*$/;
		if(!checkNum.test(lessNum)){
			layer.msg('请输入合法的总课时数', {icon: 5});
			layer.tips('请输入正确的课程数,并保证它们是正整数','#lessNum');
			return false;
		}else{
			return true;
		}
	}
}

//验证原价
function bulr_sourcePrice(){
	var souPri = $("#source_price").val();
	if(souPri == null || souPri.trim().length == 0){
		layer.msg('请输入原价金额', {icon: 5});
		layer.tips('请输入原价金额','#sourse_price');
		return false;
	}else{
		var res = /^[0-9]+(.[0-9]{1,2})?$/;
		if(!res.test(souPri)){
			layer.msg('原价输入不合法,请检查输入', {icon: 5});
			layer.tips('请输入合法的金额,可留小数点后两位','#sourse_price');
			return false;
		}else{
			return true;
		}
	}
}

//验证售价
function bulr_currentPrice(){
	var curPri = $("#current_price").val();
	if(curPri == null || curPri.trim().length == 0){
		layer.msg('请输入售价金额', {icon: 5});
		layer.tips('请输入售价金额','#sourse_price');
		return false;
	}else{
		var res = /^[0-9]+(.[0-9]{1,2})?$/;
		if(!res.test(curPri)){
			layer.msg('售价输入不合法,请检查输入', {icon: 5});
			layer.tips('请输入合法的金额,可留小数点后两位','#current_price');
			return false;
		}else{
			return true;
		}
	}
}

//验证结束时间
function bulr_endTime(){
	var endType = $("#loseType").val();
	if(endType == 0){//按天数
		
		var endTime = $("#end_time").val(); 
	    if(endTime == null || endTime.trim().length == 0){
	    	layer.msg('请输入结束日期', {icon: 5});
			return false;
	    }else{
// 	    	var res = /\d{4}\/([[0]\d{1}]|[1][12])\/(([0][1-9])|([12]\d{1})|([3][01]))/;
// 	    	if(!res.test(endTime)){
// 	    		layer.msg('请输入正确的日期格式', {icon: 5});
// 				return false;
// 	    	}else{
	    		return true;
// 	    	}
	    }
		
	}else{//按到期时间
		
		var loseTime = $("#lose_time").val(); 
	    if(loseTime == null || loseTime.trim().length == 0){
	    	layer.msg('请输入到期时间天数', {icon: 5});
			layer.tips('请输入到期时间天数','#lose_time');
			return false;
	    }else{
	    	var res = /^[1-9]\d*$/;
	    	if(!res.test(loseTime)){
		    	layer.msg('请输入正确的天数,并保证它们是正整数格式', {icon: 5});
				layer.tips('请输入正确的天数,并保证它们是正整数格式','#lose_time');
				return false;
	    	}else{
	    		return true;
	    	}
	    }
	}
}

function checkSub(){
    var parentId = $("#parent_id").val();
    var subjectId = $("#subject_id").val();
    if(parentId != -1 || subjectId != -1){
    	return true;
    }
    layer.msg('请选择课程专业', {icon: 5});
    return false;
}

function checkTeacher(){
	if(teas.length != 0 || tean.length != 0){
		return true;
	}
	layer.msg('请选择教师', {icon: 5});
	return false;
}

function checkForm(){
	if(bulr_courseName() && bulr_LessNum() && bulr_LessNum() && bulr_sourcePrice() && bulr_currentPrice() &&
			bulr_endTime() && checkSub() && checkTeacher()){
	    return true;
	}
	return false;
}

	
$(function() {
		
		layui.use('form', function() {
			var form = layui.form; //只有执行了这一步，部分表单元素才会修饰成功 
		});
		
		layui.use('layer', function(){ //独立版的layer无需执行这一句
			  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
		});
		
		//父专业下拉框赋值
		$.post("/admin/cou/getParent", function(data) {
			for (var i = 0; i < data.length; i++) {
				$("#parent_id").append(
						"<option value='"+data[i].subject_id+"'>"
								+ data[i].subject_name + "</option>");
			}
			//此处开始加载个人信息		
			
			//父专业下拉框赋值
			var link = "${course.subject_link}";
			var subs = link.split(",");
			$("#parent_id").val(subs[0]);
			
			//根据父下拉加载子下拉框
			var parent_id = $("#parent_id").val();
			$.post("/admin/cou/getSubject/" + parent_id, function(msg) {
				for (var i = 0; i < msg.length; i++) {
					$("#subject_id").append(
							"<option value='"+msg[i].subject_id+"'>"
									+ msg[i].subject_name + "</option>");
				}

				//个人子专业框赋值
				var sub = ${course.subject.subject_id};
				$("#subject_id").val(sub);
				renderForm();
			}, "json");
			
			renderForm();
		}, "json");
	
		
//day1  lose_time   天数                         time1    end_time  时间	
//  加载到期  时间控件
		var losetp = ${course.loseType};
        $("#loseType").val(losetp);
        if($("#loseType").val()==0){
			$("#day1").css("display", "none");
			$("#time1").css("display", "block"); 
		}else{
			$("#day1").css("display", "block");
			$("#time1").css("display", "none");
        }
		
		
	}, "json");


		
		//加载课程图片
		var logoPath = "${course.logo}";
		if(logoPath != null || logoPath.trim().length != 0){
			$("#pic").attr("src",logoPath);
			$("#logo").val(logoPath);
		}
		
		//教师数组,ul,checkbox进行赋值
        $.post("/admin/cou/getTeacher/" + "${course.course_id}", function(info) {
        	for (var i = 0; i < info.length; i++) {
                teas[i] = info[i].id;
                tean[i] = info[i].name;
                $("#checkDiv").append("<input name='teacher_ids' title='"+info[i].name+"' type='checkbox' value='"+info[i].id+"'/><span>"+info[i].name+"</span>");
                $("#tea1").append("<li value='"+teas[i]+"' c='"+tean[i]+"'>"+tean[i]
                +"<a href='javascript:;' onclick='removeTeacher(this)'><i class='layui-icon'>&#x1006;</i></a></li>");
        	}
        },"json");
		
		
		//验证提交
		$("#btn_submit").click(function() {
	 		//添加教师链   字符串
	 		var teach = "";
	 		for(var i = 0;i < teas.length;i++){
	 			teach += teas[i];
	 			if(i < teas.length-1){
	 				teach += ",";
	 			}
	 		}
	 		$("#teacher_id").val(teach);
			
	 		if (checkForm()){
				var um = UM.getEditor("myEditor");
				var p = um.getContentTxt();
				$("#context").val(p);
	 		    document.forms[0].action="/admin/cou/updateCourse";
	 		    document.forms[0].submit();
	 		}
		});
		

	
	layui.use('upload', function(){
		  
		  layui.upload({
		    url: '/admin/cou/uploadImg'
		    ,elem: '#logo1' //指定原始元素，默认直接查找class="layui-upload-file"
		    ,method: 'post' //上传接口的http类型
		    ,success: function(res){
		    	$('#pic').attr('src',res); 
		 		$("#logo").val(res);
		    }
		  });
		});

		//实例化编辑器
		var um = UM.getEditor("myEditor");
	</script>
</body>
</html>