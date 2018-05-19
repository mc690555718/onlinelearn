<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>讲师列表</title> 
</head>
<body>
	<div id="aCoursesList" class="bg-fa of">
		<!-- /课程列表 开始 -->
		<section class="container">
			<header class="comm-title all-teacher-title">
				<h2 class="fl tac">
					<span class="c-333">全部讲师</span>
				</h2>
				<section class="c-tab-title">
					<a id="subjectAll" title="全部" href="${ctx}/front/teacher/list">全部</a>
					<c:forEach var="subject" items="${list2}">
						<a id="${subject.subject_id}" title="${subject.subject_name }" href="/front/teacher/getByIdSM/${subject.subject_id}" >${subject.subject_name }</a>
					</c:forEach>
				</section>
			</header>
			<section class="c-sort-box unBr">
				<div>
					<!-- /无数据提示 开始-->
					<c:if test="${empty list }">
						<section class="no-data-wrap">
							<em class="icon30 no-data-ico">&nbsp;</em>
							 <span class="c-666 fsize14 ml10 vam">没有相关数据，小编正在努力整理中...</span>
						</section>
					</c:if>
					<!-- /无数据提示 结束-->
					<article class="i-teacher-list">
						<ul class="of">
							<c:if test="${not empty list }">
								<c:forEach var="teacher" items="${list }">
									<li>
										<section class="i-teach-wrap">
											<div class="i-teach-pic">
												<a href="${ctx }/front/teacher/${teacher.id}" title="${teacher.name }">
													<c:choose>
														<c:when test="${not empty teacher.pic_path }">
															<img src="${ctx }/static/inxweb/img/default-tea-img.gif" xsrc="<%=staticImage %>${teacher.pic_path}" alt="">
														</c:when>
														<c:otherwise>
															<img xSrc="${ctx }/static/inxweb/img/default-tea-img.gif" src="${ctx }/static/inxweb/img/default-tea-img.gif" alt="">
														</c:otherwise>
													</c:choose>
												</a>
											</div>			
											<div class="mt10 hLh30 txtOf tac">
												<a href="${ctx }/front/teacher/${teacher.id}" title="${teacher.name }" class="fsize18 c-666">${teacher.name }</a>
											</div>
											<div class="hLh30 txtOf tac">
												<span class="fsize14 c-999">${teacher.career }</span>
											</div>
											<div class="mt15 i-q-txt">
												<p class="c-999 f-fA">${teacher.education}</p>
											</div>
										</section>
									</li>
								</c:forEach>
				
								
							</c:if>
						</ul>
						
							<div align="center">

				                 	<tr>
									<td align="center" colspan="9"><font face="微软雅黑"
										size="3px" color="black">一共${page.pages}页</font> <font
										face="微软雅黑" size="3px" color="black">每页${page.pageSize }条/</font>
										<font face="微软雅黑" size="3px" color="black">当前第${page.pageNum }页</font>
										<c:if test="${page.isFirstPage==true }">
											<a class="layui-btn">首页</a>
										</c:if> <c:if test="${page.isFirstPage==false }">
											<a class="layui-btn"
												href="/front/teacher/list?page=${page.firstPage}">首页</a>
										</c:if> <c:if test="${page.hasPreviousPage==true }">
											<a class="layui-btn"
												href="/front/teacher/list?page=${page.prePage}">上一页</a>
										</c:if> <c:if test="${page.hasPreviousPage==false }">
											<a class="layui-btn">上一页</a>
										</c:if> <c:if test="${page.hasNextPage==true }">
											<a class="layui-btn"
												href="/front/teacher/list?page=${page.nextPage }">下一页</a>
										</c:if> <c:if test="${page.hasNextPage==false }">
											<a class="layui-btn">下一页</a>
										</c:if> <c:if test="${page.isLastPage==false }">
											<a class="layui-btn"
												href="/front/teacher/list?page=${page.lastPage }">最后一页</a>
										</c:if> <c:if test="${page.isLastPage==true }">
											<a class="layui-btn">最后一页</a>
										</c:if></td>
								</tr>
							
							
							
							
							
							
							
							
					</div>
						<div class="clear"></div>
					</article>
				</div>
				<!-- 公共分页 开始 -->
				<div>
					<form action="${ctx }/front/teacherlist" method="post" id="searchForm">
						<input type="hidden" name="page.currentPage" id="pageCurrentPage" value="1">
						<input type="hidden" name="queryTeacher.subjectId" id="" value="${subject_Id }">
					</form>
				 	<%-- <jsp:include page="/WEB-INF/jsp/common/front_page.jsp"></jsp:include>  --%>
				</div>
				<!-- 公共分页 结束 -->
			</section>
		</section>
		<!-- /课程列表 结束 -->
	</div>
	
		
<script type="text/javascript">
	$(function() {
		if ('${subjectId}' == null || '${subjectId}' == 0) {
			$("#subjectAll").addClass("current");
		}else{
			$("#${subjectId}").addClass("current");
		};
		scrollLoad(); //响应滚动加载课程图片
	})
	/**
	 * 条件查询
	 */
	function submitForm(val){
		$("input[name='queryTeacher.subjectId']").val(val);
		$("#searchForm").submit();
	}
</script>
</body>
</html>