<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>查看邮件信息</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css"
	href="/common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css"
	href="/common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
</head>
<body>
	<section class="layui-larry-box">
		<div class="larry-personal">
			<header class="larry-personal-tit">
				<span>查看</span>
			</header>
			<div class="larry-personal-body clearfix">

				<form class="layui-form col-lg-5" action="" method="post">
					<input type="text" name="id" value="${list.id}" hidden="hidden" />
					<div class="layui-form-item">
						<label class="layui-form-label">操作人</label>
						<div class="layui-input-block">
							<input type="text" name="user_id" class="layui-input "
								value="${list.user.user_name}" autocomplete="off"
								disabled="disabled">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">邮箱</label>
						<div class="layui-input-block">
							<input type="text" name="email" class="layui-input "
								value="${list.email}" autocomplete="off" disabled="disabled">
						</div>
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label">类型</label>
						<div class="layui-input-block">
							<c:if test="${list.type==1}">
								<input type="text" name="type" class="layui-input " value="普通"
									autocomplete="off" disabled="disabled">
							</c:if>
							<c:if test="${list.type==2}">
								<input type="text" name="type" class="layui-input " value="定时 "
									autocomplete="off" disabled="disabled">
								<input type="text" name="type" class="layui-input "
									value=" <fmt:formatDate value="${list.send_time }" type="date"
							pattern="yyyy-MM-dd hh:mm:ss" />"
									autocomplete="off" disabled="disabled">
							</c:if>
						</div>
					</div>


					<div class="layui-form-item">
						<label class="layui-form-label">是否发送</label>
						<div class="layui-input-block">
							<c:if test="${list.status==1}">
								<input type="text" name="status" class="layui-input "
									value="已发送" autocomplete="off" disabled="disabled">
							</c:if>
							<c:if test="${list.status==2}">
								<input type="text" name="status" class="layui-input "
									value="未发送" autocomplete="off" disabled="disabled">
							</c:if>
						</div>
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label">邮箱标题</label>
						<div class="layui-input-block">
							<input type="text" name="title" class="layui-input"
								value="${list.title}" disabled="disabled">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">邮箱正文</label>
						<div class="layui-input-block">
							<input type="text" name="content" class="layui-input"
								value="${list.content}" disabled="disabled">
						</div>
					</div>

					<div class="layui-form-item">
						<div class="layui-input-block">
							<a href="/admin/email/sendEmaillist">
								<button type="button" class="layui-btn" lay-submit=""
									lay-filter="demo1">返回</button>
							</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="/common/layui/layui.js"></script>
	<script type="text/javascript">
		layui.use([ 'form', 'upload' ], function() {
			var form = layui.form();
			layui.upload({
				url : '',//上传接口 
				success : function(res) {
					//上传成功后的回调 
					console.log(res)
				}
			});
		});
	</script>
	<script>
		laydate({
			elem : '#data', //选择input的id     
			event : 'focus', //鼠标获得input焦点开始下拉日期控件
			format : 'YYYY-MM-DD', //日期格式
			festival : true, //显示节日
			choose : function(datas) { //选择日期完毕的回调
				/* alert('得到：'+datas);*/
			}
		});
		//添加第二个input日期下拉的方法
		laydate({
			elem : '#txt',
			event : 'focus'
		});
	</script>
</body>
</html>