<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加章节</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css"
	href="/static/common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css"
	href="/common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="/validate/dist/validation.css" media="all">
<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
<script type="text/javascript" src="/static/common/layui/layui.js"></script>
<script type="text/javascript" src="/static/common/layui/layui.all.js"></script>
<script type="text/javascript" src="/js/jquery-form.js"></script>
<script type="text/javascript" src="/validate/lib/jquery.js"></script>
<script type="text/javascript" src="/validate/dist/jquery.validate.js"></script>
<script type="text/javascript"
	src="/validate/dist/localization/messages_zh.js"></script>
<style type="text/css">
form {
	height: 500px;
}

</style>
</head>
<body>

<script type="text/javascript">
var num = 0;
var t1 = null;
//一个上传动画定时器
function uploading(){ 
	var title = "上传中,请耐心等待";
	for(var i = 0 ; i<=num;i++){
		if(num<6){
			title+=".";
		}else{
			num = 0;
			title+=".";
		}
	}
	num++;
	$("#upload_tittle").text(title);
} 

	$(function() {
		
		layui.use('form', function(){
			var form = layui.form; //只有执行了这一步，部分表单元素才会修饰成功 
		});
		
		layui.use('layer', function(){ //独立版的layer无需执行这一句
			  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
		});
		
		//检测是否存在视频路径
		var video_path = $("#video_url").val();
		if(video_path != null && video_path.trim() != ""){
			$("#upload_tittle").text("已存在视频文件");
		}
		
		//教师列表下拉框赋值
		layui.use('form', function() {
			var form = layui.form; //只有执行了这一步，部分表单元素才会修饰成功 
			$.post("/admin/cou/getTeacher/" + $("#course_id").val(),
					function(msg) {
						for (var i = 0; i < msg.length; i++) {
							$("#teacher_id").append(
									"<option value='"+msg[i].id+"' >"
											+ msg[i].name + "</option>");
						}
						var teacher = ${kpoint.teacher_id};
						$("#teacher_id").val(teacher);
						form.render();
					}, "json");
		});
		
			//加载上传组件
		layui.use('upload', function() {
			
			var upload = layui.upload; //得到 upload 对象
			  upload.render({
				    elem: '#vedio_btn'//上传资源
				    ,url: '/admin/cou/uploadVideo'
				    ,auto: false//自动上传  取消
				    ,accept: 'file' //普通文件
				    ,exts: 'ram|avi|mov|qt|wmv|vob|mpeg|asf|mp4|mpg|mpe|rmvb' //只允许上传视频文件
				    ,method:'post'
				    ,size:'524288000'//kb
				    ,bindAction: '#start_upload'//激活上传
				    ,before : function(input) {
				    	t1 = window.setInterval(uploading,200); 
					}
				    ,done: function(res){
				    	window.clearInterval(t1);
				    	$("#upload_tittle").css({"color":"green"});
				    	$("#upload_tittle").text("上传成功");
				    	$("#video_url").val(res.video_url);
				    }
				    ,error : function(){
				    	window.clearInterval(t1);
				    	$("#upload_tittle").css({"color":"red"});
				    	$("#upload_tittle").text("上传失败");
				    }
			 });
		});
});

	//重置按钮点击
	function cleanText() {
		$("#name").val("");
		$("#sort").val("");
		$("#play_time").val("");
		$("#play_count").val("");
		$("#is_free").val("");
		$("#teacher_id").val("");
	}
	
	//异步提交按钮,修改节点
	function updateKpoint() {
		
		var freecheck = $("#free").is(":checked");
		if (freecheck) {
			$("#is_free").val(2);
		} else {
			$("#is_free").val(1);
		}

		$.ajax({
			url : "/admin/cou/updateKpoint",
			data : $('#kpointForm').serialize(),
			dataType : "json",
			success : function(data) {
				parent.location.reload();
			}
		});
	}
