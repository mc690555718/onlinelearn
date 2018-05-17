<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>个人信息</title>
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
<link rel="stylesheet" type="text/css"
	href="/validate/dist/validation.css" media="all">	
<script type="text/javascript" src="/validate/lib/jquery.js"></script>
<script type="text/javascript" src="/validate/dist/jquery.validate.js"></script>
<script type="text/javascript" src="/validate/dist/localization/messages_zh.js"></script>
</head>
<body>
	<section class="layui-larry-box">
		<div class="larry-personal">
			<div class="layui-tab">
				<form action="" method="post">
					<blockquote class="layui-elem-quote news_search">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<input value="" placeholder="请输入关键字"
									class="layui-input search_input" type="text" name="qname">
							</div>
							<a id="btn_search" class="layui-btn">查询</a>
							<shiro:hasPermission name="user_create">
								<a href="/admin/sysuser/tocreateuser"
									class="layui-btn layui-btn-xs"> <i class="layui-icon">&#xe608;</i>
									新增
								</a>
							</shiro:hasPermission>
						</div>
					</blockquote>
				</form>
				<div class="layui-inline">
					<div class="layui-form news_list">
						<table class="layui-table" id="table1">
							<colgroup>
								<col width="2%">
								<col width="8%">
								<col width="5%">
								<col width="5%">
								<col width="10%">
								<col width="10%">
								<col width="6%">
								<col width="12%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>

									<th style="text-align: left;">ID</th>
									<th>用户名</th>
									<th>真实姓名</th>
									<th>状态</th>
									<th>创建时间</th>
									<th>Tel</th>
									<th>角色</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody class="news_content">
								<c:forEach items="${users}" var="user">
									<tr id="tr">
										<td>${user.user_id}</td>
										<td>${user.login_name}</td>
										<td>${user.user_name}</td>
										<td><c:if test="${user.status == 0}">正常</c:if> <c:if
												test="${user.status == 1}">冻结</c:if></td>
										<td><fmt:formatDate value="${user.create_time}"
												type="date" pattern="yyyy-MM-dd hh:mm:ss" /></td>
										<td>${user.tel}</td>
										<td>${user.role.role_name}</td>
										<td>
										
										<shiro:hasPermission name="user_update">
										        <a href="javascript:;" onclick="updatePwd(${user.user_id})"
													class="layui-btn layui-btn-sm">修改密码
												</a>
												<a href="/admin/sysuser/toeditsysuser/${user.user_id}"
													class="layui-btn layui-btn-sm"> <i class="layui-icon">&#xe642;</i>
												</a>
										</shiro:hasPermission> 
										<shiro:hasPermission name="user_delete">
												<a href="/admin/sysuser/deleteuser/${user.user_id}"
													class="layui-btn layui-btn-sm layui-btn-danger"> <i class="layui-icon">&#xe640;</i>
												</a>
										</shiro:hasPermission></td>
									</tr>
								</c:forEach>
								<tr>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="/common/layui/layui.js"></script>
	<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
	<script type="text/javascript">
		$(function(){
			layui.use('layer', function(){ //独立版的layer无需执行这一句
				  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
			});
			
			//提交
			$("#btn_search").click(function(){
				document.forms[0].action="/admin/sysuser/userlist";
				document.forms[0].submit();
			});
			
		});
		
		function updatePwd(user_id){
			//修改密码
			var html ="     <div class='layui-form-item'>                                                             "
				+ "     <label class='layui-form-label'>新密码</label>                                                  "
				+ "     <div class='layui-input-block'>                                                               "
				+ "        <input type='password' name='newPwd' id='newPwd' autocomplete='off'                        "
				+ "          class='layui-input' placeholder='以字母开头，长度在6~18之间，只能包含字母、数字和下划线'/>               "
				+ "     </div>                                                                                        "
				+ "     </div>                                                                                        "
				+ "     <div class='layui-form-item'>                                                                 "
				+ "     <label class='layui-form-label'>再次输入密码</label>                                              "
				+ "     <div class='layui-input-block'>                                                               "
				+ "        <input type='password' name='confimPwd' id='confimPwd'                                     "
				+ "           autocomplete='off' class='layui-input' placeholder='请重复输入密码，并保证与上个密码输入相同'/>      "
				+ "     </div>                                                                                        "
				+ "     </div>                                                                                        ";
	        layui.use('layer', function(){
		        layer.open({
					type : 1,
					title : '修改密码',
					skin : 'layui-layer-rim',
					offset : '150px',
					btnAlign : 'c', //按钮居中
					shade : 0, //不显示遮罩
					maxmin : true, //开启最大化最小化按钮
					area : [ '500px', 'auto' ],
					btn : '确定',
					content : html,
					yes : function() {
                        var newPwd = $("#newPwd").val();
                        var confimPwd = $("#confimPwd").val();
                        if(newPwd == null || newPwd.trim().length == 0){//第一次输入密码为空
                        	layer.tips('新密码不能为空', '#newPwd');
                        }else{
                        	var pwd = /^[a-zA-Z]\w{5,17}$/;
                        	if(pwd.test(newPwd)){
                        		if(confimPwd != newPwd){
                            		layer.tips('两次输入密码不相同','#confimPwd');
                            	}else{
                            		$.post("/admin/sysuser/updatepwd?user_id="+user_id+"&login_pwd="+newPwd
                                    		,function(res){
                                    	layer.closeAll();
                                    	layer.msg('修改成功', {icon: 6});
                                    });
                            	}
                        	}else{
                        		layer.tips('以字母开头，长度在6~18之间，只能包含字母、数字和下划线', '#newPwd');
                        	}
                        	
                        }
					}
				});
	        });
		}
	</script>
</body>
</html>