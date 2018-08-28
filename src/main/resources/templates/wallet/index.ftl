<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/iziToast.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/app.css" rel="stylesheet">
    <style type="text/css">
        .li1{
            float: left;
            list-style: none;
            border-right: 1px solid #000;
            width: 18%;
            text-align: center;
            font-size: 16px;
        };
    </style>
	<title>乐切 - 官方网站</title>
</head>
<body>
	<#include "/common/top.ftl" />
	<#assign navbarSelectedMenu='center' />
	<#assign logoInfo='我的钱包' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right orders-panel">
				<div class="bread-crumb">
					<h3>我的钱包</h3>
				</div>
				<div class="panel-title">
					<ul class="order-menus">
						<li class="order-menu-item <#if tip?? && 'userMoney'==tip>active</#if>"><a href="${ctx}/app/wallet">当前余额</a></li>
						<li class="order-menu-item <#if tip?? && 'chargeList'==tip>active</#if>"><a href="${ctx}/app/wallet/chargeList?p=1">充值明细</a></li>
						<li class="order-menu-item <#if tip?? && 'consumeList'==tip>active</#if>"><a href="${ctx}/app/wallet/consumeList?p=1">消费明细</a></li>
						<li class="order-menu-item <#if tip?? && 'withdraw'==tip>active</#if>"><a href="${ctx}/app/wallet/withdraw">申请提现</a></li>
						<li class="order-menu-item <#if tip?? && 'withdrawList'==tip>active</#if>"><a href="${ctx}/app/wallet/withdrawList?p=1">提现列表</a></li>
					</ul>
				</div>
				<div class="panel-content wallet-content">
				<#if tip?? && "userMoney"==tip ><#include "wallet_userMoney.ftl" /></#if>
                <#if tip?? && "chargeList"==tip ><#include "wallet_chargeList.ftl" /></#if>
                <#if tip?? && "consumeList"==tip ><#include "wallet_consumeList.ftl" /></#if>
                <#if tip?? && "withdraw"==tip ><#include "wallet_withdraw.ftl" /></#if>
                <#if tip?? && "withdrawList"==tip ><#include "wallet_withdrawList.ftl" /></#if>
                </div>
			</div>
		</div>
	</div>
	<#include "/common/footer.ftl" />
<#include "/common/foot.ftl" />
<script type="text/javascript">
$(function() {
});
</script>
</body>
</html>