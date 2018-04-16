<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
<script src="/js/jquery-3.0.0.js"></script>
<script src="/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="/bs/bootstrap-table.css" />
<script src="/bs/bootstrap-table.js"></script>
<script src="/locale/bootstrap-table-zh-CN.min.js"></script>	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="/css/personal.css" media="all">
</head>
<body>
<form action="/shop_receive/listAll" method="post">
  <div class="col-xs-3">
    <input type="text" class="form-control" placeholder="请输入收货人姓名" name="receive_name">
  </div>
  <button class="btn btn-default" type="submit">查询</button>
	<table class="table table-bordered">
     <tr>
     <td>收货人姓名</td>
     <td>收货人电话</td>
     <td>收货人地址</td>
     </tr>
     <c:forEach items="${shop_receives }" var="s">
			<tr>
				<td>${s.receive_name }</td>
				<td>${s.receive_phone }</td>
				<td>${s.receive_address}</td>
			</tr>
		</c:forEach>
		<tr>
		<td align="center" colspan="9">一共${page.pages}页 <a
		href="/shop_receive/listAll?page=${page.firstPage}" class="layui-btn layui-btn-primary" type="text">第一页</a> <a
		href="/shop_receive/listAll?page=${page.prePage}" class="layui-btn layui-btn-primary" type="text">上一页</a> <a
		href="/shop_receive/listAll?page=${page.nextPage}" class="layui-btn layui-btn-primary" type="text">下一页</a> <a
		href="/shop_receive/listAll?page=${page.lastPage}" class="layui-btn layui-btn-primary" type="text">最后页</a></td>
		</tr>
	</table>
	 <a href="/shop_receive/listUserReceive/${user.aid}">测试</a>
	</form>
</body>
</html>