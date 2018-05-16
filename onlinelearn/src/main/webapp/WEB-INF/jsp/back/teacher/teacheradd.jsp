<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>讲师信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<script src="/js/jquery-3.0.0.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="/css/personal.css" media="all">
	<link rel="stylesheet" href="/js/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="/js/ztree/css/demo.css" type="text/css">
	<script type="text/javascript" src="/js/ztree/js/jquery.ztree.core.js"></script>
<style type="text/css">
	#t{
	border: 1px solid;
	width: 200px;
	height: 200px;
	background-image:1px;
	}
	
	
	</style>

<script type="text/javascript">
	    function check(){
	        var file = document.getElementById("file1").value;
	        if(file == ""){
	          alert('请选择要上传的文件');
	          return false;
	         }else{
	          window.returnValue=file;
	          return true;
	         }
	       }

 function save() {
			document.forms[0].action="/teacher/tosave";
			document.forms[0].subject();
		}
	     function tj() {
			var tj=$("#tj").val();
			
			if ($("#name").val()=="") {
				alert("名字不能为空")
			}
			if ($("#is_star").val()=="") {
				alert("讲师等级不能为空")
			}
		}
</script>
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>添加讲师</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix changepwd">
			<form class="layui-form col-lg-4" method="post" action="/admin/teacher/tosave" enctype="multipart/form-data">
			 	<div class="layui-form-item">
					<label class="layui-form-label">讲师名称</label>
					<div class="layui-input-block">  
					  	<input type="text" name="name" id="name" class="layui-input"   >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">讲师资历</label>
					<div class="layui-input-block">  
					  	<input type="text" id="education" name="education"   class="layui-input"  >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">讲师专业</label>
					  <div class="layui-input-block">  
					  <input id="citySel" type="text" readonly class="layui-input"/>
		&nbsp;<a id="menuBtn" href="#" onclick="showMenu(); return false;">选择</a>
		<input type="hidden" name="subjectids" value="${a.subject_id.subject_id}">
					  
					</div>  
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">讲师等级</label>
					<div class="layui-input-block">  
					  	<select  id="ptid" name="is_star" class="form-control">
									<option value="0">--请选择--</option>
									<option value="2">首席讲师</option>
									<option value="1">高级讲师</option>
						</select>
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">讲师排序</label>
					<div class="layui-input-block">  
					  	<input type="text" name="sort" class="layui-input" >
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">讲师简介</label>
					<div class="layui-input-block">  
					  	<textarea class="form-control" name="career" rows="3" ></textarea>
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">讲师头像</label>
					<div class="layui-input-block">
					<div>
			<div class="col-sm-4">
				<img id="blah" style="width:200px; height:150px;" />
				<input type="hidden" runat="server" id="file" /> 
				<input type="file" name="file" id="imgInp">
			</div>
					</div>
					</div>
				</div>
				
				
				<div class="layui-form-item change-submit">
					<div class="layui-input-block">
						<input type="submit" class="layui-btn" id="tj" value="立即提交" />
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>

<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
	<ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
</div>
 	
<script type="text/javascript" src="/common/layui/layui.js"></script>

<script type="text/javascript">

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
			$("input[name=subjectId]").val(ids);
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
	layui.use(['form','upload'],function(){
         var form = layui.form();
	});
	
	$(function(){ 
		$("#pbid").val("${product.pbrand.pbid}");
		$("#ptid").val("${product.productType.ptid}");
	}
		)
			
//div显示图片
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