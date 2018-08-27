<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/iziToast.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/dropzone.css" rel="stylesheet">
	<link href="${ctx}/static/css/app.css" rel="stylesheet">
	<title>乐切 - 官方网站</title>
</head>
<body>
	<#include "/common/top.ftl" />
	<#assign navbarSelectedMenu='center' />
	<#assign logoInfo='企业认证' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right address">
				<div class="bread-crumb">
					<h3>企业认证</h3>
				</div>
				<div class="panel-body">
					<form class="form-content" id="_form">
						<div class="row">
							<div class="col quarter text-right">
								<label class="form-label required">公司名称</label>
							</div>
							<div class="col half">
								<div class="form-item">
									<input name="gongsimingchen" type="text" placeholder="请输入公司名称" required="required" value="${model.gongsimingchen!''}" />
								</div>
								<span class="form-item-msg"></span>
							</div>
						</div>
						<div class="row">
							<div class="col quarter text-right">
								<label class="form-label required">经营模式</label>
							</div>
							<div class="col half">
								<div class="form-item">
									<input name="jingyingmoshi" type="text" placeholder="请输入经营模式" required="required" value="${model.jingyingmoshi!''}" />
								</div>
								<span class="form-item-msg"></span>
							</div>
						</div>
						<div class="row">
							<div class="col quarter text-right">
								<label class="form-label required">公司负责人</label>
							</div>
							<div class="col half">
								<div class="form-item">
									<input name="gongsifuzeren" type="text" placeholder="请输入公司负责人" required="required" value="${model.gongsifuzeren!''}" />
								</div>
								<span class="form-item-msg"></span>
							</div>
						</div>
						<div class="row">
							<div class="col quarter text-right">
								<label class="form-label required">公开联系人</label>
							</div>
							<div class="col half">
								<div class="form-item">
									<input name="lianxiren" type="text" placeholder="请输入公开联系人" required="required" value="${model.lianxiren!''}" />
								</div>
								<span class="form-item-msg"></span>
							</div>
						</div>
						<div class="row">
							<div class="col quarter text-right">
								<label class="form-label required">公开联系人号码</label>
							</div>
							<div class="col half">
								<div class="form-item">
									<input name="lianxirendianhua" type="text" placeholder="请输入公开联系人号码" required="required" value="${model.lianxirendianhua!''}" />
								</div>
								<span class="form-item-msg"></span>
							</div>
						</div>
						<div class="row">
							<div class="col quarter text-right">
								<label class="form-label required">详细地址</label>
							</div>
							<div class="col half">
								<div class="form-item">
									<input name="xiangxidizhi" type="text" placeholder="请输入详细地址" required="required" value="${model.xiangxidizhi!''}" />
								</div>
								<span class="form-item-msg"></span>
							</div>
						</div>
						<div class="row">
							<div class="col quarter text-right">
								<label class="form-label required">公司介绍</label>
							</div>
							<div class="col half">
								<div class="form-item">
									<textarea name="gongsijieshao" placeholder="请输入公司介绍" required="required">${model.gongsijieshao!''}</textarea>
								</div>
								<span class="form-item-msg"></span>
							</div>
						</div>
						<div class="row">
							<div class="col quarter text-right">
								<label class="form-label required">公司负责人身份证</label>
							</div>
							<div class="col half">
								<input type="hidden" name="fuzerenshenfenzheng" value="${model.fuzerenshenfenzheng!''}" />
								<div class="form-item dropzone" id="dropzone1">
									<div class="fallback">
										<input name="file" type="file" />
									</div>
								</div>
								<span class="form-item-msg">
									<#if model.fuzerenshenfenzheng?exists>不上传则默认原先照片</#if>
								</span>
							</div>
						</div>
						<div class="row">
							<div class="col quarter text-right">
								<label class="form-label required">公司营业执照</label>
							</div>
							<div class="col half">
								<input type="hidden" name="yingyezhizhao" value="${model.yingyezhizhao!''}" />
								<div class="form-item dropzone" id="dropzone2">
									<div class="fallback">
										<input name="file" type="file" />
									</div>
								</div>
								<span class="form-item-msg">
									<#if model.yingyezhizhao?exists>不上传则默认原先照片</#if>
								</span>
							</div>
						</div>
						<div class="row">
							<div class="col quarter text-right">
								&nbsp;
							</div>
							<div class="col half">
								<div class="form-item text-center">
									<button type="button" id="save-btn">保 存</button>
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
			$("input[name='fuzerenshenfenzheng']").val(ret.data);
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
			$("input[name='yingyezhizhao']").val(ret.data);
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
				url: "${ctx}/app/enterprise/auth.jo",
				data: $("#_form").serializeObject(),
				success: function(ret) {
					if(ret.success) {
						$.info.success('填写认证信息成功，请等待客服人员的审核!', function() {
							window.location.href = "${ctx}/app/enterprise.jhtml";
						});
					}else {
						$.info.error('填写认证信息失败，请刷新后再试!');
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
			var phone = $("input[name='lianxirendianhua']").val();
			if(!/^1\d{10}$/.test(phone)) {
				$("input[name='lianxirendianhua']").focus().closest(".row").find(".form-item-msg").text("手机号码不正确");
				return false;
			}
			$(".form-item-msg").text("");
		}
		return ret;
	}
	
});
</script>
</body>
</html>