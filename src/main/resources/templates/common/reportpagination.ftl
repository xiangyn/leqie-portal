<#-- page is start from 1. -->
<#macro pagination pageSize page totalRecords>
	<#local totalPageCount=0 maxDisplayPageCount=6 halfMaxDisplayPageCount=( maxDisplayPageCount / 2 ) ? floor >
	
	<#local totalPageCount = ( totalRecords / pageSize ) ? floor >
	<#if (totalRecords % pageSize > 0) >
		<#local totalPageCount = totalPageCount + 1 >
	</#if>
	
	<#if (page < 1) >
		<#local page = 1 >
	<#elseif ( page > totalPageCount ) >
		<#local page = totalPageCount >
	</#if>
	<#if ( totalPageCount > 1 ) >
		<ul class="mypagination custom-modal">
		  <li><span class="txt" id="pagenationpagetext">Page</span></li>
		  <li> <label for="inputPagination" class="sr-only">Page</label><input type=text id="inputPagination" value="${(page)?c}"/></li>
		  <li><span class="txt" id="pagenationtotalpagecount">of ${totalPageCount?c}</span></li>
		   <li><span class="txt"  style="display:none" id="pagenationtotalcount" >Total ${totalRecords!'0'}</span></li>
		  <li class="<#if page == 1>disabled</#if>"><a id="prepagelink"  p="${(page-1)?c}"><img src="/static/images/prev.png" alt='上一页'/></a></li>
		  <li class="<#if page == totalPageCount>disabled</#if>"><a id="nextpagelink"  p="${(page+1)?c}"><img src="/static/images/next.png" alt='下一页'/></a></li>
		</ul>
		<input type=hidden id="totalPage" value="${totalPageCount?c}" />
	</#if>
<style>
	.mypagination-container {
		margin: 0; 
	}

	.mypagination {
	  list-style: none;
	  display: inline-block;
	  padding: 0;
	}
	.mypagination li {
	  display: inline;
	  text-align: center;
	}
	.mypagination a {
	  float: left;
	  display: block;
	  font-size: 12px;
	  text-decoration: none;
	  padding: 5px 12px;
	  color: #fff;
	  margin-left: -1px;
	  border: 1px solid;
	  line-height: 1.5;
	}
	.mypagination a.active {
	  cursor: default;
	}
	.mypagination a:active {
	  outline: none;
	}

	.custom-modal a {
	  border-color: #ffffff;
	  color: #424242;
	  background: #EEF0F2;
	}
	.custom-modal a:hover {
	  background: #eee;
	}
	.custom-modal a.active, .custom-modal a:active {
	  border-color: #EEF0F2;
	  background: #EEF0F2;
	  color: #424242;	  
	  cursor: default;
	}

	.custom-modal .txt{
	  float: left;
	  display: block;
	  font-size: 12px;
	  text-decoration: none;
	  padding: 6px 12px;
	  margin-left: -1px;
	  line-height: 1.5;
	}

	.custom-modal input {
	  float: left;
	  display: block;
	  font-size: 12px;
	  text-decoration: none;
	  padding: 5px 0px 5px 1px;
	  color: #fff;
	  margin-left: -1px;
	  width : 30px;
	  border: 1px solid transparent;
	  line-height: 1.5;
	  text-align: center;
	}		

	.custom-modal input {
	  border-color: #ddd;		  
	  color: #000000;
	 
	}
	
	.disabled > a,
	.disabled > a:hover,
	.disabled > a:focus,
	.disabled > span {
	  color: #999999;
	  cursor: default;
	  background-color: #fff;
	  border-color: #fff;	
	}
</style>

<script>
	$(function () {
        $('#nextpagelink').on('click', function(){
            var li = $(this).parent();
            if (li.hasClass('disabled') || li.hasClass('active')) {
                return false;
            }
            var page = parseInt($(this).attr('p'), 10);
            //putSearchKey();
            window.location.href = changeURLArg( window.location.href,"p",$(this).attr('p'));
            return false;
        })

        $('#prepagelink').on('click', function(){
            var li = $(this).parent();
            if (li.hasClass('disabled') || li.hasClass('active')) {
                return false;
            }
            var page = parseInt($(this).attr('p'), 10);
            //putSearchKey();
            window.location.href = changeURLArg( window.location.href,"p",$(this).attr('p'));
            return false;
        })

    })

    function changeURLArg(url,arg,arg_val){
        var pattern=arg+'=([^&]*)';
        var replaceText=arg+'='+arg_val;
        if(url.match(pattern)){
            var tmp='/('+ arg+'=)([^&]*)/gi';
            tmp=url.replace(eval(tmp),replaceText);
            return tmp;
        }else{
            if(url.match('[\?]')){
                return url+'&'+replaceText;
            }else{
                return url+'?'+replaceText;
            }
        }
        return url+'\n'+arg+'\n'+arg_val;
    }

</script>
</#macro>