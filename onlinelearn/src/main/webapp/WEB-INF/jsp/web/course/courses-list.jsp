<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>课程列表</title>
<script type="text/javascript" src="${ctx}/static/inxweb/front/course.js"></script>
</head> 
<body> 
	<div id="aCoursesList" class="bg-fa of">
		<!-- /课程列表 开始 -->
		<section class="container">
			<header class="comm-title">
				<h2 class="fl tac">
					<span class="c-333"><a href="/front/toCourseslist">全部课程</a></span>
				</h2>
			</header>
			<section class="c-sort-box">
				<section class="c-s-dl">
					<dl>
						<dt>
							<span class="c-999 fsize14">按班型</span>
						</dt>
						<dd class="c-s-dl-li">
							<ul class="clearfix">
								<c:forEach items="${subjectList}" var="subject">
									<li <c:if test="${queryCourse.subject_id==subject.subject_id or subjectParentId==subject.subject_id}">class="current"</c:if>><a onclick="submitForm(1,${subject.subject_id})" title="${subject.subject_name}" href="/front/toCourseslist?Sid=${subject.subject_id}">${subject.subject_name}</a></li>
								</c:forEach>
							</ul>
							<aside class="c-s-more">
								<a href="javascript: void(0)" title="" class="fsize14 c-master">[展开]</a> 
							</aside>
						</dd>
					</dl>
					<c:if test="${sonSubjectList!=null&&sonSubjectList.size()>0 }">
                      	<dl>
							<dt>
								<span class="c-999 fsize14"></span>
							</dt>
							<dd class="c-s-dl-li">
							
								<ul class="clearfix">
									<c:forEach items="${sonSubjectList}" var="subject">
										<li <c:if test="${queryCourse.subject_id==subject.subject_id}">class="current"</c:if>><a onclick="submitForm(1,${subject.subject_id})" title="${subject.subject_name}" href="javascript:void(0)">${subject.subject_name}</a></li>
									</c:forEach>
								</ul>
								<aside class="c-s-more">
									<a href="javascript: void(0)" title="" class="fsize14 c-master">[展开]</a>
								</aside>
							</dd>
						</dl>
                    </c:if>
					<dl>
						<dt>
							<span class="c-999 fsize14">按讲师</span>
						</dt>
						<dd class="c-s-dl-li">
							<ul class="clearfix">
								<c:forEach items="${teacherList}" var="teacher">
									<li <c:if test="${teacher.id==queryCourse.teacherId}">class="current"</c:if>><a title="${teacher.name}" onclick="submitForm(2,${teacher.id})" href="/front/toCourseslist?Tid=${teacher.id}">${teacher.name}</a></li>
								</c:forEach>
							</ul>
							<aside class="c-s-more">
								<a href="javascript: void(0)" title="" class="fsize14 c-master">[展开]</a>
							</aside>
						</dd>
					</dl>
					<div class="clear"></div>
				</section>
				<div class="js-wrap">
					<section class="fr">
						<span class="c-ccc"> <tt class="c-master f-fM">${page.currentPage}</tt>/<tt class="c-666 f-fM">${page.totalPageSize}</tt>
						</span>
					</section>
				</div>
				<div class="mt40">
					<c:if test="${empty courseList}">
						<!-- /无数据提示 开始-->
						<section class="no-data-wrap">
							<em class="icon30 no-data-ico">&nbsp;</em> <span class="c-666 fsize14 ml10 vam">没有相关数据，小编正在努力整理中...</span>
						</section>
						<!-- /无数据提示 结束-->
					</c:if>
					<c:if test="${not empty courseList}">
						<article class="comm-course-list">
							<ul class="of">
								<c:forEach items="${courseList}" var="course" varStatus="index">
									<li>
										<div class="cc-l-wrap">
											<section class="course-img">
												<c:choose>
													<c:when test="${not empty course.logo }">
														<img xSrc="<%=staticImage%>${course.logo}" src="${ctx }/static/inxweb/img/default-img.gif" class="img-responsive" alt="">
													</c:when>
													<c:otherwise>
														<img xSrc="/static/inxweb/img/default-img.gif" src="${ctx }/static/inxweb/img/default-img.gif" class="img-responsive" alt="">
													</c:otherwise>
												</c:choose>
												<div class="cc-mask">
													<a href="/front/tocourseinfor?courseid=${course.course_id}" title="" class="comm-btn c-btn-1">开始学习</a>
												</div>
											</section>
											<h3 class="hLh30 txtOf mt10">
												<a href="${ctx}/front/couinfo/${course.course_id}" title="${course.course_name}" class="course-title fsize18 c-333">${course.course_name}</a>
											</h3>
											<section class="mt10 hLh20 of">
												<c:if test="${course.current_price=='0.00' }">
													<span class="fr jgTag bg-green"><tt class="c-fff fsize12 f-fA">免费</tt></span>
												</c:if>
												<c:if test="${course.current_price!='0.00' }">
													<span class="fr jgTag bg-orange"><tt class="c-fff fsize14 f-fG">￥${course.current_price }</tt></span>
												</c:if>
												<span class="fl jgAttr c-ccc f-fA"> <tt class="c-999 f-fA">${course.page_buyCount }人学习</tt> | <tt class="c-999 f-fA">${course.page_viewCount }浏览</tt>
												</span>
											</section>
										</div>
									</li>
								</c:forEach>
							</ul>
							<div class="clear"></div>
						</article>
					</c:if>
				</div>
				<!-- 公共分页 开始 -->
				<jsp:include page="/WEB-INF/jsp/common/front_page.jsp" />
				<!-- 公共分页 结束 -->
				<form action="${ctx}/front/showcoulist" id="searchForm" method="post">
					<input type="hidden" id="pageCurrentPage" name="page.currentPage" value="1" />
					<input type="hidden" name="queryCourse.teacherId" value="${queryCourse.teacherId}" />
					<input type="hidden" name="queryCourse.subject_id" value="${queryCourse.subject_id}" />
					<input type="hidden" name="queryCourse.order" value="${queryCourse.order}" />
				</form>
			</section>
		</section>
		<!-- /课程列表 结束 -->
	</div>
	<script>
		$(function() {
			cSortFun(); //分类更多按钮交互效果
			scrollLoad(); //响应滚动加载课程图片
		});
		//sort suMore
		var cSortFun = function() {
		    $(".c-s-dl>dl .c-s-more>a").each(function() {
		        var _this = $(this),
		            _uList = _this.parent().siblings("ul"),
		            _uLw = _uList.height();
		        if (_uLw <= "40") {
		            _this.hide();
		        } else {
		            _uList.css("height","40px");
		            _this.click(function() {
		                if(_this.html() == "[展开]") {
		                    _uList.css("height","auto");
		                    _this.text("[收起]");
		                } else {
		                    _uList.css("height" , "40px");
		                    _this.text("[展开]");
		                }
		            })
		        }
		    });
		}
	</script>
</body>
</html>