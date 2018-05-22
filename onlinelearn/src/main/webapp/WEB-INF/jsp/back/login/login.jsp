<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>三阳科技在线学习管理系统后台登录</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<!-- load css -->
<link rel="stylesheet" type="text/css" href="/common/layui/css/layui.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/login.css" media="all">
<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
</head>
<body>

	<div class="layui-canvs"></div>
	<div class="layui-layout layui-layout-login">
	<input type="hidden" name="loginState" id="loginState" value="${loginState}">
	<form action="" method="post" id="login_form">
		<h1>
			<strong>三阳科技在线学习管理系统后台</strong> <em>Management System</em>
		</h1>
	<div class="layui-user-icon larry-login">
	    <p>
		   <input type="text" placeholder="请输入账号..." class="login_txtbx" name="login_name"/>
		</p>
	</div>
	<div class="layui-pwd-icon larry-login">
	    <p>
		   <input type="password" placeholder="请输入密码..." class="login_txtbx" name="login_pwd"/>
		</p>
	</div>
    <div class="layui-submit larry-login">
    	<input type="button" value="立即登陆" class="submit_btn"/>
    </div>
    </form>
    <div class="layui-login-text">
    	<p>© 2017-2018 三阳科技 版权所有</p>
        <p>鄂xxxxxx</p>
    </div>
</div>
<script type="text/javascript" src="/common/layui/lay/dest/layui.all.js"></script>
<script type="text/javascript" src="/js/login.js"></script>
<script type="text/javascript" src="/jsplug/jparticle.jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	layui.use('layer', function(){ //独立版的layer无需执行这一句
		  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
	});
	
	if($("#loginState").val() == 1){
		layer.msg('账号或密码不匹配', {icon: 5});
	}
	
	if($("#loginState").val() == 2){
		layer.msg('该账户已被锁定...', {icon: 5});
	}
	
	$(".layui-canvs").jParticle({
		background: "#141414",
		color: "#E6E6E6"
	});
	//登录链接测试，使用时可删除
	$(".submit_btn").click(function(){
			document.forms[0].action="/admin/back/checkAdmin";
			document.forms[0].submit();
	});
	

});
</script>

</body>
</html>