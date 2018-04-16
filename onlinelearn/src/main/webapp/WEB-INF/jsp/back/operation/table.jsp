<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
            <blockquote  class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input value="" placeholder="请输入关键字" class="layui-input search_input" type="text">
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div><div class="layui-inline">
		
            
		         <!-- 操作日志 -->
                <div class="layui-form news_list">
                    <table class="layui-table" id="table1">
					    <colgroup>
						<col width="2%">
						<col width="2%">
						<col width="7%">
						<col width="8%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
					</colgroup>
					<thead>
						<tr >
							<th></th>
							<th style="text-align:left;">id</th>
							<th>订单编号</th>
							<th>订单金额</th>
							<th>下单日期</th>
							<th>会员编号</th>
							<th>订单状态</th>
							<th>支付状态</th>
							<th>配送状态</th>
							<th>支付方式</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
					<c:forEach items="${listOrder }" var="list" >
						<tr id="tr">
						    <td></td>
							<td>${list.order_id }</td>
							<td>${list.order_code }</td>
							<td>${list.order_price }</td>
							<td>${list.create_time }</td>
							<td>${list.member_id }</td>
							<c:if test="${list.order_status==1 }">
							<td>已确认</td>
							</c:if>
							<c:if test="${list.order_status==2 }">
							<td>未确认</td>
							</c:if>
							<c:if test="${list.order_status==3 }">
							<td>已取消</td>
							</c:if>
							
							<c:if test="${list.payment_status==1 }">
							<td>已支付</td>
							</c:if>
							<c:if test="${list.payment_status==2 }">
							<td>未支付</td>
							</c:if>
							
							
							<c:if test="${list.shipping_status==1 }">
							<td>已发货</td>
							</c:if>
							<c:if test="${list.shipping_status==2 }">
							<td>未发货</td>
							</c:if>
							
							<c:if test="${list.payment_way==1 }">
							<td>支付宝</td>
							</c:if>
							<td>
								<a class="layui-btn layui-btn-mini"><i></i> 编辑</a>
								<a class="layui-btn layui-btn-mini"><i></i> 删除</a>
							</td>
						</tr>
						</c:forEach>
						<tr>
						</tr>
					</tbody>
					</table>					
                    </div>

			    </div>
		    </div>
		</div>
	
</section>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript" src="js/newslist.js"></script>
</body>
</html>