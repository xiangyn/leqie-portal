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
					<div class="panel-title">
						<h3 class="color">安全中心</h3>
					</div>
					<div class="panel-content">
						<div class="clearfix">
							 <div class="security-list">
							 	<div class="security-item clearfix">
							 		<#if auth?exists>
							 		<div class="state finish">
							 			<span class="fa fa-check"></span>已完成
							 		</div>
							 		<#else/>
							 		<div class="state no">
							 			<span class="fa fa-remove"></span>未认证
							 		</div>
							 		</#if>
							 		<div class="info">
							 			<div class="title"><em>企&nbsp;业&nbsp;认&nbsp;证</em></div>
		    							<div class="supply">
		    								用于提升账号的安全性和信任级别。认证后的有卖家记录的账号不能修改认证信息。
		    							</div>
							 		</div>
	    							<div class="operate">
	    								<#if auth?exists>
	    								<a class="color" title="查看" href="${ctx}/app/enterprise.jhtml">查看</a>
	    								<#else/>
	    								<a class="color" title="认证" href="${ctx}/app/enterprise/auth.jhtml">认证</a>
	    								</#if>
	    							</div>
							 	</div>
							 	<div class="security-item clearfix">
							 		<div class="state finish">
							 			<span class="fa fa-check"></span>已完成
							 		</div>
							 		<div class="info">
							 			<div class="title"><em>登&nbsp;录&nbsp;密&nbsp;码</em></div>
		    							<div class="supply">
		    								安全性高的密码可以使账号更安全。建议您定期更换密码，且设置一个包含数字和字母，并长度超过6位以上的密码。
		    							</div>
							 		</div>
	    							<div class="operate">
	    								<a class="color" title="修改" href="${ctx}/app/user/updatePwd.jhtml">修改</a>
	    							</div>
							 	</div>
							 </div>
						</div>
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