<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/app.css" rel="stylesheet">
	<link href="${ctx}/static/css/iziToast.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/dropzone.css" rel="stylesheet">
	<title>乐切 - 官方网站</title>
</head>
<body>
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
						</div>
					</div>
				</div>
				<div class="info-panel">
					<div class="panel-title">
						<h3 class="color">申请白条</h3>
					</div>
					<div class="panel-content">
						<form class="form-content" id="_form">
							<div class="row">
								<div class="col quarter text-right">
									<label class="form-label required">营业执照</label>
								</div>
								<div class="col half">
									<input type="hidden" name="yingyezhizhao" />
									<div class="form-item dropzone" id="dropzone1">
										<div class="fallback">
											<input name="file" type="file" />
										</div>
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col quarter text-right">
									<label class="form-label required">法人身份证</label>
								</div>
								<div class="col half">
									<input type="hidden" name="farenshenfenzheng" />
									<div class="form-item dropzone" id="dropzone2">
										<div class="fallback">
											<input name="file" type="file" />
										</div>
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col quarter text-right">
									<label class="form-label required">银行流水</label>
								</div>
								<div class="col half">
									<input type="hidden" name="yinhangliushui" />
									<div class="form-item dropzone" id="dropzone3">
										<div class="fallback">
											<input name="file" type="file" />
										</div>
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col quarter text-right">
									<label class="form-label required">租赁合同</label>
								</div>
								<div class="col half">
									<input type="hidden" name="zulinhetong" />
									<div class="form-item dropzone" id="dropzone4">
										<div class="fallback">
											<input name="file" type="file" />
										</div>
									</div>
									<span class="form-item-msg"></span>
								</div>
							</div>
							<div class="row">
								<div class="col quarter text-right">
									&nbsp;
								</div>
								<div class="col half">
									<div class="form-item text-center">
										<button type="button" id="save-btn">提交申请</button>
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
<script type="text/javascript" src="${ctx}/static/js/dropzone.js"></script>
<script type="text/javascript" src="${ctx}/static/js/iziToast.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
<script type="text/javascript">
$(function() {
	
	new Dropzone("#dropzone1", { 
		url: "${ctx}/app/user/upload.jo",
		thumbnailWidth: 450,
		thumbnailHeight: 300,
		acceptedFiles: "image/*",
		maxFiles: 1
	}).on("success", function(file, ret) {
		if(ret.success) {
			$("input[name='yingyezhizhao']").val(ret.data);
		}else {
			$.info.error("上传图片失败，请稍后再试！")
		}
	});
	
	new Dropzone("#dropzone2", { 
		url: "${ctx}/app/user/upload.jo",
		thumbnailWidth: 450,
		thumbnailHeight: 300,
		acceptedFiles: "image/*",
		maxFiles: 1
	}).on("success", function(file, ret) {
		if(ret.success) {
			$("input[name='farenshenfenzheng']").val(ret.data);
		}else {
			$.info.error("上传图片失败，请稍后再试！")
		}
	});
	
	new Dropzone("#dropzone3", { 
		url: "${ctx}/app/user/upload.jo",
		thumbnailWidth: 450,
		thumbnailHeight: 300,
		acceptedFiles: "image/*",
		maxFiles: 1
	}).on("success", function(file, ret) {
		if(ret.success) {
			$("input[name='yinhangliushui']").val(ret.data);
		}else {
			$.info.error("上传图片失败，请稍后再试！")
		}
	});
	
	new Dropzone("#dropzone4", { 
		url: "${ctx}/app/user/upload.jo",
		thumbnailWidth: 450,
		thumbnailHeight: 300,
		acceptedFiles: "image/*",
		maxFiles: 1
	}).on("success", function(file, ret) {
		if(ret.success) {
			$("input[name='zulinhetong']").val(ret.data);
		}else {
			$.info.error("上传图片失败，请稍后再试！")
		}
	});
	
	
	$("#save-btn").on("click", function() {
		$("#_form").trigger("submit");
	});
	$("#_form").on("submit", function() {
		if(validate()) {
			$.fastAjax({
				url: "${ctx}/app/overdraft/apply.jo",
				data: $("#_form").serializeObject(),
				success: function(ret) {
					if(ret.success) {
						$.info.success('申请信息提交成功，请等待客服人员的审核!', function() {
							window.location.href = "${ctx}/app/overdraft.jhtml";
						});
					}else {
						$.info.error('申请信息提交失败，请刷新后再试!');
					}
				}
			});
		}
		return false;
	});
	
	function validate() {
		var ret = true;
		$("#_form input[type='hidden']").each(function() {
			var text = $(this).val();
			if(!text) {
				var $row = $(this).closest(".row");
				$row.find(".form-item-msg").text($row.find(".form-label").text() + "不能为空");
				ret = false;
			}
		});
		return ret;
	}
	
});
</script>
</body>
</html>