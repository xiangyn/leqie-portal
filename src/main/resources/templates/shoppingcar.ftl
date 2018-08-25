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
	<#assign logoInfo='购物车' />
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
	<div class="buy-product-list" id="shoppingcar-product-list">
		<div class="container">
			<div class="table">
				<table>
					<colgroup>
						<col style="width: 60px;">
						<col style="width: 100px;">
						<col style="width: 120px;">
						<col style="width: 200px;">
						<col style="width: 120px;">
						<col style="width: 150px;">
						<col style="width: 150px;">
						<col style="width: 60px;">
					</colgroup>
					<thead class="table-header">
						<tr>
							<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
								<div class="table-cell-wrapper">#</div></th>
							<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
								<div class="table-cell-wrapper">种类</div></th>
							<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
								<div class="table-cell-wrapper">型号</div></th>
							<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
								<div class="table-cell-wrapper">尺寸</div></th>
							<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
								<div class="table-cell-wrapper">类型</div></th>
							<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
								<div class="table-cell-wrapper">数量</div></th>
							<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
								<div class="table-cell-wrapper">价格</div></th>
							<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
								<div class="table-cell-wrapper">操作</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<#if data?size==0>
						<tr>
							<td class="table-cell shoppingcar-info" colspan="7">
								<p class="empty-info text-center">您的购物车空空如也！</p>
							</td>
						</tr>
						<#else/>
						<#list data as model>
						<tr class="table-row unselect" data-id="${model.id}" data-money="${model.money}">
							<td type="body" class="table-cell" role="gridcell">
								<div class="table-cell-wrapper"><input type="checkbox" /></div></td>
							<td type="body" class="table-cell" role="gridcell">
								<div class="table-cell-wrapper">${model.zhonglei}</div></td>
							<td type="body" class="table-cell" role="gridcell">
								<div class="table-cell-wrapper">${model.erjimulu!'-'}</div></td>
							<td type="body" class="table-cell" role="gridcell">
								<div class="table-cell-wrapper">
									<#if model.length?exists><p>长度：${model.length} mm</p></#if>
									<#if model.width?exists>
										<#if model.zhonglei == '圆棒'>
											<p>直径：${model.width} mm</p>
										<#elseif model.zhonglei == '管材' />
											<p>外径：${model.width} mm</p>
										<#else/>
											<p>宽度：${model.width} mm</p>
										</#if>
									</#if>
									<#if model.height?exists>
										<#if model.zhonglei == '管材' >
											<p>内径：${model.height} mm</p>
										<#else/>
											<p>厚度：${model.height} mm</p>
										</#if>
									</#if>
								</div></td>
							<td type="body" class="table-cell" role="gridcell">
								<div class="table-cell-wrapper">${model.type!'-'}</div></td>
							<td type="body" class="table-cell" role="gridcell">
								<div class="table-cell-wrapper">${model.productNum}</div></td>
							<td type="body" class="table-cell" role="gridcell">
								<div class="table-cell-wrapper">¥ ${model.money}</div></td>
							<td type="body" class="table-cell" role="gridcell">
								<div class="table-cell-wrapper">
									<a href="javascript:void(0);" class="color shopcar-remove">删除</a>
								</div></td>
						</tr>
						</#list>
						</#if>
					</tbody>
				</table>
			</div>
			<!-- 
			<ul class="product-list">
				<li class="product-list-title clearfix">
					<span class="column checkbox">#</span>
					<span class="column zhonglei">种类</span>
					<span class="column xinghao">型号</span>
					<span class="column params">尺寸</span>
					<span class="column type">类型</span>
					<span class="column amount">数量</span>
					<span class="column money">价格</span>
					<span class="column opera">操作</span>
				</li>
				<#if data?size==0>
				<li class="product-item shoppingcar-info"><p class="empty-info text-center">您的购物车空空如也！</p></li>
				</#if>
				<#list data as model>
				<li class="product-item clearfix" data-id="${model.id}">
					<span class="column checkbox"><input type="checkbox" /></span>
					<span class="column zhonglei">${model.zhonglei}</span>
					<span class="column xinghao">${model.erjimulu!'-'}</span>
					<span class="column params">
						<#if model.length?exists><p>长度：${model.length} mm</p></#if>
						<#if model.width?exists>
							<#if model.zhonglei == '圆棒'>
								<p>直径：${model.width} mm</p>
							<#elseif model.zhonglei == '管材' />
								<p>外径：${model.width} mm</p>
							<#else/>
								<p>宽度：${model.width} mm</p>
							</#if>
						</#if>
						<#if model.height?exists>
							<#if model.zhonglei == '管材' >
								<p>内径：${model.height} mm</p>
							<#else/>
								<p>厚度：${model.height} mm</p>
							</#if>
						</#if>
					</span>
					<span class="column type">${model.type!'-'}</span>
					<span class="column amount">${model.productNum}</span>
					<span class="column money">${model.money}元</span>
				</li>
				</#list>
			</ul>
			 -->
			<form class="form">
			<div class="product-order">
				<input type="hidden" name="gouwucheIds" value="" />
				<input type="hidden" name="addressId" value="" />
				<div class="row">
					<div class="left order-price">
						合计：<span class="value">¥ 0.00</span> 元
					</div>
					<div class="right clearfix">
						<div class="order-button">
							<button type="button" id="buy-button" class="disabled" disabled="disabled">确认下单</button>
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
					$.info.error('加载个人收货地址失败');
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
	
	$(".buy-product-list .table tbody tr").on("click", function(e) {
		if(e.target.tagName != 'A') {
			var checkbox = $(this).find("input[type='checkbox']").get(0);
			checkbox.checked = !checkbox.checked;
			$(checkbox).trigger("change");
		}
	});
	
	$(".buy-product-list .table input[type='checkbox']").on("change", function() {
		var total = 0;
		var ids = [];
		$(".buy-product-list .table input[type='checkbox']:checked").each(function() {
			total += $(this).closest("tr").data("money");
			ids.push($(this).closest("tr").data("id"));
		});
		if(total == 0) {
			$("#buy-button").addClass("disabled").attr("disabled", "disabled");
		}else {
			$("#buy-button").removeClass("disabled").removeAttr("disabled");
		}
		$("input[name='gouwucheIds']").val(ids.join(","));
		$(".product-order .value").text("¥ " + total.toFixed(2));
	});
	
	$(".buy-product-list .table a.shopcar-remove ").on("click", function() {
		var $tr = $(this).closest("tr");
		confirm("你确认移除该商品吗？") && $.fastAjax({
			url: "${ctx}/app/shoppingcar/remove.jo",
			data: { id : $tr.data("id") },
			success: function(ret) {
				if(ret.success) {
					$tr.remove();
					$.info.success("移除成功！");
				}else {
					$.info.success("移除失败，请刷新后再试！");
				}
			}
		});
	});
	
	$("#buy-button").on("click", function() {
		if(!$("input[name=addressId]").val()) {
			$.info.error("请先选择一个地址!");
			return;
		}
		$.ajax({
			url: "${ctx}/app/shoppingcar/order.jo",
			type: 'POST',
			data: $("form").serializeObject(),
			dataType: 'json',
			success: function(ret) {
				if(ret.success) {
					$.info.success("下单成功!", function() {
			        	window.location.href = "${ctx}/app/order/unpay.jhtml";
			        });
				}else {
					$.info.error(ret.data.msg || '下单失败，请刷新后再试!');
				}
			}
		});
	});
	
});
</script>
</body>
</html>