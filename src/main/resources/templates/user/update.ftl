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
	<#assign logoInfo='账户管理' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right user-manage">
				<div class="user-panel">
					<div class="panel-title">
						<h3 class="color">编辑基本信息</h3>
					</div>
					<div class="panel-content">
					<form id="_form">
						<div class="form-content">
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label">账号</label>
								</div>
								<div class="col half">
									<div class="form-item"><span>${Session.__user.phone}</span></div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">姓名</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="name" type="text" placeholder="请输入您的姓名" required="required" value="${user.name}" />
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">公司</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="company" type="text" placeholder="请输入您的公司" required="required" value="${user.company}" />
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">职位</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="zhiwei" type="text" placeholder="请输入您的职位" required="required" value="${user.zhiwei}" />
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
				url: "${ctx}/app/user/update.jo",
				data: $("#_form").serializeObject(),
				success: function(ret) {
					if(ret.success) {
						$.info.success('编辑个人信息成功!', function() {
							window.location.href = "${ctx}/app/user.jhtml";
						});
					}else {
						$.info.error('编辑个人信息失败，请刷新后再试!');
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
		return ret;
	}
	
});
</script>
</body>
</html>