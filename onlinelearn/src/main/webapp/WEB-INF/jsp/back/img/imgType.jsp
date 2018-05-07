<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<title>layui</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" type="text/css" href="/common/layui/css/layui.css" media="all">
		<link rel="stylesheet" type="text/css" href="/common/layui/css/layui.css" media="all">
		<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.css" media="all">
		<link rel="stylesheet" type="text/css" href="/common/global.css" media="all">
		<link rel="stylesheet" type="text/css" href="/css/personal.css" media="all">
		<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
		<style type="text/css">
	#tr1{
		background-color: #000000;
		font-family: "微软雅黑";
        font-size: 14px;
        color: white;
      text-align: center;
		
		
	}
		#div1{
		width: 800px;
	   height: 25px;
		border: 2px solid crimson;
		
		
	}
		.bu1{
		background-color: #000000;
		font-family: "微软雅黑";
        font-size: 14px;
        color: white;
      text-align: center;
	}
		#tr2{
		font-family: "微软雅黑";
        font-size: 14px;
      text-align: center;
		
		
	}
	#in2 {
	background-color:  #000000;
	width: 100px;
	height: 40px;
	font-family: "微软雅黑";
	size: 18px;
	color: white;
}
	#a1{

	size: 18px;
	color: white;
}
		</style>

	</head>

	<body>

		<form action="get">
			<!-- 示例-970 -->
			<ins class="adsbygoogle" style="display: inline-block; width: 970px; height: 90px" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>

      <p><button type="button"  id="in2" ><a href="/imgTypeadd.jsp" id="a1">创建类型</a></button></p>
	
				<table border="1" width="1100" height="40">
			    <tr id="tr1">
				<td>类型ID</td>
				<td>类型名称</td>
				<td>操作</td>
					</tr>
		<c:forEach items="${list}" var="p" varStatus="stat">	
				<tr id="tr2">
				<td>${stat.index+1}</td>
		        <td><input  placeholder="图片标题"  name="typeName" type="text" value=" ${p.typeName}" width="80px"></td>
				<td> <a class="layui-btn layui-btn-mini"
										href="/admin/img/getById/${p.typeId}"><i
											class="iconfont icon-edit"></i> 编辑</a> 
											 <a class="layui-btn layui-btn-danger layui-btn-mini" data-id="1"
										href="/admin/img/delete/${p.typeId}"><i
											class="layui-icon"></i> 删除</a></td>
				</tr>
				</c:forEach>
				   <tr>
						<td align="center" colspan="9">
						<font face="微软雅黑" size="4px" color="blue">一共${page.pages}页</font> 
							<a class="layui-btn"
							href="/admin/img/listimgType/${p.typeId}?page=${page.prePage}">上一页</a>
							<a class="layui-btn"
							href="/admin/img/listimgType/${p.typeId}?page=${page.nextPage}">下一页</a>
							</td>
					</tr>
				</table>
		

		</form>
	</body>

</html>