<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/login.css" rel="stylesheet">
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<title>乐切官方网站 - 用户登录</title>
</head>
<body>
	<div class="navbar">
		<div class="container">
			<div class="row">
				<div class="col left">
					<a class="logo" href="${ctx}/index.jhtml">
						<img class="logo-image" src="${ctx}/static/images/logo.png" alt="乐切官方网站LOGO" />
					</a>
					<div class="logo-title right">
						<h1>欢迎登录</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="login-body">
		<div class="container">
			<div class="login-container">
				<div class="row">
					<div class="col left">
						<div class="login-image">
							<img src="${ctx}/static/images/login-image.jpg" alt="用户登录" />
						</div>
					</div>
					<div class="col right">
						<div class="login-content">
							<h1 class="login-title">会员登录</h1>
							<form class="login-form">
								<div class="form-item form-icon-item">
									<span class="form-icon fa fa-user color"></span>
									<input type="text" name="phone" placeholder="用户名/手机号码" required="required" />
									<span class="form-item-msg" id="username-msg"></span>
								</div>
								<div class="form-item form-icon-item">
									<span class="form-icon fa fa-lock color"></span>
									<input type="password" name="password" placeholder="请输入密码" required="required"/>
									<span class="form-item-msg" id="password-msg"></span>
								</div>
								<div class="form-item">
									<button type="submit" class="btn btn-block">登 录</button>
								</div>
								<div class="form-item">
									<div class="row">
										<div class="col left">
											没有账号？<a href="${ctx}/app/register.jhtml" class="color">立即注册！</a>
										</div>
										<div class="col right">
											<a href="${ctx}/app/forget.jhtml" class="color">忘记密码？</a>
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
	</div>
<#include "/common/foot.ftl" />
<script type="text/javascript">
$(function() {
	
	$(".login-form").on("submit", function(){ 
		$.ajax({
			url: "${ctx}/app/login.jo",
			type: "POST",
			data: {
				phone: $("input[name=phone]", this).val(),
				password: $("input[name=password]", this).val()
			},
			dataType: "json",
			beforeSend: function() {
				$(".form-item-msg", this).text("");
			},
			success: function(ret) {
				if(ret.success) {
					window.location.href = decodeURIComponent("${redirectUrl}");
				}else {
					$("#password-msg").text("用户名或密码错误！");
				}
			},
			error: function() {
				$("#username-msg").text("服务器繁忙，请稍后再试！");
			}
		});
		return false;
	});
	
});
</script>
</body>
</html>