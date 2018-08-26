<#-- 分页控件-->
<#macro pagination _totalPageNum _currentPageNo _pageName _pageSize=10 _maxShowNums=5 _defaultPageParameter="pageNum" _styleClassName="digg">  
    <#-- 本段默认起始页 -->  
    <#local _pageStartNo = 1/>  
    <#-- 本段默认结束页 -->  
    <#local _pageEndNo = _maxShowNums/>  
    <#-- 分页的第一页 -->  
    <#local _firstPageNo = 1 />  
    <#-- 分页的最后一页 -->  
    <#local _lastPageNo = _totalPageNum />  
    <#-- 前一页号码 -->  
    <#local _prePageNo = _currentPageNo - 1 />  
    <#-- 后一页号码 -->  
    <#local _nextPageNo = _currentPageNo + 1 />  
      
    <#if _currentPageNo == _pageStartNo>  
        <#local _prePageNo = _pageStartNo />  
    </#if>  
      
    <#if _currentPageNo == _lastPageNo>  
        <#local _nextPageNo = _lastPageNo />  
    </#if>  
      
    <#if _currentPageNo gt _maxShowNums>  
        <#local _thisPageSegment = (_currentPageNo / _maxShowNums)?int + 1/>  
        <#assign _thisPageStartNo = _pageStartNo + (_thisPageSegment-1) * _maxShowNums/>  
        <#assign _thisPageEndNo = _pageEndNo + (_thisPageSegment-1) * _maxShowNums/>  
        <#if _thisPageEndNo gt _totalPageNum>  
            <#assign _thisPageEndNo = _totalPageNum>  
        </#if>  
    <#else>  
        <#assign _thisPageStartNo = _pageStartNo />  
        <#assign _thisPageEndNo = _pageEndNo />  
    </#if>  
      
    <#local _pages=[] />  
    <#if _totalPageNum != 0>  
        <#list _thisPageStartNo .. _thisPageEndNo as _index>  
            <#if _currentPageNo == _index >  
                <#local _pages = _pages + [{"pageNum" : _index ,"url" : _pageName+"?"+_defaultPageParameter+"="+_index , "current" : true}] />  
            <#else>  
                <#local _pages = _pages + [{"pageNum" : _index ,"url" : _pageName+"?"+_defaultPageParameter+"="+_index , "current" : false}] />  
            </#if>      
        </#list>  
    </#if>  
      
    <#local _htmlNoLinkLine>  
        <a href = "${_pageName}?${_defaultPageParameter}=${_firstPageNo}" target = "_self">首页</a>  
        <#if _currentPageNo != _pageStartNo>  
            <a href = "${_pageName}?${_defaultPageParameter}=${_prePageNo}" target = "_self">上一页</a>  
        </#if>  
        <#list _pages as page>  
            <#if page.current?default(false)>  
                <span class="current" >${page.pageNum}</span>  
            <#else>  
                <a href="${page.url}" mce_href="${page.url}" target="_self">${page.pageNum}</a>  
            </#if>  
        </#list>  
          
        <a href = "${_pageName}?${_defaultPageParameter}=${_nextPageNo}" target = "_self">下一页</a>  
        <a href = "${_pageName}?${_defaultPageParameter}=${_lastPageNo}" target = "_self">末页</a>  
        <span>共${_totalPageNum?default(0)}页</span>  
    </#local>  
      
    <div class="${_styleClassName}">  
        ${_htmlNoLinkLine}  
    </div>
</#macro>