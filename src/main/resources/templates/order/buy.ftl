<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/iziToast.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/app.css" rel="stylesheet">
	<link href="${ctx}/static/css/shopcar.css" rel="stylesheet">
	<title>乐切 - 官方网站</title>
</head>
<body>
	<#include "/common/top.ftl" />
	<#assign logoInfo='选择收货地址' />
	<#assign navbarSelectedMenu='' />
	<#include "/common/navbar.ftl" />
	<div class="address-select">
		<div class="container">
			<h3 class="color">请选择一个收货地址：</h3>
			<div class="address-list clearfix">
				<!-- 
				<div class="address-item active">
					<div class="address-info unselect">
						<p>地址一：</p>
						<p>联系人：<span>wxy</span></p>
						<p>联系方式：<span>18862191011</span></p>
						<p>地址：<span>xxxxxxxxxxxxxxxxxxxxxx</span></p>
					</div>
				</div>
				<div class="address-item">
					<div class="address-info unselect">
						<p>地址二：</p>
						<p>联系人：<span>wxy</span></p>
						<p>联系方式：<span>18862191011</span></p>
						<p>地址：<span>xxxxxxxxxxxxxxxxxxxxxx</span></p>
					</div>
				</div> -->
				<div class="address-more">
					<button type="button" class="btn">显示更多 <span class="fa fa-plus"></button>
				</div>
				<p class="loading-info text-center color">正在加载个人收货地址...</p>
				<div class="empty-info">
					<p class="text-center">暂无收货地址，请<a href="${ctx}/app/recvAddress/new.jhtml" class="color">点击添加收货地址</a></p>
				</div>
			</div>
		</div>
	</div>
	<div class="buy-product-list">
		<div class="container">
			<ul class="product-list">
				<li class="product-list-title clearfix">
					<span class="column zhonglei">种类</span>
					<span class="column xinghao">型号</span>
					<span class="column params">尺寸</span>
					<span class="column type">类型</span>
					<span class="column amount">数量</span>
					<span class="column money">价格</span>
				</li>
				<li class="product-item clearfix">
					<span class="column zhonglei">${model.zhonglei}</span>
					<span class="column xinghao">${model.xinghaoName!'-'}</span>
					<span class="column params">-</span>
					<span class="column type">${model.type!'-'}</span>
					<span class="column amount">${model.amount}</span>
					<span class="column money">${model.money}元</span>
				</li>
			</ul>
			<div class="product-order">
				<div class="row">
					<div class="left order-price">
						合计：<span class="value">¥ ${model.money}</span> 元
					</div>
					<div class="right clearfix">
						<div class="order-button">
							<button type="button" id="buy-button">确认下单</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<#include "/common/footer.ftl" />
<#include "/common/foot.ftl" />
<script type="text/javascript" src="${ctx}/static/js/iziToast.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
<script type="text/javascript">
$(function() {
	
	$(document).on("loadAddress", function () {
		$.ajax({
			url: "${ctx}/app/loadAddresses.jo",
			type: 'post',
			dataType: 'json',
			success: function(ret) {
				if(ret.success) {
					$(".address-list .loading-info").remove();
					if(ret.data.length == 0) {
						$(".address-list .empty-info").css("display", "block");
					}else {
						
					}
				}else {
					iziToast.error({
				        message: '加载个人收货地址失败',
				        position: 'topCenter',
				        transitionIn: 'bounceInLeft',
				    });
				}
			}
		});
	});
	
	$(document).trigger("loadAddress");
	
});
</script>
</body>
</html>