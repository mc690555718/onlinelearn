<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%     String path=request.getContextPath();  
String basePath=request.getScheme()+"://"+request.getServerName()+":" +request.getServerPort()+path+"/"; %>
<base href="<%=basePath%>"> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>课程信息</title>
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
<script src="/js/jquery.js" type="text/javascript" charset="utf-8"></script>
<!--  <script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script> -->
<style type="text/css">
.tt {
	margin: auto
}
</style>
<script type="text/javascript">
	   function cleanText(){
		   $("#qname").val("");
		   $("#is_avaliable").val("-1");
		   $("#subject_id").val("-1");
		   $("#add_time").val("");
		   $("#end_time").val("");
	   }
	</script>
</head>
<body>

		<div class="layui-btn-group demoTable">
			<button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
			<button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
			<button class="layui-btn" data-type="isAll">验证是否全选</button>
		</div>

		<table class="layui-table"
			lay-data="{width: 892, height:332, url:'/demo/table/user/', page:true, id:'idTest'}"
			lay-filter="demo">
			<thead>
				<tr>
					<th lay-data="{type:'checkbox', fixed: 'left'}"></th>
					<th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
					<th lay-data="{field:'username', width:80}">用户名</th>
					<th lay-data="{field:'sex', width:80, sort: true}">性别</th>
					<th lay-data="{field:'city', width:80}">城市</th>
					<th lay-data="{field:'sign', width:160}">签名</th>
					<th lay-data="{field:'experience', width:80, sort: true}">积分</th>
					<th lay-data="{field:'classify', width:80}">职业</th>
					<th lay-data="{field:'wealth', width:135, sort: true}">财富</th>
					<th lay-data="{field:'score', width:80, sort: true, fixed: 'right'}">评分</th>
					<th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
				</tr>
			</thead>
		</table>


		<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

	</div>
	<script type="text/javascript" src="/common/layui/layui.js"></script>
	<script type="text/javascript">
	
</script>
</body>
</html>