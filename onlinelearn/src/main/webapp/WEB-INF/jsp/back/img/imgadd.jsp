<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta charset="utf-8">
<title>layui</title>
<link rel="stylesheet" type="text/css"
	href="/common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" type="text/css"
	href="/css/jquery.bigcolorpicker.css" />
<script type="text/javascript" src="/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="/js/jquery.bigcolorpicker.min.js"></script>






<style type="text/css">
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

.t1 {
	width: 140px;
	height: 90px;
}

.t2 {
	width: 100px;
	height: 60px;
}

#img {
	width: 25px;
	height: 25px;
	display: block;
	border: 1px solid #d3d3d3;
}
</style>

<script type="text/javascript">

$(function(){
	$("#img").bigColorpicker(function(el,color){
		$(el).css("background-color",color);
	});
	$("#c5").bigColorpicker("c5","L",6);
});


function save() {
	var title = $("#title").val();
	var describes = $("#describes").val();
	var linkAddress = $("#linkAddress").val();
	var seriesNumber = $("#seriesNumber").val();
	if(title!=""&&describes!=""&&linkAddress!=""&&seriesNumber!=""){
		document.forms[0].action = "/admin/hello/save";
		document.forms[0].submit(); 

	}else{
		alert("添加的数据不能为空")
	}
	
		
}

</script>
</head>
<script type="text/javascript">
		function fun(a, b) {
			var v = a.value;
			var t;
			if(b == 1) {
				var reg =/^[0-9]*$/;
				t = document.getElementById("d1");
				if(v.trim().length == 0) {
					t.innerText = "标题不能为空!";
					t.style.color = "red";
					$("#btn").attr({ disabled: "disabled" });
				}else if(reg.test(v)){
					t.innerText = "标题不能为纯数字";
					t.style.color = "red";
				} else{
					t.innerText = "";
					$("#btn").removeAttr("disabled");
				}

			}else if(b == 2) {
				var reg =/^[0-9]*$/;
				t = document.getElementById("d2");
				if(v.trim().length == 0) {
					t.innerText = "描述不能为空!";
					t.style.color = "red";
					$("#btn").attr({ disabled: "disabled" });
				} else if(reg.test(v)){
					t.innerText = "描述不能为纯数字";
					t.style.color = "red";
				} else{
					t.innerText = "";
					$("#btn").removeAttr("disabled");
				}
			}else if(b == 3) {
				var reg =/^[0-9]*$/;
				t = document.getElementById("d3");
				if(v.trim().length == 0) {
					t.innerText = "链接不能为空!";
					t.style.color = "red";
					$("#btn").attr({ disabled: "disabled" });
				} else if(reg.test(v)){
					t.innerText = "链接不能为纯数字和汉字";
					t.style.color = "red";
				} else{
					t.innerText = "";
					$("#btn").removeAttr("disabled");
				}
			}
		}
			
			</script>

<body>
	<form class="form-horizontal" id="div1" method="post"
		enctype="multipart/form-data">
		<br>
		<br>
		<br>
		<br>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">图片标题:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="title" name="title"
					placeholder="请输入标题，只能输入中文汉字" maxlength="20" onblur="fun(this,1)"><span
					id="d1"></span>
			</div>

		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">图片描述:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="describes"
					name="describes" placeholder="请输入描述，只能输入中文汉字" maxlength="30"
					onblur="fun(this,2)"><span id="d2"></span>
			</div>

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
				<input type="text" class="form-control" id="linkAddress"
					name="linkAddress" placeholder="请输入跳转链接" maxlength="20"
					onblur="fun(this,3)"><span id="d3"></span>
			</div>
		</div>
		<br>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">排序:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="seriesNumber"
					name="seriesNumber" placeholder="请输入排序,只能输入数字" maxlength="3"
					onkeyup='this.value=this.value.replace(/\D/gi,"")'>
			</div>
		</div>
		<br>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">图片:</label>
			<div class="col-sm-10">
				<div>
					<img id="imageUrl" src="" name="imageUrl" class="t1"><label
						style="color: red">(请上传图片文件)</label> <input type="file"
						name="file" id="file" accept='image/*' />
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">背景颜色:</label>
			<div class="col-sm-10">
				<input type="text" id="c5" name="color" />
			</div>
		</div>
		<br>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button class="btn btn-default" id="btn" onclick="save()">添加</button>
				<button type="button" class="btn btn-default">
					<a href="/admin/hello/list" id="a1">返回</a>
				</button>
			</div>
		</div>

	</form>
</body>

<script type="text/javascript">
document.getElementById('file').onchange = function() {
	var imgFile = this.files[0];
	var fr = new FileReader();
	fr.onload = function() {
		document.getElementById('imageUrl').src = fr.result;  
	};
	fr.readAsDataURL(imgFile);
}
document.getElementById('file1').onchange = function() {
	var imgFile = this.files[0];
	var fr = new FileReader();
	fr.onload = function() {
		document.getElementById('previewUrl').src = fr.result;
	};
	fr.readAsDataURL(imgFile); 
}
  


</script>

</html>


