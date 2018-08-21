<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/iziToast.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/product.css" rel="stylesheet">
	<title>乐切 - 官方网站</title>
</head>
<body>
	<#include "/common/top.ftl" />
	<#assign logoInfo='管材' />
	<#assign navbarSelectedMenu='' />
	<#include "/common/navbar.ftl" />
	<div class="product">
		<div class="container clearfix">
			<div class="product-title">
				<div class="product-types">
					<h2>所有产品</h2>
					<ul class="product-type-list">
						<li class="product-type-item">
							<a href="${ctx}/app/product-zheng.jhtml" >
								<span class="product-type-icon"><img src="${ctx}/static/images/product-1-icon.png" alt="整板" /></span>
								<span class="product-type-name">整 板</span>
							</a>
						</li>
						<li class="product-type-item">
							<a href="${ctx}/app/product-lingqie.jhtml" >
								<span class="product-type-icon"><img src="${ctx}/static/images/product-2-icon.png" alt="零切"/></span>
								<span class="product-type-name">零 切</span>
							</a>
						</li>
						<li class="product-type-item">
							<a href="${ctx}/app/product-yuanbang.jhtml" >
								<span class="product-type-icon"><img src="${ctx}/static/images/product-3-icon.png" alt="圆棒"/></span>
								<span class="product-type-name">圆 棒</span>
							</a>
						</li>
						<li class="product-type-item">
							<a href="${ctx}/app/product-xingcai.jhtml" >
								<span class="product-type-icon"><img src="${ctx}/static/images/product-4-icon.png" alt="型材"/></span>
								<span class="product-type-name">型 材</span>
							</a>
						</li>
						<li class="product-type-item active">
							<a href="${ctx}/app/product-guancai.jhtml" >
								<span class="product-type-icon"><img src="${ctx}/static/images/product-5-icon.png" alt="管材"/></span>
								<span class="product-type-name">管 材</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="product-content">
			<form action="${ctx}/app/order/buy.jhtml" method="post">
				<input type="hidden" name="zhonglei" value="管材"/>
				<input type="hidden" name="money" value="0" />
				<div class="form-content">
					<div class="row">
						<div class="col eighth text-right">
							<label class="form-label required">种类</label>
						</div>
						<div class="col half">
							<input type="hidden" name="erjimulu" value="${cates[0].id}"/>
							<ul class="order-menus clearfix" data-name="erjimulu">
								<#list cates as cate>
								<li data-value="${cate.id}" class="quarter menu-item text-center <#if cate_index==0>active</#if>">${cate.name}</li>
								</#list> 
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col eighth text-right">
							<label class="form-label required">长度</label>
						</div>
						<div class="col half">
							<div class="form-item">
								<input class="number" type="text" name="chang" placeholder="请输入长度" required="required" />
							</div>
						</div>
						<div class="col quarter">
							<span class="form-item-msg" id="chang-msg">（单位：mm）</span>
						</div>
					</div>
					<div class="row">
						<div class="col eighth text-right">
							<label class="form-label required">外径</label>
						</div>
						<div class="col half">
							<div class="form-item">
								<input class="number" type="text" name="waijing" placeholder="请输入外径" required="required" />
							</div>
						</div>
						<div class="col quarter">
							<span class="form-item-msg" id="kuang-msg">（单位：mm）</span>
						</div>
					</div>
					<div class="row">
						<div class="col eighth text-right">
							<label class="form-label required">内径</label>
						</div>
						<div class="col half">
							<div class="form-item">
								<input class="number" type="text" name="neijing" placeholder="请输入内径" required="required" />
							</div>
						</div>
						<div class="col quarter">
							<span class="form-item-msg" id="hou-msg">（单位：mm）</span>
						</div>
					</div>
					<div class="row">
						<div class="col eighth text-right">
							<label class="form-label"></label>
						</div>
						<div class="col half">
							<input type="hidden" name="type" value="整只" />
							<ul class="order-menus clearfix" data-name="type">
								<li class="menu-item text-center active" data-value="整只">整只(预计一个工作日到)</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="product-order">
					<div class="row">
						<div class="left">
							<div class="order-price">
								<p class="formula">计算公式：<span class="order-price-formula">*</span></p>
								<span class="order-price-value">¥ 0.00</span>元
							</div>
						</div>
						<div class="right clearfix">
							<div class="order-number">
								<span class="order-number-title color">购买数量：</span>
								<button class="minus" type="button"><span class="fa fa-minus"></span></button>
								<input class="number" type="text" name="amount" value="1"  />
								<button class="plus" type="button"><span class="fa fa-plus"></span></button>
							</div>
							<div class="order-button">
								<button type="button" id="buy-button">购 买</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
	<#include "/common/footer.ftl" />
