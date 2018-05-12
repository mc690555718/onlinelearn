<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加章节</title>
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
<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
<script type="text/javascript" src="/static/common/layui/layui.js"></script>
<script type="text/javascript" src="/static/common/layui/layui.all.js"></script>
<script type="text/javascript" src="/js/jquery-form.js"></script>
<style type="text/css">
form {
	height: 500px;
}
</style>
</head>
<body>
	<form id="kpointForm" class="layui-form" action="" method="post">

		<input type="hidden" id="course_id" name="course_id"
			value="${kpoint.course_id}" /> <input type="hidden" id="kpoint_id"
			name="kpoint_id" value="${kpoint.kpoint_id}" />

		<!-- 节点名称 -->
		<div class="layui-form-item">
			<label class="layui-form-label">节点名称</label>
			<div class="layui-input-inline">
				<input type="text" name="name" id="name" value="${kpoint.name}"
					required lay-verify="required" autocomplete="off"
					class="layui-input">
			</div>
		</div>

		<!-- 视频上传 -->
		<div class="layui-form-item">
			<label class="layui-form-label">视频上传</label>
			<div class="layui-input-block">
				<div class="layui-upload">
					<button class="layui-btn layui-btn-normal" id="testList"
						type="button">选择多文件</button>
					<div class="layui-upload-list">
						<table class="layui-table">
							<thead>
								<tr>
									<th>文件名</th>
									<th>大小</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="demoList"></tbody>
						</table>
					</div>
					<button class="layui-btn" id="testListAction" type="button">开始上传</button>
				</div>
				<!-- 			    <input name="vedio" class="layui-upload-file" type="file" lay-type="video"  />  -->
				<!-- 				<input type="hidden" name="video_url" id="vedio_url"/> -->
			</div>
			<div class="layui-form-mid layui-word-aux" id="upload_tittle">点击框内开始上传视频</div>
		</div>

		<!-- 排序 -->
		<div class="layui-form-item">
			<label class="layui-form-label">热度</label>
			<div class="layui-input-inline">
				<input type="text" name="sort" id="sort" value="${kpoint.sort}"
					required lay-verify="required" autocomplete="off"
					class="layui-input">
			</div>
		</div>

		<!-- 播放次数 -->
		<div class="layui-form-item">
			<label class="layui-form-label">播放次数</label>
			<div class="layui-input-block">
				<input type="text" name="play_count" id="play_count"
					value="${kpoint.play_count}" required lay-verify="required"
					autocomplete="off" class="layui-input">
			</div>
		</div>

		<!-- 播放时间 -->
		<div class="layui-form-item">
			<label class="layui-form-label">播放时间</label>
			<div class="layui-input-block">
				<input type="text" name="play_time" id="play_time"
					value="${kpoint.play_time }" required lay-verify="required"
					autocomplete="off" class="layui-input">
			</div>
		</div>

		<!-- 收费 :1免费 2收费 -->
		<c:if test="${kpoint.is_free==1}">
			<div class="layui-form-item">
				<label class="layui-form-label">收费</label>
				<div class="layui-input-block">
					<input type="checkbox" name="free" id="free" lay-skin="switch"
						lay-text="免费|收费"> <input type="hidden"
						value="${kpoint.is_free}" id="is_free" name="is_free" />
				</div>
			</div>
		</c:if>
		<c:if test="${kpoint.is_free==2}">
			<div class="layui-form-item">
				<label class="layui-form-label">收费</label>
				<div class="layui-input-block">
					<input type="checkbox" name="free" id="free" lay-skin="switch"
						lay-text="免费|收费" checked="checked"> <input type="hidden"
						value="${kpoint.is_free}" id="is_free" name="is_free" />
				</div>
			</div>
		</c:if>

		<!-- 选择讲师 -->
		<div class="layui-form-item">
			<label class="layui-form-label">选择讲师</label>
			<div class="layui-input-inline">
				<select name="teacher_id" id="teacher_id" lay-verify="required">
					<option value="-1">--请选择--</option>
				</select>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="button" class="layui-btn" onclick="updateKpoint()">确认修改</button>
				<button type="button" class="layui-btn layui-btn-primary"
					onclick="cleanText()">重置</button>
			</div>
		</div>
	</form>

	<script>
		$(function() {
			//加载上传组件
			layui.use('upload', function() {
				
				var upload = layui.upload; //得到 upload 对象
				
				var demoListView = $('#demoList')
				  ,uploadListIns = upload.render({
				    elem: '#testList'
				    ,url: '/admin/cou/uploadVideo'
				    ,accept: 'file'
				    ,multiple: false
				    ,auto: false
				    ,bindAction: '#testListAction'
				    ,choose: function(obj){   
				      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
				      //读取本地文件
				      obj.preview(function(index, file, result){
				        var tr = $(['<tr id="upload-'+ index +'">'
				          ,'<td>'+ file.name +'</td>'
				          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
				          ,'<td>等待上传</td>'
				          ,'<td>'
				            ,'<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>'
				            ,'<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>'
				          ,'</td>'
				        ,'</tr>'].join(''));
				        
				        //单个重传
				        tr.find('.demo-reload').on('click', function(){
				          obj.upload(index, file);
				        });
				        
				        //删除
				        tr.find('.demo-delete').on('click', function(){
				          delete files[index]; //删除对应的文件
				          tr.remove();
				          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
				        });
				        
				        demoListView.append(tr);
				      });
				    }
				    ,done: function(res, index, upload){
				      if(res == 0){ //上传成功
				        var tr = demoListView.find('tr#upload-'+ index)
				        ,tds = tr.children();
				        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
				        tds.eq(3).html(''); //清空操作
				        return delete this.files[index]; //删除文件队列已经上传成功的文件
				      }
				      this.error(index, upload);
				    }
				    ,error: function(index, upload){
				      var tr = demoListView.find('tr#upload-'+ index)
				      ,tds = tr.children();
				      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
				      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
				    }
				  });

				
				
// 				layui.upload({
// 					url : '/admin/cou/uploadVideo',
// 					before : function(input) {
// 						alert("before");
// 					},
// 					success : function(res) {
// 						alert(res);
// 					}
// 				});
			});

			layui.use('form', function() {
				var form = layui.form(); //只有执行了这一步，部分表单元素才会修饰成功 
				$.post("/admin/cou/getTeacher/" + $("#course_id").val(),
						function(msg) {
							for (var i = 0; i < msg.length; i++) {
								$("#teacher_id").append(
										"<option value='"+msg[i].id+"' >"
												+ msg[i].name + "</option>");
							}
							var teacher = ${kpoint.teacher_id};
							$("#teacher_id").val(teacher);
							form.render();
						}, "json");
			});
		});

		//重置按钮点击
		function cleanText() {
			$("#name").val("");
			$("#sort").val("");
			$("#play_time").val("");
			$("#play_count").val("");
			$("#is_free").val("");
			$("#teacher_id").val("");
		}
		//异步提交按钮,添加
		function updateKpoint() {
			var freecheck = $("#free").is(":checked");
			if (freecheck) {
				$("#is_free").val(2);
			} else {
				$("#is_free").val(1);
			}

			$.ajax({
				url : "/admin/cou/updateKpoint",
				data : $('#kpointForm').serialize(),
				dataType : "json",
				success : function(data) {
					parent.location.reload();
				}
			});

		}
	</script>
</body>
</html>