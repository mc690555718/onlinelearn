<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问答标签</title>
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
<script>
 function todown(){
	 document.forms[0].action="/admin/questions_tag/listAll/${q.id }?page=${page.nextPage}";
	 document.forms[0].submit();
 }
 function toup(){
	 document.forms[0].action="/admin/questions_tag/listAll/${q.id }?page=${page.prePage}";
	 document.forms[0].submit();
 }
</script>
</head>
<body>
   <div class="layui-inline">
		<form action="/admin/questions_tag/save" method="post">
			<label>问答标签</label>
			<div class="layui-input-inline">
				<input name="questions_tag_name"  class="layui-input"
					type="text">
			</div>
			<input type="hidden" name="status" value="0" />
			<input type="hidden" name="parent_id" value="0" />
			<button class="layui-btn" type="submit">添加</button>
		</form>
	</div>
	<table class="layui-table">
		<colgroup>
			<col width="5%">
			<col width="14%">
		</colgroup>
		<c:forEach items="${tags }" var="t">
			<tr>
				<td>${t.questions_tag_name }</td>
				<td><button class="layui-btn layui-btn-sm layui-btn-normal"
						onclick="del(${t.questions_tag_id })">
						<i class="layui-icon"></i>
					</button>
					<button class="layui-btn layui-btn-xs" onclick="update(${t.questions_tag_id })">修改</button></td>
			</tr>
		</c:forEach>
		<tr>
			<td align="center" colspan="9">一共${page.pages}页
				<button class="layui-btn layui-btn-xs" onclick="toup()">上一页</button>
				<button class="layui-btn layui-btn-xs" onclick="todown()">下一页</button>
				当前第${page.pageNum}页</td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	function del(id){
		location.href = "/admin/questions_tag/updateStatus/"+id;
	}
	function update(id){
		location.href = "/admin/questions_tag/init/"+id;
	}
</script>
</html>