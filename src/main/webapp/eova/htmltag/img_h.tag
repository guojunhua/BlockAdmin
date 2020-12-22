<%
//图片或者文件 三个路径  1、基本路径 http://127.0.0.1:8080/file 2、内部路径如：/avatar/ ,3、文件名 1475647037704.jpg ,需要改成数据库存储：/avatar/1475647037704.jpg 因为内部路径可以能程序调整发生变化
//一个完整的访问路径：http://127.0.0.1:8080/file/avatar/1475647037704.jpg
var fileNameKey = id!+'_name';
//文件真的原名
var srcfileName = null;
if(data! != null)
	srcfileName = @data.get(fileNameKey);

if(isEmpty(filedir!)){
	filedir = "/"+objectCode!+"/"+name!;
}

var uploadDir = filedir;

var imgUrl = "";
if(!isEmpty(value!)){
	
	//imgUrl = IMG! + uploadDir + '/' + value;
	
	if(strutil.index(value,'http://') == -1 && strutil.index(value,'https://') == -1){
		imgUrl = IMG! +  '/' +  value;
	}else
		imgUrl =  value;
	debug(imgUrl);
}

var verify = "";
if(isTrue(isNoN!) ){
	verify = "required=true";
}
if(!isEmpty(validator!)){
	if(verify != ''){
		verify += ';';
	}
	verify = verify + validator!;
}
var disabled="";
if( isTrue(isReadonly!) ||isTrue(view!)){
	disabled = 'disabled=""';
	verify = '';
}

var fileTypes = "";
if(!isEmpty(item.config.fileTypes!)){
	fileTypes = item.config.fileTypes!;
}else
	fileTypes = @com.eova.common.utils.io.FileUtil.IMG_TYPE;
var maxLength = null;
if(!isEmpty(item.config.maxLength!)){
	maxLength = item.config.maxLength!;
}else
	maxLength = @com.eova.config.EovaConst.UPLOAD_IMG_SIZE;

var fileNum= item.config.fileNum!;
if(isEmpty(fileNum!))
	fileNum = 1;


value = isEmpty( value! ) ? defaultValue!:value!;
%>


 

<!--dom结构部分 http://fex.baidu.com/webuploader/getting-started.html
https://my.oschina.net/lemos/blog/2998818
https://www.helloweba.net/demo/2016/webuploader/
https://blog.csdn.net/caiyongshengcsdn/article/details/79412933
http://www.bootstrap-fileinput.com/options.html

 <div class="bb-img-upload">
 <input id="fileinput_${name!}"  name="fileinput_${id!}" type="file" multiple data-min-file-count="1">
 <input type="hidden"  id="${id!}" name="${name!}" value="${value!}" ${ismultiple!}  lay-verify="${verify!}" title='${item.cn!}'/>
</div>          
-->
<div class="bb-img-upload" >
            <div class="file-loading">
                <input  id="fileinput_${name!}"  name="fileinput_${id!}" type="file" multiple ${disabled!}>
            </div>
            <div id="fileinput_${id!}_kv-avatar-errors" class="center-block" style="width:800px;display:none"></div>
            <input type="hidden" id="${id!}" name="${name!}" value="${value!}" bb-verify="${verify!}" ${strutil.replace(verify!,';',' ')}  target='fileinput_${id!}'/>
</div>
        

<script>
$(document).ready(function () {
	//类似 .jpg|.gif|.png|.bmp=>gif,jpg,jpeg,bmp,png
	var fileTypes = "${fileTypes!}".replaceAll('\\.', '').replaceAll('\\|', ',');
	var imgUrl = '${imgUrl!}';
	var initialPreviews = new Array();
	var initialPreviewConfigs = new Array();
	if(imgUrl !=''){
		initialPreviews[0] = imgUrl;
		
		var fileName = $.getFilePathName(imgUrl);
		if ( '${srcfileName!}' != '' ) { 
			 fileName =  '${srcfileName!}';
		 } 
		initialPreviewConfigs[0] = { caption: fileName,filename: fileName,downloadUrl:imgUrl,url:'toDelete'};//type 后面控件会根据后缀自行添加
	}
	
	<% if(!isEmpty( placeholder! )){ %>
	var tips = '${placeholder!}';
	<% }else{ %>
	var tips = '请选择(支持格式：'+fileTypes+')';
	<% } %>
	
	$("#fileinput_${id!}").fileinput({
	    'uploadUrl': ctx+'upload/img?name=fileinput_${name!}&filedir=${filedir}', //上传的地址
	    overwriteInitial: true,
	    maxFileSize: ${maxLength!},//这个是单个文件大小
	    showClose: false,
	    showCaption: false,
	    showBrowse: false,
	    initialPreviewAsData: true,
	    browseOnZoneClick: true,
	    removeFromPreviewOnError:true, //当选择的文件不符合规则时，例如不是指定后缀文件、大小超出配置等，选择的文件不会出现在预览框中，只会显示错误信息  
	    initialPreview: initialPreviews,
	    initialPreviewAsData: true, // defaults markup  
	    initialPreviewConfig: initialPreviewConfigs,
	    removeLabel: '删除',
	    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
	    removeTitle: 'Cancel or reset changes',
	    elErrorContainer: '#fileinput_${id!}_kv-avatar-errors',
	    msgErrorClass: 'alert alert-block alert-danger',
	    defaultPreviewContent: '<img src="/ui/images/upload-a.png" alt="积木图片上传" alt=""><h6 class="text-muted">'+tips+'</h6>',
	    layoutTemplates: {main2: '{preview} ' },
	    allowedFileExtensions :  fileTypes.split(","),//接收的文件后缀（数组）
	});
	
	$("#fileinput_${id!}").on("fileuploaded", function (event, data, previewId, index) {
	            if(data.response.success == true){
	                //alert('上传成功');
	            	//fileName: "http://img.bblocks.cn/c159e1c8032344788e45eb3904b3fc1e.jpg"
	            	//	msg: "上传成功"
	            	$('#${id!}').attr('value', data.response.fileName); 
	            	 //判断是否存在文件名字段吗
		   			 if ( $("#${fileNameKey!}").length > 0 ) { 
		   				 $("#${fileNameKey!}").val(data.files[0].name); 
		   			 } 
	            }else{
	            	//data.response.msg;
	            	
	            }
	 }).on("filebatchselected", function(event, files) {
	     $(this).fileinput("upload");
	 });
});
</script>