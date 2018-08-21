<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/product.css" rel="stylesheet">
	<title>乐切 - 官方网站</title>
</head>
<body>
	<#include "/common/top.ftl" />
	<#assign logoInfo='整板' />
	<#assign navbarSelectedMenu='' />
	<#include "/common/navbar.ftl" />
	<div class="product">
		<div class="container clearfix">
			<div class="product-title">
				<div class="product-types">
					<h2>所有产品</h2>
					<ul class="product-type-list">
						<li class="product-type-item active">
							<a href="${ctx}/app/product-zheng.jhtml" >
								<span class="product-type-icon"><img src="${ctx}/static/images/product-1-icon.png" alt="整板" /></span>
								<span class="product-type-name">整 板</span>
							</a>
						</li>
						<li class="product-type-item">
							<a href="${ctx}/app/product-lingqie.jhtml" >
								<span class="product-type-icon"><img src="${ctx}/static/images/product-2-icon.png" alt="零切"/></span>
								<span class="product-type-name">零 切</span>
							</a>
						</li>
						<li class="product-type-item">
							<a href="${ctx}/app/product-yuanbang.jhtml" >
								<span class="product-type-icon"><img src="${ctx}/static/images/product-3-icon.png" alt="圆棒"/></span>
								<span class="product-type-name">圆 棒</span>
							</a>
						</li>
						<li class="product-type-item">
							<a href="${ctx}/app/product-xingcai.jhtml" >
								<span class="product-type-icon"><img src="${ctx}/static/images/product-4-icon.png" alt="型材"/></span>
								<span class="product-type-name">型 材</span>
							</a>
						</li>
						<li class="product-type-item">
							<a href="${ctx}/app/product-guancai.jhtml" >
								<span class="product-type-icon"><img src="${ctx}/static/images/product-5-icon.png" alt="管材"/></span>
								<span class="product-type-name">管 材</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="product-content">
				<h1 class="color">整版产品详情</h1>
				<div class="product-search">
					<form class="form-inline">
						<div class="form-item">
							<label class="form-label">型号：</label>
							<input class="form-input" type="text" name="xinghao" placeholder="请输入型号" value="${search.xinghao!}"/>
						</div>
						<div class="form-item">
							<label class="form-label">厚度：</label>
							<input class="form-input" type="text" name="houdu" placeholder="请输入厚度" value="${search.houdu!}"/>
						</div>
						<div class="form-item right">
							<button class="form-button" type="submit">筛 选</button>
						</div>
					</form>
				</div>
				<div class="product-display" id="product-zheng-display">
					<#if data?size==0>
						<p class="empty-info text-center">暂无记录！</p>
					<#else/>
						<ul class="product-list">
							<li class="product-list-title clearfix">
								<span class="colomn xinghao">型号</span>
								<span class="colomn gongyi">工艺标准</span>
								<span class="colomn kucun">库存</span>
								<span class="colomn shijian">时间</span>
								<span class="colomn caozuo">操作</span>
							</li>
							<#list data as each>
							<li class="product-item clearfix">
								<div class="colomn xinghao">
									<p class="import">${each.zhonglei} ${each.canzhaozhishu}</p>
									<p>规格：${each.guige}</p>
									<p>类别：${each.leibie}</p>
								</div>
								<span class="colomn gongyi">
									<p class="import m-t">${each.gongyibiaozhun}</p>
								</span>
								<span class="colomn kucun">
									<p class="import m-t">${each.kucun}</p>
								</span>
								<span class="colomn shijian">
									<p class="m-t">${each.createDate?number_to_datetime?string("yyyy-MM-dd")}</p>
								</span>
								<span class="colomn caozuo">
									<p class="m-t">
										<!-- <span class="btn shopcar" data-id="${each.id}">加入购物车</span> -->
										<a class="btn order color" href="${ctx}/app/product-zheng-${each.id?string('0')}.jhtml">查看详情</a>
									</p>
								</span>
							</li>
							</#list>
						</ul>
					</#if>
				</div>
			</div>
		</div>
	</div>
	<#include "/common/footer.ftl" />
<#include "/common/foot.ftl" />
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
</body>
</html>