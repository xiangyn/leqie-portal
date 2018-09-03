<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/app.css" rel="stylesheet">
	<link href="${ctx}/static/css/iziToast.min.css" rel="stylesheet">
	<title>乐切 - 官方网站</title>
</head>
<body>
	<#import "/common/page.ftl" as pagination />
	<#include "/common/top.ftl" />
	<#assign navbarSelectedMenu='center' />
	<#assign logoInfo='我的白条' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right ">
				<div class="bread-crumb">
					<h3>我的白条</h3>
				</div>
				<div class="info-panel">
					<div class="panel-title">
						<h3 class="color">基本信息</h3>
					</div>
					<div class="panel-content">
						<div class="clearfix">
							<div class="list-infos left">
								<p><span class="fa fa-user"></span> 账号：<span class="info">${Session.__user.phone}</span></p>
								<p><span class="fa fa-id-card"></span> 姓名：<span class="info">${Session.__user.name}</span></p>
								<p><span class="fa fa-home"></span> 公司：<span class="info">${Session.__user.company!'暂无'}</span></p>
								<p><span class="fa fa-briefcase"></span> 职位：<span class="info">${Session.__user.zhiwei!'暂无'}</span></p>
							</div>
							
							<div class="infos-edit right">
								<#if !over?exists>
									<a href="${ctx}/app/overdraft/apply.jhtml" >申请白条</a>
								<#elseif over.status == '审核拒绝'/>
									<a href="${ctx}/app/overdraft/apply.jhtml" >重新申请</a>
								<#elseif over.status == '审核通过' && edu?exists/>
									<p>总额度：<span class="info">¥ ${edu.zongedu?string("#.00")}</span></p>
									<p>可用额度：<span class="info">¥ ${edu.keyongedu?string("#.00")}</span></p>
									<#if edu.zongedu gt edu.keyongedu>
									<a href="${ctx}/app/overdraft/pay.jhtml" class="text-center" >点  击  还  款</a>
									</#if>
								</#if>
							</div>
							<div class="status-infos">
								<#if !over?exists>
									<p class="status-info">当前状态：<span>未开通</span></p>
								<#elseif over.status != '审核通过'/>
									<p class="status-info">当前状态：<span>${over.status}</span></p>
								</#if>
							</div>
						</div>
					</div>
				</div>
				<div class="info-panel">
					<div class="panel-title">
						<h3 class="color">我的记录</h3>
					</div>
					<div class="panel-content" id="overdraft-list">
						<#if !over?exists || over.status != '审核通过'>
							<div class="overdraft-apply-info">
								<p>使用白条必须预先通过审核后，才可以使用，如果你想使用该功能，请先提交审核资料！</p>
							</div>
						<#else />
						<ul class="panel-menu clearfix">
							<li class="item active" data-panel="overdraft-bill-list"><a href="javascript:void(0)">我的白条</a></li>
							<li class="item" data-panel="overdraft-pay-list"><a href="javascript:void(0)">我的还款</a></li>
						</ul>
						<div class="buy-product-list" id="overdraft-bill-list" >
							<ul class="product-list">
								<li class="product-list-title clearfix">
									<span class="column no">订单编号</span>
									<span class="column money">金额</span>
									<span class="column time">使用时间</span>
								</li>
								<li class="product-empty">
									<div class="empty-div">
										<span class="fa fa-clipboard unselect"></span>
										<p>暂无记录</p>
									</div>
								</li>
							</ul>
							<@pagination.pagination page=page js=true />
						</div>
						<div class="buy-product-list" id="overdraft-pay-list" style="display: none;">
							<ul class="product-list">
								<li class="product-list-title clearfix">
									<span class="column no">还款编号</span>
									<span class="column money">金额</span>
									<span class="column time">使用时间</span>
								</li>
								<li class="product-empty">
									<div class="empty-div">
										<span class="fa fa-clipboard unselect"></span>
										<p>暂无记录</p>
									</div>
								</li>
							</ul>
							<@pagination.pagination page=page js=true />
						</div>
						</#if>
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
	
	var emptyInfo = '<li class="product-empty">\
		<div class="empty-div">\
			<span class="fa fa-clipboard unselect"></span>\
			<p>暂无记录</p>\
		</div>\
		</li>';
	
	function loadBillList(page) {
		$.fastAjax({
			url: '${ctx}/app/overdraft/bill.jo',
			data: { pageNum: page },
			success: function(ret) {
				if(ret.success) {
					if(ret.data && ret.data.data.length != 0) {
						$("#overdraft-bill-list .product-item").remove();
						$("#overdraft-bill-list .product-empty").remove();
						for(var i=0; i<ret.data.data.length; i++) {
							var each = ret.data.data[i];
							$("#overdraft-bill-list .product-list").append(
									'<li class="product-item clearfix">\
										<span class="column no">'+each.no+'</span>\
										<span class="column money">'+each.money+'</span>\
										<span class="column time">'+(new Date(each.createTime).format('yyyy-MM-dd HH:mm:ss'))+'</span>\
									</li>');
						}
						$("#overdraft-bill-list .page-btn").removeClass("disabled");
						if(page == 1) {
							$("#overdraft-bill-list .prev-btn").addClass("disabled");
						}
						if(ret.data.pages == page) {
							$("#overdraft-bill-list .next-btn").addClass("disabled");
						}
						$("#overdraft-bill-list .current-page").val(page);
						$("#overdraft-bill-list .page-info span.page-info").text("第" + page + "页／共" + ret.data.pages + "页");
					}else {
						$("#overdraft-bill-list .product-item").remove();
						$("#overdraft-bill-list .product-empty").remove();
						$("#overdraft-bill-list .product-list").append(emptyInfo);
						$("#overdraft-bill-list .page-btn").addClass("disabled");
						$("#overdraft-bill-list .current-page").val("1");
						$("#overdraft-bill-list .page-info span.page-info").text("");
					}
				}
			}
		});
	}
	
	function loadPayList(page) {
		$.fastAjax({
			url: '${ctx}/app/overdraft/payRecord.jo',
			data: { pageNum: page },
			success: function(ret) {
				if(ret.success) {
					if(ret.data && ret.data.data.length != 0) {
						$("#overdraft-pay-list .product-item").remove();
						$("#overdraft-pay-list .product-empty").remove();
						for(var i=0; i<ret.data.data.length; i++) {
							var each = ret.data.data[i];
							$("#overdraft-pay-list .product-list").append(
									'<li class="product-item clearfix">\
										<span class="column no">'+each.no+'</span>\
										<span class="column money">'+each.money+'</span>\
										<span class="column time">'+(new Date(each.createTime).format('yyyy-MM-dd HH:mm:ss'))+'</span>\
									</li>');
						}
						$("#overdraft-pay-list .page-btn").removeClass("disabled");
						if(page == 1) {
							$("#overdraft-pay-list .prev-btn").addClass("disabled");
						}
						if(ret.data.pages == page) {
							$("#overdraft-pay-list .next-btn").addClass("disabled");
						}
						$("#overdraft-pay-list .current-page").val(page);
						$("#overdraft-pay-list .page-info span.page-info").text("第" + page + "页／共" + ret.data.pages + "页");
					}else {
						$("#overdraft-pay-list .product-item").remove();
						$("#overdraft-pay-list .product-empty").remove();
						$("#overdraft-pay-list .product-list").append(emptyInfo);
						$("#overdraft-pay-list .page-btn").addClass("disabled");
						$("#overdraft-pay-list .current-page").val("1");
						$("#overdraft-pay-list .page-info span.page-info").text("");
					}
				}
			}
		});
	}
	
	$("#overdraft-bill-list .prev-btn").on("click", function() {
		if($(this).hasClass("disabled")) {
			return;
		}
		loadBillList($("#overdraft-bill-list .current-page").val() * 1 - 1);
	});
	$("#overdraft-bill-list .next-btn").on("click", function() {
		if($(this).hasClass("disabled")) {
			return;
		}
		loadBillList($("#overdraft-bill-list .current-page").val() * 1 + 1);
	});
	
	$("#overdraft-pay-list .prev-btn").on("click", function() {
		if($(this).hasClass("disabled")) {
			return;
		}
		loadPayList($("#overdraft-pay-list .current-page").val() * 1 - 1);
	});
	$("#overdraft-pay-list .next-btn").on("click", function() {
		if($(this).hasClass("disabled")) {
			return;
		}
		loadPayList($("#overdraft-pay-list .current-page").val() * 1 + 1);
	});
	
	loadBillList(1);
	
	loadPayList(1);
	
});
</script>
</body>
</html>