</script>

	<form id="kpointForm" class="layui-form" action="" method="post">

		<input type="hidden" id="course_id" name="course_id"
			value="${kpoint.course_id}" /> <input type="hidden" id="kpoint_id"
			name="kpoint_id" value="${kpoint.kpoint_id}" />

		<!-- 节点名称 -->
		<div class="layui-form-item">
			<label class="layui-form-label">节点名称</label>
			<div class="layui-input-inline">
				<input type="text" name="name" id="name" placeholder="请输入2-10长度的节点名称(不包括标点符号)"
				autocomplete="off" class="layui-input" style="width: 240px" value="${kpoint.name}">
			</div>
		</div>

		<!-- 视频上传 -->
		<div class="layui-form-item">
			<label class="layui-form-label">视频上传</label>
			<div class="layui-input-block">
  			        <button class="layui-btn layui-btn-normal" id="vedio_btn" name="vedioFile" type="button">选择文件</button>
  			        <button class="layui-btn" id="start_upload" type="button">开始上传</button>
					<input type="hidden" name="video_url" id="video_url" value="${kpoint.video_url}"/>
			</div>
			<div class="layui-form-mid layui-word-aux" id="upload_tittle">请选择视频文件</div>
		</div>

		<!-- 排序 -->
		<div class="layui-form-item">
			<label class="layui-form-label">热度</label>
			<div class="layui-input-inline">
				<input type="number" name="sort" id="sort" placeholder="请输入热度值，并保证它们是正整数"
				autocomplete="off" class="layui-input" style="width: 240px" value="${kpoint.sort}">
			</div>
		</div>

		<!-- 播放次数 -->
		<div class="layui-form-item">
			<label class="layui-form-label">播放次数</label>
			<div class="layui-input-block">
				<input type="number" name="play_count" id="play_count"  placeholder="请输入播放次数，并保证它们是正整数"
				autocomplete="off" class="layui-input" style="width: 240px" value="${kpoint.play_count}">
			</div>
		</div>

		<!-- 播放时间 -->
		<div class="layui-form-item">
			<label class="layui-form-label">播放时间</label>
			<div class="layui-input-block">
				<input type="text" name="play_time" id="play_time" 
				autocomplete="off" class="layui-input" value="${kpoint.play_time }">
			</div>
		</div>

		<!-- 收费 :1免费 2收费 -->
		<c:if test="${kpoint.is_free==1}">
			<div class="layui-form-item">
				<label class="layui-form-label">收费</label>
				<div class="layui-input-block">
					<input type="checkbox" name="free" id="free" lay-skin="switch"/> 
					<input type="hidden" value="${kpoint.is_free}" id="is_free" name="is_free" />
				</div>
			</div>
		</c:if>
		<c:if test="${kpoint.is_free==2}">
			<div class="layui-form-item">
				<label class="layui-form-label">收费</label>
				<div class="layui-input-block">
					<input type="checkbox" name="free" id="free" lay-skin="switch" checked="checked"> 
					<input type="hidden" value="${kpoint.is_free}" id="is_free" name="is_free" />
				</div>
			</div>
		</c:if>

		<!-- 选择讲师 -->
		<div class="layui-form-item">
			<label class="layui-form-label">选择讲师</label>
			<div class="layui-input-inline">
				<select name="teacher_id" id="teacher_id" lay-verify="required">
					<option value="-1">--请选择--</option>
				</select>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="button" class="layui-btn" id="btn_submit">确认修改</button>
				<button type="button" class="layui-btn layui-btn-primary"
					onclick="cleanText()">重置</button>
			</div>
		</div>
	</form>

	<script>
	//验证教师
	function checkTeacher(){
		var teacher_id = $("#teacher_id").val();
		if(teacher_id > 0){
			return true;
		}
		layer.msg('请选择视频讲师', {icon: 5});
		return false;
	}
	
    $(function(){
    	
    	//验证规则
   	 $("#kpointForm").validate({
   		    rules: {
   		      name: {
   		        required: true,
   		        rangelength:[3,10]
   		      },
   		      sort: {
   		        required: true,
   		        digits:true,
   		        min:0
   		      },
   		      play_count: {
   		    	required: true,
   		    	digits:true,
   		        min:0
   		      }
   		    },
   		    messages: {
   		      name:{
   		    		required :"请输入视频节点名",
   		    		rangelength:"节点名称应在3-10长度之间"
   		      },
   		      sort: {
   			        required: "请输入热度值",
   			        digits:"热度值应输入数字格式",
   			        min:"热度值应为正整数"
   			  },
   			  play_count: {
   				    required: "请输入播放次数",
			        digits:"播放次数应输入数字格式",
			        min:"播放次数应为正整数"
   	   		  }
   		     }
   		    });



//异步提交按钮,添加节点
	$("#btn_submit").click(function(){
	
        //检查收费 开关  并给隐藏域赋值 准备提交
		var freecheck  =  $("#free").is(":checked");
		if(freecheck){
			$("#is_free").val(2);
		}else{
			$("#is_free").val(1);
		}
	
   	   var flag = $("#kpointForm").valid();
	     if(!flag || !checkTeacher()){
	         //没有通过验证
	         return;
	     }
		
		 $.ajax({
   	      url:"/admin/cou/addKpoint",
    	     data:$('#kpointForm').serialize(),
        	 dataType:"json",
        	 success:function(data){
        		 parent.location.reload();
        	 }
     });

});
    	
    });

	</script>
</body>
</html>