<#import "../common/reportpagination.ftl" as pagination>
<div id="content" style="border:1px solid #000;height: 500px;">
    <table>
        <thead>
        <tr>
            <th>编号</th>
            <th>方式</th>
            <th>金额</th>
            <th>时间</th>
        </tr>
        </thead>
        <tbody><#if totalRecords?? &&(totalRecords>0)></#if>
    <#list chargeList as list>
    <tr>
        <td>${list.no}</td>
        <td>${list.method}</td>
        <td>${list.money}</td>
        <td>${list.createDate?number?number_to_datetime}</td>
    </tr>
    </#list>
        </tbody>
    </table>
    <div class="row">
    <#if totalRecords??>
                        <@pagination.pagination 2 page totalRecords>
                        </@pagination.pagination>
    </#if>
    </div>
</div>
