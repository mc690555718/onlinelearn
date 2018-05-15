<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>个人信息</title>
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
</head>

<body style="width: 100%; height: 100%;">
	<section class="layui-larry-box ">
	<div class="larry-personal">
		<div class="layui-tab">
			<!-- 用户详情 -->
			<form class="layui-form" action="" method="post"
				style="height: 550px;">
				<input type="hidden" id="aid" name="user_id" value="${user.user_id}" />
				<!-- 用户名 -->
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<input type="text" name="login_name" value="${user.login_name}"
							required lay-verify="required" autocomplete="off"
							class="layui-input layui-disabled" disabled>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名</label>
					<div class="layui-input-inline">
						<input type="text" name="user_name" value="${user.user_name}"
							required lay-verify="required" autocomplete="off"
							class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">Tel</label>
					<div class="layui-input-block">
						<input type="text" name="tel" value="${user.tel}" required
							lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">状态</label>
					<div class="layui-input-block">
						<input type="radio" name="user_status" value="0" title="正常">
						<input type="radio" name="user_status" value="1" title="冻结">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">角色</label>
					<div class="layui-input-inline">
						<select name="role_id" lay-verify="required" id="sel_role">
							<option value="-1">--------请选择角色-------</option>
							<c:forEach items="${roles}" var="role">
								<c:if test="${user.role.role_id == role.role_id}">
									<option value="${role.role_id}" selected>${role.role_name}</option>
								</c:if>
								<c:if test="${user.role.role_id != role.role_id}">
									<option value="${role.role_id}">${role.role_name}</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" id="btn_submit" lay-filter="formDemo">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>

			</form>


			<!-- 完 -->

		</div>
	</div>

	</section>
	<script type="text/javascript" src="/static/common/layui/layui.js"></script>
	<script>
$(function(){
	
	layui.use('form', function(){
		var form = layui.form; //只有执行了这一步，部分表单元素才会修饰成功 
	});

	var radioIndex = ${user.status};
	$('input:radio[name=user_status]')[radioIndex].checked = true;
	$("#btn_submit").click(function(){
		document.forms[0].action="/admin/sysuser/sysuseredit";
		document.forms[0].submit();
	});
});

</script>
</body>
</html>