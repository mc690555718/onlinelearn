<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
<link rel="stylesheet" type="text/css"
	href="/common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
	<script src="/js/My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>

<style type="text/css">  
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
function list(){
	document.froms[0].action="/admin/teacher/list";
	document.froms[0].submit;
	
}
</script>
</head>
<body>
	<section class="layui-larry-box">
		<div class="larry-personal">
			<div class="layui-tab">
				<blockquote class="layui-elem-quote news_search">
					<div class="layui-inline">
						<form action="/admin/teacher/list" method="get">
							<div class="layui-input-inline">
								<input value="${name}" placeholder="请输入关键字"
									class="layui-input search_input" name="qname"
									type="text">
							</div>

							<div class="layui-input-inline">
								<select class="form-control" name="isstar" value="${is_star}">
									<option value="-1">---请选择---</option>
									<option value="2">首席讲师</option>
									<option value="1">高级讲师</option>
								</select>
							</div>
							开始时间
							<div class="layui-input-inline">
							 <input class="layui-input search_input" name="star" value="${star}"
							 onclick="WdatePicker()">
							</div>
		
							结束时间
							<div class="layui-input-inline">
								<input class="layui-input search_input" name="emp" value="${emp}"
								 onclick="WdatePicker()"> 
							</div>
							
							<button type="submit" class="layui-btn layui-btn-primary" onclick="list()">查询</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</form>
					</div>
					<div class="layui-inline">


						<!-- 操作日志 -->
						<div class="layui-form news_list">
							<table class="layui-table" id="table1">
								<colgroup>
									<col width="2%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
								</colgroup>
								<thead>
									<tr>
										<th style="text-align: left;">编号</th>
										<th>教师名称</th>
										<th>教师头衔</th>
										<th>教师资历</th>
										<th>教师简介</th>
										<th>创建时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody class="news_content">

									<c:forEach items="${list}" var="p" varStatus="stat">
										<tr>
											<th>${p.id}</th>
											<th>${p.name}</th>
											<th>
											<c:if test="${p.is_star==2}">
												首席讲师
											</c:if>
											<c:if test="${p.is_star==1}">
												高级讲师
											</c:if>
											</th>
											<th><div id="ca" title="${p.education}">${p.education}</div></th>	
											<th><div id="ca" title="${p.career}">${p.career}</div></th>
											<th width="10%">
												<fmt:formatDate value="${p.create_time}" type="date" pattern="yyyy-MM-dd"/>
											</th>
											<th>
											<shiro:hasPermission name="teacher_delete">
			
										<a href="/admin/teacher/delete/${p.id}" class="layui-btn layui-btn-normal">删除</a>
											</shiro:hasPermission>
											<shiro:hasPermission name="teacher_update">
	
												 <a href="/admin/teacher/updateinit/${p.id }" class="layui-btn layui-btn-normal">修改</a></th>
										  </th>
										    </shiro:hasPermission>
										</tr>
				
									</c:forEach>
					
				                 	<tr>
									<td align="center" colspan="9"><font face="微软雅黑"
										size="3px" color="black">一共${page.pages}页</font> <font
										face="微软雅黑" size="3px" color="black">每页${page.pageSize }条/</font>
										<font face="微软雅黑" size="3px" color="black">当前第${page.pageNum }页</font>
										<c:if test="${page.isFirstPage==true }">
											<a class="layui-btn">首页</a>
										</c:if> <c:if test="${page.isFirstPage==false }">
											<a class="layui-btn"
												href="/admin/teacher/list?page=${page.firstPage}">首页</a>
										</c:if> <c:if test="${page.hasPreviousPage==true }">
											<a class="layui-btn"
												href="/admin/teacher/list?page=${page.prePage}">上一页</a>
										</c:if> <c:if test="${page.hasPreviousPage==false }">
											<a class="layui-btn">上一页</a>
										</c:if> <c:if test="${page.hasNextPage==true }">
											<a class="layui-btn"
												href="/admin/teacher/list?page=${page.nextPage }">下一页</a>
										</c:if> <c:if test="${page.hasNextPage==false }">
											<a class="layui-btn">下一页</a>
										</c:if> <c:if test="${page.isLastPage==false }">
											<a class="layui-btn"
												href="/admin/teacher/list?page=${page.lastPage }">最后一页</a>
										</c:if> <c:if test="${page.isLastPage==true }">
											<a class="layui-btn">最后一页</a>
										</c:if></td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="/common/layui/layui.js"></script>
</body>
</html>