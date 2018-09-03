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
			<#include "/product/product-menu.ftl"/>
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
					<#if page.count==0>
						<p class="empty-info text-center">暂无记录！</p>
					<#else/>
						<#import "/common/page.ftl" as pagination />
						<@pagination.pagination page=page url=pageUrl />
						<ul class="product-list">
							<li class="product-list-title clearfix">
								<span class="column xinghao">型号</span>
								<span class="column gongyi">工艺标准</span>
								<span class="column kucun">库存</span>
								<span class="column shijian">时间</span>
								<span class="column caozuo">操作</span>
							</li>
							<#list page.data as each>
							<li class="product-item clearfix">
								<div class="column xinghao">
									<p class="import">${each.zhonglei} ${each.canzhaozhishu}</p>
									<p>规格：${each.guige}</p>
									<p>类别：${each.leibie}</p>
								</div>
								<span class="column gongyi">
									<p class="import m-t">${each.gongyibiaozhun}</p>
								</span>
								<span class="column kucun">
									<p class="import m-t">${each.kucun}</p>
								</span>
								<span class="column shijian">
									<p class="m-t">${each.createDate?number_to_datetime?string("yyyy-MM-dd")}</p>
								</span>
								<span class="column caozuo">
									<p class="m-t">
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