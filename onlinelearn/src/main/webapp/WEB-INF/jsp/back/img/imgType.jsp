<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>图片类型管理</title>

<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">

<link rel="stylesheet" type="text/css"
	href="/common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
<script src="/js/jquery.js" type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
<script src="/js/jquery-3.0.0.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/css/bootstrap-table.css" />
<script src="/js/bootstrap-table.js" type="text/javascript"
	charset="utf-8"></script>
<script src="/js/bootstrap-table-zh-CN.min.js" type="text/javascript"
	charset="utf-8"></script>

<script type="text/javascript">
	function list() {//查询
		document.forms[0].action = "/admin/img/listimgType";
		document.forms[0].submit();
	}
	
	
	function upd() {
		var id=$("#typeId").val();
		var name = $("#typeName2").val();
		alert(id+""+name);
		$.post("/admin/img/update?id="+id+"&name="+name,
				function(data){
			if(data==1){
				$("#myModal3").modal("hide");
				location.href="/admin/img/listimgType";
			}
		});
		
	} 
	
	
	
	function up(name, id) {
		$("#myModal3").modal("show");
		$("#typeName2").val(name);
		$("#typeId").val(id);
		
	}
	
	
	



	function jump() {
		document.forms[0].action = "/admin/img/to";
		document.forms[0].submit();
	}
</script>
<style type="text/css">
#fonts {
	font-family: Arial, Verdana, Sans-serif;
	font-weight: normal;
	font-size: 18px;
}
</style>
</head>
<body>





	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title" align="center" id="myModalLabel">修改类型</h3>
				</div>
				<div class="modal-body">


					<form class="form-horizontal" method="post">

						<div class="modal-footer">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 modal-title"
									style="font-family: Arial, Verdana, Sans-serif; font-weight: normal; font-size: 16px;">输&nbsp;&nbsp;入&nbsp;&nbsp;名&nbsp;&nbsp;称</label>
								<div class="col-sm-9">
									<input type="hidden" class="form-control zh" id="typeId"
										name="typeId"> <input type="text"
										class="form-control zh" id="typeName2" name="typeName">
								</div>
							</div>
						</div>

					</form>

				</div>
				<div class="modal-footer">
					<div class="col-sm-8">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-default" onclick="upd()">修改</button>
					</div>
				</div>

			</div>
		</div>
	</div>


	<section class="layui-larry-box">
		<div class="larry-personal">
			<div class="layui-tab">
				<blockquote class="layui-elem-quote news_search">

					<form action="" method="post">

						<div class="layui-inline">

							<div class="layui-inline">
								<shiro:hasPermission name="imgType_add">
								<button type="button" class="layui-btn search_btn"
									onclick="jump()">添加类型</button>
										</shiro:hasPermission>
							</div>
						</div>

					</form>
				</blockquote>

				<div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
					<div class="layui-tab-item layui-field-box layui-show">
						<table class="layui-table table-hover" lay-even="" lay-skin="nob">

							<thead>
								<tr>
									<th width="33%" align="center">序号</th>
									<th width="34%" align="center">类型名称</th>
									<th width="33%" align="center">操作</th>
								</tr>
							</thead>
							<tbody> 
								<c:forEach items="${list}" var="p" varStatus="statu">
									<tr>
										<td>${p.typeId }</td>
										<td>${p.typeName}</td>
										<td>
										<shiro:hasPermission name="imgType_upd">
										<a class="layui-btn layui-btn-mini"
											onclick="up('${p.typeName}','${p.typeId }')"><i
												class="iconfont icon-edit"></i> 编辑</a> 
												</shiro:hasPermission> 
												<shiro:hasPermission name="imgType_del">
												<a class="layui-btn layui-btn-danger layui-btn-mini" data-id="1"
											href="/admin/img/delete/${p.typeId}" ><i
												class="layui-icon"></i> 删除</a>
											</shiro:hasPermission> 
												</td>
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
												href="/admin/img/listimgType?page=${page.firstPage}">首页</a>
										</c:if> <c:if test="${page.hasPreviousPage==true }">
											<a class="layui-btn"
												href="/admin/img/listimgType?page=${page.prePage}">上一页</a>
										</c:if> <c:if test="${page.hasPreviousPage==false }">
											<a class="layui-btn">上一页</a>
										</c:if> <c:if test="${page.hasNextPage==true }">
											<a class="layui-btn"
												href="/admin/img/listimgType?page=${page.nextPage }">下一页</a>
										</c:if> <c:if test="${page.hasNextPage==false }">
											<a class="layui-btn">下一页</a>
										</c:if> <c:if test="${page.isLastPage==false }">
											<a class="layui-btn"
												href="/admin/img/listimgType?page=${page.lastPage }">最后一页</a>
										</c:if> <c:if test="${page.isLastPage==true }">
											<a class="layui-btn">最后一页</a>
										</c:if></td>
								</tr>
					
							</tbody>
						</table>
					</div>



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

	<script type="text/javascript" src="/common/layui/layui.js"></script>
	<script type="text/javascript">
		layui.use([ 'jquery', 'layer', 'element', 'laypage' ], function() {
			window.jQuery = window.$ = layui.jquery;
			window.layer = layui.layer;
			var element = layui.element(), laypage = layui.laypage;

			laypage({
				cont : 'page',
				pages : 10 //总页数
				,
				groups : 5 //连续显示分页数
				,
				jump : function(obj, first) {
					//得到了当前页，用于向服务端请求对应数据
					var curr = obj.curr;
					if (!first) {
						//layer.msg('第 '+ obj.curr +' 页');
					}
				}
			});

			laypage({
				cont : 'page2',
				pages : 10 //总页数
				,
				groups : 5 //连续显示分页数
				,
				jump : function(obj, first) {
					//得到了当前页，用于向服务端请求对应数据
					var curr = obj.curr;
					if (!first) {
						//layer.msg('第 '+ obj.curr +' 页');
					}
				}
			});
		});
	</script>
</body>
</html>