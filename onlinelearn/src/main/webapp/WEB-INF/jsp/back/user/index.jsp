<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
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
<link rel="stylesheet" type="text/css" href="/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
<link rel="stylesheet" href="/common/layui/css/layui.css" media="all">
<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<link href="/js/font-awesome-4.7.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript">
function xiugai(id) { 
	layer.open({
				id : 1,
				type : 1,
				title : '修改密码',
				area : [ '500px', 'auto' ],
				content : ' <div class="row" style="width: 450px;  margin-left:10px; margin-top:10px;">'
						+ '<div class="col-sm-12">'
						+ '<div class="input-group">'
						+ '<span class="input-group-addon"> 新 密 码   :</span>'
						+ '<input id="firstpwd" type="password" class="layui-input placeholder="请输入密码">'
						+ '</div>'
						+ '</div>'
						+ '<div class="col-sm-12" style="margin-top: 10px">'
						+ '<div class="input-group">'
						+ '<span class="input-group-addon">确认密码:</span>'
						+ '<input id="secondpwd" type="password" class="layui-input placeholder="请再输入一次密码">'
						+ '</div>' + '</div>' + '</div>',
				btn : [ '保存', '取消' ],
				btn1 : function(index, layero) {
					 var fir=$("#firstpwd").val();
					
					 var sev=$("#secondpwd").val();
					
					 if (fir!=sev) {
					      alert("两次密码不一致!请重新输入！");
					      $("#firstpwd").val("");
					      $("#secondpwd").val("");
					 } else{
					    if (fir.length<6) {
					    alert("密码不能少于6位数！");  
					    $("#firstpwd").val("");
					     $("#secondpwd").val("");
					    } else{
					      $.post("updatepwd?id="+id+"&fir="+fir,
					    function(data){
					    if (data==1) {
					    	alert("修改成功！");
					    	layer.close(index);
					    } else{
					    }
					    }				    
					    )
					    }
					 }
				},
				btn2 : function(index, layero) {
					layer.close(index);
				}

			});
}

	function getList() {
		
		document.forms[0].action ="/admin/user/listUser";
		document.forms[0].submit();

	}
	
	function dongjie (id,zz) {
		if (zz==2) {
			 $.post("dongjiezz?id="+id+"&zz="+zz,function(data){
			   if (data==1) {
			   	alert("解冻成功！")
			   	location.href="/admin/user/listUser";
			   } 
			   })
		} else{
			   $.post("dongjiezz?id="+id+"&zz="+zz,function(data){
			   if (data==1) {
			   	alert("冻结成功！")
			   	location.href="/admin/user/listUser";
			   } 
			   })
		}
	}

