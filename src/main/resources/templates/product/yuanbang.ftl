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
	<#assign logoInfo='圆棒' />
	<#assign navbarSelectedMenu='' />
	<#include "/common/navbar.ftl" />
	<div class="product">
		<div class="container clearfix">
			<#include "/product/product-menu.ftl"/>
			<div class="product-content">
			<form action="${ctx}/app/order/buy.jhtml" method="post">
				<input type="hidden" name="zhonglei" value="圆棒"/>
				<input type="hidden" name="money" value="0" />
				<div class="form-content">
					<div class="row">
						<div class="col eighth text-right">
							<label class="form-label required">种类</label>
						</div>
						<div class="col half">
							<input type="hidden" name="xinghaoName" value="${cates[0].name}" />
							<input type="hidden" name="erjimulu" value="${cates[0].id}"/>
							<ul class="order-menus clearfix erjimulu" data-name="erjimulu">
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
							<label class="form-label required">直径</label>
						</div>
						<div class="col half">
							<div class="form-item widget-sider">
								<input class="number" type="text" name="kuang" placeholder="请输入直径" required="required" readonly="readonly" />
							</div>
						</div>
						<div class="col quarter">
							<span class="form-item-msg" id="kuang-msg">（单位：mm）</span>
						</div>
					</div>
					<div class="row">
						<div class="col eighth text-right">
							<label class="form-label"></label>
						</div>
						<div class="col half">
							<input type="hidden" name="type" value="零切" />
							<ul class="order-menus clearfix" data-name="type">
								<li class="half menu-item text-center active" data-value="零切">零切(预计一个工作日到)</li>
								<li class="half menu-item text-center" data-value="整只">整只(预计两个工作日到)</li>
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
								<button type="button" id="shopcar-button">加入购物车</button>
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
<script type="text/javascript" src="${ctx}/static/js/sider.jquery.min.js"></script>
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
	
	$("ul.erjimulu li").on("click", function() {
		$("input[name='hou']").val("");
		setTimeout(function() {
			initSider();
		}, 20);
	});
	
	function initSider() {
		$.fastAjax({
			url: "${ctx}/app/product/getParams.jo",
			data: {
				zhonglei: $("input[name=zhonglei]").val(),
				xinghaoId: $("ul.erjimulu li.active").data("value")
			},
			success: function(ret) {
				if(ret.success) {
					if(ret.data.zhijings.length == 0) {
						$.info.error("获取直径失败，请联系管理员！");
					}
					$(".widget-sider").sider({
						name: 'kuang',
						placeholder: '请选择直径',
						quick: ret.data.zhijings,
						callback: function(_this, value, status) {
							status && $(".form-content input[name='chang']").trigger("change");
						}
					});
				}
			}
		})
	}
	initSider();
	
	$(".product-order input.number").on("change", function() {
		setTimeout(calculate, 10);
	});
	
	var success = false;
	function calculate() {
		var amount = $(".product-order input.number").val();
		var chang = $("input[name='chang']").val();
		var kuang = $("input[name='kuang']").val();
		if($.isNumeric(amount) && $.isNumeric(chang) && $.isNumeric(kuang)) {
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
		}else {
			$(".order-price-formula").text("*");
			$(".order-price-value").text("¥ 0.00");
			$("input[name='money']").val('0');
		}
	}
	
	$("#buy-button").on("click", function() {
		if(success) {
			$("input[name=xinghaoName]").val($(".erjimulu li.active").text());
			$(".product-content form").submit();
		}
	});
	
	$("#shopcar-button").on("click", function() {
		if(success) {
			$("input[name=xinghaoName]").val($(".erjimulu li.active").text());
			$.fastAjax({
				url: "${ctx}/app/shoppingcar/add.jo",
				data: $(".product-content form").serializeObject(),
				success: function(ret) {
					if(ret.success) {
						$.info.success("已添加至购物车！");
						$("#shopcar-count").text("("+($("#shopcar-count").data("value")*1+1)+")");
					}else {
						$.info.error("添加至购物车失败，请刷新后再试！");
					}
				}
			});
		}
	});
	
});
</script>
</body>
</html>