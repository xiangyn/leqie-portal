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
	<#assign logoInfo='企业认证' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right enterprise-panel">
				<div class="bread-crumb">
					<h3>企业认证</h3>
				</div>
				<#if data?exists>
					<#if data.shenhezhuangtai == '审核中'>
						<p class="empty-info text-center" style="color:red">你提交的认证正在等待审核！</p>
					<#elseif data.shenhezhuangtai == '审核通过'>
						<p class="empty-info text-center" style="color:red">你提交的认证已审核通过！<a class="color" href="${ctx}/app/enterprise/auth.jhtml" >点击此处修改认证信息</a></p>
					<#elseif data.shenhezhuangtai == '审核拒绝'>
						<p class="empty-info text-center" style="color:red">你提交的认证审核失败！<a class="color" href="${ctx}/app/enterprise/auth.jhtml" >点击此处重新申请认证</a></p>
					</#if>
				<#else />
				<p class="empty-info text-center">您没有完成企业认证，
					<a class="color" href="${ctx}/app/enterprise/auth.jhtml" >点击此处</a>完成认证
				</p>
				</#if>
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