</script>
<script>
 function daochu() {
	 document.forms[0].action ="/admin/user/excel";
	 document.forms[0].submit();
}
</script>
</head>
<body>
	<div class="larry-personal">
		<div class="layui-tab">
			<form action="" method="post">
				<div class="layui-inline">
					<div class="layui-input-inline">
						<input value="${name }" placeholder="请输入关键字" 
							class="layui-input search_inupt " type="text" name="name" >
					</div>
					<span>状态查询</span> <select class="layui-select" name="type">
						<option value="0" <c:if test="${type==0 }">selected</c:if>>--请选择--</option>
						<option value="1" <c:if test="${type==1 }">selected</c:if>>正常</option>
						<option value="2" <c:if test="${type==2 }">selected</c:if>>冻结</option>

					</select>

					<div class="layui-input-inline">
						<label class="layui-inline">开始时间:</label>
						<div class="layui-input-inline">
							<input class="Wdate layui-input" type="text"
								onClick="WdatePicker()" name="start" value="${start }"/>
						</div>
					</div>
					<div class="layui-input-inline">
						<label class="layui-inline">结束时间:</label>
						<div class="layui-input-inline">
							<input class="Wdate layui-input" type="text" name="end" 
								onClick="WdatePicker()" value="${end }"/ >
						</div>
					</div>
					<a class="layui-btn" onclick="getList()">查询</a> <a
						class="layui-btn" onclick="daochu()">查询并导出</a>
				</div>
			</form>
			<!-- 操作日志 -->
			<div class="layui-form news_list">
				<table class="layui-table">
					<colgroup>
						<col width="5%">
						<col width="8%">
						<col width="8%">
						<col width="6%">
						<col width="6%">
						<col width="4%">
						<col width="4%">
						<col width="6%">
						<col width="20%">
					</colgroup>
					<tr>
						<td>学员Id</td>
						<td>手机号</td>
						<td>邮箱号</td>
						<td>用户名</td>
						<td>昵称</td>
						<td>性别</td>
						<td>年龄</td>
						<td>状态</td>
						<td>操作</td>
					</tr>
					<c:forEach items="${listUser }" var="list">
						<tr>
							<td>${list.user_id }</td>
							<td>${list.mobile }</td>
							<td>${list.email }</td>
							<td>${ list.user_name}</td>
							<td>${list.show_name }</td>

							<c:if test="${list.sex==0 }">
								<td>男</td>
							</c:if>
							<c:if test="${list.sex==1 }">
								<td>女</td>
							</c:if>
							<td>${list.age }</td>
							<c:if test="${list.is_avalible==1 }">
								<td>正常</td>
								<td><shiro:hasPermission name="updatePwd">
										<button title="修改密码" onclick="xiugai(${list.user_id})"
											class="layui-btn layui-btn-normal">修改密码</button>
									</shiro:hasPermission> <shiro:hasPermission name="updateUser">
										<button title="冻结"
											onclick="dongjie(${list.user_id},${list.is_avalible})"
											class="layui-btn layui-btn-danger">冻结</button>
									</shiro:hasPermission></td>
							</c:if>
							<c:if test="${list.is_avalible==2 }">
								<td>冻结</td>
								<td><shiro:hasPermission name="updatePwd">
										<button title="修改密码" onclick="xiugai(${list.user_id})"
											class="layui-btn layui-btn-normal">修改密码</button>
									</shiro:hasPermission> <shiro:hasPermission name="updateUser">
										<button title="解冻"
											onclick="dongjie(${list.user_id},${list.is_avalible})"
											class="layui-btn layui-btn-danger">解冻</button>
									</shiro:hasPermission></td>

							</c:if>
						</tr>
					</c:forEach>
					<tr>
									<td align="center" colspan="9"><font face="微软雅黑"
										size="3px" color="black">一共${page.pages}页</font> <font
										face="微软雅黑" size="3px" color="black">每页${page.pageSize }条/</font>
										<c:if test="${page.isFirstPage==true }">
											<a class="layui-btn">首页</a>
										</c:if> <c:if test="${page.isFirstPage==false }">
											<a class="layui-btn"
												href="/admin/user/listUser/?page=${page.firstPage}&type=${type}">首页</a>
										</c:if> <c:if test="${page.hasPreviousPage==true }">
											<a class="layui-btn"
												href="/admin/user/listUser/?page=${page.prePage}&type=${type}">上一页</a>
										</c:if> <c:if test="${page.hasPreviousPage==false }">
											<a class="layui-btn">上一页</a>
										</c:if> <c:if test="${page.hasNextPage==true }">
											<a class="layui-btn"
												href="/admin/user/listUser/?page=${page.nextPage }&type=${type}">下一页</a>
										</c:if> <c:if test="${page.hasNextPage==false }">
											<a class="layui-btn">下一页</a>
										</c:if> <c:if test="${page.isLastPage==false }">
											<a class="layui-btn"
												href="/admin/user/listUser/?page=${page.lastPage }&type=${type}">最后一页</a>
										</c:if> <c:if test="${page.isLastPage==true }">
											<a class="layui-btn">最后一页</a>
										</c:if></td>
								</tr>
				</table>
			</div>

		</div>
	</div>
	<script type="text/javascript" src="/common/layui/layui.js"></script>
	<script type="text/javascript" src="/js/newslist.js"></script>


</body>
</html>