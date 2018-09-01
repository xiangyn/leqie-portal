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
	<#assign logoInfo='个人中心' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right orders-panel">
				<div class="bread-crumb">
					<h3>开票记录</h3>
				</div>
				<div class="panel-title">
					<ul class="order-menus">
						<li class="order-menu-item"><a href="${ctx}/app/invoice/record-wait.jhtml">等待中</a></li>
						<li class="order-menu-item active"><a href="${ctx}/app/invoice/record-finished.jhtml">已完成</a></li>
					</ul>
				</div>
				<#include "/invoice/invoiceList.ftl" />
			</div>
		</div>
	</div>
	<#include "/common/footer.ftl" />
<#include "/common/foot.ftl" />
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
<#include "/order/order-js.ftl" />
</html>