<form id="form1" name="form1">
	<div><span>提现金额</span><input type="text" name="money" id="money"/></div>
    <div><span>开户行名称</span><input type="text" name="name" id="name"/></div>
    <div><span>开户行账号</span><input type="text" name="account" id="account"/></div>
    <div><span>开户人</span><input type="text" name="person" id="person"/></div>
    <div><span>开户行地址</span><input type="text" name="address" id="address"/></div>
</form>
<input id="myButton" type="button" value="提交"/>
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