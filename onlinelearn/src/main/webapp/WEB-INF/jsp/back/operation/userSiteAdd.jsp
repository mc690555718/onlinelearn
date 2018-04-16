<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script src="js/jquery-3.0.0.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="bs/bootstrap-table.css" />
<script src="bs/bootstrap-table.js"></script>
<script src="locale/bootstrap-table-zh-CN.min.js"></script>
</head>
<script type="text/javascript">
	
</script>

<body>

	<form class="form-horizontal" action="shop_receive/save" method="post">


		<div class="form-group">
			<label class="col-sm-2 control-label">收货人姓名</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="receive_name"
					name="receive_name">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">收货人电话</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="receive_phone"
					name="receive_phone">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">收货人地址</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="receive_address"
					name="receive_address">
			</div>
		</div>
		<input type="hidden" id="set_address" name="set_address" value="0" />
		<input type="hidden" id="member_id" name="member_id" value="${user.aid}"/>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">添加</button>
			</div>
		</div>
	</form>

</body>

</html>
