<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>文章管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<script src="/js/jquery-3.0.0.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css" href="/common/global.css" media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css" media="all">
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<script src="/common/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.css" />
<script type="text/javascript">
	function getList() {
		document.forms[0].action = "showlist";
		document.forms[0].submit();
	}
</script>

</head>
<body>
	<section class="layui-larry-box">
		<div class="larry-personal">
			<div class="layui-tab">
				<blockquote class="layui-elem-quote news_search">
					<form action="" method="post">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<input value="${qname }" name="qname" placeholder="请输入关键字"
									class="layui-input search_input" type="text">
							</div>
	
							<label class="layui-inline">创建时间:</label>
							<div class="layui-input-inline">
								<input class="layui-input search_input" type="text" onClick="WdatePicker()" name="create_time" value="${create_time }"/>
							</div>
							-
							<div class="layui-input-inline">
								<input class="layui-input search_input" type="text" onClick="WdatePicker()" name="publish_time" value="${publish_time }"/>
							</div>
							
							

							<a href="#" class="layui-btn" onclick="getList()">查找文章</a>
						</div>

						<div class="layui-inline">
							 <a href="listPtype"
								class="layui-btn layui-btn-normal newsAdd_btn">添加文章</a> 
						</div>

<!-- 						<div class="layui-inline">
							<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
						</div> -->
 						<div class="layui-inline">
							<div class="layui-form-mid layui-word-aux">本页面刷新后除新添加的文章外所有操作无效，关闭页面所有数据重置</div>
						</div> 
					</form>
				</blockquote>

				<div
					class="layui-tab-content larry-personal-body clearfix mylog-info-box">
					<!-- 操作日志 -->
					<div class="layui-tab-item layui-field-box layui-show">
						<table class="layui-table table-hover" lay-even="" lay-skin="nob">
							<thead>
								<tr>
									<th><input type="checkbox" id="selected-all"></th>
									<th>标题</th>
									<th>作者</th>
									<th>来源</th>
									<th>创建时间</th>
									<th>发布时间</th>
									<th>点击量</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${list }" var="a" varStatus="statu">
									<tr>
										<td><input type="checkbox"></td>
										<td>${a.title }</td>
										<td>${a.author }</td>
										<td>${a.source }</td>
										<td><fmt:formatDate value="${a.create_time }" type="date"
							pattern="yyyy-MM-dd hh:mm:ss" /></td>
										<td><fmt:formatDate value="${a.publish_time }" type="date"
							pattern="yyyy-MM-dd hh:mm:ss" /></td>
										<td>${a.click_num }</td>
										<td>
										<c:if test="${a.releases==0 }">
										<a href="/admin/article/releaseEdit/${a.article_id }/${a.releases}"
											class="btn btn-default ">未发布</a>
										</c:if>
										<c:if test="${a.releases==1 }">
										<a href="/admin/article/releaseEdit/${a.article_id }/${a.releases}"
											class="btn btn-default ">已发布</a>
										</c:if>
										<a href="/admin/article/delete?article_id=${a.article_id }"
											class="btn btn-default ">删除</a>
											<a href="/admin/article/updateValue?article_id=${a.article_id }"
											class="btn btn-default">修改</a></td>
									</tr>
								</c:forEach>
								
								<!-- 分页 -->
								<tr>
						<td align="center" colspan="9"><font face="微软雅黑" size="3px"
							color="black">一共${page.pages}页</font> 
							<font face="微软雅黑" size="3px"
							color="black">每页${page.pageSize }条/</font>
							<a class="layui-btn"
							href="/admin/article/showlist?page=${page.firstPage}">首页</a>
							<a class="layui-btn"
							href="/admin/article/showlist?page=${page.prePage}">上一页</a>
							<a class="layui-btn"
							href="/admin/article/showlist?page=${page.nextPage}">下一页</a>
							<a class="layui-btn"
							href="/admin/article/showlist?page=${page.lastPage}">最后页</a></td>
					</tr>
								
								
								

							</tbody>
						</table>


						<div class="larry-table-page clearfix">
							<a href="javascript:;" class="layui-btn layui-btn-small"><i
								class="iconfont icon-shanchu1"></i>删除</a>
							<div id="page" class="page"></div>
						</div>
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
						<div class="larry-table-page clearfix">
							<a href="javascript:;" class="layui-btn layui-btn-small"><i
								class="iconfont icon-shanchu1"></i>删除</a>
							<div id="page2" class="page"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		$("#qname").val("${qname}");
	</script>
	<script type="text/javascript" src="/common/layui/layui.js"></script>
</body>
</html>