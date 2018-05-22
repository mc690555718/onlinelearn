<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
</style>
<script type="text/javascript">

function save() {
	var typeName = $("#typeName").val();
	if(typeName!=""){
		document.forms[0].action = "/admin/img/save";
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
			t.innerText = "类型不能为空!";
			t.style.color = "red";
			$("#btn").attr({ disabled: "disabled" });
		}else if(reg.test(v)){
			t.innerText = "类型不能为纯数字";
			t.style.color = "red";
		} else{
			t.innerText = "";
			$("#btn").removeAttr("disabled");
		}

	}}


</script>
<body>
<form class="form-horizontal" id="div1" method="post"
		enctype="multipart/form-data">
		<br>
		<br>
		
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">图片类型:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="typeName" name="typeName"
					placeholder="请输入图片类型" maxlength="20" onblur="fun(this,1)"><span
					id="d1"></span>
			</div>

		</div>
	
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button class="btn btn-default" id="btn" onclick="save()">添加</button>
				<button type="button" class="btn btn-default">
					<a href="/admin/img/listimgType" id="a1">返回</a>
				</button>
			</div>
		</div>

	</form>
</body>
</html>