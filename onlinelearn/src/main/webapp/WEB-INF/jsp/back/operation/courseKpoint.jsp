<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>章节编辑</title>
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
<link href="/js/utf8-jsp/themes/default/css/umeditor.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" href="/css/tree/demo.css" type="text/css">
<link rel="stylesheet" href="/css/tree/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript" src="/js/tree/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/js/tree/jquery.ztree.core.js"></script>
<script type="text/javascript" src="/js/tree/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="/js/tree/jquery.ztree.exedit.js"></script>
<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
<script type="text/javascript" src="/common/layui/layui.js"></script>
<style type="text/css">
td{
    vertical-align: middle;
}
</style>
<script type="text/javascript">

    $(function(){
    	layui.use('layer', function(){ //独立版的layer无需执行这一句
  		  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
  	    });
    });

	var setting = {
		edit : {
			enable : true
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			beforeDrag : beforeDrag,//用户禁止拖动节点
			beforeRemove : beforeRemove,//点击删除时触发，用来提示用户是否确定删除
			beforeRename : beforeRename,//编辑结束时触发，用来验证输入的数据是否符合要求
			onRemove : onRemove,//删除节点后触发，用户后台操作
			onRename : onRename, //编辑后触发，用于操作后台
			onClick: zTreeOnClick//点击触发的事件
		}
	};
		
    //异步加载ztree数据
	function loadTree() {
		var course_id = $("#course_id").val();
		$.post("/admin/cou/loadCourseKpoint/" + course_id, function(data) {
			$.fn.zTree.init($("#tree"), setting, data);
		});
	}
    
	 //单击个节点触发的事件
	function zTreeOnClick(event, treeId, treeNode) {
		 $("#node_id").val(treeNode.id);
		 $("#parent_id").val(treeNode.pId);
		 var node_id = $("#node_id").val();
		 if(treeNode.pId == null){//如果是父节点则右侧显示父节点域
			 $("#parent_id").val(0);
			 $("#iframe_right").attr("src","/admin/cou/toUpdateParentKpoint/"+node_id);
		 }else{//子节点进入子节点域
			 $("#iframe_right").attr("src","/admin/cou/toUpdateKpoint/"+node_id);
		 }
		 
    };

	//用户禁止拖动节点
	function beforeDrag(treeId, treeNodes) {
		return false;
	}

	//点击删除时触发，用来提示用户是否确定删除
	function beforeRemove(treeId, treeNode) {
		
		//若有权限,则取出权限隐藏域
		var checkPermission = $("#deletePermission").val();
		
		if(checkPermission == "kpoint_del"){//是否有删除节点权限
			var result = confirm("确认删除 节点 -- " + treeNode.name + " 吗？")
			if(result){
				$("#iframe_right").attr("src","");
			}
	    	return result;
		}else{
			layer.msg('权限不足,无法删除', {icon: 4});
			return false;
		}
	}
	
	//编辑结束时触发，用来验证输入的数据是否符合要求
	function beforeRename(treeId, treeNode, newName) {
		if (newName.length == 0) {
			 layui.use('layer', function(){
				 layer.msg('节点名称不能为空'); 
		     });
			var zTree = $.fn.zTree.getZTreeObj("tree");
			setTimeout(function() {
				zTree.editName(treeNode)
			}, 10);
			return false;
		}
		return true;
	}

	//删除节点后触发，用户后台操作
	function onRemove(e, treeId, treeNode) {
		var pid = 0;
		if (tree.pId != null) {
			pid = tree.pId;
		}
		$.post("/admin/cou/removeKpoint/" + treeNode.id + "/" + pid, 
				function(data) {
			loadTree();
		}, "json");
	}
	
	//编辑后触发，用于操作后台
	function onRename(e, treeId, treeNode) {
	}
	
	//添加子节点的操作
	function addKpointNode(){
		var parent_id = $("#parent_id").val();
		var node_id = $("#node_id").val();
		var course_id = $("#course_id").val();
		if(node_id == null || node_id.trim().length == 0){//未选中节点状态
			 layui.use('layer', function(){
				 layer.msg('请选中要添加节点的章节'); 
		     });
		}else{
			if(parent_id != 0){//不是根目录
				 layui.use('layer', function(){
					 layer.msg('请在章目录下添加节点'); 
			     });
			}else{
				$("#iframe_right").attr("src","/admin/cou/toCreateKpoint/"+course_id+"/"+node_id);
			}
		}
	}
	
	//添加父节点的弹出层
	function addParentNode(){
		var html = "     <div class='layui-form-item'>                                                            "
			+ "     <label class='layui-form-label'>章节</label>                                                   "
			+ "     <div class='layui-input-block'>                                                               "
			+ "     <input type='text' name='name' id='name'placeholder='请输入章节名称'                              "          
            + "          autocomplete='off' class='layui-input'>                                                  "
			+ "     </div>                                                                                        "
			+ "     </div>                                                                                        "  
			+ "     <div class='layui-form-item'>                                                                 "
			+ "     <label class='layui-form-label'>热度</label>                                                   "
			+ "     <div class='layui-input-block'>                                                               "
			+ "     <input type='number' name='sort' id='sort'                                                    "          
            + "         placeholder='请输入热度数值' autocomplete='off' class='layui-input'>                          "
			+ "     </div>                                                                                        "
			+ "     </div>                                                                                        ";
    layui.use('layer', function(){
	    var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
	    layer.open({
		   type : 1,
		   title : '添加章节',
		   skin : 'layui-layer-rim',
		   offset : '150px',
		   btnAlign : 'c', //按钮居中
		   shade : 0, //不显示遮罩
		   maxmin : true, //开启最大化最小化按钮
		   area : [ '420px', 'auto' ],
		   btn : '确定',
		   content : html,
		   yes : function() {
			   
			   var sort = $("#sort").val();
			   var name = $("#name").val();
			   
			   if(name == null || name.trim().length == 0){
				   layer.tips('请输入章节名', '#name');
			   }else{
				   var rule_name = /^[\u4E00-\u9FA5A-Za-z0-9]{2,10}$/;
				   if(!rule_name.test(name)){
					   layer.tips('请输入2-10长度的章节名称(不包括标点符号)', '#name');
				   }else{
					   if(sort == null || sort.trim().length == 0){
						   layer.tips('请输入热度', '#sort');
					   }else{
						   var rule_sort = /^\d+$/;
						   if(!rule_sort.test(sort)){
							   layer.tips('热度值必须是正整数', '#sort');
						   }else{
							   
							   document.forms[0].action = "/admin/cou/addKpointParent?"
									+ "name="+name+"&sort="+sort;
							   document.forms[0].submit();
							   
						   }
					   }
				   }
			   }
			   
		   }
	    });
    });	
}

	var $j = jQuery.noConflict();
	$j(document).ready(function() {
		loadTree();
	});
	
