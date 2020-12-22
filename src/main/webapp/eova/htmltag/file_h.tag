<%
//图片或者文件 三个路径  1、基本路径 http://127.0.0.1:8080/file 2、内部路径如：/avatar/ ,3、文件名 1475647037704.jpg ,需要改成数据库存储：/avatar/1475647037704.jpg 因为内部路径可以能程序调整发生变化
//一个完整的访问路径：http://127.0.0.1:8080/file/avatar/1475647037704.jpg
//需要显示图片原名：例如：文件字段叫：xx，则默认(目前只能默认除非改这边的源码)的文件名字段为：xx_name

var fileNameKey = id!+'_name';

//文件真的原名
var srcfileName = null;
if(data! != null)
	srcfileName = @data.get(fileNameKey);


if(isEmpty(filedir!)){
	filedir = "/"+objectCode!+"/"+name!;
}

var uploadDir = filedir;
debug(filedir);
var fileUrl = "";
if(!isEmpty(value!)){
	if(isEmpty(uploadDir!)){
		//uploadDir = "temp";
		//uploadDir = com.eova.common.utils.xx.getConfig("eova_upload_temp");
	}
	//imgUrl = IMG! + uploadDir + '/' + value;
	if(strutil.index(value,'http://') == -1 && strutil.index(value,'https://') == -1){
		fileUrl = FILE! +  '/' +  value;
	}else
		fileUrl =  value;

	debug(fileUrl);
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
if(!isEmpty(validator!)){
	if(isEmpty(verify))
		verify = validator;
	else
		verify = verify + "|" +validator;
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
	fileTypes = @com.eova.common.utils.io.FileUtil.ALL_TYPE;
var maxLength = null;
if(!isEmpty(item.config.maxLength!)){
	maxLength = item.config.maxLength!;
}else
	maxLength = @com.eova.config.EovaConst.UPLOAD_FILE_SIZE;
var fileNum= item.config.fileNum!;
if(isEmpty(fileNum!))
	fileNum = 1;

value = isEmpty( value! ) ? defaultValue!:value!;
%>
<div class="bb-file-upload" >
            <div class="file-loading">
                <input  id="${id!}_show"  name="fileinput_${name!}" type="file" multiple ${disabled!}>
            </div>
            <div id="${id!}_show_kv-avatar-errors" class="center-block" style="width:800px;display:none"></div>
            <input type="hidden"  id="${id!}" name="${name!}" value="${value!}" placeholder="${placeholder!}" bb-verify="${verify!}" ${strutil.replace(verify!,';',' ')} target='${id!}_show'/>
            
            
</div>
        

<script>

$(document).ready(function () {
	//类似 .jpg|.gif|.png|.bmp=>gif,jpg,jpeg,bmp,png
	var fileTypes = "${fileTypes!}".replaceAll('\\.', '').replaceAll('\\|', ',');
	var fileUrl = '${fileUrl!}';
	var initialPreviews = new Array();
	var initialPreviewConfigs = new Array();
	if(fileUrl !=''){
		initialPreviews[0] = fileUrl;
		
		var fileName = $.getFilePathName(fileUrl);
		if ( '${srcfileName!}' != '' ) { 
			 fileName =  '${srcfileName!}';
		 } 
		initialPreviewConfigs[0] = { caption: fileName,filename: fileName,downloadUrl:fileUrl,url:'toDelete',key:'123'};//type 后面控件会根据后缀自行添加
		
		//initialPreviewConfigs[0] = {caption: "abc.jpg", type: "jpg"};
		//initialPreviewConfigs[0] ={ caption: "菲哥.jpg", type: "jpg", size: 12345 };
	}
	
	
	
	<% if(!isEmpty( placeholder! )){ %>
	var tips = '${placeholder!}';
	<% }else{ %>
	var tips = '请选择(支持格式：'+fileTypes+')';
	<% } %>
	
	
	$("#${id!}_show").fileinput({
	    'uploadUrl': ctx+'upload/file?name=fileinput_${name!}&filedir=${filedir}', //上传的地址
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
	    
	    previewFileIconSettings:{
			'docx':'<i class="glyphicon glyphcion-file"></i>',
			'xlsx':'<i class="glyphicon glyphcion-file"></i>',
			'pptx':'<i class="glyphicon glyphcion-file"></i>',
			'jpg':'<i class="glyphicon glyphcion-picture"></i>',
			'pdf':'<i class="glyphicon glyphcion-file"></i>',
			'zip':'<i class="glyphicon glyphcion-file"></i>',
		},

	    
	    removeLabel: '删除',
	    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
	    removeTitle: 'Cancel or reset changes',
	    elErrorContainer: '#${id!}_show_kv-avatar-errors',
	    msgErrorClass: 'alert alert-block alert-danger',
	    defaultPreviewContent: '<img src="/ui/images/upload-a.png" alt="积木文件上传" alt=""><h6 class="text-muted">'+tips+'</h6>',
	    layoutTemplates: {main2: '{preview} ' },
	    allowedFileExtensions : fileTypes.split(","),//接收的文件后缀（数组）
	    
	    //otherActionButtons: btns,
	});

	
	$("#${id!}_show").on("fileuploaded", function (event, data, previewId, index) {

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
	 }).on('filesuccessremove', function (event, previewId, extra) {
		 console.log('开始删除。。。');
	　　　　　　//在移除事件里取出所需数据，并执行相应的删除指令
		   //delete(($('#' + previewId).attr('fileid'));
	 }).on('fileuploaded', function (event, previewId, extra) {
		 console.log('开始删除。。。');
	　　　　　　//在移除事件里取出所需数据，并执行相应的删除指令
		   //delete(($('#' + previewId).attr('fileid'));
	 });
	
		   
});
</script>