<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>邮箱信息表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
<link rel="stylesheet" type="text/css"
	href="/common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css"
	href="/common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
<style type="text/css">
#myButton {
	width: 80px;
}
#table1{
text-align: center;
}
</style>
</head>
<body>
<form action="/admin/email/sendEmaillist" method="post">
	<section class="layui-larry-box">
		<div class="larry-personal">
			<div class="layui-tab">
				<blockquote class="layui-elem-quote news_search">
					<div class="layui-inline">

						<div class="layui-input-inline">
							<input value="${email}" placeholder="请输入关键字"
								class="layui-input search_input" type="text" name="email">
						</div>
						<div class="layui-input-inline">
							<label class="sr-only" for="exampleInputEmail3">类型查找</label> <select
								id="type" name="type"  class="form-control">
								<option value="-1" <c:if test="${type==-1}">selected</c:if>>--请选择--</option>
								<option value="1" <c:if test="${type==1}">selected</c:if>>普通</option>
								<option value="2" <c:if test="${type==2 }">selected</c:if>>定时</option>
							</select>

						</div>
						<button type="submit" id="myButton" 
							class="btn btn-primary">查询</button>
					</div>
				</blockquote>
				<div
					class="layui-tab-content larry-personal-body clearfix mylog-info-box">
					<!-- 操作日志 -->
					<div class="layui-tab-item layui-field-box layui-show">
						<table class="layui-table table-hover" id="table1">
							<thead>
								<tr>
									<th>id</th>
									<th>邮件类型</th>
									<th>是否发送</th>
									<th>邮件标题</th>
									<th>邮箱</th>
									<th>创建时间</th>
									<th>发送时间</th>
									<th>操作人</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody >
								<c:forEach items="${list}" var="p" varStatus="count">
									<tr align="center">
										<td>${p.id }</td>
										<c:if test="${p.type==1}">
											<td>&nbsp&nbsp&nbsp&nbsp普通</td>
										</c:if>
										<c:if test="${p.type==2 }">
											<td>&nbsp&nbsp&nbsp&nbsp定时</td>
										</c:if>
										<c:if test="${p.status==1}">
											<td>已发送</td>
										</c:if>
										<c:if test="${p.status==2 }">
											<td>未发送</td>
										</c:if>
										<td>${p.title}</td>
										<td>${p.email}</td>
										<td><fmt:formatDate value="${p.create_time}" type="both" /></td>
										<td><fmt:formatDate value="${p.send_time}" type="both" /></td>
										<td>${p.user.user_name }</td>
										<td><a href="/admin/email/sendEmailinit/${p.id}">
												<button type="button" class="btn btn-success">查看</button>
										</a></td>
									</tr>
								</c:forEach>
											<tr>
									<td align="center" colspan="9"><font face="微软雅黑"
										size="3px" color="black">一共${page.pages}页</font> <font
										face="微软雅黑" size="3px" color="black">每页${page.pageSize }条/</font>
										<c:if test="${page.isFirstPage==true }">
											<a class="layui-btn">首页</a>
										</c:if> <c:if test="${page.isFirstPage==false }">
											<a class="layui-btn"
												href="/admin/email/sendEmaillist?page=${page.firstPage}&type=${type}">首页</a>
										</c:if> <c:if test="${page.hasPreviousPage==true }">
											<a class="layui-btn"
												href="/admin/email/sendEmaillist?page=${page.prePage}&type=${type}">上一页</a>
										</c:if> <c:if test="${page.hasPreviousPage==false }">
											<a class="layui-btn">上一页</a>
										</c:if> <c:if test="${page.hasNextPage==true }">
											<a class="layui-btn"
												href="/admin/email/sendEmaillist?page=${page.nextPage }&type=${type}">下一页</a>
										</c:if> <c:if test="${page.hasNextPage==false }">
											<a class="layui-btn">下一页</a>
										</c:if> <c:if test="${page.isLastPage==false }">
											<a class="layui-btn"
												href="/admin/email/sendEmaillist?page=${page.lastPage}&type=${type}">最后一页</a>
										</c:if> <c:if test="${page.isLastPage==true }">
											<a class="layui-btn">最后一页</a>
										</c:if></td>
								</tr>
							</tbody>
						</table>

					</div>
					<!-- 登录日志 -->
					<div class="layui-tab-item layui-field-box">
						<table class="layui-table table-hover" lay-even="" lay-skin="nob">
							<thead>
								<tr>
									<th><input type="checkbox" id="selected-all"></th>
									<th>ID</th>
									<th>管理员账号</th>
									<th>状态</th>
									<th>最后登录时间</th>
									<th>上次登录IP</th>
									<th>登录IP</th>
									<th>IP所在位置</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>110</td>
									<td>admin</td>
									<td>后台登录成功</td>
									<td>2016-12-19 14:26:03</td>
									<td>127.0.0.1</td>
									<td>127.0.0.1</td>
									<td>Unknown</td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</section>

</form>
	<script type="text/javascript" src="/common/layui/layui.js"></script>


</body>
</html>