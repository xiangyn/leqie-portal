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
						<h3 class="color">修改密码</h3>
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
									<label class="form-label required">旧密码</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="oldPassword" type="password" placeholder="请输入您的旧密码" required="required" />
									</div>
									<span class="form-item-msg" id="password-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">新密码</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="newPassword1" type="password" placeholder="请输入您的新密码" required="required" />
									</div>
									<span class="form-item-msg" id="password1-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col eighth text-right">
									<label class="form-label required">密码确认</label>
								</div>
								<div class="col half">
									<div class="form-item">
										<input name="newPassword2" type="password" placeholder="请再次输入您的新密码" required="required" />
									</div>
									<span class="form-item-msg" id="password2-msg"></span>
								</div>
							</div>
							
							<div class="row">
								<div class="col eighth text-right">
									&nbsp;
								</div>
								<div class="col half">
									<div class="form-item text-center">
										<button type="button" id="save-btn">确认修改</button>
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
				url: "${ctx}/app/user/updatePwd.jo",
				data: $("#_form").serializeObject(),
				success: function(ret) {
					if(ret.success) {
						$.info.success('修改密码成功!', function() {
							window.location.href = "${ctx}/app/user.jhtml";
						});
					}else {
						$.info.error('修改密码失败，请刷新后再试!');
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
			var valid = true;
			$("form .form-item-msg").each(function() {
				valid = valid && $(this).text() == "";
			});
			return valid;
		}
		return false;
	}
	
	var passRegex = /^[a-zA-Z]+(\d*)(\s*?)(\d*)$/
	
	$("form input[name='oldPassword']").on("change", function() {
		var password1 = $(this).val();
		if(!password1) {
			$("#password-msg").text("密码不能为空");
		}else if(password1.length < 6) {
			$("#password-msg").text("密码长度不能小于6位");
		}else {
			$("#password-msg").text("");
		}
	});
	
	$("form input[name='newPassword1']").on("change", function() {
		var password1 = $(this).val();
		if(!password1) {
			$("#password1-msg").text("密码不能为空");
		}else if(password1.length < 6) {
			$("#password1-msg").text("密码长度不能小于6位");
		}else {
			$("#password1-msg").text("");
		}
	});
	
	$("form input[name='newPassword2']").on("change", function() {
		var password2 = $(this).val();
		if(!password2) {
			$("#password2-msg").text("密码不能为空");
		}else if(password2.length < 6) {
			$("#password2-msg").text("密码长度不能小于6位");
		}else if(password2 !== $("form input[name='newPassword1']").val()) {
			$("#password2-msg").text("两次输入的密码不一致");
		}else {
			$("#password2-msg").text("");
		}
	});
	
});
</script>
</body>
</html>