<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<title>圆粑粑</title>
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
	#in2 {
	background-color: #000000;
	width: 80px;
	height: 30px;
	font-family: "微软雅黑";
	size: 10px;
	color: white;
}
	#it {

	width: 140px;
	height: 30px;
	font-family: "微软雅黑";
	size: 10px;

}
	#in1 {
	background-color: #000000;
	width: 80px;
	height: 30px;
	font-family: "微软雅黑";
	size: 10px; 
	color: white;
}

#se{
	width: 140px;
	height: 30px;
	font-family: "微软雅黑";
	size: 10px;


}
  
#ca {  
    width:150px;  
    overflow:hidden;  
    white-space:nowrap;  
    text-overflow:ellipsis;  
    -o-text-overflow:ellipsis;  
    -icab-text-overflow: ellipsis;  
    -khtml-text-overflow: ellipsis;  
    -moz-text-overflow: ellipsis;  
    -webkit-text-overflow: ellipsis;  
}  


		</style>
<script type="text/javascript">

 function list(){
	 document.forms[0].action="/admin/cy/listcomment";
	 document.forms[0].submit;
	 
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
			<p>
				<input value="" placeholder="邮箱" id="it"  name="email" type="text" >
				<input value="" placeholder="内容" id="it" name="content" type="text" > 
							<select class="se" id="type" name="type" class="form-control" >
									<option value="" >--请选择--</option>
									<option value="1">文章</option>
									<option value="2">课程</option>
								</select>
			             开始时间:<input type="date" name="start" id="it"  value="" placeholder="开始时间" > 
				结束时间:<input type="date" name="end" id="it"  value="" placeholder="结束时间" > 
						
                 <button type="submit"  id="in1" onclick="list()" >查找评论</button>
                 <button type="reset"  id="in2" onclick="cy()">清空</button>
			</p>
			
			
				<table border="2" width="1180" height="30">
					<tr id="tr1">
						<td>ID</td>
						<td>邮件</td>
						<td>类型</td>
						<td>点赞</td>
						<td>回复</td>
						<td>创建时间</td>
						<td>评论内容</td>
						<td>操作</td>
					</tr>
					
				<c:forEach items="${lists}" var="p" varStatus="stat">	
				<tr>
				<td>${stat.index+1}</td>
		        <td>${p.user.email }</td>
				<td>
				<c:if test="${p.type==2}">
				课程
				</c:if>
			   <c:if test="${p.type==1}">
				文章
				</c:if>
				</td>
				<td>${p.praise_count}</td>
				<td>${p.reply_count}</td>
				<td>${p.addtime}</td> 
				<td ><div id="ca" title="${p.content}">${p.content}</div>
				<td> <a class="layui-btn layui-btn-mini" href="#"><i class="iconfont icon-edit"></i> 回复评论</a> 
				<a class="layui-btn layui-btn-danger layui-btn-mini" data-id="1" href="/admin/cy/delete/${p.comment_id}">
				<i class="layui-icon" ></i> 删除</a></td> 
				</tr>
				</c:forEach>
					
		           <tr>
						<td align="center" colspan="9">
						<font face="微软雅黑" size="4px" color="blue">一共${page.pages}页</font> 
							<a class="layui-btn"
							href="/admin/cy/listcomment/${p.comment_id}?page=${page.prePage}">上一页</a>
							<a class="layui-btn"
							href="/admin/cy/listcomment/${p.comment_id}?page=${page.nextPage}">下一页</a>
							</td>
					</tr>
				</table>
		

		</form>
	</body>

</html>