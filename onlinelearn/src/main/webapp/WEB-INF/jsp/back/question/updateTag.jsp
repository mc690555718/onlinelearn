<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>标签修改</title>
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
<link rel="stylesheet" href="/common/layui/css/layui.css" media="all">
<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn").click(function() {
			document.forms[0].action = "/admin/questions_tag/update";
			document.forms[0].submit();
		});
	});	
</script>
</head>
<body>
<body> 
	<form action="" method="post">
		<input type="hidden" name="questions_tag_id"
			value="${tag.questions_tag_id }" /> <label>标签名:</label>
		<div class="layui-input-inline">
			<input name="questions_tag_name" value="${tag.questions_tag_name }"
				id="questions_tag_name" class="layui-input" type="text">
		</div>
		<input class="layui-btn" type="button" value="修改" id="btn" />
	</form>
</body>
</html>