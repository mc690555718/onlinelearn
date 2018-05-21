
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
</head>
<style>
table {
	width: 100px;
	table-layout: fixed; /* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
}

td {
	width: 100%;
	word-break: keep-all; /* 不换行 */
	white-space: nowrap; /* 不换行 */
	overflow: hidden; /* 内容超出宽度时隐藏超出部分的内容 */
	text-overflow: ellipsis;
	/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用*/
}
</style>
<body>
	<div class="layui-inline">
		<form action="/admin/questions_comment/listAll" method="post"
			id="myform">
			<label>问答标题</label>
			<div class="layui-input-inline">
				<input type="hidden" name="page" id="page" value="${pageNum }" /> <input
					name="name" value="" id="name" class="layui-input" type="text">
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
		<tr>
			<td>序号</td>
			<td>问答标题</td>
			<td>发表人</td>
			<td>是否采纳</td>
			<td>回复详情</td>
			<td>点赞数</td>
			<td>回复时间</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${comments }" var="c" varStatus="stat">
			<tr>
				<td>${stat.index+1 }</td>
				<td title="${c.questions.title }">${c.questions.title }</td>
				<td title="${c.edu_user.email }">${c.edu_user.email }</td>
				<td><c:if test="${c.is_best==0 }">
					否
				</c:if> <c:if test="${c.is_best==1 }">
					是
				</c:if></td>
				<td title="${c.content }">${c.content }</td>
				<td title="${c.praise_count }">${c.praise_count }</td>
				<td
					title="<fmt:formatDate value="${c.add_time }" type="date"
						pattern="yyyy-MM-dd hh:mm:ss" />"><fmt:formatDate
						value="${c.add_time }" type="date" pattern="yyyy-MM-dd hh:mm:ss" /></td>
				<td><button class="layui-btn layui-btn-danger"
						onclick="del(${c.id })">
						<i class="layui-icon"></i>
					</button>
					<button class="layui-btn layui-btn-sm layui-btn-normal"
						onclick="update(${c.id },${c.is_best })">采纳最佳</button></td>
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
	if("${is_best}"==null || "${is_best}"==''){
		$("#is_best").val(-1);
	}else{
		$("#is_best").val("${is_best}");
	}
	$("#question_id").val("${question_id}");
	$("#name").val("${name}");
	$("#start").val("${start}");
	$("#end").val("${end}");
	 function del(id){
		 location.href = "/admin/questions_comment/delete/"+id;
	} 
	 function update(id,is_best){
		 if(is_best==0){
			 location.href = "/admin/questions_comment/update/"+id;
		 }else{
			alert("已经采纳为最佳！"); 
		 }	  
	 }
	 var page = ${pageNum};
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