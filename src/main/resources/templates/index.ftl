<!DOCTYPE html>
<html>
<head>
	<#include "/common/head.ftl" />
	<link href="${ctx}/static/css/index.css" rel="stylesheet">
	<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
	<link href="${ctx}/static/css/ft-carousel.css" rel="stylesheet">
	<title>乐切 - 官方网站</title>
</head>
<body>
	<#include "/common/top.ftl" />
	<#assign navbarSelectedMenu='home' />
	<#include "/common/navbar.ftl" />
	<div class="banner">
		<div class="container">
			<div class="carousel-wrapper">
				<div class="ft-carousel">
					<ul class="carousel-inner example">
						<li class="carousel-item"><img src="${ctx}/static/images/banner1.png" /></li>
						<li class="carousel-item"><img src="${ctx}/static/images/banner2.png" /></li>
						<li class="carousel-item"><img src="${ctx}/static/images/banner3.png" /></li>
						<li class="carousel-item"><img src="${ctx}/static/images/banner4.png" /></li>
					</ul>
				</div>
			</div>
			<div class="product-menu">
				<ul class="product-list clearfix">
					<li class="product-item">
						<a href="${ctx}/app/product-zheng.jhtml" >
							<span class="product-icon"><img src="${ctx}/static/images/product-1-icon.png" alt="整板"/></span>
							<p class="product-name">整 板</p>
						</a>
					</li>
					<li class="product-item">
						<a href="${ctx}/app/product-lingqie.jhtml" >
							<span class="product-icon"><img src="${ctx}/static/images/product-2-icon.png" alt="零切"/></span>
							<p class="product-name">零 切</p>
						</a>
					</li>
					<li class="product-item">
						<a href="${ctx}/app/product-yuanbang.jhtml" >
							<span class="product-icon"><img src="${ctx}/static/images/product-3-icon.png" alt="圆棒"/></span>
							<p class="product-name">圆 棒</p>
						</a>
					</li>
					<li class="product-item">
						<a href="${ctx}/app/product-xingcai.jhtml" >
							<span class="product-icon"><img src="${ctx}/static/images/product-4-icon.png" alt="型材"/></span>
							<p class="product-name">型 材</p>
						</a>
					</li>
					<li class="product-item">
						<a href="${ctx}/app/product-guancai.jhtml" >
							<span class="product-icon"><img src="${ctx}/static/images/product-5-icon.png" alt="管材" /></span>
							<p class="product-name">管 材</p>
						</a>
					</li>
					<li class="product-item">
						<a href="${ctx}/app/fastOrder.jhtml" >
							<span class="product-icon"><img src="${ctx}/static/images/product-6-icon.png" alt="快速下单" /></span>
							<p class="product-name">快速下单</p>
						</a>
					</li>
				</div>
			</div>
			<!-- 
			<div class="login-body">
				<div class="login-icon text-center">
					<img src="${ctx}/images/login-icon.png" />
				</div>
				<h2 class="login-title">乐切，满足你的一切铝材需求</h2>
				<div class="login-buttons">
					<a href="${ctx}/app/login.jhtml" class="solid bg-color">登 录</a>
					<a href="${ctx}/app/register.jhtml" class="bd-color color">立即注册</a>
				</div>
				<div class="shop-process clearfix text-center">
					<div class="quarter process">
						<div class="process-icon">
							<span class="fa fa-shopping-bag"></span>
						</div>
						<p class="process-name">下单</p>
					</div>
					<div class="process-sepa">
						<span class="fa fa-angle-right"></span>
					</div>
					<div class="quarter process">
						<div class="process-icon">
							<span class="fa fa-credit-card-alt"></span>
						</div>
						<p class="process-name">支付</p>
					</div>
					<div class="process-sepa">
						<span class="fa fa-angle-right"></span>
					</div>
					<div class="quarter process">
						<div class="process-icon">
							<span class="fa fa-car"></span>
						</div>
						<p class="process-name">收货</p>
					</div>
				</div>
				<p class="process-info">快捷方便的交易方式</p>
			</div>
			 -->
		</div>
	</div>
	<div class="chart-plate">
		<div class="container">
			<div class="row">
				<!-- <div class="col product-menu"></div> -->
				<div class="col chart">
					<p class="chart-title"><span class="fa fa-area-chart"></span> A00铝价格走向趋势图</p>
					<div class="picture" id="chart">
						<p class="picture-loading">正在加载中....</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="price-plate">
		<div class="container">
			<div class="row">
				<#list prices as price>
				<div class="col quarter">
					<div class="panel">
						<div class="panel-body">
							<div class="panel-title">
								<h2>
									<span class="title-day"> ${price.riqi?number_to_datetime?string("dd")}日 </span>/<span class="title-month"> ${price.riqi?number_to_datetime?string("M")}月 </span>
									<span class="title-info">${price.source} / ${price.name}</span>
								</h2>
							</div>
							<div class="panel-content clearfix">
								<div class="row ${(price.priceChange?number gte 0)?string('change-up', 'change-down')}">
									<div class="left">
										<p class="content-icon">均价</p>
									</div>
									<div class="right">
										<div class="content-value">
											${price.averagePrice}
											<p class="change-value"><span>${(price.priceChange?number gte 0)?string('+', '')}${price.priceChange}</span></p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="left">
										<p class="content-icon">区间</p>
									</div>
									<div class="right">
										<p class="content-value">${price.priceRange}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</#list>
			</div>
		</div>
	</div>
	<#include "/common/footer.ftl" />
<#include "/common/foot.ftl" />
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
<script type="text/javascript" src="${ctx}/static/js/ft-carousel.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/chart.bundle.js"></script>
<script type="text/javascript">
$(function() {
	
	$(".ft-carousel").FtCarousel();
	
	$.ajax({
		url: "${ctx}/chartData.jo",
		type: 'POST',
		dataType: "json",
		success: function(ret) {
			if(ret.success) {
				displayChart(ret.data);
			}else {
				$(".chart .picture-loading").text("加载失败！").addClass("error");
			}
		},
		error: function() {
			$(".chart .picture-loading").text("加载失败！").addClass("error");
		}
	});
	
	window.chartColors = {
		red: 'rgb(255, 99, 132)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)'
	};
	
	function displayChart(data) {
		var date = [];
		var chartData = [];
		$.each(data, function() {
			date.push(new Date(this.riqi).format("yyyy-MM-dd"));
			chartData.push(this.averagePrice * 1);
		});
		var config = {
			type: 'line',
			data: {
				labels: date,
				datasets: [{
					label: 'A00铝价格',
					backgroundColor: window.chartColors.red,
					borderColor: window.chartColors.red,
					data: chartData,
					fill: false
				}]
			},
			options: {
				responsive: true,
				tooltips: {
					mode: 'index',
					intersect: false,
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				scales: {
					xAxes: [{
						display: true
					}],
					yAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: '元／吨'
						}
					}]
				}
			}
		};
		$("#chart").html('<canvas id="canvas" width="1040" height="300"></canvas>')
		var ctx = document.getElementById('canvas').getContext('2d');
		window.chartline = new Chart(ctx, config);
	}
});
</script>
</body>
</html>