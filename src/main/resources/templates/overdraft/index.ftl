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
	<#assign logoInfo='我的白条' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right ">
				<#if tip?? && "applyOverdraft"==tip ><#include "applyOverdraft.ftl" /></#if>
				<#if tip?? && "editOverdraft"==tip ><#include "editOverdraft.ftl" /></#if>
				<#if tip?? && "showOverdraft"==tip ><#include "editOverdraft.ftl" /></#if>
				<#if tip?? && "refuseOverdraft"==tip ><#include "refuseOverdraft.ftl" /></#if>
				<#if tip?? && "billList"==tip ><#include "billList.ftl" /></#if>
				<#if tip?? && "repaymentList"==tip ><#include "repaymentList.ftl" /></#if>
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