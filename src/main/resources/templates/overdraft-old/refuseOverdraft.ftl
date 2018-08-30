申请白条
<form action='' enctype="multipart/form-data" method="post" name="form1" id="form1">
    <input type="file" id="upload1" onchange="uploadPic()"  name="pic" style="display: none;">
    <input type="file" id="upload2" onchange="uploadPic()"  name="pic" style="display: none;">
    <input type="file" id="upload3" onchange="uploadPic()"  name="pic" style="display: none;">
    <input type="file" id="upload4" onchange="uploadPic()"  name="pic" style="display: none;">





    <label>营业执照上传</label>
    <div id="div1" style="background-color: #000000;height: 60px;display:block;overflow:hidden;width:60px;">
        <img width="100" height="100" id="img1"/>
    </div>

    <input name="imgUrl1" id="path1"/>


    <label>法人身份证</label>
    <div id="div2" style="background-color: #000000;height: 60px;display:block;overflow:hidden;width:60px;">
        <img width="100" height="100" id="img2"/>
    </div>
    <input  name="imgUrl2" id="path2"/>


    <label>银行流水</label>
    <div id="div3" style="background-color: #000000;height: 60px;display:block;overflow:hidden;width:60px;">
        <img width="100" height="100" id="img3"/>
    </div>
    <input  name="imgUrl3" id="path3"/>

    <label>租赁合同/厂房产权证</label>
    <div id="div4" style="background-color: #000000;height: 60px;display:block;overflow:hidden;width:60px;">
        <img width="100" height="100" id="img4"/>
    </div>
    <input  name="imgUrl4" id="path4"/>
</form>
<input id="myButton" type="button" class="btn btn-primary ml-auto" style="float:right" value="提交"/>
<script>
    var picOrder =1;
    $(function () {
            $("#div1").click(function () {
                picOrder =1;
                $("#upload1").trigger('click');
            })
        $("#div2").click(function () {
            picOrder =2;
            $("#upload2").trigger('click');
        })
        $("#div3").click(function () {
            picOrder =3;
            $("#upload3").trigger('click');
        })
        $("#div4").click(function () {
            picOrder =4;
            $("#upload4").trigger('click');
        })

        var ajaxFormOption = {
            type: "post",  //提交方式
            dataType: "json", //数据类型
            url: "overdraft", //请求url
            success: function (data) { //提交成功的回调函数
                alert(data.msg);
                document.getElementById("form1").reset();
                windows.location.href ="app/overdraft";
            }
        };

        $("#myButton").on("click",function () {
            $form("#form1").ajaxSubmit(ajaxFormOption);
        })
    })
    function uploadPic(){
        var options={
            url:'overdraft/upload',
            dataType:'json',
            Type:'post',
            success:function(data){
                if(picOrder == 1 ) {
                    //$("#allImgUrl").attr("src", data.path);
                    $("#path1").val(data.path);
                }else if(picOrder == 2){
                    $("#path2").val(data.path);
                }else if(picOrder == 3){
                    $("#path3").val(data.path);
                }else if(picOrder == 4){
                    $("#path4").val(data.path);
                }
            }
        };
        $form("#form1").ajaxSubmit(options);
    }

</script>