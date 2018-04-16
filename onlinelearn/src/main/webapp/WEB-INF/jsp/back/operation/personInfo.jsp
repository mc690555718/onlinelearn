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
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>商品添加</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix">
			<form class="layui-form col-lg-5" action="" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">商品名称</label>
					<div class="layui-input-block">  
						<input type="text" name="pname"  autocomplete="off"  class="layui-input" value=""  >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品单价</label>
					<div class="layui-input-block">
						<input type="text" name="price"  autocomplete="off" class="layui-input" value="" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品数量</label>
					<div class="layui-input-block">
						<input type="text" name="salecount"  autocomplete="off" class="layui-input" value="">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品描述</label>
					<div class="layui-input-block">
						<input type="text" name="descript"  autocomplete="off" class="layui-input" >
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">商品状态</label>
					<div class="layui-input-block">
						<select name="interest" lay-filter="aihao">
							<option value=""></option>
							<option value="0" selected="selected">热卖</option>
							<option value="1">下架</option>
						</select>
					</div>
				</div>
				 
				
				
				
				<div class="layui-form-item">
					<label class="layui-form-label">图片</label>
					<div class="layui-input-block">
						<input type="file" name="pimg" class="layui-upload-file">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品类型</label>
					<div class="layui-input-block">
						<select  id="ptid" name="ptid" class="form-control">
									<option value="-1">--请选择--</option>
									<c:forEach items="${types }" var="t">
										<option value="${t.ptid }">${t.ptname }</option>
									</c:forEach>
						</select>
					</div>
				</div>

			
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['form','upload'],function(){
         var form = layui.form();
         layui.upload({ 
             url: '' ,//上传接口 
             success: function(res){
              //上传成功后的回调 
              console.log(res) 
            } 
         });

	});
</script>
</body>
</html>