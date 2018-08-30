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
				<div class="bread-crumb">
					<h3>我的白条</h3>
				</div>
				<div class="info-panel">
					<div class="panel-title">
						<h3 class="color">基本信息</h3>
					</div>
					<div class="panel-content">
						<div class="clearfix">
							<div class="list-infos left">
								<p><span class="fa fa-user"></span> 账号：<span class="info">${Session.__user.phone}</span></p>
								<p><span class="fa fa-id-card"></span> 姓名：<span class="info">${Session.__user.name}</span></p>
								<p><span class="fa fa-home"></span> 公司：<span class="info">${Session.__user.company!'暂无'}</span></p>
								<p><span class="fa fa-briefcase"></span> 职位：<span class="info">${Session.__user.zhiwei!'暂无'}</span></p>
							</div>
							
							<div class="infos-edit right">
								<#if !over?exists>
									<a href="${ctx}/app/overdraft/apply.jhtml" >申请白条</a>
								<#elseif over.status != '审核通过'/>
									<a href="${ctx}/app/overdraft/apply.jhtml" >重新申请</a>
								<#else />
									
								</#if>
							</div>
							<div class="status-infos">
								<#if !over?exists>
									<p class="status-info">当前状态：<span>未开通</span></p>
								<#elseif over.status != '审核通过'/>
									<p class="status-info">当前状态：<span>${over.status}</span></p>
								</#if>
							</div>
						</div>
					</div>
				</div>
				<div class="info-panel">
					<div class="panel-title">
						<h3 class="color">我的记录</h3>
					</div>
					<div class="panel-content">
						<ul class="panel-menu clearfix">
							<li class="item active"><a href="javascript:void(0)">我的白条</a></li>
							<li class="item"><a href="javascript:void(0)">我的还款</a></li>
						</ul>
					</div>
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