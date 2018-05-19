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
 function todown(id){
	 window.location.href="/admin/questions_comment/getById1?id="+id+"?page=${page.nextPage}";
 }
 function toup(id){
     window.location.href="/admin/questions_comment/getById1?id="+id+"?page=${page.prePage}";
 }
</script>
</head>
<body>
	<table class="layui-table">
		<colgroup>
			<col width="2%">
			<col width="10%">
			<col width="30%">
			<col width="2%">
			<col width="30%">
		</colgroup>
		<tr>
			<td>问答ID</td>
			<td>问答标题</td>
			<td>回复内容</td>
			<td>是否采纳</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${comments }" var="c">
			<tr>
				<td>${c.questions.id }</td>
				<td>${c.questions.title }</td>
				<td>${c.content }</td>
				<td><c:if test="${c.is_best==0 }">
					否
				</c:if> <c:if test="${c.is_best==1 }">
					是
				</c:if></td>
				<td><button class="layui-btn layui-btn-danger"
						onclick="del(${c.id },${c.questions.id })">
						<i class="layui-icon"></i>
					</button>
					<button class="layui-btn layui-btn-sm layui-btn-normal"
						onclick="update(${c.id },${c.is_best },${c.questions.id })">采纳为最佳</button></td>
			</tr>
		</c:forEach>
		<tr>
			<td align="center" colspan="9"><font face="微软雅黑" size="3px"
				color="black">一共${page.pages}页</font> <font face="微软雅黑" size="3px"
				color="black">每页${page.pageSize }条/当前第${page.pageNum}页</font> <a
				class="layui-btn" href="javascript:onpage(${id})">上一页</a> <a
				class="layui-btn" href="javascript:nextpage(${id})">下一页</a>
				<button class="layui-btn layui-btn-sm layui-btn-normal"
					onclick="back()">返回之前页面</button></td>
		</tr>
	</table>
</body>
<script type="text/javascript">
     function del(id,questionsId){
	     location.href = "/admin/questions_comment/delete1/"+id+"/"+questionsId;
    }
	 function update(id,is_best,questionsId){
		 if(is_best==0){
			 location.href = "/admin/questions_comment/update1/"+id+"/"+questionsId;
		 }else{
			alert("已经采纳为最佳！"); 
		 }	  
	 }
	 var pageNum = ${pageNum};
	 function back(){
		 location.href = "/admin/questions/listAll?page="+pageNum;
	 }
	 var page = ${total};
	 function onpage(id){
		 if(page-1 < 1){
			 page = 1;
		 }else{
			 page = page-1;
		 }
		 location.href="/admin/questions_comment/getById1?id="+id+"&page="+page+"&pageNum="+pageNum;
		 }
	 var a = ${page.pages};
	 function nextpage(id){
		 if(page+1 > a){
			 page = a;
		 }else{
			 page = page+1;
		 }
	     location.href="/admin/questions_comment/getById1?id="+id+"&page="+page+"&pageNum="+pageNum;
		 }
</script>
</html>