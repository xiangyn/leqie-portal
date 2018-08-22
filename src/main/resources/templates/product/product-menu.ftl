<div class="product-title">
	<div class="product-types">
		<h2>所有产品</h2>
		<ul class="product-type-list">
			<li class="product-type-item <#if _uri?starts_with('/app/product-zheng')>active</#if>">
				<a href="${ctx}/app/product-zheng.jhtml" >
					<span class="product-type-icon"><img src="${ctx}/static/images/product-1-icon.png" alt="整板" /></span>
					<span class="product-type-name">整 板</span>
				</a>
			</li>
			<li class="product-type-item <#if _uri=='/app/product-lingqie.jhtml'>active</#if>">
				<a href="${ctx}/app/product-lingqie.jhtml" >
					<span class="product-type-icon"><img src="${ctx}/static/images/product-2-icon.png" alt="零切"/></span>
					<span class="product-type-name">零 切</span>
				</a>
			</li>
			<li class="product-type-item <#if _uri=='/app/product-yuanbang.jhtml'>active</#if>">
				<a href="${ctx}/app/product-yuanbang.jhtml" >
					<span class="product-type-icon"><img src="${ctx}/static/images/product-3-icon.png" alt="圆棒"/></span>
					<span class="product-type-name">圆 棒</span>
				</a>
			</li>
			<li class="product-type-item <#if _uri=='/app/product-xingcai.jhtml'>active</#if>">
				<a href="${ctx}/app/product-xingcai.jhtml" >
					<span class="product-type-icon"><img src="${ctx}/static/images/product-4-icon.png" alt="型材"/></span>
					<span class="product-type-name">型 材</span>
				</a>
			</li>
			<li class="product-type-item <#if _uri=='/app/product-guancai.jhtml'>active</#if>">
				<a href="${ctx}/app/product-guancai.jhtml" >
					<span class="product-type-icon"><img src="${ctx}/static/images/product-5-icon.png" alt="管材"/></span>
					<span class="product-type-name">管 材</span>
				</a>
			</li>
		</ul>
	</div>
</div>