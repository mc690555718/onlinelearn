
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问答回复列表</title>
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
<script>
 function todown(){
	 document.forms[0].action="/admin/questions_comment/listAll/${q.id }?page=${page.nextPage}";
	 document.forms[0].submit();
 }
 function toup(){
	 document.forms[0].action="/admin/questions_comment/listAll/${q.id }?page=${page.prePage}";
	 document.forms[0].submit();
 }
</script>
</head>
<body>
	<div class="layui-inline">
		<form action="/admin/questions_comment/listAll" method="post">
			<label>问答标题</label>
			<div class="layui-input-inline">
				<input name="name" value="" id="name" class="layui-input"
					type="text">
			</div>
			<label class="layui-inline">是否采纳:</label>
			<div class="layui-input-inline">
				<select class="layui-input" name="is_best" id="is_best">
					<option value="-1">全选</option>
					<option value="1">是</option>
					<option value="0">否</option>
				</select>
			</div>
			<div class="layui-input-inline">
				<label class="layui-inline">开始时间:</label>
				<div class="layui-input-inline">
					<input class="Wdate layui-input" type="text" name="start"
						onClick="WdatePicker()" />
				</div>
			</div>
			<div class="layui-input-inline">
				<label class="layui-inline">结束时间:</label>
				<div class="layui-input-inline">
					<input class="Wdate layui-input" type="text" name="end"
						onClick="WdatePicker()" />
				</div>
			</div>
			<button class="layui-btn" type="submit">查询</button>
		</form>
	</div>
	<table class="layui-table">
		<colgroup>
			<col width="2%">
			<col width="10%">
			<col width="7%">
			<col width="3%">
			<col width="3%">
			<col width="3%">
			<col width="7%">
			<col width="20%">
		</colgroup>
		<tr>
			<td>回复ID</td>
			<td>问答标题</td>
			<td>发表人</td>
			<td>是否采纳</td>
			<td>回复数</td>
			<td>点赞数</td>
			<td>添加时间</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${comments }" var="c">
			<tr>
				<td>${c.id }</td>
				<td>${c.questions.title }</td>
				<td>${c.edu_user.email }</td>
				<td><c:if test="${c.is_best==0 }">
					否
				</c:if> <c:if test="${c.is_best==1 }">
					是
				</c:if></td>
				<td>${c.questions.reply_count }</td>
				<td>${c.questions.praise_count }</td>
				<td><fmt:formatDate value="${c.questions.add_time }"
						type="date" pattern="yyyy-MM-dd hh:mm:ss" /></td>
				<td><button class="layui-btn layui-btn-sm layui-btn-normal"
						onclick="del(${c.id })">
						<i class="layui-icon"></i>
					</button>
					<button class="layui-btn layui-btn-sm layui-btn-normal"
						onclick="getById(${c.id })">查看评论详情</button>
					<button class="layui-btn layui-btn-sm layui-btn-normal"
						onclick="update(${c.id },${c.is_best })">采纳为最佳</button></td>
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
	$("#is_best").val("${is_best}");
	$("#question_id").val("${question_id}");
	$("#name").val("${name}");
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
</script>
</html>