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
	<#assign navbarSelectedMenu='center' />
	<#assign logoInfo='整板' />
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
				<div class="product-display" id="product-zheng-display">
					<ul class="product-list">
						<li class="product-list-title clearfix">
							<span class="colomn detail text-center">产品详情</span>
						</li>
						<li class="product-item clearfix">
							<div class="colomn key">
								<p class="import">规格</p>
							</div>
							<div class="colomn value">
								<p>${data.guige}</p>
							</div>
							<div class="colomn key">
								<p class="import">工艺标准</p>
							</div>
							<div class="colomn value">
								<p>${data.gongyibiaozhun}</p>
							</div>
						</li>
						<li class="product-item clearfix">
							<div class="colomn key">
								<p class="import">类别</p>
							</div>
							<div class="colomn value">
								<p>${data.leibie!}</p>
							</div>
							<div class="colomn key">
								<p class="import">状态</p>
							</div>
							<div class="colomn value">
								<p>${data.zhuangtai!}</p>
							</div>
						</li>
						<li class="product-item clearfix">
							<div class="colomn key">
								<p class="import">加纸</p>
							</div>
							<div class="colomn value">
								<p>${data.jiazhi!}</p>
							</div>
							<div class="colomn key">
								<p class="import">覆膜</p>
							</div>
							<div class="colomn value">
								<p>${data.fumo!}</p>
							</div>
						</li>
						<li class="product-item clearfix">
							<div class="colomn key">
								<p class="import">包装</p>
							</div>
							<div class="colomn value">
								<p>${data.baozhuang!}</p>
							</div>
							<div class="colomn key">
								<p class="import">重量</p>
							</div>
							<div class="colomn value">
								<p>${data.zhongliang!}</p>
							</div>
						</li>
						<li class="product-item clearfix">
							<div class="colomn key">
								<p class="import">补贴额</p>
							</div>
							<div class="colomn value">
								<p>${data.butiee!0}</p>
							</div>
							<div class="colomn key">
								<p class="import">加工费</p>
							</div>
							<div class="colomn value">
								<p>${data.jiagongfei!}</p>
							</div>
						</li>
						<li class="product-item clearfix">
							<div class="colomn key">
								<p class="import">剩余件树</p>
							</div>
							<div class="colomn value">
								<p>${data.kucun}</p>
							</div>
							<div class="colomn key">
								<p class="import">参照指数</p>
							</div>
							<div class="colomn value">
								<p>${data.canzhaozhishu}</p>
							</div>
						</li>
					</ul>
					<div class="product-order">
						<div class="row">
							<div class="left">
								<div class="order-price">
									<p class="formula">计算公式：<span class="order-price-formula">加载中...</span></p>
									<span class="order-price-value">¥ 0.00</span>
								</div>
							</div>
							<div class="right clearfix">
								<div class="order-number">
									<span class="order-number-title">购买数量：</span>
									<input type="text" value="1" />
								</div>
								<div class="order-button">
									<button class="button">购 买</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<#include "/common/footer.ftl" />
<#include "/common/foot.ftl" />
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
</body>
</html>