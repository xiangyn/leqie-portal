<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/iziToast.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/app.css" rel="stylesheet">
	<title>乐切 - 官方网站</title>
</head>
<body>
	<#include "/common/top.ftl" />
	<#assign navbarSelectedMenu='center' />
	<#assign logoInfo='个人中心' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right orders-panel">
				<div class="bread-crumb">
					<h3>我的订单</h3>
				</div>
				<div class="panel-title">
					<ul class="order-menus">
						<li class="order-menu-item"><a href="${ctx}/app/order/index.jhtml">最近</a></li>
						<li class="order-menu-item"><a href="${ctx}/app/order/unpay.jhtml">未付款</a></li>
						<li class="order-menu-item active"><a href="${ctx}/app/order/unrecv.jhtml">未收货</a></li>
						<li class="order-menu-item"><a href="${ctx}/app/order/finished.jhtml">已完成</a></li>
						<li class="order-menu-item right"><a href="${ctx}/app/order/all.jhtml">更多</a></li>
					</ul>
				</div>
				<#include "/order/orderList.ftl" />
			</div>
		</div>
	</div>
	<#include "/common/footer.ftl" />
<#include "/common/foot.ftl" />
<script type="text/javascript" src="${ctx}/static/js/iziToast.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
<#include "/order/order-js.ftl" />
</html>