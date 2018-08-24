<#import "../common/reportpagination.ftl" as pagination>
<div id="content" class="table-responsive">
    <table class="table card-table table-vcenter text-nowrap">
        <thead>
        <tr>
            <th>申请金额</th>
            <th>申请时间</th>
            <th>处理时间</th>
            <th>提现状态</th>
        </tr>
        </thead>
        <tbody><#if totalRecords?? &&(totalRecords>0)></#if>
    <#list withdrawList as list>
    <tr>
        <td>${list.money}</td>
        <td>${list.createDate?number?number_to_datetime}</td>
        <td><#if list.withDrawTime?exists>${list.createDate?number?number_to_datetime}</#if></td>
        <td>${list.status}</td>
    </tr>
    </#list>
        </tbody>
    </table>
    <div class="row">
    <#if totalRecords??>
                        <@pagination.pagination 10 page totalRecords>
                        </@pagination.pagination>
    </#if>
    </div>
</div>
