<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
<script type="text/javascript" src="/static/common/layui/layui.js"></script>
<script type="text/javascript" src="/static/common/layui/layui.all.js"></script>
<script type="text/javascript" src="/js/jquery-form.js"></script>
<style type="text/css">
form {
	height: 500px;
}
</style>
</head>
<body>
	<form id="kpointForm" class="layui-form" action="" method="post">
		<input type="hidden" id="course_id" name="course_id"
			value="${kpoint.course_id}" /> <input type="hidden" id="parent_id"
			name="parent_id" value="${kpoint.parent_id}" />

		<!-- 节点名称 -->
		<div class="layui-form-item">
			<label class="layui-form-label">节点名称</label>
			<div class="layui-input-inline">
				<input type="text" name="name" id="name" required
					lay-verify="required" autocomplete="off" class="layui-input">
			</div>
		</div>

		<!-- 视频上传 -->
		<div class="layui-form-item">
			<label class="layui-form-label">视频上传</label>
			<div class="layui-input-block">
  			        <button class="layui-btn layui-btn-normal" id="vedio_btn" name="vedioFile" type="button">选择文件</button>
  			        <button class="layui-btn" id="start_upload" type="button">开始上传</button>
					<input type="hidden" name="video_url" id="video_url" value=""/>
			</div>
			<div class="layui-form-mid layui-word-aux" id="upload_tittle">请选择视频文件</div>
		</div>

		<!-- 排序 -->
		<div class="layui-form-item">
			<label class="layui-form-label">热度</label>
			<div class="layui-input-inline">
				<input type="text" name="sort" id="sort" required
					lay-verify="required" autocomplete="off" class="layui-input">
			</div>
		</div>

		<!-- 播放次数 -->
		<div class="layui-form-item">
			<label class="layui-form-label">播放次数</label>
			<div class="layui-input-block">
				<input type="text" name="play_count" id="play_count" required
					lay-verify="required" autocomplete="off" class="layui-input">
			</div>
		</div>

		<!-- 播放时间 -->
		<div class="layui-form-item">
			<label class="layui-form-label">播放时间</label>
			<div class="layui-input-block">
				<input type="text" name="play_time" id="play_time" required
					lay-verify="required" autocomplete="off" class="layui-input">
			</div>
		</div>

		<!-- 收费 :1免费 2收费 -->
		<div class="layui-form-item">
			<label class="layui-form-label">收费</label>
			<div class="layui-input-block">
				<input type="checkbox" name="free" id="free" lay-skin="switch">
				<input type="hidden" value="" id="is_free" name="is_free" />
			</div>
		</div>

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
				<button type="button" class="layui-btn" onclick="addKpoint()">立即提交</button>
				<button type="button" class="layui-btn layui-btn-primary"
					onclick="cleanText()">重置</button>
			</div>
		</div>
	</form>

	<script>
	
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
	
	
	$(function(){
		layui.use('form', function(){
			var form = layui.form; //只有执行了这一步，部分表单元素才会修饰成功 
			//异步加载教师下拉框
			$.post("/admin/cou/getTeacher/"+$("#course_id").val(),function(msg){
				for(var i = 0;i < msg.length;i++){
					$("#teacher_id").append("<option value='"+msg[i].id+"' >"+msg[i].name+"</option>");
				}
				form.render();
			},"json");
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
	function cleanText(){
		    $("#name").val("");
		    $("#sort").val("");
		    $("#play_time").val("");
		    $("#play_count").val("");
		    $("#is_free").val("");
		    $("#teacher_id").val("");
	}
	//异步提交按钮,添加
	function addKpoint(){
		var freecheck  =  $("#free").is(":checked");
		if(freecheck){
			$("#is_free").val(2);
		}else{
			$("#is_free").val(1);
		}
		
		 $.ajax({
             url:"/admin/cou/addKpoint",
             data:$('#kpointForm').serialize(),
             dataType:"json",
             success:function(data){
            	 parent.location.reload();
             }
         });

	}

	</script>
</body>
</html>