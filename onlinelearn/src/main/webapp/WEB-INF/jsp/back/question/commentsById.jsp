<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回复详情</title>
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
/*  function todown(){
	 document.forms[0].action="/admin/questions/listAll/${q.id }?page=${page.nextPage}";
	 document.forms[0].submit();
 }
 function toup(){
	 document.forms[0].action="/admin/questions/listAll/${q.id }?page=${page.prePage}";
	 document.forms[0].submit();
 } */
 </script>
</head>
<body>
	<table class="layui-table">
		<colgroup>
			<col width="2%">
			<col width="10%">
			<col width="7%">
			<col width="3%">
			<col width="3%">
			<col width="3%">
			<col width="7%">
			<col width="30%">
		</colgroup>
		<tr>
			<td>问答ID</td>
			<td>问答标题</td>
		
			<td>操作</td>
		</tr>
		<c:forEach items="${comments }" var="c">
			<tr>
				<td>${c.questions.id }</td>
				<td>${c.questions.title }</td>
				
				<td><button class="layui-btn layui-btn-sm layui-btn-normal"
						onclick="del(${c.id })">
						<i class="layui-icon"></i>
					</button>
					<button class="layui-btn layui-btn-sm layui-btn-normal"
						onclick="getById(${c.id })">查看评论详情</button>
					<button class="layui-btn layui-btn-sm layui-btn-normal"
						onclick="update(${c.id },${c.is_best })">采纳为最佳</button>
					<button class="layui-btn layui-btn-sm layui-btn-normal"
						onclick="back()">返回</button></td>
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
		 location.href = "/admin/questions_comment/delete/"+id;
	} 
	 function getById(id){
		 location.href = "/admin/questions_comment/getById/"+id;
	 }
	 function update(id,is_best){
		 if(is_best==0){
			 location.href = "/admin/questions_comment/update/"+id; 
		 }else{
			alert("已经采纳为最佳！"); 
		 }	  
	 }
	 function back(){
		 location.href = "/admin/questions/listAll";
	 }
</script>
</html>