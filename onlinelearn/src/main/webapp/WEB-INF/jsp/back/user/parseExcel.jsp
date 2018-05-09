<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<link rel="stylesheet" type="text/css" href="/css/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
<link href="/js/font-awesome-4.7.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<script src="/js/jquery-3.0.0.js" type="text/javascript" charset="utf-8"></script>
<title>解析excel</title>
</head>
<style type="text/css">
img {
	width: 35px;
	height: 35px;
	border-radius: 50%;
}

h2 {
	text-align: center;
}

#ptid {
	width: 200px;
}

#qname {
	width: 440px;
}

#search_btn {
	width: 100px;
}

#container {
	text-align: center;
}

#tab1 {
	width: 1000px;
	margin: 10px auto;
	border: 1px solid gainsboro;
	padding-left: 100px;
	margin-left: auto 100px;
}
</style>

<script type="text/javascript">
function down(){
	var action = "<%=request.getContextPath()%>/admin/user/down?method=post";
		window.location = action;
	}
</script>
<body>
	<form method="post" action="/admin/user/parseExcel"
		enctype="multipart/form-data">
		<table class="table" width="90%" id="tab1"
			class="layui-table table-hover">
			<tr>
				<td rowspan="5">*信息描述</td>
				<td>excel模板说明:</td>
			</tr>
			<tr>
				<td>第一列:用户的电子邮件必须是未注册过得</td>
			</tr>
			<tr>
				<td>第二列:用户的手机号</td>
			</tr>
			<tr>
				<td>第三列:密码，如不填写默认111111，不得填入非法字符例如.*#$等</td>
			</tr>
			<tr>
				<td>第四列:赠送课程模板（ <i class="fa fa-download" title="下载模板"
					onclick="down()"></i>）
				</td>
			</tr>
			<tr>
				<td>上传</td>
				<td><input type="file" name="file" /></td>
			</tr>
			<tr>

				<td colspan="2" style="padding: 0px 240px"><input type="submit"
					value="提交" class="layui-btn layui-bth-primary" /> <a href="/admin/user/listUser"
					class="layui-btn layui-bth-primary">返回</a></td>
			</tr>
		</table>
	</form>
</body>
</html>