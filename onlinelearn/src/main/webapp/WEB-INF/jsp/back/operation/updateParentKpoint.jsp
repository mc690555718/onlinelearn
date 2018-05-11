<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
	href="/common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css"
	href="/common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
<script type="text/javascript" src="/common/layui/layui.js"></script>
<script type="text/javascript" src="/js/jquery-form.js"></script>
<style type="text/css">
form {
	height: 500px;
}
</style>
</head>
<body>
	<form id="kpointForm" class="layui-form" action="" method="post">
			
		<input type="hidden" id="kpoint_id"
			name="kpoint_id" value="${kpoint.kpoint_id}" />

		<!-- 节点名称 -->
		<div class="layui-form-item">
			<label class="layui-form-label">节点名称</label>
			<div class="layui-input-inline">
				<input type="text" name="name" id="name" value="${kpoint.name}" required
					lay-verify="required" autocomplete="off" class="layui-input">
			</div>
		</div>


		<!-- 排序 -->
		<div class="layui-form-item">
			<label class="layui-form-label">热度</label>
			<div class="layui-input-inline">
				<input type="text" name="sort" id="sort" value="${kpoint.sort}" required
					lay-verify="required" autocomplete="off" class="layui-input">
			</div>
		</div>



		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="button" class="layui-btn" onclick="updateKpoint()">确认修改</button>
				<button type="button" class="layui-btn layui-btn-primary"
					onclick="cleanText()">重置</button>
			</div>
		</div>
	</form>

	<script>
	
	$(function(){
		layui.use('form', function(){
			var form = layui.form(); //只有执行了这一步，部分表单元素才会修饰成功 
		}); 
	});

	
	//重置按钮点击
	function cleanText(){
		    $("#name").val("");
		    $("#sort").val("");
	}
	//异步提交按钮,添加
	function updateKpoint(){
		
		 $.ajax({
             url:"/admin/cou/updateKpoint",
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