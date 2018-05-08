<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	
	
<script type="text/javascript">

/* 显示 */
 function list(){
alert(111)
	 document.forms[0].action="/admin/hello/list";
	 document.forms[0].submit;
	 
 }

 
 /*批量删除  */
 function batchDeletes(){  
     //判断至少写了一项  
     var checkedNum = $("input[name='subcheck']:checked").length;  
     if(checkedNum==0){  
         alert("请至少选择一项!");  
         return false;  
     }  
     if(confirm("确定删除所选项目?")){  
     var checkedList = new Array();  
     $("input[name='subcheck']:checked").each(function(){  
         checkedList.push($(this).val());  
     });  
     $.ajax({  
         type:"POST",  
         url:"del",  
         data:{"delitems":checkedList.toString()},  
         datatype:"jsp",  
         success:function(data){  
             $("[name='checkbox2']:checkbox").attr("checked",false);  
             location.reload();//页面刷新  
         },  
         error:function(data){  
             art.dialog.tips('删除失败!');  
         }  
     });  
     }  
}  
 
 
 /*清空  */
 function cy(){ 
	 alert()
 $(document).ready(function(){  
	 $(function(){  
	   $('input:reset').click(function(){  
	     $('.input').val("");  
	    });  
	  });  
	  });  
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
									class="layui-input search_input" type="text">
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



							<a href="#" class="layui-btn" onclick="list()">查找评论</a> 
							<a href="#" class="layui-btn" onclick="cy()">清空</a>
							 <a href="#" class="layui-btn" onclick="batchDeletes()">批量删除</a> 
							 <a href="/admin/hello/listtype" class="layui-btn">新建图片</a>
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
									<th>标题</th>
									<th>图片URL</th>
									<th>链接URL</th>
									<th>类型</th>
									<th>序列号</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${list }" var="p" varStatus="statu">
									<tr>
										<td><input type="checkbox"></td>
										<td>${stat.index+1}</td>
										<td>${p.title }</td>
										<td>${p.imageUrl}</td>
										<td>${p.linkAddress}</td>
										<td>${p.imgType.typeName}</td>
										<td>${p.seriesNumber}</td>
										<td><a class="layui-btn layui-btn-mini"
											href="/admin/hello/getById/${p.imageId}"><i
												class="iconfont icon-edit"></i> 编辑</a> <a
											class="layui-btn layui-btn-danger layui-btn-mini" data-id="1"
											href="/admin/hello/delete/${p.imageId}"><i
												class="layui-icon"></i> 删除</a></td>
									</tr>
								</c:forEach>
 <tr>
						<td align="center" colspan="9">
						<font face="微软雅黑" size="4px" color="blue">一共${page.pages}页</font> 
							<a class="layui-btn"
							href="/admin/hello/list/${p.imageId}?page=${page.prePage}">上一页</a>
							<a class="layui-btn"
							href="/admin/hello/list/${p.imageId}?page=${page.nextPage}">下一页</a>
							</td>
					</tr>



							</tbody>
						</table>


					<!-- 	<div class="larry-table-page clearfix">
							<a href="javascript:;" class="layui-btn layui-btn-small"><i
								class="iconfont icon-shanchu1"></i>删除</a>
							<div id="page" class="page"></div>
						</div> -->
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
<!-- 	<script type="text/javascript" src="/common/layui/layui.js"></script>
 --></body>
</html>