</script>
</head>
<body>
	<section class="layui-larry-box">
		<div class="larry-personal">
			<header class="larry-personal-tit">
				<span id="sp1">编辑课程</span>
			</header>

			<!-- /header -->
			<form action="" method="post">
			    <input type="hidden" id="course_id" name="course_id"
				    value="${course_id}"/>
				<input type="hidden" id="node_id" name="node_id"
				    value=""/>
				<input type="hidden" id="parent_id" name="parent_id"
				    value=""/>
            </form>
			<table border="1" height="100%" cellpadding="0px" cellspacing="10px">
				<tr>
					<td width="20%">
						<ul id="tree" class="ztree"
							style="width: 230px; height: 480px; overflow: auto;background-color:white;"></ul>
					</td>
					<td bgcolor="white" width="80%" rowspan="2"><iframe id="iframe_right" src=""
							id="otherpage" width="100%" height="515px"></iframe></td>
				</tr>
				<tr>
					<td>
					    <shiro:hasPermission name="kpoint_add">
						<a href="javascript:;" class="layui-btn layui-btn-xs" onclick="addParentNode()">添加章节</a>
						<a href="javascript:;" class="layui-btn layui-btn-xs" onclick="addKpointNode()">添加节点</a>
						</shiro:hasPermission>
					</td>
				</tr>
			</table>

            <shiro:hasPermission name="kpoint_del">
                <input type="hidden" id="deletePermission" name="deletePermission" value="kpoint_del">
            </shiro:hasPermission>

		</div>
	</section>
	<script type="text/javascript">
		
	</script>
</body>
</html>