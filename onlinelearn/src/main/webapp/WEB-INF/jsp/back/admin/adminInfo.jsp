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
<link rel="stylesheet" type="text/css"
	href="/validate/dist/validation.css" media="all">
<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
<script type="text/javascript" src="/validate/lib/jquery.js"></script>
<script type="text/javascript" src="/validate/dist/jquery.validate.js"></script>
<script type="text/javascript" src="/validate/dist/localization/messages_zh.js"></script>
</head>

<body style="width: 100%; height: 100%;">
	<section class="layui-larry-box ">
	<div class="larry-personal">
		<div class="layui-tab">
			<!-- 用户详情 -->
			<form class="layui-form" action="" method="post"
				style="height: 550px;" id="userUpdateForm" name="userUpdateForm">
				<input type="hidden" id="aid" name="user_id" value="${user.user_id}" />
				<!-- 用户名 -->
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<input type="text" name="login_name" value="${user.login_name}"
							lay-verify="required" autocomplete="off"
							class="layui-input layui-disabled" disabled>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名</label>
					<div class="layui-input-inline">
						<p>
							<input type="text" name="user_name" id="user_name"
								value="${user.user_name}" lay-verify="required"
								autocomplete="off" class="layui-input">
						</p>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">Tel</label>
					<div class="layui-input-block">
						<p>
							<input type="text" name="tel" id="tel" value="${user.tel}"
								lay-verify="required" autocomplete="off" class="layui-input" style="width: 320px">
						</p>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">状态</label>
					<div class="layui-input-block">
						<input type="radio" class="ignore" name="user_status" value="0"
							title="正常" /> <input type="radio" name="user_status"
							value="1" title="冻结" />
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">角色</label>
					<div class="layui-input-inline">
						<select name="role_id" lay-verify="required" id="role_id">
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
						<button class="layui-btn" id="btn_submit">立即提交</button>
					</div>
				</div>

			</form>


			<!-- 完 -->

		</div>
	</div>

	</section>
	<script type="text/javascript" src="/static/common/layui/layui.js"></script>
	<script>

		$(function() {
			
			layui.use('form', function() {
				var form = layui.form; //只有执行了这一步，部分表单元素才会修饰成功 
			});
			
			layui.use('layer', function(){ //独立版的layer无需执行这一句
				  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
			});

			var radioIndex = ${user.status};
			$('input:radio[name=user_status]')[radioIndex].checked = true;
			
			$("#user_name").focus(function(){
				layer.tips('请填写您的真实姓名','#user_name');
			});
			
			$("#tel").focus(function(){
				layer.tips('请填写您的手机号码','#tel');
			});
			
			//验证规则
			$("#userUpdateForm").validate({
				rules : {
					user_name : {
						required : true,
						minlength : 2
					},
					tel : {
						required : true,
						minlength : 11,
						maxlength : 11,
						digits : true,
						number : true,
						isMobile : true
					}
				},
				messages : {
					user_name : {
						required : "请输入真实姓名",
						minlength : "真实姓名必须大于2个字符"
					},
					tel : {
						required : "请输入联系电话",
						minlength : "必须11位数字",
						maxlength : "必须11位数字",
						digits : "必须是数字",
						number : "请输入有效数字",
						isMobile : "手机号格式错误"//自定义验证
					}
				}
			});

			//验证提交
			$("#btn_submit").click(function() {
				var flag = $("#userUpdateForm").valid();
			    if(!flag){
			        //没有通过验证
			        return;
			    }
                document.forms[0].action = "/admin/sysuser/sysuseredit";
				document.forms[0].submit();
			});

			 //自定义验证方法
			jQuery.validator.addMethod("isMobile", function(value, element) {
				var length = value.length;
				var mobile = /^1[34578]\d{9}$/;/*/^1(3|4|5|7|8)\d{9}$/*/
				return this.optional(element)
						|| (length == 11 && mobile.test(value));
			}, "请正确填写您的手机号码");

		});
	</script>
</body>
</html>