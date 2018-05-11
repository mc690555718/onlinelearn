<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>发送邮件</title>
<link href="/js/utf8-jsp/themes/default/css/umeditor.css"
	type="text/css" rel="stylesheet">
<script src="/js/jquery-3.0.0.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/js/utf8-jsp/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/js/utf8-jsp/umeditor.min.js"></script>
<script type="text/javascript" src="/js/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
	<script>
		$(function() {
			$("#div1").hide();
			$("#tx").hide();
			$("#tid").change(function() {
				var type = $(this).val();
				if (type == '1') {
					$("#div1").hide();
				} else {
					$("#div1").show();
				}
			});
			$("#btn").click(function() {
				var content = UM.getEditor('myEditor').getContentTxt();
				$("#tx").val(content);
				$("#form1").submit();
			});
		});
		var b = "";
		function xianshi() {
			var emass = $("#eid").val();
			if (emass == 0) {
				alert("请选择联系人")
			} else {
				b = b + emass + ";";
				$("#email").val(b);
			}
		}
	</script>
	<form action="/saveEmail" method="post" id="form1">
		<p>选择联系人也可手动添加,用;隔开！</p>
		<textarea rows="4" cols="60" id="email" name="email"></textarea>
		<br> 请选择 <select name="eid" id="eid" onchange="xianshi()">
			<option value="0">请选择联系人</option>
			<c:forEach items="${ list}" var="l">
				<option value="${l.email }">${l.user_name }</option>
			</c:forEach>
		</select>
		<table
			style="font-family: '微软雅黑'; line-height: 50px; font-size: 16px; font-weight: bold; color: red; text-align: left; width: 100%;"
			id="tab2">
			<tr height="30px">
				<td>规则</td>
			</tr>
			<tr>
				<td>1.邮件格式：****@qq.com</td>
			</tr>
			<tr>
				<td>或者******@126.com,*****@163.com,*****@sina.com..等</td>
			</tr>
			<tr>
				<td>2.发送流程：添加邮箱号->设置邮箱号->提交发送</td>
			</tr>
			<tr>
				<td>3.添加邮箱号时，查询后可以选择添加所选学员及添加所有学员，请慎重选择。</td>
			</tr>
			<tr>
				<td>4.群发邮件最多不能超过1000条</td>
			</tr>
			<tr>
				<td>5.定时邮件会有几分钟的延迟。</td>
			</tr>
		</table>
		邮箱标题： <input type="text" name="title" id="title"
			placeholder="请选输入邮件标题" style="width: 80% px; height: 18px" /><br>
		正文内容：
		<script type="text/plain" id="myEditor"
			style="width: 600px; height: 240px;">
    <p>这里我可以写一些输入提示</p>
</script>
		<textarea id="tx" cols="50" rows="10" name="content"></textarea>
		<br> 邮箱类型 <select name="type" id="tid">
			<option value="1">正常</option>
			<option value="2">定时</option>
		</select> <br>
		<div id="div1">
			时间: <input name="send_time" id="d424" class="Wdate" type="text"
				onclick="WdatePicker({dateFmt:'yyyy-M-d H:mm:ss',minDate:'%y-%M-%d'})" />
		</div>
		<br> <input type="button" id="btn" value="发送" />
	</form>
</body>
<!-- 实例化编辑器 -->
<script type="text/javascript">
	//实例化编辑器
	var um = UM.getEditor('myEditor');
</script>
</html>