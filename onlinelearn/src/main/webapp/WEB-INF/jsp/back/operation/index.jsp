<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
    <%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"
    +request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Mall后台管理</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="/css/adminstyle.css" media="all">
	<script type="text/javascript" src="/js/jquery-3.0.0.js"></script>
	<script type="text/javascript">
	    function toMyInfo(){
	    	$("#iframe_body").attr("src","/admin/sysuser/toeditsysuser/${user.user_id}");
	    }
	</script>
</head>
<body>
<div class="layui-layout layui-layout-admin" id="layui_layout">
	<!-- 顶部区域 -->
	<div class="layui-header header header-demo">
		<div class="layui-main">
		    <!-- logo区域 -->
			<div class="admin-logo-box">
				<a class="logo" href="http://www.kuxuebao.net" title="logo">后台管理系统</a>
				<div class="larry-side-menu">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</div>
			</div>
            <!-- 顶级菜单区域 -->
            <div class="layui-larry-menu">
                 <ul class="layui-nav clearfix">
                       <li class="layui-nav-item layui-this">
                 	   	   <a href="javascirpt:;"><i class="iconfont icon-wangzhanguanli"></i>内容管理</a>
                 	   </li>
                 </ul>
            </div>
            <!-- 右侧导航 -->
            <ul class="layui-nav larry-header-item">
            		<li class="layui-nav-item">
            			账户名：${user.login_name}
            		</li>
            		<li class="layui-nav-item first">
						<a href="javascript:;">			
							<cite>用户</cite>
							<span class="layui-nav-more"></span>
						</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" onclick="toMyInfo()">个人资料</a>
							</dd>
							<dd>
								<a href="">修改密码</a>
							</dd>
							
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="/admin/logout">
                        <i class="iconfont icon-exit"></i>
						退出</a>
					</li>
            </ul>
		</div>
	</div>
	<!-- 左侧侧边导航开始 -->
	<div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
        <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">
		
		<!-- 左侧菜单 -->
		<ul class="layui-nav layui-nav-tree">
			<li class="layui-nav-item layui-this">
				<a href="javascript:;" data-url="/admin/back/main">
				    <i class="iconfont icon-home1" data-icon='icon-home1'></i>
					<span>后台首页</span>
				</a>
			</li>
			
			
			<!-- 商品管理 -->
			<c:forEach items="${user.role.functions}" var="fc">
			 <c:if test="${fc.parent_id==0 && fc.function_type==1}"> 
			<li class="layui-nav-item">
				<a href="javascript:;">
					<i class="iconfont icon-jiaoseguanli" ></i>
					<span>${fc.function_name}</span>
					<em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
				    <c:forEach items="${user.role.functions}" var="func">
				    <c:if test="${func.parent_id==fc.function_id && func.function_type==1}">
                    <dd>
                        <a href="javascript:;" data-url="${func.function_url}">
                            <i class="iconfont icon-geren1" data-icon='icon-geren1'></i>
                            <span>${func.function_name}</span>
                        </a>
                    </dd>
                    </c:if>
                    </c:forEach>
                </dl>
			</li>
			 </c:if> 
			</c:forEach>
				
				<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-shengchengbaogao" ></i>
					   <span>网站维护</span>
					   <em class="layui-nav-more"></em>
					</a>
					   <dl class="layui-nav-child">
                           <dd>
                           	   <a href="javascript:;">
					              <i class="iconfont icon-zhuti"  data-icon='icon-zhuti'></i>
					              <span>网站主题</span>
					           </a>
                           </dd>
                           <dd>
					    		<a href="">
					    		   <i class="iconfont icon-database" data-icon='icon-database'></i>
					    		   <span>数据库管理</span>
					    		</a>
					    	</dd>
					   	    <dd>
					    		<a href="">
					    		   <i class="iconfont icon-shengchengbaogao" data-icon='icon-shengchengbaogao'></i>
					    		   <span>生成页面</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="">
					    		   <i class="iconfont icon-qingchuhuancun" data-icon='icon-qingchuhuancun'></i>
					    		   <span>更新缓存</span>
					    		</a>
					    	</dd>
					    	
					   </dl>
				</li>
				
			<!-- 系统设置 -->
			<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-xitong" ></i>
					   <span>系统设置</span>
					   <em class="layui-nav-more"></em>
					</a>
					    <dl class="layui-nav-child">
					    	<dd>
					    		<a href="javascript:;">
					    		   <i class="iconfont icon-zhandianpeizhi" data-icon='icon-zhandianpeizhi'></i>
					    		   <span>基本参数设置</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;">
					    		   <i class="iconfont icon-zhandianguanli1" data-icon='icon-zhandianguanli1'></i>
					    		   <span>多站点管理</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;">
					    		   <i class="iconfont icon-anquanshezhi" data-icon='icon-anquanshezhi'></i>
					    		   <span>安全设置</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;">
					    		   <i class="iconfont icon-sms" data-icon='icon-sms'></i>
					    		   <span>短信接口设置</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;">
					    		   <i class="iconfont icon-iconfuzhi01" data-icon='icon-iconfuzhi01'></i>
					    		   <span>系统日志管理</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;">
					    			<i class='iconfont icon-SQLServershujuku' data-icon='icon-SQLServershujuku'></i>
					    			<span>SQL命令行工具</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;">
					    			<i class='iconfont icon-xinxicaiji' data-icon='icon-xinxicaiji'></i>
					    			<span>防采集管理</span>
					    		</a>
					    	</dd>
					    </dl>
				</li>
				<!-- 友链设置 -->
				<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-youqinglianjie"  data-icon='icon-youqinglianjie'></i>
					   <span>友情链接</span>
					</a>
				</li>
		</ul>
	    </div>
	</div>

	
	

	<!-- 左侧侧边导航结束 -->
	<!-- 右侧主体内容 -->
	<div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #2299ee;">
		<div class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="demo" lay-allowclose="true">
			<div class="go-left key-press pressKey" id="titleLeft" title="滚动至最右侧"><i class="larry-icon larry-weibiaoti6-copy"></i> </div>
			<ul class="layui-tab-title">
				<li class="layui-this" id="admin-home"><i class="iconfont icon-diannao1"></i><em>后台首页</em></li>
			</ul>
			<div class="go-right key-press pressKey" id="titleRight" title="滚动至最左侧"><i class="larry-icon larry-right"></i></div> 
			<ul class="layui-nav closeBox">
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont icon-caozuo"></i> 页面操作</a>
				    <dl class="layui-nav-child">
					  <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
				      <dd><a href="javascript:;" class="closePageOther"><i class="iconfont icon-prohibit"></i> 关闭其他</a></dd>
				      <dd><a href="javascript:;" class="closePageAll"><i class="iconfont icon-guanbi"></i> 关闭全部</a></dd>
				    </dl>
				  </li>
				</ul>
			<div class="layui-tab-content" style="min-height: 150px; ">
				<div class="layui-tab-item layui-show">
					<iframe class="larry-iframe" data-id='0' src="/admin/back/main" id="iframe_body"></iframe>
				</div>
			</div>
		</div>
	</div>
	<!-- 底部区域 -->
	<div class="layui-footer layui-larry-foot" id="larry-footer">
		<div class="layui-mian">  
		    <p class="p-admin">
		    	<span>2017 &copy;</span>
		    	 广州普金计算机科技股份有限公司,版权所有
		    </p>
		</div>
	</div>
</div>
<!-- 加载js文件-->                                                                                                                                                                                           
	<script type="text/javascript" src="/common/layui/layui.js"></script> 
	<script type="text/javascript" src="/js/larry.js"></script>
	<script type="text/javascript" src="/js/index.js"></script>

</body>
</html>