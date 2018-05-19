<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="/css/personal.css" media="all">
	<script type="text/javascript" src="/js/jquery-3.2.0.min.js"></script>
</head>
<style type="text/css">
select{width:250px;}

   	#a1 {
	width: 80px;
	height: 30px;
	font-family: "微软雅黑";
	size: 10px;
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
$("#te").text("123");
</script>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>查看评论</span>
		</header>
		<div class="larry-personal-body clearfix">
		
			<form class="layui-form col-lg-5" action="" method="post">
					<%--
			<input type="text"  name="comment_id" value="${list.comment_id}" hidden="hidden"/>
	 
				<div class="layui-form-item">
					<label class="layui-form-label">类型:</label>
					<div class="layui-input-block">
						<c:if test="${list.type==1 }">
						<input type="text" disabled="true" name="type" id="type"  class="layui-input " value="文章"  autocomplete="off" disabled="disabled" style="width:250px;">
						</c:if>
						<c:if test="${list.type==2 }">
						<input type="text" disabled="true" name="type" id="type"  class="layui-input " value="课程"  autocomplete="off" disabled="disabled" style="width:250px;">
					</c:if>
					</div>
				</div>
				
				 <div class="layui-form-item">
					<label class="layui-form-label">评论内容:</label>
					<div class="layui-input-block">
					<textarea rows="60" cols="50"  readonly="readonly">${list.content}</textarea>
					</div>
				</div> 
				
				<div class="layui-form-item">
					<label class="layui-form-label">父级评论内容:</label>
					<div class="layui-input-block">
					<textarea rows="60" cols="50" readonly="readonly">${coment.content}</textarea>
					</div>
				</div> --%>
				
			
		
		
		
		
					<div class="layui-tab-item layui-field-box layui-show">
						<table class="layui-table table-hover" lay-even="" lay-skin="nob">
						
							<thead>
								<tr>
									<th>序号</th>
									<th>邮件</th>
									<th>类型</th>
									<th>点赞</th>
									<th>回复</th>
									<th>创建时间</th>
									<th>回复内容</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${list}" var="p" varStatus="stat">
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
										<td>
												<a class="layui-btn layui-btn-danger" data-id="1"
											href="/admin/cy/delete/${p.comment_id}"> <i
												class="layui-icon"></i> 
										</a>
										</td>
									</tr> 
								</c:forEach>
						
						</table>
					</div>
		
		
		
		
		
			<div class="layui-form-item">
					<div class="layui-input-block">
				    <button type="button"  class="btn btn-default" ><a href="/admin/cy/listcomment" id="a1">返回</a></button>
					</div>
		
	
		
				
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="/common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['form','upload'],function(){
         var form = layui.form();
         layui.upload({ 
             url: '' ,//上传接口 
             success: function(res){
              //上传成功后的回调 
              console.log(res) 
            } 
         });

	});
</script>
<script>     
    laydate({         
        elem: '#data',    //选择input的id     
        event: 'focus',     //鼠标获得input焦点开始下拉日期控件
        format: 'YYYY-MM-DD', //日期格式
                festival: true, //显示节日
                choose: function(datas){ //选择日期完毕的回调
                   /* alert('得到：'+datas);*/
                }
    }); 
//添加第二个input日期下拉的方法
    laydate({         
        elem: '#txt',         
        event: 'focus'     
    }); 
</script>


</body>
</html>