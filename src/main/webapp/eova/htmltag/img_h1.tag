<%
//图片或者文件 三个路径  1、基本路径 http://127.0.0.1:8080/file 2、内部路径如：/avatar/ ,3、文件名 1475647037704.jpg ,需要改成数据库存储：/avatar/1475647037704.jpg 因为内部路径可以能程序调整发生变化
//一个完整的访问路径：http://127.0.0.1:8080/file/avatar/1475647037704.jpg
//控件：http://bootstrap-fileinput.com/
if(isEmpty(filedir!)){
	filedir = "/"+objectCode!+"/"+name!;
}

var uploadDir = filedir;
debug(filedir);
var imgUrl = "";
if(!isEmpty(value!)){
	if(isEmpty(uploadDir!)){
		//uploadDir = "temp";
		//uploadDir = com.eova.common.utils.xx.getConfig("eova_upload_temp");
	}
	//imgUrl = IMG! + uploadDir + '/' + value;
	
	if(strutil.index(value,'http://') == -1){
		imgUrl = IMG! +  '/' +  value;
	}else
		imgUrl =  value;
	debug(imgUrl);
}
//支持多个文件上传未实现
//imgUrl = 'http://img.bblocks.cn/a8ba9fb75bdc4b5a95df9163f0b55d22.jpg';
//imgUrl = 'http://img.bblocks.cn/19e52d42b61d44628c66cca6c3142928.doc';
var ismultiple = "";
if(isTrue(multiple!)){
	ismultiple = "multiple";
}
var verify = "";
if(isTrue(isNoN!) ){//文件只检查是否存在即可
	verify = verify + "required";
}
var disabled="";
if( isTrue(isReadonly!) ||isTrue(view!)){
	disabled = 'disabled=""';
	verify = '';
}
//从配置中可以额外提取的 文件类型(imgTypes)、文件大小imgSize、数量imgNum
var imgNum = 1;//默认值 ，然后从配置中提取，以及
var imgSize = '';
var imgTypes = '';
%>


 <div class="file-loading">
	<input id="fileinput_${id!}" name="fileinput_${name!}"  type="file"'>
    <input type="hidden"  id="${id!}" name="${name!}" value="${value!}" ${ismultiple!}  lay-verify="${verify!}" title='${item.cn!}'/>
</div>




<script>
$(document).ready(function () {
    $("#fileinput_${id!}").fileinput({
        'theme': 'explorer-fas',
        uploadUrl: ctx+'upload/img?name=fileinput_${name!}&filedir=${filedir}', //上传的地址
        language: 'zh', //设置语言
        overwriteInitial: false,
        initialPreviewAsData: true,
     	allowedFileExtensions: UPLOAD_IMG_TYPE.split(","),//接收的文件后缀（数组）
     // allowedFileExtensions: ['jpg','png','pdf','apk','rar'],//接收的文件后缀
        maxFileSize: IMG_MAX,//这个是单个文件大小
        maxFileCount: 0, // 这里设为0，由于存在bug，这个属性相当于没什么用了，判断是否超限统一用事件钩子来执行
        uploadClass: "btn green",
        removeClass: "btn red",
    }).on("filebatchselected", function(event, files) {
        $(this).fileinput("upload");
        
        //
    }).on("fileuploaded", function(event, data,t1,index) {
        if(data.response.success == true)
        {
            //alert('处理成功');
        	$('#${id!}').attr('value', newFile); 
        }else{
       	 //alert(data.response.msg);
       	 //$(".file-error-message").text(data.response.msg);
        }
    });
});

</script>

