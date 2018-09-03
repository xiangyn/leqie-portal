<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/index.css" rel="stylesheet">
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/iziToast.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/dropzone.css" rel="stylesheet">
	<link href="${ctx}/static/css/app.css" rel="stylesheet">
	<title>乐切 - 官方网站</title>
</head>
<body>
	<#include "/common/top.ftl" />
	<#assign navbarSelectedMenu='fastOrder' />
	<#assign logoInfo='快速下单' />
	<#include "/common/navbar.ftl" />
	<div class="fast-order">
		<div class="container">
			<div class="row">
				<div class="quarter">&nbsp;</div>
				<div class="half">
					<form id="_form">
						<div class="form-item dropzone" id="dropzone">
							<div class="fallback">
								<input name="file" type="file" />
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
	
	new Dropzone("#dropzone", { 
		url: "${ctx}/app/user/upload.jo",
		acceptedFiles: ".jpg,.gif,.png,.xls,.xlsx",
		dictDefaultMessage: '点击选择文件快速下单<br/>目前只支持图片或Excel',
		maxFiles: 1
	}).on("success", function(file, ret) {
		if(ret.success) {
			$.fastAjax({
				url: "${ctx}/app/order/fast.jo",
				data: { file: ret.data },
				success: function(ret) {
					$.info.success("上传成功，待客服审核通过后，将会将商品加入到购物车中！", function() {
						window.location.href = "${ctx}/app/order/index.jhtml";
					});
				}
			})
		}else {
			$.info.error("上传图片失败，请稍后再试！")
		}
	});
	
});
</script>
</body>
</html>