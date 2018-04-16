<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>商品管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="css/personal.css"
	media="all">
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	function getList() {
		document.forms[0].action = "ProductServlet?state=list";
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
									class="layui-input search_input"  type="text">
							</div>

							<div class="layui-input-inline">
								<label class="sr-only" for="exampleInputEmail3">商品类型</label> 
								<select  id="ptid" name="ptid" class="form-control">
									<option value="-1">--请选择--</option>
									<c:forEach items="${types }" var="t">
									<c:if test="${t.producttypeid>0 }">
										<option value="${t.ptid }">${t.ptname }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>

							<a href="#" class="layui-btn" onclick="getList()">查询</a>
						</div>

						<div class="layui-inline">
							<a href="ProductServlet?state=toAdd"
								class="layui-btn layui-btn-normal newsAdd_btn">添加商品</a>
						</div>
						
						<div class="layui-inline">
							<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
						</div>
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
									<th>ID</th>
									<th>商品名称</th>
									<th>价格</th>
									<th>销售数量</th>
									<th>商品详情</th>
									<th>品牌</th>
									<th>图片</th>
									<th>商品类型</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${products }" var="p" varStatus="statu">
									<tr>
										<td><input type="checkbox"></td>
										<td>${statu.index+1 }</td>
										<td>${p.pname }</td>
										<td>${p.price }</td>
										<td>${p.saleCount }</td>
										<td>${p.descript }</td>
										<td>${p.pbrand.pbname }</td>
										<td>${p.pimg }</td>
										<td>${p.productType.ptname }</td>
										<td><a href="/ProductServlet?state=del&pid=${p.pid}"
											class="btn btn-default ">删除</a><a
											href="/ProductServlet?state=toUpdate&pid=${p.pid}"
											class="btn btn-default">修改</a></td>
									</tr>
								</c:forEach>

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
		$("#ptid").val("${ptid}");
		$("#qname").val("${qname}");
	</script>
	<script type="text/javascript" src="common/layui/layui.js"></script>
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