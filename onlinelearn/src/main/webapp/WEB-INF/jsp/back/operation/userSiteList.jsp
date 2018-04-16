<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<table class="table table-bordered">
     <tr>
     <td>收货人姓名</td>
     <td>收货人电话</td>
     <td>收货人地址</td>
     <td>操作</td>
     </tr>
     <c:forEach items="${shop_receives }" var="s">
			<tr>
				<td>${s.receive_name }</td>
				<td>${s.receive_phone }</td>
				<td>${s.receive_address}</td>
				<td><a href=""><button class="btn btn-default" type="text">修改</button></a>
				<a href=""><button class="btn btn-default" type="text">删除</button></a>
				<a href=""><button class="btn btn-default" type="text">设为首选地址</button></a></td>
			</tr>
		</c:forEach>
		<tr>
		<td align="center" colspan="9">一共${page.pages}页 <a
		href="/shop_receive/listUserReceive/${user.aid}?page=${page.firstPage}">第一页</a> <a
		href="/shop_receive/listUserReceive/${user.aid}?page=${page.prePage}">上一页</a> <a
		href="/shop_receive/listUserReceive/${user.aid}?page=${page.nextPage}">下一页</a> <a
		href="/shop_receive/listUserReceive/${user.aid}?page=${page.lastPage}">最后页</a></td>
		</tr>
		
	</table>
</body>
</html>