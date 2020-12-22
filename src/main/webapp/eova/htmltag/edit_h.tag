<%
// data-options


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



if( isTrue(isReadonly!) || isTrue(view!)  ){
	verify ='';
}

if(!isEmpty(width!)){
	if(!strutil.contain(width!,'%') && !strutil.contain(width!,'px')){
		width = width+'%';
	}
}
if(!isEmpty(height!)){
	if(!strutil.contain(height!,'%') && !strutil.contain(height!,'px')){
		height = height+'px';
	}
}else
	height =80+'px';


value = isEmpty( value! ) ? defaultValue!:value!;
%>



<!--
style="width:100%;height:340px;"
https://www.cnblogs.com/deverz/p/7825178.html
删除掉bootstrap.min.css和summernote-bs3.css 中的 .modal-backdrop样式内的 position: fixed;
-->
<div class="bb_text">
<div id="${id!}_summernote" type='edit'>${value!}</div>
<input type="hidden"  id="${id!}" name="${name!}" bb-verify="${verify!}" placeholder="${placeholder!}" ${strutil.replace(verify!,';',' ')} target='${id!}_summernote'/>
</div>
<!-- 隐藏值 -->
<script type="text/javascript">
$(document).ready(function() {
	
    
    <% if( isTrue(isReadonly!) || isTrue(view!)  ){ %>
    ${id!}_readonly();
    <% }else{%>
    ${id!}_edit();
    <% }%>
}); 

function ${id!}_edit(){
	
	//jquery创建一个summernote实例
    $('#${id!}_summernote').summernote({
         //功能图标改为中文
         lang: 'zh-CN',
         //预设内容
         placeholder: '${placeholder!}',
         height: '${height!}',
         width:'${width!}',
         //focus: true,  //设定focus为true时，打开页面后焦点定位到编辑器中。
         //回调函数
         callbacks: {
               //初始化
              onInit: function() {
                  //init
            	  //console.log("onInit...");
              },
            //失焦点
              onBlur: function() {
                  //focus
                 // console.log("onBlur...:"+$('#${id!}_summernote').code());
                  //var sHTML = $('.summernote').code();
                  $('#${id!}').attr('value', $('#${id!}_summernote').summernote('code')); 
              },
              //焦点
              onFocus: function() {
                  //focus
                  //console.log("focus...");
              },
              onsubmit: function() {
                  //focus
                  //console.log("onSubmit...");
              },
              //图片文件上传
              onImageUpload: function(files, editor, $editable) {
            	  console.log("to upload...");
                  data = new FormData();  
                  data.append("upfile", files[0]);  
                $.ajax({  
                    data : data,  
                    type : "POST",  
                    url : "/upload/editor?filedir=/image",   
                    cache : false,  
                    contentType : false,  
                    processData : false,  
                    dataType : "json",  
                    success: function(data) {  
                    	if(data.state == 'SUCCESS'){
                            //[服务器所在文件所在目录位置]一般为"http://119.23.216.181/RoboBlogs/Upload_File/default_show.png"
                            $('#${id!}_summernote').summernote('insertImage', data.url);  
                    		//parent.layer.msg('富文本框图片传输失败');
                    	}else{
                    		//提示层
                    		parent.layer.msg('富文本框图片传输失败');
                    	}
                    },  
                    error:function(){  
                        alert("上传失败");  
                    }  
                });  
              }
         }
         
    });	
    $('#${id!}').attr('value', $('#${id!}_summernote').summernote('code')); 
}

function ${id!}_readonly(){
	//var markup = $('#${id!}_summernote').summernote('code');
	//console.log(markup);
	  $('#${id!}_summernote').summernote('destroy');
}

</script>