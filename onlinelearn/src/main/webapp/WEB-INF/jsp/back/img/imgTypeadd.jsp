<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
function save(){
	
	document.forms[0].action="/admin/img/save";
	document.forms[0].submit();
}


</script>
</head>
<body>
	<form  method="post">

     类型：  <input type="text" name="typeName" id="typeName" value=""  maxlength="20">
<button type="submit" class="btn btn-default" id="cy" onclick="save()">添加</button>
</form>

</body>
</html>