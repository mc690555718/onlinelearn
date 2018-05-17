<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>图片管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<script src="/js/jquery-3.0.0.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="/common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css" href="/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<script src="/common/bootstrap/js/bootstrap.js" type="text/javascript"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="/common/bootstrap/css/bootstrap.css" />

<style type="text/css">
#in1 {
	background-color: mediumaquamarine;
	width: 100px;
	height: 35px;
	font-family: "微软雅黑";
	size: 10px;
	color: white;
}

#a1 {
	width: 80px;
	height: 30px;
	font-family: "微软雅黑";
	size: 10px;
	color: white;
}

#inp1{
	width: 150px;
	height: 30px;
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
	function list() {
		document.forms[0].action = "/admin/cy/listcomment";
		document.forms[0].submit;
	}

	/*清空  */
	function cy() {
		$(document).ready(function() {
			$(function() {
				$('input:reset').click(function() {
					$('.input').val("");
				});
			});
		});
	} 
	
	

 	function cly() {
		document.forms[0].action = "/admin/cy/to";
		document.forms[0].submit();
	} 
</script>
</head>
<body>						
	<section class="layui-larry-box">
		<div class="larry-personal">
			<div class="layui-tab"> 
				<blockquote class="layui-elem-quote news_search">
					<form action="" method="post">
					
						<div class="layui-inline">
							<div class="layui-input-inline">
							<input value="" placeholder="请输入邮箱" id="inp1"  name="email" type="text"  maxlength="20">
							</div>
							<div class="layui-input-inline">
				               <input value="" placeholder="请输入内容" id="inp1" name="content" type="text"  maxlength="20"> 
							</div>

							<label class="layui-inline">类型:</label>
							<div class="layui-input-inline">
								<select class="se" id="type" name="type" class="form-control" id="inp1">
									<option value="">--请选择--</option>
									<option value="1">文章</option>
									<option value="2">课程</option>
								</select>
							</div>
							开始时间 
							<div class="layui-input-inline">
							<input class="layui-input search_input" type="text" name="start" onclick="WdatePicker()" id="inp1">
							</div>
							结束时间:
							<div class="layui-input-inline">
								<input class="layui-input search_input" type="text" name="end" onclick="WdatePicker()" id="inp1">

							</div>

							<button type="submit" id="in1" onclick="list()">查找评论</button>
							<button type="reset" id="in1" onclick="cy()">清空</button>
						</div>

					</form>
				</blockquote>

				<div
					class="layui-tab-content larry-personal-body clearfix mylog-info-box">
					<!-- 操作日志 -->
					<div class="layui-tab-item layui-field-box layui-show">
						<table class="layui-table table-hover" lay-even="" lay-skin="nob">
							<thead>
								<tr>
									<th>ID</th>
									<th>邮件</th>
									<th>类型</th>
									<th>点赞</th>
									<th>回复</th>
									<th>创建时间</th>
									<th>评论内容</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${lists}" var="p" varStatus="stat">
									<tr>
										<td>${stat.index+1}</td>
										<td>${p.user.email }</td>
										<td><c:if test="${p.type==2}">
			                                                                                                     课程
			                           	</c:if> <c:if test="${p.type==1}">
				                                                                                        文章
				                        </c:if></td>
										<td>${p.praise_count}</td>
										<td>${p.reply_count}</td>
										<td><fmt:formatDate value="${p.addtime}" type="date" pattern="yyyy-MM-dd" /></td>
										<td><div id="ca" title="${p.content}">${p.content}</div>
										<td><a class="layui-btn layui-btn-mini" href="#" onclick="cly()"><i
												class="iconfont icon-edit"></i> 回复评论</a> 
												<shiro:hasPermission name="comment_del">
												<a class="layui-btn layui-btn-danger layui-btn-mini" data-id="1"
											href="/admin/cy/delete/${p.comment_id}"> <i
												class="layui-icon"></i> 删除
										</a>
										</shiro:hasPermission>
										</td>
									</tr> 
								</c:forEach>
						    <tr>
						    <td align="center" colspan="9"><font face="微软雅黑" size="3px"
							color="black">一共${page.pages}页</font> 
							<font face="微软雅黑" size="3px"
							color="black">每页${page.pageSize }条/</font>
							<a class="layui-btn"
							href="/admin/cy/listcomment?page=${page.firstPage}">首页</a>
							<a class="layui-btn"
							href="/admin/cy/listcomment?page=${page.prePage}">上一页</a>
							<a class="layui-btn"
							href="/admin/cy/listcomment?page=${page.nextPage}">下一页</a>
							<a class="layui-btn"
							href="/admin/cy/listcomment?page=${page.lastPage}">最后页</a>
							</td>
					        </tr>
						</tbody>
						</table>
					</div>
					<div class="layui-tab-item layui-field-box">
						<table class="layui-table table-hover" lay-even="" lay-skin="nob">
							<thead>
								<tr>
									<th><input type="checkbox" id="selected-all"></th>
									<th>ID</th>
									<th>管理员账号</th>
									<th>状态</th>
									<th>最后登录时间</th>
									<th>上次登录IP</th>
									<th>登录IP</th>
									<th>IP所在位置</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>110</td>
									<td>admin</td>
									<td>后台登录成功</td>
									<td>2016-12-19 14:26:03</td>
									<td>127.0.0.1</td>
									<td>127.0.0.1</td>
									<td>Unknown</td>
								</tr>
							</tbody>
						</table>
						<div class="larry-table-page clearfix">
							<a href="javascript:;" class="layui-btn layui-btn-small"><i
								class="iconfont icon-shanchu1"></i>删除</a>
							<div id="page2" class="page"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	 	<script type="text/javascript" src="/common/layui/layui.js"></script>
 
</body>
</html>