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
<script type="text/javascript"
	src="/validate/dist/localization/messages_zh.js"></script>
</head>

<body style="width: 100%; height: 100%;">
	<section class="layui-larry-box ">
	<div class="larry-personal">
		<div class="layui-tab">
			<!-- 用户添加 -->
			<form class="layui-form" action="" method="post" id="userAddForm"
				name="userAddForm" style="height: 550px;">
				<!-- 用户名 -->
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<p>
							<input type="text" name="login_name" id="login_name" value=""
								autocomplete="off" class="layui-input">
						</p>
					</div>
				</div>

				<!--  密码 -->
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">
						<p>
							<input type="password" id="login_pwd" name="login_pwd" value=""
								autocomplete="off" class="layui-input" style="width: 320px;">
						</p>
					</div>
				</div>

				<!-- 重复输入密码 -->
				<div class="layui-form-item">
					<label class="layui-form-label">再次输入密码</label>
					<div class="layui-input-block">
						<p>
							<input type="password" id="confimPwd" name="confimPwd" value=""
								autocomplete="off" class="layui-input" style="width: 320px;">
						</p>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名</label>
					<div class="layui-input-inline">
						<input type="text" name="user_name" id="user_name" value=""
							autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">Tel</label>
					<div class="layui-input-block">
						<input type="text" name="tel" id="tel" value="" autocomplete="off"
							class="layui-input" style="width: 320px;">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">角色</label>
					<div class="layui-input-inline">
						<select name="role_id" lay-verify="required" id="role_id">
							<option value="-1">--------请选择角色-------</option>
							<c:forEach items="${roles}" var="role">
								<option value="${role.role_id}">${role.role_name}</option>
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
	
	layui.use('layer', function(){ //独立版的layer无需执行这一句
		  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
	});
	
	layui.use('form', function(){
		var form = layui.form; //只有执行了这一步，部分表单元素才会修饰成功 
	});
	
	$("#login_name").focus(function(){
		layer.tips('字母开头，允许5-16字节，允许字母数字下划线','#login_name');
	});
	
	$("#login_pwd").focus(function(){
		layer.tips('以字母开头，长度在6~18之间，只能包含字母、数字和下划线','#login_pwd');
	});
	
	$("#confimPwd").focus(function(){
		layer.tips('请重复输入密码，并保证与上个密码输入相同','#confimPwd');
	});
	
	$("#user_name").focus(function(){
		layer.tips('请正确填写您的真实姓名','#user_name');
	});
	
	$("#tel").focus(function(){
		layer.tips('请正确填写您的手机号码','#tel');
	});
	
	//验证提交
	$("#btn_submit").click(function(){
		var flag = $("#userAddForm").valid();
	    if(!flag){
	        //没有通过验证
	        return;
	    }
        document.forms[0].action="/admin/sysuser/createuser";
		document.forms[0].submit();
		
	});
	
	//手机号自定义验证方法
	jQuery.validator.addMethod("isMobile", function(value, element) {
	    var length = value.length;
	    var mobile = /^1[34578]\d{9}$/;/*/^1(3|4|5|7|8)\d{9}$/*/
	    return this.optional(element) || (length == 11 && mobile.test(value));
	}, "请正确填写您的手机号码");
	
	//用户名自定义验证方法
	jQuery.validator.addMethod("isUsername", function(value, element) {
	    var length = value.length;
	    var username = /^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;/*/^1(3|4|5|7|8)\d{9}$/*/
	    return this.optional(element) || (username.test(value));
	}, "字母开头，允许5-16字节，允许字母数字下划线");
	
	//密码验证方法
	jQuery.validator.addMethod("isPassword", function(value, element) {
	    var length = value.length;
	    var password = /^[a-zA-Z]\w{5,17}$/;/*/^1(3|4|5|7|8)\d{9}$/*/
	    return this.optional(element) || (password.test(value));
	}, "以字母开头，长度在6~18之间，只能包含字母、数字和下划线");
	
	
	//验证规则
	 $("#userAddForm").validate({
		    rules: {
		      login_name: {
		        required: true,
		        isUsername: true,
		      //异步验证 开始
                remote: {
                    url: "/admin/sysuser/checkusername",//发送请求的url地址
                    type: "post", //请求方式
                    dataType: "json",//接收的数据类型
                    data: {
                    	login_name: function () {
                            return $("#login_name").val();
                        }
                    },
                    dataFilter: function (data, type) { //过滤返回结果
                        if (data == "true"){
                        	 return true;  //true代表用户名还未存在
                        }else{
                            return false; //false代表用户名已经存在
                        }
                    }
                }

		      },
		      login_pwd: {
		        required: true,
		        isPassword: true
		      },
		      confimPwd: {
		    	 required: true,
		    	 equalTo:"#login_pwd"
		      },
		      user_name: {
			    	 required: true,
				     minlength: 2
			      },
		      tel: {
                  required: true,
                  minlength: 11,
                  maxlength:11,
                  digits:true,
                  number:true,
                  isMobile : true
		      }
		    },
		    messages: {
		      login_name:{
		    		required :"请输入用户名",
		    		isUsername :"请输入合法的用户名",
		    		remote :"该用户名已存在"
		      },
		      login_pwd: {
			        required: "请输入密码",
			        isPassword: "请输入合法的密码"
			  },
		      confimPwd: {
			    	 required: "请再次输入密码",
			    	 equalTo: "两次密码输入不一致"
			  },
		      user_name: {
		        required: "请输入真实姓名",
		        minlength: "真实姓名必须大于2个字符"
		      } ,
		      tel: {
                  required: "请输入联系电话",
                  minlength: "必须11位数字",
                  maxlength:"必须11位数字",
                  digits:"必须是数字"    ,
                  number:"请输入有效数字",
                  isMobile : "手机号格式错误"//自定义验证
		      }
		     }
		    });

});

</script>
</body>
</html>