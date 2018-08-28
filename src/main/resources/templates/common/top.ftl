<div class="top">
	<div class="container">
		<div class="row">
			<div class="col left">
				<span>乐切欢迎您！</span>
				<#if Session.__user?exists>
					<a class="color" href="${ctx}/app/order/index.jhtml">${Session.__user.name}</a>
					<a class="color-hover" href="${ctx}/app/logout.jhtml">退出</a>
				<#else />
					<a class="color" href="${ctx}/app/login.jhtml">请先登录</a>
					<a class="color-hover" href="${ctx}/app/register.jhtml">免费注册</a>
				</#if>
			</div>
			<div class="col right">
				<ul>
					<li><span>联系电话：0510-88996061</span></li>
					<li><a class="color-hover" href="${ctx}/index.jhtml">网站首页</a></li>
					<li>
						<div class="drop-down">
							<a class="drop-button color-hover" href="javascript:void(0);">APP下载<span class="fa fa-angle-down"></span></a>
							<div class="drop-menu">
								<img src="${ctx}/static/images/app-download.png" alt="APP下载" />
							</div>
						</div>
					</li>
					<li>
						<div class="drop-down">
							<a class="drop-button color-hover" href="javascript:void(0);">微信公众号<span class="fa fa-angle-down"></span></a>
							<div class="drop-menu">
								<img src="${ctx}/static/images/wechat-qrcode.png" alt="微信公众号" />
							</div>
						</div>
					</li>
					<#if Session.__user?exists>
					<li><a class="color-hover shopcar" href="${ctx}/app/shoppingCar.jhtml">我的购物车<span class='color' id="shopcar-count" data-value="${Session.__shopCarCount!0}">(${Session.__shopCarCount!0})</span></a></li>
					</#if>
				</ul>
			</div>
		</div>
	</div>
</div>