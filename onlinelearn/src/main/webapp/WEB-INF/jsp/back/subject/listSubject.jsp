<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
</head>
<body>
	<form action="" method="post">
		<section class="layui-larry-box">
			<div class="larry-personal">
				<div class="layui-tab">
					<blockquote class="layui-elem-quote news_search">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<input value="" placeholder="请输入关键字" id="qname"
									class="layui-input search_input" type="text" name="qname">
							</div>
							<div class="layui-input-inline">
								<select class="layui-input" width="150" name="parent_id"
									id="parent_id">
									<option value="-1" selected="selected">--请选择--</option>
									<option value="0">父专业</option>
									<c:forEach items="${subs}" var="su">
										<option value="${su.subject_id}">${su.subject_name}</option>
									</c:forEach>
								</select>
							</div>
							<a id="btn_search" class="layui-btn">查询</a>
							<shiro:hasPermission name="subject_add">
								<a href="javascript:;" onclick="addSubject()"
									class="layui-btn layui-btn-xs"> <i class="layui-icon">&#xe608;</i>
									新增
								</a>
							</shiro:hasPermission>
						</div>
					</blockquote>

					<div class="layui-inline">
						<div class="layui-form news_list">
							<table class="layui-table" id="table1">
								<colgroup>
									<col width="5%">
									<col width="15%">
									<col width="10%">
									<col width="20%">
									<col width="10%">
									<col width="15%">
								</colgroup>
								<thead>
									<tr>
										<th style="text-align: left;">专业ID</th>
										<th>专业名称</th>
										<th>所属专业</th>
										<th>创建时间</th>
										<th>热度等级</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody class="news_content">
									<c:forEach items="${subjects}" var="sub">
										<tr id="tr">
											<td>${sub.subject_id}</td>
											<td>${sub.subject_name}</td>
											<th>${sub.sub.subject_name}</th>
											<td><fmt:formatDate value="${sub.create_time}"
													type="date" pattern="yyyy-MM-dd hh:mm:ss" /></td>
											<td>${sub.sort}</td>
											<td><shiro:hasPermission name="subject_upd">
													<a href="javascript:updateSubject(${sub.subject_id})"
														class="layui-btn layui-btn-sm"> <i class="layui-icon">&#xe642;</i>
													</a>
												</shiro:hasPermission> <shiro:hasPermission name="subject_del">
													<a href="/admin/subj/deletesubject/${sub.subject_id}"
														class="layui-btn layui-btn-danger layui-btn-sm"> <i
														class="layui-icon">&#xe640;</i>
													</a>
												</shiro:hasPermission></td>
										</tr>
									</c:forEach>
									<tr>
									</tr>
								</tbody>
							</table>
							<div class="larry-table-page clearfix">
							   <div id="page" class="page"></div>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<script type="text/javascript" src="/common/layui/layui.js"></script>
		<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
		<script type="text/javascript">
			$(function() {
				
				var qname = "${qname}";
				$("#qname").val(qname);
				var parentId = "${parentId}";
				if(parentId != null && parentId.trim().length != 0){
					$("#parent_id").val(parentId);
				}
				
				
                //查询按钮点击时间
				$("#btn_search").click(function() {
					document.forms[0].action = "/admin/subj/toSubjectList";
					document.forms[0].submit();
				});
				
				layui.use('layer', function(){ //独立版的layer无需执行这一句
					  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
				});
			});

			function addSubject() {
				var html = "     <div class='layui-form-item'>                                                                "
						+ "     <label class='layui-form-label'>专业名称</label>                                                 "
						+ "     <div class='layui-input-block'>                                                               "
						+ "     <input type='text' name='subject_name' id='subject_name' required  lay-verify='required'      "            
			            + "     placeholder='请输入专业' autocomplete='off' class='layui-input'>                                 "
						+ "     </div>                                                                                        "
						+ "     </div>                                                                                        "
						+ "     <div class='layui-form-item'>                                                                 "
						+ "     <label class='layui-form-label'>专业类型</label>                                                 "
						+ "     <div class='layui-input-block'>                                                               "
						+ "     <select class='layui-input' width='150' name='parentId' id='parentId'>                        "
						+ "        <option value='0' selected='selected'>父专业</option>                                        "
						+ "     <c:forEach items='${subs}' var='su'>                                                          "
						+ "     <option value='${su.subject_id}'>${su.subject_name}</option>                                  "
						+ "     </c:forEach>                                                                                  "
						+ "     </select>                                                                                     "
						+ "     </div>                                                                                        "
						+ "     </div>                                                                                        ";
			        layui.use('layer', function(){
				        layer.open({
							type : 1,
							title : '添加专业',
							skin : 'layui-layer-rim',

							offset : '150px',
							btnAlign : 'c', //按钮居中
							shade : 0, //不显示遮罩
							maxmin : true, //开启最大化最小化按钮
							area : [ '420px', 'auto' ],
							btn : '确定',
							content : html,
							yes : function() {
								var subject_name = $("#subject_name").val();
								var parentId = $("#parentId").val();
								if(subject_name == null || subject_name.trim().length == 0){
										layer.tips('请输入专业名称','#subject_name');
								}else{
									var checkName = /^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$/;
									if(!checkName.test(subject_name)){
										layer.tips('请输入2~15长度的中文、英文、数字但不包括下划线等符号','#subject_name');
									}else{
									    document.forms[0].action = "/admin/subj/subjectadd?subject_name="
										    + subject_name
										    + "&parentId="
										    + parentId;
								        document.forms[0].submit();
									}
								}
							}
						});
			        });
			}

			function updateSubject(subject_id) {
				var html = "     <input type='hidden' name='subject_id' id='subject_id'/>                                     "
						+ "     <div class='layui-form-item'>                                                                 "
						+ "     <label class='layui-form-label'>专业名称</label>                                                 "
						+ "     <div class='layui-input-block'>                                                               "
						+ "     <input type='text' name='subject_name' id='subject_name' required  lay-verify='required'      "          
			            + "         placeholder='请输入专业名称' autocomplete='off' class='layui-input'>                           "
						+ "     </div>                                                                                        "
						+ "     </div>                                                                                        "
						+ "     <div class='layui-form-item'>                                                                 "
						+ "     <label class='layui-form-label'>专业类型</label>                                                 "
						+ "     <div class='layui-input-block'>                                                               "
						+ "     <select class='layui-input' width='150' name='parentId' id='parentId'>                        "
						+ "        <option value='0' selected='selected'>父专业</option>                                        "
						+ "     <c:forEach items='${subs}' var='su'>                                                          "
						+ "         <option value='${su.subject_id}'>${su.subject_name}</option>                              "
						+ "     </c:forEach>                                                                                  "
						+ "     </select>                                                                                     "
						+ "     </div>                                                                                        "
						+ "     </div>                                                                                        "
						+ "     <div class='layui-form-item'>                                                                 "
						+ "     <input type='hidden' id='subject_id' name='subject_id'/>                                      "
						+ "     <label class='layui-form-label'>热度</label>                                                   "
						+ "     <div class='layui-input-block'>                                                               "
						+ "     <input type='number' name='sort' id='sort' required  lay-verify='required'                    "          
			            + "         placeholder='请输入热度数值' autocomplete='off' class='layui-input'>                          "
						+ "     </div>                                                                                        "
						+ "     </div>                                                                                        ";
		    layui.use('layer', function(){
				layer.open({
					type : 1,
					title : '编辑专业',
					skin : 'layui-layer-rim',
					offset : '150px',
					btnAlign : 'c', //按钮居中
					shade : 0, //不显示遮罩
					maxmin : true, //开启最大化最小化按钮
					area : [ '420px', 'auto' ],
					btn : '确定',
					content : html,
					yes : function() {
						var subject_name = $("#subject_name").val();
						var sort = $("#sort").val();
						var subId = $("#subject_id").val();
						var parentId = $("#parentId").val();
						if(subject_name == null || subject_name.trim().length == 0){
							layer.tips('请输入专业名称','#subject_name');
					    }else{
						    var checkName = /^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$/;
						    if(!checkName.test(subject_name)){
							    layer.tips('请输入2~15长度的中文、英文、数字但不包括下划线等符号','#subject_name');
						    }else{
						    	var checkSort = /^([1-9]\d*|[0]{1,2})$/;
						    	if(!checkSort.test(sort)){
						    		layer.tips('请输入2位以内的正整数','#sort');
						    	}else{
						  
								    document.forms[0].action = "/admin/subj/subjectupdate?"
							    		+ "subject_name=" + subject_name + "&sort="
							    		+ sort + "&subject_id=" + subId + "&parentId="
								    	+ parentId;
							        document.forms[0].submit();
						  		
						    	}
						    }
					    }
					}
				});
		    });

				$.post("/admin/subj/loadSubjectById/" + subject_id, function(data) {
					$("#subject_name").val(data.subject_name);
					$("#sort").val(data.sort);
					$("#subject_id").val(data.subject_id);
					if(data.sub != null){
						$("#parentId").val(data.sub.subject_id);
					}
					$("#parentId option[value='"+subject_id+"']").remove();  
				}, "json");
			}
			
			layui.use(['jquery','layer','element','laypage'],function(){
			      window.jQuery = window.$ = layui.jquery;
			      window.layer = layui.layer;
		          var element = layui.element(),
		              laypage = layui.laypage;

		            
		          laypage({
						cont: 'page',
						pages: '${info.pages}' , //总页数
						curr: '${info.pageNum}',
						first: 1,
						last: '${info.pages}',
						groups: 5 ,    //连续显示分页数
						jump: function(obj, first) {
							//得到了当前页，用于向服务端请求对应数据
							var curr = obj.curr;
							if(!first) {
								//layer.msg('第 '+ obj.curr +' 页');
								document.forms[0].action="/admin/subj/toSubjectList?currentPage="+curr;
								document.forms[0].submit();
							}
						}
					});
		    });
			
		</script>
	</form>
</body>
</html>