<#include "/common/foot.ftl" />
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
<script type="text/javascript" src="${ctx}/static/js/iziToast.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".product-content .row .form-item input").on("change", function() {
		$(".product-order input.number").trigger("change");
	});
	$("ul.order-menus li").on("click", function() {
		var $ul = $(this).closest("ul.order-menus");
		$ul.find("li.active").removeClass("active");
		$("input[name='" + $ul.data("name") + "']").val($(this).data("value"));
		$(this).addClass("active");
		$(".product-order input.number").trigger("change");
	});
	
	$(".order-number .minus").on("click", function() {
		var input = $(".product-order input.number").get(0);
		input.value = input.value * 1 - 1;
		$(input).trigger("change");
	});
	$(".order-number .plus").on("click", function() {
		var input = $(".product-order input.number").get(0);
		input.value = input.value * 1 + 1;
		$(input).trigger("change");
	});
	
	$(".form-content input[name='waijing']").on("change", function() {
		var waijing = $(this).val();
		if($.isNumeric(waijing)) {
			$.ajax({
				url: "${ctx}/app/product/getNeijing.jo",
				type: 'post',
				data: {
					waijing: waijing,
					xinghaoId: $("input[name='erjimulu']").val()
				},
				dataType: "json",
				success: function(ret) {
					
				}
			});
		}
	});
	
	$(".form-content input[name='neijing']").on("change", function() {
		var neijing = $(this).val();
		if($.isNumeric(neijing)) {
			$.ajax({
				url: "${ctx}/app/product/getWaijing.jo",
				type: 'post',
				data: {
					neijing: neijing,
					xinghaoId: $("input[name='erjimulu']").val()
				},
				dataType: "json",
				success: function(ret) {
					
				}
			});
		}
	});
	
	var success = false;
	$(".product-order input.number").on("change", function() {
		var amount = $(this).val();
		var chang = $("input[name='chang']").val();
		var waijing = $("input[name='waijing']").val();
		var neijing = $("input[name='neijing']").val();
		if($.isNumeric(amount) && $.isNumeric(chang) && $.isNumeric(waijing) && $.isNumeric(neijing)) {
			$.ajax({
				url: "${ctx}/app/product/getMoney.jo",
				type: 'post',
				data: $(".product-content form").serializeObject(),
				dataType: 'json',
				beforeSend: function() {
					$(".order-price-formula").text("加载中...");
					$(".order-price-value").text("¥ 0.00");
					$("input[name='money']").val('0');
					success = false;
				},
				success: function(ret) {
					if(!ret.success) {
						iziToast.error({
					        message: '获取价格失败!',
					        position: 'topCenter',
					        transitionIn: 'bounceInLeft',
					    });
						$(".order-price-formula").text("-");
						success = false;
					}else if(ret.data.status == '0') {
						iziToast.error({
					        message: ret.data.msg,
					        position: 'topCenter',
					        transitionIn: 'bounceInLeft',
					    });
						$(".order-price-formula").text("-");
						success = false;
					}else {
						$(".order-price-formula").text(ret.data.rule);
						$(".order-price-value").text(ret.data.orderMoney);
						$("input[name='money']").val(ret.data.orderMoney);
						success = true;
					}
				}
			});
		}
	});
	
	$("#buy-button").on("click", function() {
		if(success) {
			$(".product-content form").submit();
		}
	});
	
});
</script>
</body>
</html>