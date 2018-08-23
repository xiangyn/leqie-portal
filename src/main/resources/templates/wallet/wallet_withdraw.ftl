<form id="form1" name="form1" >
	<div class="form-group"><label class="form-label">提现金额</label><input class="form-control" type="text" name="money" id="money"/></div>
    <div class="form-group"><label class="form-label">开户行名称</label><input class="form-control" type="text" name="name" id="name"/></div>
    <div class="form-group"><label class="form-label">开户行账号</label><input class="form-control" type="text" name="account" id="account"/></div>
    <div class="form-group"><label class="form-label">开户人</label><input class="form-control" type="text" name="person" id="person"/></div>
    <div class="form-group"><label class="form-label">开户行地址</label><input class="form-control" type="text" name="address" id="address"/></div>
</form>
<input id="myButton" type="button" class="btn btn-primary ml-auto" style="float:right" value="提交"/>
<script>
$(function(){
    var myData = {
        "money":$("#money").val(),
        "name":$("#name").val(),
        "account":$("#account").val(),
        "person":$("#person").val(),
        "address":$("#address").val()
    }

    var ajaxFormOption = {
        type: "post",  //提交方式
        dataType: "json", //数据类型
        //data: myData,//自定义数据参数，视情况添加
        url: "withdraw", //请求url
        success: function (data) { //提交成功的回调函数
            alert(data.msg);
            document.getElementById("form1").reset();
        }
    };

    $("#myButton").on("click",function () {
        $form("#form1").ajaxSubmit(ajaxFormOption);
    })
})

</script>