<#import "../common/reportpagination.ftl" as pagination>
<div id="content" class="table-responsive">
    <table class="table card-table table-vcenter text-nowrap">
        <thead>
        <tr>
            <th>还款编号</th>
            <th>金额</th>
            <th>时间</th>
        </tr>
        </thead>
        <tbody><#if totalRecords?? &&(totalRecords>0)></#if>
    <#list repaymentList as list>
    <tr>
        <td>${list.no}</td>
        <td>${list.money}</td>
        <td>${list.createDate?number?number_to_datetime}</td>
    </tr>
    </#list>
        </tbody>
    </table>
    <div class="row" style="display:block">
    <#if totalRecords??>
                        <@pagination.pagination 10 page totalRecords>
                        </@pagination.pagination>
    </#if>
    </div>
</div>
