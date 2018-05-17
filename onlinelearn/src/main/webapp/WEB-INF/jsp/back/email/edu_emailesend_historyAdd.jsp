<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>发送邮件</title>
<link rel="stylesheet" href="/common/layui/css/layui.css" />
<link href="/js/utf8-jsp/themes/default/css/umeditor.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" href="/common/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="/css/bootstrap-table.css" />
<script src="/js/jquery-3.0.0.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="/common/layui/layui.js"></script>
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/js/utf8-jsp/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/js/utf8-jsp/umeditor.min.js"></script>
<script type="text/javascript" src="/js/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="/common/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/bootstrap-table-zh-CN.js"></script>
</head>

<body>
	<script>
			$(function() {
				$("#div1").hide();
				$("#tx").hide();
				$("#tid").change(function() {
					var type = $(this).val();
					if(type == '1') {
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
				if(emass == 0) {
					alert("请选择联系人")
				} else {
					b = b + emass + ";";
					$("#email").val(b);
				}
			}
			
				function fun1() {
				var checklist = document.getElementsByName("subcheck");
				if(document.getElementById("checkbox").checked) {
					for(var i = 0; i < checklist.length; i++) {
						checklist[i].checked = 1;
					}
				} else {
					for(var j = 0; j < checklist.length; j++) {
						checklist[j].checked = 0;
					}
				}
			}
				
				
			var b = [];
	        var d = 0 ;
			function xuanzhong() {
				var emass = document.getElementsByName("subcheck");
				for(var i = 0; i < emass.length; i++) {
					if(emass[i].checked) {
						b.push(emass[i].value);
					}
				}
				var c = "";
				for(var i = 0; i < b.length; i++) {
                     
						if(c.trim().length == 0) {
						c = b[i] + ";";
					} else {
						c += b[i] + ";";
					}
				}
                       	$("#email").val(c);
			}

		</script>

	<script type="text/javascript">
       $(function () {
    	var  type=$("#type").val();
	    if(type==1){
		$("#myModal").modal("hide");
	}else{
		$("#myModal").modal("show");
	}
})
</script>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">请选择联系人</h4>
				</div>
				<div class="modal-body">
					<input id="type" type="text" value="${type }" hidden="hidden">

					<table class="layui-table table-hover" lay-even="" lay-skin="nob"
						id="mytab" name="mytab">
						<thead>
							<tr>
								<th><input type="checkbox" id="checkbox" name="checkbox"
									onclick="fun1()"></th>
								<th>邮箱</th>
								<th>用户名</th>
						</thead>
						<tbody id="t1" name="t1">
							<c:forEach items="${list}" var="p" varStatus="stea">
								<tr>
									<th><input type="checkbox" id="subcheck" name="subcheck"
										value="${p.email}"></th>
									<th>${p.email}</th>
									<th>${p.user_name}</th>

								</tr>
							</c:forEach>
							<tr>
								<td colspan="3"><a
									href="/admin/email/toEmail?page=${page.prePage}&type=2"
									class="layui-btn layui-btn-small"><i
										class="iconfont icon-shanchu1"></i>上一页</a> <a
									href="/admin/email/toEmail?page=${page.nextPage}&type=2"
									class="layui-btn layui-btn-small"><i
										class="iconfont icon-shanchu1"></i>下一页</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="xuanzhong()">确认</button>
				</div>
			</div>
		</div>
	</div>
	<!--</form>-->

	<form action="/admin/email/sendEmail" method="post">
		<table style="margin-top: 30px; width: 1200px">
			<tr>
				<td>
					<table id="tab1">
						<tr height="50px">
							<td id="t1"><span id="span1">*</span> 添加联系人:</td>
							<td id="t2"><input name="email" id="email"
								style="width: 600px; height: 50px;" class="form-control"
								placeholder="请选输入对方邮箱,多个请用(;)分号隔开" onblur="fun()"></input></td>
							<td><button type="button" class="layui-btn"
									data-toggle="modal" onclick="xiugai(${p.user_id})"
									data-target="#myModal">请选择联系人</button></td>
						</tr>
					</table>
				</td>
			</tr>

		</table>
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
		邮箱标题： <input type="text" class="layui-input" name="title"
			style="width: 300px;" id="title" placeholder="请选输入邮件标题" /><br>
		正文内容：
		<script type="text/plain" id="myEditor"
			style="width: 600px; height: 240px;">
				<p>这里我可以写一些输入提示</p>
			</script>
		<textarea id="tx" cols="50" rows="10" name="content"></textarea>
		<br> 邮箱类型 <select name="type" id="tid" class="layui-select">
			<option value="1">正常</option>
			<option value="2">定时</option>
		</select> <br>
		<div id="div1">
			时间: <input name="send_time" id="d424" class="Wdate" type="text"
				onclick="WdatePicker({dateFmt:'yyyy-M-d H:mm:ss',minDate:'%y-%M-%d'})" />
		</div>
		<br> <input type="button" id="btn" class="layui-btn" value="发送" />
	</form>
</body>
<!-- 实例化编辑器 -->
<script type="text/javascript">
		//实例化编辑器
		var um = UM.getEditor('myEditor');
	</script>

</html>