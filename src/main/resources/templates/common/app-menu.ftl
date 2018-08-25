<div class="app-menus">
	<div class="app-menus-title">所有功能</div>
	<ul class="app-menu-list">
		<li class="app-menu-item">
			<a class="<#if _uri?starts_with('/app/order')>color</#if>" href="${ctx}/app/order/index.jhtml"><#if _uri?starts_with('/app/order')><span class="fa fa-minus-square-o"></span><#else/><span class="fa fa-plus-square-o"></span></#if> 我的订单</a>
			<#if _uri?starts_with('/app/order')>
			<ul class="app-menu-list">
				<li class="app-menu-item"><a class="<#if _uri=='/app/order/index.jhtml'>color</#if>" href="${ctx}/app/order/index.jhtml" >最近的订单</a></li>
				<li class="app-menu-item"><a class="<#if _uri=='/app/order/unpay.jhtml'>color</#if>" href="${ctx}/app/order/unpay.jhtml">未付款的订单</a></li>
				<li class="app-menu-item"><a class="<#if _uri=='/app/order/unrecv.jhtml'>color</#if>" href="${ctx}/app/order/unrecv.jhtml">未收货的订单</a></li>
				<li class="app-menu-item"><a class="<#if _uri=='/app/order/all.jhtml'>color</#if>" href="${ctx}/app/order/all.jhtml">所有订单</a></li>
			</ul>
			</#if>
		</li>
		<li class="app-menu-item">
			<a class="<#if _uri?starts_with('/app/wallet')>color</#if>" href="${ctx}/app/wallet.jhtml"><#if _uri?starts_with('/app/wallet')><span class="fa fa-minus-square-o"></span><#else/><span class="fa fa-plus-square-o"></span></#if> 我的钱包</a>
		</li>
		<li class="app-menu-item">
			<a class="<#if _uri?starts_with('/app/overdraft')>color</#if>" href="${ctx}/app/overdraft.jhtml"><#if _uri?starts_with('/app/overdraft')><span class="fa fa-minus-square-o"></span><#else/><span class="fa fa-plus-square-o"></span></#if> 我的白条</a>
		</li>
		<li class="app-menu-item">
			<a class="<#if _uri?starts_with('/app/invoice')>color</#if>" href="${ctx}/app/invoice.jhtml"><#if _uri?starts_with('/app/invoice')><span class="fa fa-minus-square-o"></span><#else/><span class="fa fa-plus-square-o"></span></#if> 我的发票</a>
			<#if _uri?starts_with('/app/invoice')>
			<ul class="app-menu-list">
				<li class="app-menu-item"><a class="<#if _uri=='/app/invoice/will.jhtml'>color</#if>" href="${ctx}/app/invoice/will.jhtml">可开发票</a></li>
				<li class="app-menu-item"><a class="<#if _uri=='/app/invoice/open.jhtml'>color</#if>" href="${ctx}/app/invoice/open.jhtml">已开发票</a></li>
			</ul>
			</#if>
		</li>
		<li class="app-menu-item">
			<a class="<#if _uri?starts_with('/app/recvAddress')>color</#if>" href="${ctx}/app/recvAddress.jhtml"><#if _uri?starts_with('/app/recvAddress')><span class="fa fa-minus-square-o"></span><#else/><span class="fa fa-plus-square-o"></span></#if> 收货地址</a>
			<#if _uri?starts_with('/app/recvAddress')>
			<ul class="app-menu-list">
				<li class="app-menu-item"><a class="<#if _uri=='/app/recvAddress/new.jhtml'>color</#if>"  href="${ctx}/app/recvAddress/new.jhtml">新增地址</a></li>
			</ul>
			</#if>
		</li>
		<li class="app-menu-item">
			<a class="<#if _uri?starts_with('/app/enterprise')>color</#if>" href="${ctx}/app/enterprise.jhtml"><#if _uri?starts_with('/app/enterprise')><span class="fa fa-minus-square-o"></span><#else/><span class="fa fa-plus-square-o"></span></#if> 企业认证</a>
		</li>
		<li class="app-menu-item">
			<a class="<#if _uri?starts_with('/app/user')>color</#if>" href="${ctx}/app/user.jhtml"><#if _uri?starts_with('/app/user')><span class="fa fa-minus-square-o"></span><#else/><span class="fa fa-plus-square-o"></span></#if> 账户管理</a>
			<#if _uri?starts_with('/app/user')>
			<ul class="app-menu-list">
				<li class="app-menu-item"><a class="<#if _uri=='/app/user/updatePwd. jhtml'>color</#if>" href="${ctx}/app/user/updatePwd.jhtml">修改密码</a></li>
			</ul>
			</#if>
		</li>
	</ul>
</div>