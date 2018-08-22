<form action="app/wallet/saveWithdraw" method="post" id="form">
	<div><span>提现金额</span><input type="text" name="money"/></div>
    <div><span>开户行名称</span><input type="text" name="name"/></div>
    <div><span>开户行账号</span><input type="text" name="account"/></div>
    <div><span>开户人</span><input type="text" name="person"/></div>
    <div><span>开户行地址</span><input type="text" name="address"/></div>
	<input id="submit" type="button"  提交/>
</form>

<script>
$(function(){
    $("#submit").on("click",function () {
			$("#form").submit();
    })

    $("#form").ajaxForm(function(data){
        debugger;
    });
})

</script>