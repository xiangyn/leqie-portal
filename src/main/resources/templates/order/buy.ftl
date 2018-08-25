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
				<div class="address-more">
					<button type="button" class="btn">显示更多 <span class="fa fa-plus"></button>
					<!-- <button type="button" class="btn">添加地址 <span class="fa fa-plus"></button> -->
				</div>
				<p class="loading-info text-center color">正在加载个人收货地址...</p>
				<div class="empty-info">
					<p class="text-center">暂无收货地址，请<a target="_blank" href="${ctx}/app/recvAddress/new.jhtml" class="color">点击添加收货地址</a></p>
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
					<span class="column params">
						<#if model.chang?exists><p>长度：${model.chang} mm</p></#if>
						<#if model.kuang?exists>
							<#if model.zhonglei == '圆棒'>
								<p>直径：${model.chang} mm</p>
							<#else/>
								<p>宽度：${model.chang} mm</p>
							</#if>
						</#if>
						<#if model.hou?exists><p>厚度：${model.hou} mm</p></#if>
						<#if model.waijing?exists><p>外径：${model.waijing} mm</p></#if>
						<#if model.neijing?exists><p>内径：${model.neijing} mm</p></#if>
					</span>
					<span class="column type">${model.type!'-'}</span>
					<span class="column amount">${model.amount}</span>
					<span class="column money">${model.money}元</span>
				</li>
			</ul>
			<form class="form">
			<div class="product-order">
				<input type="hidden" name="zhonglei" value="${model.zhonglei}" />
				<input type="hidden" name="erjimulu" value="${model.erjimulu}" />
				<input type="hidden" name="chang" value="${model.chang!}" />
				<input type="hidden" name="kuang" value="${model.kuang!}" />
				<input type="hidden" name="hou" value="${model.hou!}" />
				<input type="hidden" name="waijing" value="${model.waijing!}" />
				<input type="hidden" name="neijing" value="${model.neijing!}" />
				<input type="hidden" name="type" value="${model.type!}" />
				<input type="hidden" name="amount" value="${model.amount}" />
				<input type="hidden" name="money" value="${model.money}" />
				<input type="hidden" name="addressId" value="" />
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
			</form>
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
						$(".address-list .empty-info").css("display", "none");
						for(var i=0; i<ret.data.length; i++) {
							var active = ret.data[i].moren * 1 == 1 ? 'active' : '';
							if(active) {
								$("input[name=addressId]").val(ret.data[i].id);
							}
							$('<div class="address-item '+active+'" data-id="'+ret.data[i].id+'">\
									<div class="address-info unselect">\
									<p>联系人：<span>'+ret.data[i].name+'</span>'+(active ? '(默认地址)': '')+'</p>\
									<p>联系方式：<span>'+ret.data[i].phone+'</span></p>\
									<p>地址：<span>'+ret.data[i].address+'</span></p>\
								</div>\
							</div>').prependTo($(".address-list"));
						}
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
	
	$(".address-list").on("click", ".address-item", function() {
		$(".address-list .address-item").removeClass("active");
		$("input[name=addressId]").val($(this).data("id"));
		$(this).addClass("active");
	});
	
	$(document).trigger("loadAddress");
	
	$("#buy-button").on("click", function() {
		if(!$("input[name=addressId]").val()) {
			iziToast.error({
		        message: '请先选择一个地址!',
		        position: 'topCenter',
		        transitionIn: 'bounceInLeft',
		    });
			return;
		}
		$.ajax({
			url: "${ctx}/app/order/save.jo",
			type: 'POST',
			data: $("form").serializeObject(),
			dataType: 'json',
			success: function(ret) {
				if(ret.success) {
					iziToast.success({
				        message: '下单成功!',
				        position: 'topCenter',
				        transitionIn: 'bounceInLeft',
				        onClose: function() {
				        	window.location.href = "${ctx}/app/order/unpay.jhtml";
				        }
				    });
				}else {
					iziToast.error({
				        message: ret.msg || '下单失败，请刷新后再试!',
				        position: 'topCenter',
				        transitionIn: 'bounceInLeft',
				    });
				}
			}
		});
	});
	
});
</script>
</body>
</html>