<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


	<head>
		<meta charset="utf-8">
		<title>layui</title>
		<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.css" media="all">
		<link rel="stylesheet" type="text/css" href="/common/global.css" media="all"> 
	 	<link rel="stylesheet" type="text/css" href="/css/personal.css" media="all"> 

<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" type="text/css" href="/css/jquery.bigcolorpicker.css" />
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/jquery.bigcolorpicker.min.js"></script>






<style type="text/css">

   #div1{
	width: 1180px;
	height: 680px;
	background-color: #ADADAD;
   }
   
   	#a1 {
	width: 80px;
	height: 30px;
	font-family: "微软雅黑";
	size: 10px;
}

   	。in1 {
	width: 60px;
	height: 20px;
	font-family: "微软雅黑";
	size: 10px;
}


.t1{
	width: 140px;
	height: 90px;

}

.t2{
	width: 100px;
	height: 60px;

}

		</style>
		
 <script type="text/javascript">
 $(function(){
		$("#btn").bigColorpicker("c2");
	});

 
 



function save(){
	
	document.forms[0].action="/admin/hello/save";
	document.forms[0].submit();
}

</script> 

	</head>

	<body>
		<form class="form-horizontal" id="div1" method="post" enctype="multipart/form-data">
		<br>
		<br>
		<br>
		<br>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">图片标题:</label>
    <div class="col-sm-10">
      <input type="" class="form-control" id="title" name="title" placeholder="请输入标题">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">图片描述:</label>
    <div class="col-sm-10">
      <input type="" class="form-control" id="describes" name="describes" placeholder="请输入描述">
    </div>
  </div>
   <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">图片类型:</label>
    <div class="col-sm-10">
    <select name="typeId" id="typeId">
	<option value="-1">--请选择--</option>
	<c:forEach items="${types }" var="t">
	<c:if test="${t.typeId>0 }">
	<option value="${t.typeId }">${t.typeName }</option>
	</c:if>
	</c:forEach>
  </select> 
    </div>
    
  </div> 
  
               
			
     <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">跳转链接:</label>
    <div class="col-sm-10">
      <input type="" class="form-control" id="linkAddress" name="linkAddress" placeholder="请输入跳转链接">
    </div>
  </div>
  
  
      <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">排序:</label>
    <div class="col-sm-10">
      <input type="" class="form-control" id="seriesNumber" name="seriesNumber" placeholder="请输入排序">
    </div>
  </div>
  
  
     <div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">图片:</label>
			<div class="col-sm-10">
				<div>
					<img id="imageUrl" name="imageUrl" class="t1"><label
						style="color: red">(请上传图片文件)</label> <input type="file"
						name="file" onclick="check()" accept='image/*' />
				</div>
			</div>
		</div>


		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">略缩图片:</label>
			<div class="col-sm-10">
				<img id="previewUrl" name="previewUrl" class="t2"><label
						style="color: red">(请上传图片文件)</label> <input type="file"
						name="file" onclick="check()" accept='image/*' />
			</div>
		</div>
  
  
    <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">背景颜色:</label>
    <div class="col-sm-10">
    <input type="text" id="c2" name="color"/><input id="bt" type="button" value="选色" />
   </div>
  </div>

  


  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default" id="cy" onclick="save()">添加</button>
      <button type="button"  class="btn btn-default" ><a href="/hello/list" id="a1">返回</a></button>
    </div>
  </div>

</form>
		


	</body>

</html>


