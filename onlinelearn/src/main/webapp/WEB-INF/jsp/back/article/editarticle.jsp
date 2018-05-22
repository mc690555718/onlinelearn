<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script src="/js/jquery-3.0.0.js" type="text/javascript" charset="utf-8"></script>
<link href="/js/utf8-jsp/themes/default/css/umeditor.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css"
	href="/common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/js/utf8-jsp/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/js/utf8-jsp/umeditor.min.js"></script>
<script type="text/javascript" src="/js/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	function update() {
		var title = $("#title").val();
		var summary = $("#summary").val();
		var author = $("#author").val();
		var source = $("#source").val();
		if(title!=""&&summary!=""&&author!=""&&source!=""){
			document.forms[0].action = "update";
			document.forms[0].submit();
		}else{
			alert("添加的数据不能为空")
		}
			
	}
</script>

</head>
<script type="text/javascript">
		function fun(a, b) {
			var v = a.value;
			var t;
			if(b == 1) {
				var reg =/^[0-9]*$/;
				t = document.getElementById("d1");
				if(v.trim().length == 0) {
					t.innerText = "标题不能为空!";
					t.style.color = "red";
					$("#btn").attr({ disabled: "disabled" });
				}else if(reg.test(v)){
					t.innerText = "标题不能为纯数字";
					t.style.color = "red";
				} else{
					t.innerText = "";
					$("#btn").removeAttr("disabled");
				}

			} else if(b == 2) {
				var reg =/^[0-9]*$/;
				t = document.getElementById("d2");
				if(v.trim().length == 0) {
					t.innerText = "摘要不能为空!";
					t.style.color = "red";
					$("#btn").attr({ disabled: "disabled" });
				} else if(reg.test(v)){
					t.innerText = "摘要不能为纯数字";
					t.style.color = "red";
				} else{
					t.innerText = "";
					$("#btn").removeAttr("disabled");
				}
			} 
		}
</script>


<body>
	<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit"> <span>修改文章</span> </header>
		<!-- /header -->
		<div class="larry-personal-body clearfix changepwd">
			<form class="layui-form col-lg-4" method="post" action=""
				enctype="multipart/form-data">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<input type="hidden" name="article_id" id="article_id"
							value="${article.article_id }" class="layui-input layui-disabled">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">标题</label>
					<div class="layui-input-block">
						<input type="text" name="title" id="title"
							value="${article.title }" class="layui-input" onblur="fun(this,1)" maxlength="25" placeholder="文章标题不得超过25个字">
					</div>
					<span id="d1"></span>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">摘要</label>
					<div class="layui-input-block">
						<input type="text" name="summary" id="summary"
							value="${article.summary }" class="layui-input" onblur="fun(this,2)" maxlength="40" placeholder="文章标题不得超过40个字">
					</div>
					<span id="d2"></span>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">作者</label>
					<div class="layui-input-block">
						<input type="text" name="author" id="author"
							value="${article.author }" readonly="readonly"
							class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">来源</label>
					<div class="layui-input-block">
						<input type="text" name="source" id="source"
							value="${article.source }" class="layui-input" readonly="readonly">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">图片</label>
					<div class="layui-input-block">
						<img alt="" src="${article.image_url }" id="blah"
							name="image_urls" style="height: 200px; width: 200px" />
							<input type="file" name="file" id="file">
							 <input type="hidden" name="hiddens" value="${article.image_url }">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">文章内容</label>
					<div class="layui-input-block">
						<!--style给定宽度可以影响编辑器的最终宽度-->
						<script type="text/plain" name="content" id="content"
							style="width:600px;height:240px;">
                       <p>${article.articleContent.content }</p>
                    </script>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">排序值</label>
					<div class="layui-input-block">
						<input type="text" name="sort" id="sort" value="${article.sort }"
							class="layui-input">
					</div>
				</div>

				<div class="layui-form-item change-submit">
					<div class="layui-input-block">
						<button class="layui-btn" onclick="update()">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	</section>
	<script type="text/javascript">
// 	layui.use(['form','upload'],function(){
//         var form = layui.form();
//         layui.upload({ 
//             url: '' ,//上传接口 
//             success: function(res){
//              //上传成功后的回调 
//              console.log(res) 
//            } 
//         });

// 	});
		
		
//  图片显示
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#file").change(function() {
		readURL(this);
	});
	</script>

</body>
<!-- 实例化编辑器 -->
<script type="text/javascript">
//实例化编辑器
var um = UM.getEditor('content');
 function getContentTxt() {
    var arr = [];
    arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
    arr.push("编辑器的纯文本内容为：");
    arr.push(UM.getEditor('contene').getContentTxt());
    alert(arr.join("\n")); 
}
</script>
</html>