<div class="navbar">
	<div class="container">
		<div class="row">
			<div class="col left">
				<a class="logo" href="${ctx}/index.jhtml">
					<img class="logo-image" src="${ctx}/static/images/logo.png" alt="乐切官方网站LOGO" />
				</a>
				<#if logoInfo?exists>
					<div class="logo-title right">
						<h1>${logoInfo}</h1>
					</div>
				</#if>
			</div>
			<div class="col right">
				<ul class="navbar-menu">
					<li class="navbar-menu-item ${(navbarSelectedMenu == 'home')?string('active', '')}">
						<a class="color-hover" href="${ctx}/index.jhtml">首页</a>
					</li>
					<li class="navbar-menu-item ${(navbarSelectedMenu == 'fastOrder')?string('active', '')}">
						<a class="color-hover" href="${ctx}/app/fastOrder.jhtml">快速下单</a>
					</li>
					<#if Session.__user?exists>
					<li class="navbar-menu-item ${(navbarSelectedMenu == 'center')?string('active', '')}">
						<a class="color-hover" href="${ctx}/app/order/index.jhtml">个人中心</a>
					</li>
					</#if>
					<li class="navbar-menu-item ${(navbarSelectedMenu == 'company')?string('active', '')}">
						<a class="color-hover" href="${ctx}/company/index.jhtml">公司简介</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>