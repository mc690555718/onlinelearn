<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学员登陆数统计</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="/common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="/css/personal.css" media="all">
	<style type="text/css">
*{margin:0;padding:0;list-style:none;}
html{background-color:#E3E3E3; font-size:14px; color:#000; font-family:'微软雅黑'}
h2{line-height:30px; font-size:20px;}
a,a:hover{ text-decoration:none;}
pre{font-family:'微软雅黑'}
.box{width:970px; padding:10px 20px; background-color:#fff; margin:10px auto;}
.box a{padding-right:20px;}
.demo1,.demo2,.demo3,.demo4,.demo5,.demo6{margin:25px 0;}
h3{margin:10px 0;}
.layinput{height: 22px;line-height: 22px;width: 150px;margin: 0;}
.laydate_table { 
	display: none;
}
#laydate_hms{
	display: none !important;
}
</style>
</head>
<body>
<section class="layui-larry-box">
<form method="post" action="/admin/statisticsPage/login">
	<div class="larry-personal">
	    <div class="layui-tab">
            <blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		<div class="layui-input-inline">
<input placeholder="请输入查询月份" name="stuLogtime" class="laydate-icon" onClick="laydate({istime: true, format: 'YYYY-MM'})">
			</div>
		</div>
		 <input type="submit" class="layui-btn search_btn" value="查询">
	       </blockquote>
	       
		    <div align="center">  
        <div id="main" style="width: 1000px;height:700px"></div>  
            </div> 
             
		</div>
		</div>
	</form>
</section>
<script type="text/javascript" src="/js/echarts.min.js"></script>
<script type="text/javascript" src="/js/laydate.js"></script>
<script type="text/javascript" src="/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript">  
var myChart = echarts.init(document.getElementById('main'));
option = {
	    title: {
	        text: '折线图堆叠'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['学员登录统计']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	            saveAsImage: {}
	        }
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: ${days}
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: [
	        {
	            name:'学员登录统计',
	            type:'line',
	            stack: '总量',
	            data:${nums}
	        }
	        ]
};
myChart.setOption(option);

			function myFormatter(date){
			    var y = date.getFullYear();
			    var m = date.getMonth()+1;
			    return y+'-'+(m<10?('0'+m):m);
			}
			
			
			function myParser(s){
			if(!s){
			   return new Date();
			}
			    var ss = s.split('-');
			    var y = parseInt(ss[0],10);
			    var m = parseInt(ss[1],10);
			    if (!isNaN(y) && !isNaN(m)){
			        return new Date(y,m-1);
			    }
			}
			$(document).ready(function(){
			if(!$("#myDate").datebox('getValue')){
			$("#myDate").datebox('setValue',myFormatter(new Date()));
			}
			});
			
			!function(){
				laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
				laydate({elem: '#demo'});//绑定元素
			}();

			//日期范围限制
			var start = {
			    elem: '#start',
			    format: 'YYYY-MM-DD',
			    min: laydate.now(), //设定最小日期为当前日期
			    max: '2099-06-16', //最大日期
			    istime: true,
			    istoday: false,
			    choose: function(datas){
			         end.min = datas; //开始日选好后，重置结束日的最小日期
			         end.start = datas //将结束日的初始值设定为开始日
			    }
			};

			var end = {
			    elem: '#end',
			    format: 'YYYY-MM-DD',
			    min: laydate.now(),
			    max: '2099-06-16',
			    istime: true,
			    istoday: false,
			    choose: function(datas){
			        start.max = datas; //结束日选好后，充值开始日的最大日期
			    }
			};
			laydate(start);
			laydate(end);

			//自定义日期格式
			laydate({
			    elem: '#test1',
			    format: 'YYYY年MM月',
			    festival: true, //显示节日
			    choose: function(datas){ //选择日期完毕的回调
			        alert('得到：'+datas);
			    }
			});

			//日期范围限定在昨天到明天
			laydate({
			    elem: '#hello3',
			    min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
			    max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
			});
    </script>  
</body>
</html>