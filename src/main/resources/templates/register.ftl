<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/login.css" rel="stylesheet">
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/iziToast.min.css" rel="stylesheet">
	<title>乐切官方网站 - 快速注册</title>
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
						<h1>快速注册</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="register-body">
		<div class="container clearfix">
			<div class="left register-content">
				<h1 class="register-title">填写注册信息</h1>
				<form class="register-form">
					<div class="row">
						<div class="col eighth text-right">
							<label class="form-label required">手机号码</label>
						</div>
						<div class="col half">
							<div class="form-item">
								<input type="text" name="phone" placeholder="请输入手机号码" required="required" />
							</div>
						</div>
						<div class="col quarter">
							<span class="form-item-msg" id="phone-msg"></span>
						</div>
					</div>
					<div class="row">
						<div class="col eighth text-right">
							<label class="form-label required">验证码</label>
						</div>
						<div class="col quarter">
							<div class="form-item">
								<input type="text" name="number" placeholder="请输入验证码" required="required" />
							</div>
						</div>
						<div class="col quarter">
							<div class="form-item text-right">
								<button type="button" class="btn" id="sms-button">获取验证码<span id="sms-interval"></span></button>
							</div>
						</div>
						<div class="col quarter">
							<span class="form-item-msg" id="number-msg"></span>
						</div>
					</div>
					<div class="row">
						<div class="col eighth text-right">
							<label class="form-label required">密码</label>
						</div>
						<div class="col half">
							<div class="form-item">
								<input type="password" name="password1" placeholder="请输入密码" required="required" />
							</div>
						</div>
						<div class="col quarter">
							<span class="form-item-msg" id="password1-msg"></span>
						</div>
					</div>
					<div class="row">
						<div class="col eighth text-right">
							<label class="form-label required">密码确认</label>
						</div>
						<div class="col half">
							<div class="form-item">
								<input type="password" name="password2" placeholder="请再次输入密码" required="required" />
							</div>
						</div>
						<div class="col quarter">
							<span class="form-item-msg" id="password2-msg"></span>
						</div>
					</div>
					<div class="row">
						<div class="col eighth text-right">
							<label class="form-label">推荐人号码</label>
						</div>
						<div class="col half">
							<div class="form-item">
								<input type="text" name="promotePhone" placeholder="请再次推荐人号码（没有则不填）" />
							</div>
						</div>
						<div class="col quarter">
							<span class="form-item-msg" id="promotePhone-msg"></span>
						</div>
					</div>
					<div class="row">
						<div class="form-item text-center">
							<button type="submit" class="btn"> 用 户 注 册 </button>
						</div>
					</div>
				</form>
			</div>
			<div class="left register-right">
				<a class="btn btn-large color bd-color" href="${ctx}/app/login.jhtml">已有账号，点击登录 <span class="fa fa-arrow-circle-o-right"></span></a>
			</div>
		</div>
		<#include "/common/footer.ftl" />
	</div>
