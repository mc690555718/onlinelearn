<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>图片管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<script src="/js/jquery-3.0.0.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="/common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css" href="/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<script src="/common/bootstrap/js/bootstrap.js" type="text/javascript"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="/common/bootstrap/css/bootstrap.css" />



<style type="text/css">
#in1 {
	background-color: mediumaquamarine;
	width: 100px;
	height: 35px;
	font-family: "微软雅黑";
	size: 10px;
	color: white;
}

#a1 {
	width: 80px;
	height: 30px;
	font-family: "微软雅黑";
	size: 10px;
	color: white;
}

#ca {
	width: 150px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	-icab-text-overflow: ellipsis;
	-khtml-text-overflow: ellipsis;
	-moz-text-overflow: ellipsis;
	-webkit-text-overflow: ellipsis;
}

#img1 {
	width: 100px;
	height: 80px;
}
</style>

<script type="text/javascript">

/* 显示 */
 function list(){
	 document.forms[0].action="/admin/hello/list";
	 document.forms[0].submit;
	 
 }

 
//批量删除
 function batchDeletes() {
 	//判断至少写了一项
 	var num = $("input[name='subcheck']:checked").length;
 	if (num==0) {
 		alert("请至少选择一项");
 		return false;
 	}
 	if (confirm("确认删除所选项?")) {
 		var checkdList = new Array();
 		$("input[name='subcheck']:checked").each(function() {
 			checkdList.push($(this).val());
 		});
 		$.ajax({
 			type:"post",
 			url:"/admin/hello/del",
 			data:{"delitems":checkdList.toString()},
 			datetype:"html",
 			success:function(date){
 			$("[name='checkbox2']:checked").attr("checked",false);
 			alert("11111");
 			location.reload();//刷新页面
 			},
 			error:function(date) {
 				art.dialog.tips("删除失败!");
 			}
 		});
 	}
 }
 
 /*清空  */
 function cy(){ 
 $(document).ready(function(){  
	 $(function(){  
	   $('input:reset').click(function(){  
	     $('.input').val("");  
	    });  
	  });  
	  });  
 }
 
//全选反选
 function fun1() {
 	var checklist = document.getElementsByName("subcheck");
 	if (document.getElementById("checkbox").checked) {
 		for (var i=0;i<checklist.length;i++) {
 			checklist[i].checked = 1;
 		}
 	} else{
 		for (var j=0;j<checklist.length;j++) {
 			checklist[j].checked = 0;
 		}
 	}
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
								<input value="${title}" name="title" placeholder="请输入关键字"
									class="layui-input search_input" type="text" maxlength="20">
							</div>

							<label class="layui-inline">类型:</label>
							<div class="layui-input-inline">
								<select name="typeId" id="typeId">
									<option value="">请选择</option>
									<c:forEach items="${types}" var="t">
										<option value="${t.typeId}">${t.typeName}</option>
									</c:forEach>
								</select>
							</div>



							<button type="submit" id="in1" onclick="list()">查找评论</button>
							<button type="reset" id="in1" onclick="cy()">清空</button>
								<shiro:hasPermission name="img_delete">
							<button type="button" id="in1" onclick="batchDeletes()">批量删除</button>
							</shiro:hasPermission>
							<shiro:hasPermission name="img_add">
								<button type="button" id="in1">
									<a href="/admin/hello/listtype" id="a1">新建图片</a>
								</button>
							</shiro:hasPermission>
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
									<th><input type="checkbox" id="checkbox" name="checkbox"
										onclick="fun1()"></th>
									<th>序号</th>
									<th>标题</th>
									<th>图片URL</th>
									<th>链接URL</th>
									<th>类型</th>
									<th>序列号</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${list}" var="p" varStatus="stat">
									<tr>
										<td><input type="checkbox" id="subcheck" name="subcheck"
											value="${p.imageId}"></td>
										<td>${stat.index+1}</td>
										<td>${p.title }</td>
										<td><img src="${p.previewUrl}" id="img1" /></td>
										<td>${p.linkAddress}</td>
										<td>${p.imgType.typeName}</td>
										<td>${p.seriesNumber}</td>
										<td><shiro:hasPermission name="img_update">
												<a 	class="layui-btn layui-btn-normal"
													href="/admin/hello/getById/${p.imageId}"><i
													class="iconfont icon-edit"></i> 编辑</a>
											</shiro:hasPermission> <shiro:hasPermission name="img_del">
												<a class="layui-btn layui-btn-danger"
													data-id="1" href="/admin/hello/delete/${p.imageId}"><i
													class="layui-icon"></i> </a>
											</shiro:hasPermission></td>
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
												href="/admin/hello/list?page=${page.firstPage}">首页</a>
										</c:if> <c:if test="${page.hasPreviousPage==true }">
											<a class="layui-btn"
												href="/admin/hello/list?page=${page.prePage}">上一页</a>
										</c:if> <c:if test="${page.hasPreviousPage==false }">
											<a class="layui-btn">上一页</a>
										</c:if> <c:if test="${page.hasNextPage==true }">
											<a class="layui-btn"
												href="/admin/hello/list?page=${page.nextPage }">下一页</a>
										</c:if> <c:if test="${page.hasNextPage==false }">
											<a class="layui-btn">下一页</a>
										</c:if> <c:if test="${page.isLastPage==false }">
											<a class="layui-btn"
												href="/admin/hello/list?page=${page.lastPage }">最后一页</a>
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
</body>
</html>