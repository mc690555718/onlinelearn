<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>权限管理</TITLE>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/demo.css" type="text/css">
<link rel="stylesheet" href="/css/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="/js/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" href="/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css"
	href="/static/common/layui/css/layui.css" media="all">
<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
<script type="text/javascript" src="/static/common/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="/static/common/ztree/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="/js/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="/static/common/layui/layui.js"></script>
<SCRIPT type="text/javascript">
	var setting = {
		check : {
			enable : true
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pId",
				rootPId : "0"
			},
			key : {
				name : "name"
			}
		}
	};

	function loadTree() {
		$.post("/admin/sysfunctioin/loadtree", function(data) {
			$.fn.zTree.init($("#tree"), setting, data);
		});
	}

	function loadTreeAjax(role_id) {
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "/admin/sysfunctioin/loadtree",
			data : {
				role_id : role_id
			},
			success : function(result) {
				$.fn.zTree.init($("#tree"), setting, result);
			}
		});
	}
</SCRIPT>
</HEAD>

<BODY>

	<div>
		<form action="" id="roleForm" method="post">
			<input type="hidden" name="perid" id="perid" />
			<div class="row" style="width: 1019px">
				<div class="col-md-3">
					<select class="form-control" id="role_id" name="role_id" style="width: 300px">
						<c:forEach items="${roles}" var="role">
							<option value="${role.role_id }">${role.role_name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<button type="button" class="btn btn-success" aria-label="Left Align"
				id="btn_submit">保存</button>

			<button type="button" class="btn btn-danger" aria-label="Left Align"
				id="btn_delete">删除</button>

			<!-- 			新建用户 -->
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#myModal" id="btn_modal">新建角色</button>
<!-- 			Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">创建一个新的用户</h4>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<label for="exampleInputEmail1">角色名称</label> <input type="text"
									class="form-control" id="role_name" name="role_name"
									placeholder="请输入长度为2-10的角色名(不包括标点符号)">
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="button" id="btn_addRole" class="btn btn-primary">确认</button>
						</div>
					</div>
				</div>
			</div>

		</form>
		<ul id="tree" class="ztree"
			style="width: 350px; height: 500px; margin-left: 300px"></ul>
	</div>

	<script type="text/javascript">
	layui.use('layer', function(){ //独立版的layer无需执行这一句
		  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
	});
	
		$(document).ready(function() {
			loadTree();

			$('#role_id').change(function() {
				var role_id = $("#role_id").val();
				loadTreeAjax(role_id);
			});

			$("#btn_submit").click(function() {
				//根据ztree的id获取ztree对象
				var treeObj = $.fn.zTree.getZTreeObj("tree");
				//获取ztree上选中的节点，返回数组对象
				var nodes = treeObj.getCheckedNodes(true);
				var array = new Array();
				for (var i = 0; i < nodes.length; i++) {
					var id = nodes[i].id;
					array.push(id);
				}
				var functionIds = array.join(",");
				//为隐藏域赋值（权限的id拼接成的字符串）
				$("#perid").val(functionIds);
				document.forms[0].action = "/admin/sysrole/saveroelfunction";
				document.forms[0].submit();
			});
			
			$("#btn_addRole").click(function() {
				var roleName = $("#role_name").val();
				if(roleName == null || roleName.trim().length == 0){
					layer.tips('请输入角色名','#role_name');
				}else{
					var res = /^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$/;
					if(!res.test(roleName)){
						layer.tips('角色名不合法,请输入长度为2-10的角色名(不包括标点符号)','#role_name');
					}else{
						$.post("/admin/sysrole/checkrolename?role_name="+roleName
						            ,function(data){
							alert(data);
							if(data){
								layer.tips('已存在的角色名','#role_name');
							}else{
				 				document.forms[0].action = "/admin/sysrole/addrole";
				 				document.forms[0].submit();
							}
						},"json");
					}
				}

			});
			
			
			$("#btn_delete").click(function() {
				document.forms[0].action = "/admin/sysrole/deleterole";
				document.forms[0].submit();
			});
			
		});
	</script>
</BODY>
</HTML>