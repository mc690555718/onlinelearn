<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>修改讲师</title>
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
<link rel="stylesheet" type="text/css"
	href="/common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="/css/personal.css"
	media="all">
<link rel="stylesheet" href="/js/ztree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link rel="stylesheet" href="/js/ztree/css/demo.css" type="text/css">
<script type="text/javascript" src="/js/ztree/js/jquery.ztree.core.js"></script>
<style type="text/css">
#t {
	border: 1px solid;
	width: 200px;
	height: 200px;
	background-image: 1px;
}
</style>

<script type="text/javascript">

function list() {
	document.forms[0].acion="admin/teacher/getByIdSM";
	document.forms[0].option();
}
var setting = {
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			beforeClick: beforeClick,
			onClick: onClick
		}
	};

     var zNodes=${list};
	function beforeClick(treeId, treeNode) {
		 var check = (treeNode && !treeNode.isParent);
		 if (!check) alert("只能选择专业课程..."); 
		return check;
	}
	 
	function onClick(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
		nodes = zTree.getSelectedNodes(),
		v = "";
		var ids="";
		nodes.sort(function compare(a,b){return a.id-b.id;});
		for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].name + ",";
			ids+=nodes[i].id+",";
		}
		if (v.length > 0 ) v = v.substring(0, v.length-1);
		if(ids.length>0) ids=ids.substring(0,ids.length-1);
		var cityObj = $("#citySel");
		cityObj.attr("value", v);
		
		$("#subject").val(ids);
	}
	function showMenu() {
		var cityObj = $("#citySel");
		var cityOffset = $("#citySel").offset();
		$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
		$("body").bind("mousedown", onBodyDown);
	}
	function hideMenu() {
		$("#menuContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
	function onBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
			hideMenu();
		}
	}

	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
</script>

<script type="text/javascript">
function update() {
	    var name = $("#name").val();
		var education = $("#education").val();
		var sort = $("#sort").val();
		var career = $("#career").val();
		 if(name!=""&&education!=""&&sort!=""&&career!=""){
			 document.forms[0].action = "/admin/teacher/update";
			 document.forms[0].submit();
		 } 
		else{
			alert("修改的数据不能为空");
		}  
}
</script>

<script type="text/javascript">
		function fun(a, b) {
			var v = a.value;
			var t;
			if(b == 1) {
				var reg =/^[0-9]*$/;
				t = document.getElementById("d1");
				if(v.trim().length == 0) {
					t.innerText = "教师名称不能为空!";
					t.style.color = "red";
					$("#btn").attr({ disabled: "disabled" });
				}else if(reg.test(v)){
					t.innerText = "教师名称不能为纯数字";
					t.style.color = "red";
				} else{
					t.innerText = "";
					$("#btn").removeAttr("disabled");
				}

			} else if(b == 2) {
				var reg =/^[0-9]*$/;
				t = document.getElementById("d2");
				if(v.trim().length == 0) {
					t.innerText = "讲师资历不能为空!";
					t.style.color = "red";
					$("#btn").attr({ disabled: "disabled" });
				} else if(reg.test(v)){
					t.innerText = "讲师资历不能为纯数字";
					t.style.color = "red";
				} else{
					t.innerText = "";
					$("#btn").removeAttr("disabled");
				}
			} else if(b == 3) {
				var reg =/^[0-9]*$/;
				t = document.getElementById("d3");
				if(v.trim().length == 0) {
					t.innerText = "讲师简介不能为空!";
					t.style.color = "red";
					$("#btn").attr({ disabled: "disabled" });
				}else if(reg.test(v)){
					t.innerText = "讲师不能为纯数字";
					t.style.color = "red";
				}  else{
					t.innerText = "";
					$("#btn").removeAttr("disabled");
				}
		}
			else if(b == 4) {
				var reg =/^[0-9]*$/;
				t = document.getElementById("d4");
				if(!reg.test(v)){
					t.innerText = "排序值为数字";
					t.style.color = "red";
				}  else{
					t.innerText = "";
					$("#btn").removeAttr("disabled");
				}
		}
		}
</script>

</head>
<body>
	<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit"> <span>修改讲师</span> </header>
		<!-- /header -->
		<div class="larry-personal-body clearfix changepwd">
			<form class="layui-form col-lg-4" method="post"
				 enctype="multipart/form-data">
				<input type="hidden" name="id" value="${a.id }"
					class="layui-input layui-disabled">
				<div class="layui-form-item">
					<label class="layui-form-label">讲师名称</label>
					<div class="layui-input-block">
						<input type="text" name="name" value="${a.name }"
							class="layui-input" maxlength="5" onblur="fun(this,1)" placeholder="讲师名称不得超过5个字">
							<span id="d1"></span>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">讲师资历</label>
					<div class="layui-input-block">
						<input type="text" name="education" value="${a.education }"
							class="layui-input"  maxlength="50" onblur="fun(this,2)" placeholder="讲师资历不得超过50个字">
							<span id="d2"></span>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">讲师专业</label>
					<div class="layui-input-block">
						<input id="citySel" name="citySel" value="${a.subject_id.subject_name}"
							readonly class="layui-input" onblur="fun(this,5)" /> &nbsp;<a id="menuBtn" href="#"
							onclick="showMenu(); return false;">选择</a> <input type="hidden"
							name="subject" id="subject" value="${a.subject_id.subject_id}">
							<span id="d5"></span>
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label">讲师等级</label>
					<div class="layui-input-block">
						<select name="is_stars" onblur="fun(this,6)"> 
							<option value="2" <c:if test="${a.is_star==2}"> selected="selected" </c:if>>首席讲师</option>
							<option value="1" <c:if test="${a.is_star==1}"> selected="selected" </c:if>>高级讲师</option>
						</select>
						<span id="d6"></span>
					</div>
				</div>
				
				
				<div class="layui-form-item">
					<label class="layui-form-label">讲师排序</label>
					<div class="layui-input-block">
						<input type="text" name="sort" value="${a.sort}"
							class="layui-input" onblur="fun(this,4)">
							<span id="d4"></span>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">讲师简介</label>
					<div class="layui-input-block">
						<textarea class="form-control" name="career" rows="3" id="career" maxlength="300" onblur="fun(this,3)" placeholder="讲师简介不得超过300个字">${a.career }</textarea>
					<span id="d3"></span>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">讲师头像</label>
					<div class="layui-input-block">
						<div>
							<div class="col-sm-4">
								<img id="blah" style="width: 200px; height: 150px;"
									src="${a.pic_path }" name="pic_path" /> <input type="file"
									name="file" id="imgInp">
									<input type="hidden" name="hiddens" value="${a.pic_path}">
							</div>
						</div>
					</div>
				</div>


				<div class="layui-form-item change-submit">
					<div class="layui-input-block">
						<button class="layui-btn" id="btn" onclick="update()">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	</section>

	<div id="menuContent" class="menuContent"
		style="display: none; position: absolute;">
		<ul id="treeDemo" class="ztree" style="margin-top: 0; width: 160px;"></ul>
	</div>
	<script type="text/javascript" src="/common/layui/layui.js"></script>
	<script type="text/javascript">
	layui.use(['form','upload'],function(){
         var form = layui.form();
	});
	
	$(function(){ 
		$("#pbid").val("${product.pbrand.pbid}");
		$("#ptid").val("${product.productType.ptid}");
	}
		);
		</script>


	<script type="text/javascript">
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#blah').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

$("#imgInp").change(function() {
	readURL(this);
});

	</script>

</body>
</html>