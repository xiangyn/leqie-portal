<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/app.css" rel="stylesheet">
	<title>乐切 - 官方网站</title>
</head>
<body>
	<#include "/common/top.ftl" />
	<#assign navbarSelectedMenu='center' />
	<#assign logoInfo='我的订单' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right orders-panel">
				<div class="panel-title">
					<ul class="order-menus">
						<li class="quarter order-menu-item"><a href="${ctx}/app/order/index.jhtml">最近</a></li>
						<li class="quarter order-menu-item active"><a href="${ctx}/app/order/unpay.jhtml">未付款</a></li>
						<li class="quarter order-menu-item"><a href="${ctx}/app/order/unsend.jhtml">未发货</a></li>
						<li class="quarter order-menu-item"><a href="${ctx}/app/order/unrecv.jhtml">未收货</a></li>
					</ul>
				</div>
				<div class="panel-content">
					<#if data?size==0>
						<p class="empty-info text-center">暂无订单记录！</p>
					<#else/>
					<ul class="orders-list">
						
					</ul>
					</#if> 
				</div>
			</div>
		</div>
	</div>
	<#include "/common/footer.ftl" />
<#include "/common/foot.ftl" />
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
<script type="text/javascript">
$(function() {
	
});
</script>
</body>
</html>