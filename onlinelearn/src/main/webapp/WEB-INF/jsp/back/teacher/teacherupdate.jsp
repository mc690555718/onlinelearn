<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="/css/personal.css" media="all">
	
	<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
	
      <style type="text/css">

	#t{
	border: 1px solid;
	width: 200px;
	height: 200px;
	background-image:1px;
	}
	</style>
	
<script type="text/javascript">
 	function update() {
		document.forms[0].action = "/teacher/update";
		document.forms[0].submit();

	}

</script>
	
	
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>添加讲师</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix changepwd">
			<form class="layui-form col-lg-4" method="post" action="/teacher/update" enctype="multipart/form-data">
			<div class="layui-form-item">
					<div class="layui-input-block">  
					  	<input type="text" name="id"  value="${a.id }" class="layui-input layui-disabled"   >
					</div>
				</div>
			
			 	<div class="layui-form-item">
					<label class="layui-form-label">讲师名称</label>
					<div class="layui-input-block">  
					  	<input type="text" name="name"  value="${a.name }"   class="layui-input"   >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">讲师资历</label>
					<div class="layui-input-block">  
					  	<input type="text" name="education" value="${a.education }"    class="layui-input"  >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">讲师专业</label>
					<div class="layui-input-block">  
					  	<input type="text" name="subject_id" value="${a.subject_id }"   class="layui-input" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">讲师等级</label>
					<div class="layui-input-block">  
					  	<select  id="ptid" name="ptid" class="form-control">
									<option value="">--请选择--</option>
									<option value="">首席讲师</option>
									<option value="">高级讲师</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">讲师排序</label>
					<div class="layui-input-block">  
					  	<input type="text" name="sort" value="${a.sort }"   class="layui-input" >
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">讲师简介</label>
					<div class="layui-input-block">  
					  	<textarea class="form-control" rows="3" name="career" id="career">${a.career }</textarea>
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">讲师头像</label>
					<div class="layui-input-block">
					<div>
					<div class="col-sm-4">
				<img id="blah" style="width:530px; height:250px;" />
				<input type="file" name="file" id="imgInp">
			</div>
					</div>
					</div>
				</div>
				
				<div class="layui-form-item change-submit">
					<div class="layui-input-block">
						<button class="layui-btn" onclick="update()">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript">

//div显示图片
function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
$("#imgInp").change(function() {
	readURL(this);
});


	layui.use(['form','upload'],function(){
         var form = layui.form();
	});
	
	$(function(){
		$("#pbid").val("${product.pbrand.pbid}");
		$("#ptid").val("${product.productType.ptid}");
	         }
			)
</script>
</body>
</html>