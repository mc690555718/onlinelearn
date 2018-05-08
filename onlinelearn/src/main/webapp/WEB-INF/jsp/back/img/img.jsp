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
			.bu1{
		background-color: #000000;
		font-family: "微软雅黑";
        font-size: 14px;
        color: white;
      text-align: center;
	}
		#table1{
		
		font-family: "微软雅黑";
        font-size: 14px;
    
      text-align: center;
		
		
	}
	#in4 {
	background-color:  #000000;
	width: 80px;
	height: 30px;
	font-family: "微软雅黑";
	size: 10px;
	color: white;
}
	#in1{
	background-color: #000000;
	width: 80px;
	height: 30px;
	font-family: "微软雅黑";
	size: 10px;
	color: white;
}
	#in2 {
	background-color: #000000;
	width: 80px;
	height: 30px;
	font-family: "微软雅黑";
	size: 10px;
	color: white;
}
	#a1 {
	background-color: #000000;
	width: 80px;
	height: 30px;
	font-family: "微软雅黑";
	size: 10px;
	color: white;
}
	#in3{
	background-color: #000000;
	width: 80px;
	height: 30px;
	font-family: "微软雅黑";
	size: 10px;
	color: white;
}
		</style>
<script type="text/javascript">
/* 查找类型 */
 function add() {
	document.forms[0].action="/admin/hello/listtype";
	document.forms[0].submit;
} 
/* 显示 */
 function list(){
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

		<form action="" method="post">
			<!-- 示例-970 -->
			<ins class="adsbygoogle" style="display: inline-block; width: 970px; height: 90px" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>

			<p>
			
				<input  placeholder="图片标题"  name="title" type="text" value="${title}" width="40px"> 
		               <select name="typeId" id="typeId">
		                   <option value="">请选择</option>
							<c:forEach items="${types}" var="t">
								<option value="${t.typeId}">${t.typeName}</option>
								</c:forEach>
						</select>
	

           <button type="submit" id="in1" onclick="list()">查找评论</button>
           <button type="reset"  id="in2" onclick="cy()" >清空</button>
           <button type="button" id="in3" onclick="batchDeletes()">批量删除</button>
           <button type="button"  id="in4"><a href="/admin/hello/listtype" id="a1">新建图片</a></button>
			</p>
		
		
				<table border="2" width="1140" height="40" id="table1">
				<tr id="tr1">
				<td><input type="checkbox" id="selected-all"></td>  
				<td>ID</td>
				<td>标题</td>
				<td>图片URL</td>
				<td>链接URL</td>
				<td>类型</td>
				<td>序列号</td>
				<td>操作</td>
					</tr>
				
			<c:forEach items="${list }" var="p" varStatus="stat">	
				<tr>
			<td><input type="checkbox" id="subcheck"  name="subcheck" value="${p.imageId}" /></td>  
				<td>${stat.index+1}</td>
		        <td>${p.title }</td>
				<td>${p.imageUrl}</td>
				<td>${p.linkAddress}</td>
				<td>${p.imgType.typeName}</td>
				<td>${p.seriesNumber}</td>
				<td> <a class="layui-btn layui-btn-mini"
										href="/admin/hello/getById/${p.imageId}"><i
											class="iconfont icon-edit"></i> 编辑</a> 
											 <a class="layui-btn layui-btn-danger layui-btn-mini" data-id="1"
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



				</table>	

		</form>
	</body>

</html>