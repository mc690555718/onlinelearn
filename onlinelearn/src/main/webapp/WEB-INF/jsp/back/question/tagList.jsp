<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问答标签</title>
<link rel="stylesheet" href="/js/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="/js/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="/js/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="/js/ztree/js/jquery.ztree.exedit.js"></script>
<link rel="stylesheet" href="/js/bootstrap/css/bootstrap.css"/>
<script type="text/javascript" src="/js/bootstrap/js/bootstrap.js"></script>
</head>
<ul id="treeDemo" class="ztree"></ul>
	<!-- 标签添加 -->
<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
  新增问答标签
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">新增标签</h4>
      </div>
      <div class="modal-body">
           <form class="form-horizontal" method="post" action="">
						<div class="form-group">
							<label for="functionName" class="col-sm-2 control-label">标签名:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="tagName" name="questions_tag_name"
									placeholder="请输入标签名称...">
							</div>
						</div>
					</form>
 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" id="btn_add" class="btn btn-primary" onclick="addTag()">添加</button>
      </div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
	var setting = { 
		edit : {
			enable : true //是否异步  
		},
		data : {
			simpleData : {
				idKey: "id",  //设置启用简单数据格式时id对应的属性名称      
				pidKey: "pid",
				enable : true,
				rootPId: 0  
			}
		},
		callback : {
			beforeDrag : beforeDrag,
			beforeRemove : beforeRemove,
			beforeRename :beforeRename,
			selectedMulti: false
		}
	};

	/*  var zNodes =[
	  { id:1, pId:0, name:"parent node 1", open:true},  
	 { id:11, pId:1, name:"leaf node 1-1"},
	 { id:12, pId:1, name:"leaf node 1-2"},
	 { id:13, pId:1, name:"leaf node 1-3"},
	  { id:2, pId:0, name:"parent node 2", open:true}, 
	 { id:21, pId:2, name:"leaf node 2-1"},
	 { id:22, pId:2, name:"leaf node 2-2"},
	 { id:23, pId:2, name:"leaf node 2-3"},
	  { id:3, pId:0, name:"parent node 3", open:true },  
	 { id:31, pId:3, name:"leaf node 3-1"},
	 { id:32, pId:3, name:"leaf node 3-2"},
	 { id:33, pId:3, name:"leaf node 3-3"}
	 ]; */
	var zNodes = ${json};
	var code;

	function beforeDrag(treeId, treeNodes) {
		return false;
	}
	
	function setEdit() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
		remove = $("#remove").attr("checked"),
		rename = $("#rename").attr("checked"),
		removeTitle = $.trim($("#removeTitle").get(0).value),
		renameTitle = $.trim($("#renameTitle").get(0).value);
		zTree.setting.edit.showRemoveBtn = remove;
		zTree.setting.edit.showRenameBtn = rename;
		zTree.setting.edit.removeTitle = removeTitle;
		zTree.setting.edit.renameTitle = renameTitle;
		showCode(['setting.edit.showRemoveBtn = ' + remove, 'setting.edit.showRenameBtn = ' + rename,
			'setting.edit.removeTitle = "' + removeTitle +'"', 'setting.edit.renameTitle = "' + renameTitle + '"']);
	}
	function showCode(str) {
		var code = $("#code");
		code.empty();
		for (var i=0, l=str.length; i<l; i++) {
			code.append("<li>"+str[i]+"</li>");
		}
	}
	
	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes); 
		setEdit();
		delTag(questions_tag_id);
		$("#remove").bind("change", setEdit);
		$("#rename").bind("change", setEdit); 
		$("#removeTitle").bind("propertychange", setEdit)
		.bind("input", setEdit);
		$("#renameTitle").bind("propertychange", setEdit)
		.bind("input", setEdit); 
	});  
	 
	//添加
	function addTag() {
		var tagName = $("#tagName").val();
		/* alert(tagName); */
		if(tagName==null||tagName.trim().length==0){
			alert("角色名称不能为空!");
		}else{
			document.forms[0].action="/admin/questions_tag/save";
			document.forms[0].submit();
		}
	}
	//删除
	function beforeRemove(treeId, treeNode) {  
		$.ajax({  
		type: "post",  
		url: "/admin/questions_tag/updateStatus",  
		data: {
		qtid: treeNode.id  
		},  
		dataType: "json",  
		success: function (data) {  
		if (data === 'success') {  
		window.parent.layer.close(window.parent.layer.index);  
		layer.msg('Delete successful!', {icon: 1, time: 1000});  
		} else {  
		layer.msg('Delete failed!', {icon: 2, time: 2000});  
		}  
		}  
		})  
		}
	//修改
	function beforeRename(treeId,treeNode) { 
		var data = {id:treeNode.id,name:treeNode.name};
		$.ajax({  
		type: "post",  
		url: "/admin/questions_tag/update",  
		data: data, 
		dataType: "json",  
		success: function (data) {
		if (data == 'success') {  
		window.parent.layer.close(window.parent.layer.index);  
		layer.msg('Update successful!', {icon: 1, time: 1000});  
		} else {  
		layer.msg('Update failed!', {icon: 2, time: 2000});  
		}  
		}  
		});  
		}  
</script>
</html>