<div class="table">
	<table>
		<colgroup>
			<col style="width: 200px;">
			<col style="width: 150px;">
			<col style="width: 150px;">
			<col style="width: 200px;">
		</colgroup>
		<thead class="table-header">
			<tr>
				<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
					<div class="table-cell-wrapper">充值编号</div></th>
				<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
					<div class="table-cell-wrapper">充值方式</div></th>
				<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
					<div class="table-cell-wrapper">充值金额</div></th>
				<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
					<div class="table-cell-wrapper">充值时间</div></th>
			</tr>
		</thead>
		<tbody class="table-body">
			<#if chargeList?size==0>
				<tr class="table-row first" role="row">
					<td colspan="7" class="table-cell first" role="gridcell">
						<p class="table-cell-wrapper text-center">暂无充值记录！</p>
					</td>
				</tr>
			<#else/>
			<#list chargeList as each>
				<tr class="table-row first" role="row">
					<td type="body" class="table-cell first" role="gridcell">
						<div class="table-cell-wrapper">${each.no}</div></td>
					<td type="body" class="table-cell first" role="gridcell">
						<div class="table-cell-wrapper">${each.method}</div></td>
					<td type="body" class="table-cell" role="gridcell">
						<div class="table-cell-wrapper">${each.money}</div></td>
					<td type="body" class="table-cell" role="gridcell">
						<div class="table-cell-wrapper">${each.createDate?number?number_to_datetime?string('yyyy-MM-dd HH:mm:ss')}</div></td>
				</tr>
			</#list>
			</#if>
		</tbody>
	</table>
	<!-- 
	<#import "../common/reportpagination.ftl" as pagination>
	<#if totalRecords??>
		<@pagination.pagination 10 page totalRecords></@pagination.pagination>
    </#if>
     -->
</div>