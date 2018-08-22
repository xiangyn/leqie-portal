<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/iziToast.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/app.css" rel="stylesheet">
	<link href="${ctx}/static/css/cityLayout.css" rel="stylesheet">
	<title>乐切 - 官方网站</title>
</head>
<body>
	<#include "/common/top.ftl" />
	<#assign navbarSelectedMenu='center' />
	<#assign logoInfo='收货地址' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right address">
				<div class="bread-crumb">
					<h3>编辑收货地址</h3>
				</div>
				<div class="form-content">
					<form id="_form">
						<input type="hidden" name="id" value="${data.id}"/>
						<div class="form-content">
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">收件人</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="name" type="text" placeholder="请输入收件人" required="required" value="${data.name}"/>
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">联系方式</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="phone" type="text" placeholder="请输入联系方式" required="required" value="${data.phone}"/>
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">地址信息</label>
								</div>
								<div class="col half">
									<input type="hidden" name="sheng" value="${data.sheng}"/>
									<input type="hidden" name="shi" value="${data.shi}"/>
									<input type="hidden" name="qu" value="${data.qu}"/>
									<div class="form-item">
										<input id="address" name="address" type="text" placeholder="请选择地址信息" required="required" readonly="readonly" value="${data.sheng}-${data.shi}-${data.qu}" />
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">详细地址</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="detailAddress" type="text" placeholder="请输入详细地址" required="required" value="${data.detailAddress}"/>
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label">是否默认</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input type="checkbox" name="moren" <#if data.moren=='1'>checked</#if> >
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									&nbsp;
								</div>
								<div class="col half">
									<div class="form-item text-center">
										<button type="button" id="save-btn">保 存</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<#include "/common/footer.ftl" />
<#include "/common/foot.ftl" />
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
<script type="text/javascript" src="${ctx}/static/js/iziToast.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/cityselect.js"></script>
<script type="text/javascript">
$(function() {
	init_city_select($("#address"));
	
	$("#save-btn").on("click", function() {
		$("#_form").trigger("submit");
	});
	$("#_form").on("submit", function() {
		if(validate()) {
			var address = $("#address").val().split('-');
			$("input[name='sheng']", this).val(address[0]);
			$("input[name='shi']", this).val(address[1]);
			$("input[name='qu']", this).val(address[2]);
			$.ajax({
				url: "${ctx}/app/recvAddress/update.jo",
				type: 'POST',
				data: $("#_form").serializeObject(),
				dataType:'json',
				success: function(ret) {
					if(ret.success) {
						iziToast.success({
					        message: '修改地址成功!',
					        position: 'topCenter',
					        transitionIn: 'bounceInLeft',
					        onClose: success
					    });
					}else {
						iziToast.error({
					        message: '修改地址失败，请刷新后再试!',
					        position: 'topCenter',
					        transitionIn: 'bounceInLeft'
					    });
					}
				}
			});
		}
		return false;
	});
	
	function validate() {
		var ret = true;
		$("#_form input").each(function() {
			if(this.type !== 'hidden') {
				var text = $(this).val();
				if(!text) {
					var $row = $(this).closest(".row");
					$row.find(".form-item-msg").text($row.find(".form-label").text() + "不能为空");
					ret = false;
				}
			}
		});
		if(ret) {
			var phone = $("input[name='phone']").val();
			if(!/^1\d{10}$/.test(phone)) {
				$("input[name='phone']").closest(".row").find(".form-item-msg").text("手机号码不正确");
				return false;
			}
			$(".form-item-msg").text("");
		}
		return ret;
	}
	
	function success() {
		if(window.opener) {
			opener.$(opener.document).trigger('loadAddress');
			setTimeout(function() {
				window.close();
			}, 100);
		}else {
			window.location.href = "${ctx}/app/recvAddress.jhtml";
		}
	}
});
</script>
</body>
</html>