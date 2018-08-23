申请白条
<form action='' enctype="multipart/form-data" method="post" name="form1" id="form1">
    <input type="file" id="upload1" onchange="uploadPic()"  name="pic" style="display: none;">
    <input type="file" id="upload2" onchange="uploadPic()"  name="pic" style="display: none;">



    <label>营业执照上传</label>
    <div id="div1" style="background-color: #000000;height: 60px;display:block;overflow:hidden;width:60px;">
        <img width="100" height="100" id="img1"/>
    </div>

    <input name="imgUrl" id="path1"/>


    <label>法人身份证</label>
    <div id="div2" style="background-color: #000000;height: 60px;display:block;overflow:hidden;width:60px;">
        <img width="100" height="100" id="img2"/>
    </div>
    <input  name="imgUrl" id="path2"/>
</form>
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
                }
            }
        };
        $form("#form1").ajaxSubmit(options);
    }

</script>