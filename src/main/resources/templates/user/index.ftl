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
	<#assign logoInfo='账户管理' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right user-manage">
				<div class="user-panel">
					<div class="panel-title">
						<h3 class="color">基本信息</h3>
					</div>
					<div class="panel-content">
						<div class="clearfix">
							<div class="list-infos left">
								<p><span class="fa fa-user"></span> 账号：<span class="info">${user.phone}</span></p>
								<p><span class="fa fa-id-card"></span> 姓名：<span class="info">${user.name}</span></p>
								<p><span class="fa fa-home"></span> 公司：<span class="info">${user.company!'暂无'}</span></p>
								<p><span class="fa fa-briefcase"></span> 职位：<span class="info">${user.zhiwei!'暂无'}</span></p>
							</div>
							<div class="infos-edit right">
								<a href="${ctx}/app/user/update.jhtml" >编辑信息</a>
							</div>
						</div>
					</div>
				</div>
				<div class="security-panel">
					
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