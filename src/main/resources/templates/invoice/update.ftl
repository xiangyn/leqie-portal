<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/iziToast.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/app.css" rel="stylesheet">
	<title>乐切 - 官方网站</title>
</head>
<body>
	<#include "/common/top.ftl" />
	<#assign navbarSelectedMenu='center' />
	<#assign logoInfo='发票信息' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right address">
				<div class="bread-crumb">
					<h3>编辑发票信息</h3>
				</div>
				<div class="form-content">
					<form id="_form">
						<input type="hidden" name="fapiaoId" value="${model.id}" />
						<div class="form-content">
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">对公账户</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="duigongzhanghu" type="text" placeholder="请输入对公账户" required="required" value="${model.duigongzhanghu}" />
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label">公司注册地址</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="gongsizhucedizhi" type="text" placeholder="请输入公司注册地址" value="${model.duigongzhanghu!''}" />
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label">公司注册座机号</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="gongsizhucezuojihao" type="text" placeholder="请选择公司注册座机号" value="${model.gongsizhucezuojihao!''}" />
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">开票抬头</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="kaipiaotaitou" type="text" placeholder="请输入开票抬头" required="required" value="${model.kaipiaotaitou}" />
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">税号</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="shuihao" type="text" placeholder="请输入税号" required="required" value="${model.shuihao}" />
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">收件人</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="shoujianren" type="text" placeholder="请输入收件人" required="required" value="${model.shoujianren}" />
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">收件地址</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="shoujiandizhi" type="text" placeholder="请输入收件地址" required="required" value="${model.shoujiandizhi}" />
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">手机号</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="shoujihao" type="text" placeholder="请输入手机号" required="required" value="${model.shoujihao}" />
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">营业网址</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="yingyewangzhi" type="text" placeholder="请输入营业网址" required="required" value="${model.yingyewangzhi}" />
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">账户开户行</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="zhanghukaihuhang" type="text" placeholder="请输入账户开户行" required="required" value="${model.zhanghukaihuhang}" />
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
<script type="text/javascript" src="${ctx}/static/js/iziToast.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
<script type="text/javascript">
$(function() {
	$("#save-btn").on("click", function() {
		$("#_form").trigger("submit");
	});
	$("#_form").on("submit", function() {
		if(validate()) {
			$.fastAjax({
				url: "${ctx}/app/invoice/update.jo",
				data: $("#_form").serializeObject(),
				success: function(ret) {
					if(ret.success) {
						$.info.success('编辑发票信息成功!', success);
					}else {
						$.info.error('编辑发票信息失败，请刷新后再试!');
					}
				}
			});
		}
		return false;
	});
	
	function validate() {
		var ret = true;
		$("#_form input[required='required']").each(function() {
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
			var phone = $("input[name='shoujihao']").val();
			if(!/^1\d{10}$/.test(phone)) {
				$("input[name='shoujihao']").closest(".row").find(".form-item-msg").text("手机号码不正确");
				return false;
			}
			$(".form-item-msg").text("");
		}
		return ret;
	}
	
	function success() {
		if(window.opener) {
			opener.$(opener.document).trigger('loadInvoice');
			setTimeout(function() {
				window.close();
			}, 100);
		}else {
			window.location.href = "${ctx}/app/invoice.jhtml";
		}
	}
});
</script>
</body>
</html>