<#include "/common/foot.ftl" />
<script type="text/javascript" src="${ctx}/static/js/iziToast.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
<script type="text/javascript">
$(function() {
	
	var phoneRegex = /^1\d{10}$/;
	var passRegex = /^[a-zA-Z]+(\d*)(\s*?)(\d*)$/
	
	$("form input[name='phone']").on("change", function() {
		var phone = $(this).val();
		if(!phone) {
			$("#phone-msg").text("手机号码不能为空");
		}else if(!phoneRegex.test(phone)) {
			$("#phone-msg").text("手机号码不正确");
		}else {
			$("#phone-msg").text("");
		}
	});
	
	$("form input[name='password1']").on("change", function() {
		var password1 = $(this).val();
		if(!password1) {
			$("#password1-msg").text("密码不能为空");
		}else if(password1.length < 6) {
			$("#password1-msg").text("密码长度不能小于6位");
		}else if(!passRegex.test(password1)){
			$("#password1-msg").text("密码必须以字母开头");
		}else {
			$("#password1-msg").text("");
		}
	});
	
	$("form input[name='password2']").on("change", function() {
		var password2 = $(this).val();
		if(!password2) {
			$("#password2-msg").text("密码不能为空");
		}else if(password2.length < 6) {
			$("#password2-msg").text("密码长度不能小于6位");
		}else if(password2 !== $("form input[name='password1']").val()) {
			$("#password2-msg").text("两次输入的密码不一致");
		}else {
			$("#password2-msg").text("");
		}
	});
	
	$("form input[name='promotePhone']").on("change", function() {
		var phone = $(this).val();
		if(phone && !phoneRegex.test(phone)) {
			$("#promotePhone-msg").text("手机号码不正确");
		}else {
			$("#promotePhone-msg").text("");
		}
	});
	
	$("#sms-button").on("click", function() {
		$("form input[name='phone']").trigger("change");
		if($("#phone-msg").text() === "") {
			if(!$(this).hasClass("disabled")) {
				$.ajax({
					url: "${ctx}/app/sms.jo",
					data: {
						phone: $("form input[name='phone']").val()
					},
					dataType: 'json',
					type: 'POST',
					success: function(ret) {
						if(ret.success) {
							$("#sms-button").addClass("disabled");
							$("#sms-interval").text("(60)");
							startSmsInterval();
							iziToast.success({
						        title: '获取验证码成功',
						        position: 'topCenter',
						        transitionIn: 'bounceInLeft',
						    });
						}else {
							$("#number-msg").text("获取验证码失败");
						}
					},
					error: function() {
						iziToast.error({
					        message: '服务器繁忙，请稍后再试!',
					        position: 'topCenter',
					        transitionIn: 'bounceInLeft',
					    });
					}
				});
			}
		}
	});
	
	function valiate() {
		$("form input").trigger("change");
		var number = $("form input[name='number']").val();
		if(number == null) {
			$("#number-msg").text("验证码不能为空");
			return false;
		}else if(number.length != 6) {
			$("#number-msg").text("验证码不正确");
			return false;
		}else {
			$("#number-msg").text("");
		}
		
		var valid = true;
		$("form .form-item-msg").each(function() {
			valid = valid && $(this).text() == "";
		});
		return valid;
	}
	
	$("form").on('submit', function() {
		if(valiate()){
			$.ajax({
				url: "${ctx}/app/register.jo",
				data: {
					phone: $("form input[name='phone']").val(),
					number: $("form input[name='number']").val(),
					password1: $("form input[name='password1']").val(),
					password2: $("form input[name='password2']").val(),
					promotePhone: $("form input[name='promotePhone']").val()
				},
				dataType: 'json',
				type: 'POST',
				success: function(ret) {
					if(ret.success) {
						iziToast.success({
					        message: '注册成功!',
					        position: 'topCenter',
					        transitionIn: 'bounceInLeft',
					        onClose: function() {
					        	window.location.href = "${ctx}/app/login.jhtml";
					        }
					    });
					}else {
						iziToast.error({
					        message: '注册失败，请检查你的验证码是否正确,或你已注册!',
					        position: 'topCenter',
					        transitionIn: 'bounceInLeft',
					    });
					}
				},
				error: function() {
					iziToast.error({
				        message: '服务器繁忙，请稍后再试!',
				        position: 'topCenter',
				        transitionIn: 'bounceInLeft',
				    });
				}
			});
		}
		return false;
	});
	
	function startSmsInterval() {
		var interval = setInterval(function() {
			var match = $("#sms-interval").text().match(/\((\d+)\)/);
			if(match == null || match[1] == '1') {
				$("#sms-button").removeClass("disabled");
				$("#sms-interval").text("");
				clearInterval(interval);
			}else {
				$("#sms-interval").text("(" + (match[1] * 1 - 1) + ")");
			}
		}, 1000);
	}
	
});
</script>
</body>
</html>