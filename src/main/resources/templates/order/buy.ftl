<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/app.css" rel="stylesheet">
	<link href="${ctx}/static/css/shopcar.css" rel="stylesheet">
	<title>乐切 - 官方网站</title>
</head>
<body>
	<#include "/common/top.ftl" />
	<#assign logoInfo='选择收货地址' />
	<#assign navbarSelectedMenu='' />
	<#include "/common/navbar.ftl" />
	<div class="address-select">
		<div class="container">
			<div class="address-list">
				<p class="empty-info">加载中...</p>
			</div>
		</div>
	</div>
	<div class="product-list">
		<div class="container">
			
		</div>
	</div>
	<#include "/common/footer.ftl" />
<#include "/common/foot.ftl" />
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
<script type="text/javascript">
$(function() {
	$.ajax({
		url: "${ctx}/app/loadAddresses.jo",
		type: 'post',
		dataType: 'json',
		success: function(ret) {
			if(ret.success) {
				
			}
		}
	});
});
</script>
</body>
</html>