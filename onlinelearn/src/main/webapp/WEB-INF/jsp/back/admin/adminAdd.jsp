<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
</head>

<body style="width:100%;height:100%;">
<section class="layui-larry-box ">
	<div class="larry-personal">
	    <div class="layui-tab">
            <blockquote class="layui-elem-quote news_search">
				<div class="layui-inline">
				    <div class="layui-input-inline">
				    	<input value="" placeholder="请输入关键字" class="layui-input search_input" type="text">
				    </div>
				    <a class="layui-btn search_btn">查询</a>
				</div>
				
			</blockquote>
			<blockquote class="layui-elem-quote news_search">
				<div class="layui-btn-group">
				  <button class="layui-btn layui-btn-small layui-btn-normal"><i class="layui-icon">&#xe61f;</i></button>
				  <button class="layui-btn layui-btn-small layui-btn-danger"><i class="layui-icon">&#x1002;</i></button>
				  <button class="layui-btn layui-btn-small layui-btn-warm"><i class="layui-icon">&#xe601;</i></button>
				  <button class="layui-btn layui-btn-small layui-btn-disabled"><i class="layui-icon">&#xe642;</i></button>
				  <button class="layui-btn layui-btn-small layui-btn-primary"><i class="layui-icon">&#xe603;</i></button>
				  <button class="layui-btn layui-btn-small layui-btn-primary"><i class="layui-icon">&#xe602;</i></button>
				  <button class="layui-btn layui-btn-small layui-btn-primary"><i class="layui-icon">&#xe62d;</i></button>
				  <button class="layui-btn layui-btn-small layui-btn-primary"><i class="layui-icon">&#xe609;</i></button>
				  <button class="layui-btn layui-btn-small layui-btn-primary"><i class="layui-icon">&#xe640;</i></button>
				</div>
			</blockquote>
			
<!-- 			 密码 -->
<!-- 				  <div class="layui-form-item"> -->
<!-- 				    <label class="layui-form-label">密码</label> -->
<!-- 				    <div class="layui-input-inline"> -->
<!-- 				      <input type="password" name="password" value="" required lay-verify="required" autocomplete="off" class="layui-input"> -->
<!-- 				    </div> -->
<!-- 				    <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
<!-- 				  </div> -->
            
		         <!-- 用户添加 -->
                <form class="layui-form" action="" method="post" style="height: 530px;">
                   <!-- 用户名 -->
				  <div class="layui-form-item">
				    <label class="layui-form-label" >用户名</label>
				    <div class="layui-input-block">
				      <input type="text" name="login_name" value="" required  lay-verify="required"  autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  
                  <!--  密码 -->
				  <div class="layui-form-item">
				    <label class="layui-form-label">密码</label>
				    <div class="layui-input-inline">
				      <input type="password" name="login_pwd" value="" required lay-verify="required" autocomplete="off" class="layui-input">
				    </div>
				    <div class="layui-form-mid layui-word-aux">辅助文字</div>
				  </div>
				  
				  <div class="layui-form-item">
				    <label class="layui-form-label">真实姓名</label>
				    <div class="layui-input-block">
				      <input type="text" name="user_name" value="" required  lay-verify="required"  autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  
				   <div class="layui-form-item">
				    <label class="layui-form-label">Tel</label>
				    <div class="layui-input-block">
				      <input type="text" name="tel" value="" required  lay-verify="required"  autocomplete="off" class="layui-input">
				    </div>
				  </div>

				  <div class="layui-form-item">
				    <label class="layui-form-label">角色</label>
				    <div class="layui-input-block">
				    <select name="role_id" lay-verify="required" id="sel_role">
                         <option value="-1">--------请选择角色-------</option>
                         <c:forEach items="${roles}" var="role">
                         <c:if test="${user.role.role_id == role.role_id}">
                             <option value="${role.role_id}" selected>${role.role_name}</option>
                         </c:if>
                         <c:if test="${user.role.role_id != role.role_id}">
                             <option value="${role.role_id}">${role.role_name}</option>
                         </c:if>
				        </c:forEach>
                    </select>  
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn" id="btn_submit" lay-filter="formDemo">立即提交</button>
				      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
				  </div>
				  
				</form>
 

			     <!-- 完 -->
			   
		    </div>
		</div>
	
</section>
<script type="text/javascript" src="/common/layui/layui.js"></script>
<script type="text/javascript" src="/js/newslist.js"></script>
<script>
/* //Demo
layui.use('form', function(){
  var form = layui.form;
  
  //监听提交
  form.on('submit(formDemo)', function(data){
    layer.msg(JSON.stringify(data.field));
    return false;
  });
}); */

$(function(){
	
	$("#btn_submit").click(function(){
		document.forms[0].action="/admin/sysuser/createuser";
		document.forms[0].submit();
	});
});

</script>
</body>
</html>