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
	<#assign logoInfo='收货地址' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right address">
				<div class="bread-crumb">
					<h3>收货地址</h3>
				</div>
				<div class="row clearfix buttons">
					<div class="left">
						<a href="${ctx}/app/recvAddress/new.jhtml" class="button"><span class="fa fa-plus"></span> 新增</a>
					</div>
				</div>
				<div class="table">
					<table>
						<colgroup>
							<col style="width: 100px;">
							<col style="width: 150px;">
							<col style="width: 250px;">
							<col style="width: 150px;">
							<col style="width: 110px;">
							<col style="width: 110px;">
						</colgroup>
						<thead class="table-header">
							<tr>
								<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
									<div class="table-cell-wrapper">收货人</div></th>
								<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
									<div class="table-cell-wrapper">所在地区</div></th>
								<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
									<div class="table-cell-wrapper">详细地址</div></th>
								<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
									<div class="table-cell-wrapper">电话/手机</div></th>
								<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
									<div class="table-cell-wrapper">操作</div></th>
								<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
									<div class="table-cell-wrapper">备注</div>
								</th>
							</tr>
						</thead>
						<tbody class="table-body">
						<#if data?size==0>
							<tr class="table-row first" role="row">
								<td colspan="7" class="table-cell first" role="gridcell">
									<p class="table-cell-wrapper text-center">暂无收货地址！</p>
								</td>
							</tr>
						<#else/>
							<#list data as each>
							<tr class="table-row first" role="row">
								<td type="body" class="table-cell first" role="gridcell">
									<div class="table-cell-wrapper">${each.name}</div></td>
								<td type="body" class="table-cell first" role="gridcell">
									<div class="table-cell-wrapper">${each.sheng} ${each.shi} ${each.qu}</div></td>
								<td type="body" class="table-cell" role="gridcell">
									<div class="table-cell-wrapper">${each.detailAddress}</div></td>
								<td type="body" class="table-cell" role="gridcell">
									<div class="table-cell-wrapper">
										<span>${each.phone}<br></span>
									</div></td>
								<td type="body" class="table-cell" role="gridcell">
									<div class="table-cell-wrapper">
										<div class="tAction">
											<a class="t-change" href="${ctx}/app/recvAddress/update.jhtml?id=${each.id}" target="_self">修改</a>
											<span class="t-line">|</span>
											<span class="t-delete" data-id="${each.id}">删除</span>
										</div>
									</div></td>
								<td type="body" class="table-cell last" role="gridcell">
									<div class="table-cell-wrapper">
										<div>
											<span class="t-default">
											<#if each.moren=='1'>默认地址<#else/>-</#if>
											</span>
										</div>
									</div></td>
							</tr>
							</#list>
						</#if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<#include "/common/footer.ftl" />
<#include "/common/foot.ftl" />
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
<script type="text/javascript" src="${ctx}/static/js/iziToast.min.js"></script>
<script type="text/javascript">
$(function() {
	
	$(".table .t-delete").on("click", function() {
		var id = $(this).data("id");
		confirm("你确认删除该条收货地址吗？") && function() {
			$.ajax({
				url: '${ctx}/app/recvAddress/delete.jo',
				type: "post",
				data: {
					id: id
				},
				dataType: "json",
				success: function(ret) {
					if(ret.success) {
						window.location.href = "${ctx}/app/recvAddress.jhtml?_"+(+new Date());
					}else {
						iziToast.error({
					        message: '删除地址失败，请刷新后再试!',
					        position: 'topCenter',
					        transitionIn: 'bounceInLeft'
					    });
					}
				}
			});
		}();
	});
	
});
</script>
</body>
</html>