<div class="table">
	<table>
		<colgroup>
			<col style="width: 200px;">
			<col style="width: 150px;">
			<col style="width: 150px;">
			<col style="width: 150px;">
			<col style="width: 200px;">
		</colgroup>
		<thead class="table-header">
			<tr>
				<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
					<div class="table-cell-wrapper">申请金额</div></th>
				<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
					<div class="table-cell-wrapper">申请时间</div></th>
				<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
					<div class="table-cell-wrapper">处理时间</div></th>
				<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
					<div class="table-cell-wrapper">状态</div></th>
			</tr>
		</thead>
		<tbody class="table-body">
			<#if withdrawList?size==0>
				<tr class="table-row first" role="row">
					<td colspan="7" class="table-cell first" role="gridcell">
						<p class="table-cell-wrapper text-center">暂无消费记录！</p>
					</td>
				</tr>
			<#else/>
			<#list withdrawList as each>
				<tr class="table-row first" role="row">
					<td type="body" class="table-cell first" role="gridcell">
						<div class="table-cell-wrapper">${each.money}</div></td>
					<td type="body" class="table-cell" role="gridcell">
						<div class="table-cell-wrapper">${each.createDate?number?number_to_datetime?string('yyyy-MM-dd HH:mm:ss')}</div></td>
					<td type="body" class="table-cell" role="gridcell">
						<div class="table-cell-wrapper">
							<#if each.withDrawTime?exists>
								${each.withDrawTime?number?number_to_datetime?string('yyyy-MM-dd HH:mm:ss')}
							<#else />
								-
							</#if>
						</div></td>
					<td type="body" class="table-cell first" role="gridcell">
						<div class="table-cell-wrapper"><span style="color:red">${each.status}</span></div></td>
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