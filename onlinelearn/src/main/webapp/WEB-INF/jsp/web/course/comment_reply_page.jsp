<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<section class="">
	<section class="question-list lh-bj-list pr">
		<ul class="pr10">
				<li>
					<aside class="noter-pic">
						<c:if test="${empty parentComment.pic_img }">
							<img width="50" height="50" class="pic_img" src="${ctx }/static/inxweb/img/avatar-boy.gif">
						</c:if>
						<c:if test="${!empty parentComment.pic_img }">
							<img width="50" height="50" class="pic_img" src="<%=staticImage%>${parentComment.pic_img }">
						</c:if>
					</aside>
					<div class="of">
						<span class="fl"> 
						<font class="fsize12 c-blue"> 
							<c:if test="${empty parentComment.user_name }">
								${parentComment.email}
							</c:if>
							<c:if test="${!empty parentComment.user_name }">
								${parentComment.user_name}
							</c:if>
						</font>
						<font class="fsize12 c-999 ml5">评论：</font></span>
					</div>
					<div class="noter-txt mt5">
						<p><c:out value="${parentComment.content}"></c:out></p>
					</div>
					<div class="of mt5">
						<span class="fr"><font class="fsize12 c-999 ml5"><fmt:formatDate value="${parentComment.addtime}" pattern="yyyy/MM/dd HH:mm" /></font></span> <span class="fl"> <a class="noter-dy vam" title="回复" href="javascript: void(0)">
								<em class="icon18">&nbsp;</em>(<span class="replyCount${parentComment.comment_id}">${parentComment.replyCount}</span>)
							</a> <tt title="赞一下" class="noter-zan vam ml10" onclick="addPraise('${parentComment.comment_id}',4)">
								<em class="icon18">&nbsp;</em>(<span class="addPraise${parentComment.comment_id}_4 praise_count">${parentComment.praise_count }</span>)
							</tt>
						</span>
					</div>
					<div class="">
						<div class="mt10 pl10 pr10 pb10 commentReply${parentComment.comment_id}">
							<dl class="n-reply-list">
								<c:forEach items="${commentList }" var="ac" varStatus="index">
									<dd>
										<aside class="n-reply-pic">
											<c:if test="${empty ac.pic_img }">
												<img width="50" height="50" class="pic_img" src="${ctx }/static/inxweb/img/avatar-boy.gif">
											</c:if>
											<c:if test="${!empty ac.pic_img }">
												<img width="50" height="50" class="pic_img" src="<%=staticImage%>${ac.pic_img }">
											</c:if>
										</aside>
										<div class="of">
											<span class="fl"><font class="fsize12 c-blue">
											<c:if test="${empty ac.user_name }">
												${ac.email}
											</c:if>
											<c:if test="${!empty ac.user_name }">
												${ac.user_name}
											</c:if>
											</font><font class="fsize12 c-999 ml5" >回复：</font></span>
										</div>
										<div class="noter-txt mt5">
											<p><c:out value="${ac.content}"></c:out></p>
										</div>
										<div class="of mt5">
											<span class="fr"><font class="fsize12 c-999 ml5"><fmt:formatDate value="${ac.addtime}" pattern="yyyy/MM/dd HH:mm" /></font></span> <span class="fl"> 
											<tt class="noter-zan vam" title="赞一下" onclick="addPraise('${ac.comment_id}',4)">
													<em class="icon18">&nbsp;</em><span class="addPraise${ac.comment_id}_4 praise_count">${ac.praise_count }</span>
												</tt>
											</span>
										</div>
									</dd>
								</c:forEach>
								<!-- 公共分页 开始 -->
								<%-- <jsp:include page="/WEB-INF/view/common/ajaxpage2.jsp"></jsp:include> --%>
								<!-- 公共分页 结束 -->
							</dl>
						</div>
					</div> <!-- /回复盒子 -->
				</li>
		</ul>
	</section>
</section>
