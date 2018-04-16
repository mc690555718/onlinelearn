<%@ page contentType="text/html;charset=UTF-8" language="java"	pageEncoding="UTF-8"%>
<%@ include file="/base.jsp"%>
<script type="text/javascript" src="/static/common/ckplayer/ckplayer.js" charset="utf-8"></script>
		<div id="videoareaname" style="width: 100%;height: 100%"></div>
		<script type="text/javascript">
			var flashvars={
				f:'${videourl}',
				c:0,
				p:1
			};
			var video=['${videourl}->video/mp4'];
			CKobject.embed('/static/common/ckplayer/ckplayer.swf','videoareaname','ckplayer_a1','100%','100%',false,flashvars,video);
		</script>
 
 
 
