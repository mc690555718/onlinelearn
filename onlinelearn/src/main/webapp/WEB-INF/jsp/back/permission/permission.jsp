<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>ZTREE DEMO - checkbox</TITLE>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/demo.css" type="text/css">
<link rel="stylesheet" href="/css/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bootstrap-theme.css">
<!-- <script type="text/javascript" src="/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
<script type="text/javascript" src="/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="/js/jquery.ztree.excheck.js"></script>

<!-- <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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

	function btn_submit() {
		//根据ztree的id获取ztree对象
		var treeObj = $.fn.zTree.getZTreeObj("tree");
		//获取ztree上选中的节点，返回数组对象
		var nodes = treeObj.getCheckedNodes(true);
		var array = new Array();
		for (var i = 0; i < nodes.length; i++) {
			var id = nodes[i].function_id;
			array.push(id);
		}
		var functionIds = array.join(",");
		//为隐藏域赋值（权限的id拼接成的字符串）
		$("#perid").val(functionIds);
		$("#roleForm").submit();
	}

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
			<div class="row">
				<div class="col-md-3">
					<select class="form-control col-md-3" id="role_id" name="role_id">
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
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="btn_modal">新建用户</button>
			<!-- Modal -->
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
						<div class="modal-body">...</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary">确认</button>
						</div>
					</div>
				</div>
			</div>

		</form>
		<ul id="tree" class="ztree"
			style="width: 500px; height: 500px; margin-left: 300px"></ul>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			loadTree();

			$('#role_id').change(function() {
				var role_id = $("#role_id").val();
				loadTreeAjax(role_id);
			});

//  			$('#myModal').modal('toggle');
			$('#btn_modal').click(function() {
				$('#myModal').modal('show');
			});
			
		});
	</script>
</BODY>
</HTML>