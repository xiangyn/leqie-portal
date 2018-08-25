<div class="panel-content">
	<div class="buy-product-list">
		<div class="table">
			<table>
				<colgroup>
					<col style="width: 80px;">
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
							<div class="table-cell-wrapper">#</div></th>
						<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
							<div class="table-cell-wrapper">商品</div></th>
						<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
							<div class="table-cell-wrapper">数量</div></th>
						<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
							<div class="table-cell-wrapper">总价</div></th>
						<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
							<div class="table-cell-wrapper">合计</div></th>
						<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
							<div class="table-cell-wrapper">状态</div></th>
						<th rowspan="1" type="header" class="table-cell table-header-node" role="gridcell">
							<div class="table-cell-wrapper">操作</div>
						</th>
					</tr>
					<#if data?size==0>
					<tr>
						<td colspan="7">
							<p class="empty-info text-center">暂无订单记录！</p>
						</td>
					</tr>
					</#if>
				</thead>
			</table>
		</div>
		<#list data as model>
			<div class="table order" data-no="${model.no}">
			<table>
				<colgroup>
					<col style="width: 89px;">
					<col style="width: 200px;">
					<col style="width: 100px;">
					<col style="width: 120px;">
					<col style="width: 120px;">
					<col style="width: 150px;">
					<col style="width: 200px;">
				</colgroup>
				<thead class="table-header">
					<tr>
						<th colspan="7" type="header" class="table-cell table-header-node" role="gridcell">
							<div class="table-cell-wrapper">
								<span> 订单编号：${model.no}</span>
								<p class="right">下单日期：${model.createDate?substring(0, 10)}</p>
							</div></th>
					</tr>
				</thead>
				<#list model.detail as detail>
					<tr class="table-row first-none">
						<td type="body" class="table-cell" role="gridcell"></td>
						<td type="body" class="table-cell" role="gridcell"></td>
						<td type="body" class="table-cell" role="gridcell"></td>
						<td type="body" class="table-cell" role="gridcell"></td>
						<td type="body" class="table-cell" role="gridcell"></td>
						<td type="body" class="table-cell" role="gridcell"></td>
						<td type="body" class="table-cell" role="gridcell"></td>
						<td type="body" class="table-cell" role="gridcell"></td>
					</tr>
					<tr class="table-row" role="row">
						<td colspan="2" type="body" class="table-cell border-r-none" role="gridcell">
							<div class="table-cell-wrapper">
								${detail.zhonglei}
							</div></td>
						<td type="body" class="table-cell border-lr-none" role="gridcell">
							<div class="table-cell-wrapper">
								${detail.productNum}
							</div></td>
						<td type="body" class="table-cell border-l-none" role="gridcell">
							<div class="table-cell-wrapper" style="color:#999;">
								¥ ${detail.money}
							</div></td>
						<#if detail_index==0>
						<td rowspan="${model.detail?size}">
							<div class="table-cell-wrapper bold">
								¥ ${model.totalMoney}
							</div></td>
						</td>
						<td rowspan="${model.detail?size}">
							<div class="table-cell-wrapper">
								<#if model.status=='0'><p>待付款</p></#if>
								<#if model.status=='1'><p>待收货</p></#if>
								<#if model.status=='2'><p>完成交易</p></#if>
							</div></td>
						</td>
						<td rowspan="${model.detail?size}">
							<div class="table-cell-wrapper">
								<#if model.status=='0'>
									<p><a class="b-pay" href="#">点击支付</a> | <a class="b-cancel" href="#">取消订单</a></p>
								</#if>
								<#if model.status=='1'><a class="b-ok" href="#">确认收货</a></#if>
								<#if model.status=='2'><span class="color">交易成功</span></#if>
							</div></td>
						</td>
						</#if>
					</tr>
				</#list>
			</table>
			</div>
		</#list>
	</div>
</div>