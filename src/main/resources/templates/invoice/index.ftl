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
	<#assign logoInfo='我的发票' />
	<#include "/common/navbar.ftl" />
	<div class="app">
		<div class="container clearfix">
			<#include "/common/app-menu.ftl" />
			<div class="col-right address">
				<div class="bread-crumb">
					<h3>发票信息</h3>
				</div>
				<div class="row clearfix buttons">
					<div class="left">
						<a href="${ctx}/app/invoice/record-wait.jhtml" class="button"><span class="fa fa-list"></span> 开票记录</a>
					</div>
					<div class="right">
						<a href="${ctx}/app/invoice/new.jhtml" class="button"><span class="fa fa-plus"></span> 新增</a>
					</div>
				</div>
				<div class="table">
					<table>
						<colgroup>
							<col style="width: 150px;">
							<col style="width: 150px;">
							<col style="width: 150px;">
							<col style="width: 110px;">
							<col style="width: 150px;">
							<col style="width: 110px;">
						</colgroup>
						<thead class="table-header">
							<tr>
								<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
									<div class="table-cell-wrapper">对公账户</div></th>
								<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
									<div class="table-cell-wrapper">开票抬头</div></th>
								<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
									<div class="table-cell-wrapper">税号</div></th>
								<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
									<div class="table-cell-wrapper">手机号</div></th>
								<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
									<div class="table-cell-wrapper">账号开户行</div></th>
								<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
									<div class="table-cell-wrapper">操作</div>
								</th>
							</tr>
						</thead>
						<tbody class="table-body">
						<#if data?size==0>
							<tr class="table-row first" role="row">
								<td colspan="7" class="table-cell first" role="gridcell">
									<p class="table-cell-wrapper text-center">暂无发票信息！</p>
								</td>
							</tr>
						<#else/>
							<#list data as each>
							<tr class="table-row first" role="row">
								<td type="body" class="table-cell first" role="gridcell">
									<div class="table-cell-wrapper">${each.duigongzhanghu!'-'}</div></td>
								<td type="body" class="table-cell first" role="gridcell">
									<div class="table-cell-wrapper">${each.kaipiaotaitou}</div></td>
								<td type="body" class="table-cell" role="gridcell">
									<div class="table-cell-wrapper">${each.shuihao}</div></td>
								<td type="body" class="table-cell" role="gridcell">
									<div class="table-cell-wrapper">${each.shoujihao!'-'}</div></td>
								<td type="body" class="table-cell" role="gridcell">
									<div class="table-cell-wrapper">${each.zhanghukaihuhang!'-'}</div></td>
								<td type="body" class="table-cell last" role="gridcell">
									<div class="table-cell-wrapper">
										<div class="tAction">
											<a class="t-change" href="${ctx}/app/invoice/update.jhtml?id=${each.id}" target="_self">修改</a>
											<span class="t-line">|</span>
											<span class="t-delete" data-id="${each.id}">删除</span>
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
		confirm("你确认删除该条发票信息吗？") && function() {
			$.fastAjax({
				url: '${ctx}/app/invoice/delete.jo',
				data: { id: id },
				success: function(ret) {
					if(ret.success) {
						window.location.href = "${ctx}/app/invoice.jhtml?_"+(+new Date());
					}else {
						$.info.error('删除失败，请刷新后再试!');
					}
				}
			});
		}();
	});
	
});
</script>
</body>
</html>