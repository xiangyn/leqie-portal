<div class="panel-content">
	<div class="buy-product-list">
		<#if data.count != 0>
		<#import "/common/page.ftl" as pagination />
		<@pagination.pagination page=data />
		</#if>
		<div class="table">
			<table>
				<colgroup>
					<col style="width: 200px;">
					<col style="width: 100px;">
					<col style="width: 120px;">
					<col style="width: 120px;">
					<col style="width: 150px;">
					<col style="width: 200px;">
				</colgroup>
				<thead class="table-header">
					<tr>
						<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
							<div class="table-cell-wrapper">订单编号</div></th>
						<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
							<div class="table-cell-wrapper">发票抬头</div></th>
						<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
							<div class="table-cell-wrapper">金额</div></th>
						<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
							<div class="table-cell-wrapper">物流费</div></th>
						<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
							<div class="table-cell-wrapper">开票时间</div></th>
						<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
							<div class="table-cell-wrapper">状态</div>
						</th>
					</tr>
					<#if data.count == 0>
					<tr>
						<td colspan="7">
							<p class="empty-info text-center">暂无发票记录！</p>
						</td>
					</tr>
					<#else />
					<#list data.data as each>
					<tr>
						<td type="body" class="table-cell" role="gridcell">${each.orderIds}</td>
						<td type="body" class="table-cell" role="gridcell">${each.kaipiaotaitou}</td>
						<td type="body" class="table-cell" role="gridcell">¥ ${each.money}</td>
						<td type="body" class="table-cell" role="gridcell">${each.wuliufei}</td>
						<td type="body" class="table-cell" role="gridcell">${each.kaipiaoTime?number?number_to_datetime?string('yyyy-MM-dd HH:mm:ss')}</td>
						<td type="body" class="table-cell" role="gridcell">${each.kaipiaoStatus}</td>
					</tr>
					</#list>
					</#if>
				</thead>
			</table>
		</div>
	</div>
</div>