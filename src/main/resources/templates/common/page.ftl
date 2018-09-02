
<#macro pagination page url="" js=false>
	<#-- 分页的第一页 -->  
    <#local _firstPageNo = 1 />  
    <#-- 分页的最后一页 -->  
    <#local _lastPageNo = page.pages />
	<#-- 前一页号码 -->  
	<#local _prePageNo = page.pageNum - 1 />  
	<#-- 后一页号码 -->  
	<#local _nextPageNo = page.pageNum + 1 />
	
	<#if js>
		<#local _prevHref = "javascript:void(0)" />
		<#local _nextHref = "javascript:void(0)" />
	<#else />
		<#if page.pageNum == 1>
			<#local _prevHref = "javascript:void(0)" />
		<#else />
			<#if url?index_of('?') != -1>
				<#local _prevHref = "${url}&pageNum=${_prePageNo}" />
			<#else />
				<#local _prevHref = "${url}?pageNum=${_prePageNo}" />
			</#if>
		</#if>
		<#if page.pageNum == page.pages>
			<#local _nextHref = "javascript:void(0)" />
		<#else />
			<#if url?index_of('?') != -1>
				<#local _nextHref = "${url}&pageNum=${_nextPageNo}" />
			<#else />
				<#local _nextHref = "${url}?pageNum=${_nextPageNo}" />
			</#if>
		</#if>
	</#if>
	<div class="row leqie-page clearfix">
		<div class="page-info left">
			<#if page.pages != 0><span class="page-info">共 ${page.pages!'0'} 页</span></#if>
			<input type="hidden" id="prevPage" value="${_prePageNo}" />
			<input type="hidden" id="nextPage" value="${_nextPageNo}" />
		</div>
		<div class="page-buttons right">
			<a class="prev-btn <#if page.pageNum == 1>disabled</#if>" href="${_prevHref}">上一页</a>
			<a class="next-btn <#if page.pageNum == page.pages>disabled</#if>" href="${_nextHref}">下一页</a>
		</div>
	</div>
</#macro>