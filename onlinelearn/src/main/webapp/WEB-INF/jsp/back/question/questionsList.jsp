<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问答列表</title>
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
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>

	<div class="layui-inline">
		<form action="/admin/questions/listAll" method="post" id="myform">
			<label class="layui-form-label">标题</label>
			<div class="layui-input-inline">
				<input type="hidden" name="page" id="page" value="${pageNum }" />
				<input name="title" value="" id="title" class="layui-input"
					type="text">
			</div>
			<label class="layui-inline">问答标签:</label>
			<div class="layui-input-inline">
				<select class="layui-input" name="type" id="type1">
					<option value="-1">全选</option>
					<option value="1">课程问答</option>
					<option value="2">学习分享</option>
				</select>
			</div>
			<div class="layui-input-inline">
				<label class="layui-inline">开始时间:</label>
				<div class="layui-input-inline">
					<input class="Wdate layui-input" type="text" name="start"
						id="start" onClick="WdatePicker()" />
				</div>
			</div>
			<div class="layui-input-inline">
				<label class="layui-inline">结束时间:</label>
				<div class="layui-input-inline">
					<input class="Wdate layui-input" type="text" name="end" id="end"
						onClick="WdatePicker()" />
				</div>
			</div>
			<button class="layui-btn" type="submit">查询</button>
		</form>
	</div>
	<table class="layui-table">
		<colgroup>
			<col width="2%">
			<col width="7%">
			<col width="10%">
			<col width="3%">
			<col width="3%">
			<col width="3%">
			<col width="3%">
			<col width="7%">
			<col width="14%">
		</colgroup>
		<tr>
			<td>ID</td>
			<td>发表人</td>
			<td>回答标题</td>
			<td>类型</td>
			<td>回复数</td>
			<td>浏览数</td>
			<td>点赞数</td>
			<td>添加时间</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${questions }" var="q">
			<tr>
				<td>${q.id }</td>
				<td>${q.edu_user.email }</td>
				<td>${q.title }</td>
				<td><c:if test="${q.type==1 }">
					课程问答
				</c:if> <c:if test="${q.type==2 }">
					学习分享
				</c:if></td>
				<td>${q.reply_count }</td>
				<td>${q.browse_count }</td>
				<td>${q.praise_count }</td>
				<td><fmt:formatDate value="${q.add_time }" type="date"
						pattern="yyyy-MM-dd hh:mm:ss" /></td>
				<td><button class="layui-btn layui-btn-danger"
						onclick="del(${q.id })">
						<i class="layui-icon"></i>
					</button>
					<button class="layui-btn layui-btn-sm layui-btn-normal" onclick="getById(${q.id })">查看回复</button></td>
			</tr>
		</c:forEach>
		<tr>
			<td align="center" colspan="9"><font face="微软雅黑" size="3px"
				color="black">一共${page.pages}页</font> <font face="微软雅黑" size="3px"
				color="black">每页${page.pageSize }条/当前第${page.pageNum}页</font> <a
				class="layui-btn" href="javascript:onpage()">上一页</a> <a
				class="layui-btn" href="javascript:nextpage()">下一页</a></td>
		</tr>
	</table>
</body>

<script type="text/javascript">
if("${type1}"==null || "${type1}"==''|| "${type1}"==""){
	$("#type1").val(-1);
}else{
	$("#type1").val("${type}");
}
	$("#title").val("${title}");
	$("#type").val("${type}");
	$("#start").val("${start}");
	$("#end").val("${end}");
	function del(id){
		location.href = "/admin/questions/delete/"+id;
	}
	var page = ${pageNum};
	function getById(id){
		location.href = "/admin/questions_comment/getById1?id="+id+"&pageNum="+page; 
	}
	 function onpage(){
		 $("#page").val(page-1);
		 if(page-1 < 1){
			 $("#page").val(1);
		 }
		 $("#myform").submit();
	 }
	 function nextpage(){
		 $("#page").val(page+1);
		 if(page+1 > "${page.pages}"){
			 $("#page").val("${page.pages}");
		 }
		 $("#myform").submit();
	 }
</script>
</html>