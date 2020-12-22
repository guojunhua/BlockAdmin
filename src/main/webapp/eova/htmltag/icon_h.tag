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
var disabled="";
if(isTrue(isReadonly!) ){
	disabled = 'readonly';
	verify = '';
}
//后面是否会搞成 图标形式再说，以及支持外部图标


value = isEmpty( value! ) ? defaultValue!:value!;
%>
<div class="bb-icon-choice">
					<input id="${id!}" name="${name!}" value="${value!}" autocomplete="off" class="form-control" type="text" placeholder="${placeholder!}"  ${disabled!} bb-verify="${verify!}" ${strutil.replace(verify!,';',' ')}>
<!-- 				<span class="input-group-addon"><i class="fa fa-search" id="${id!}_addon"></i></span> -->	
                    <div class="ms-parent" style="width: 100%;">
                        <div id="${id!}_choice" class="icon-drop animated flipInX" style="display: none;max-height:200px;overflow-y:auto">
                            <div id='${id!}_icon_list'></div>
                        </div>
                    </div>
</div>

<script type="text/javascript">

$(function () {
	var url = '/toIcon';
	$.ajax({
        type: 'get',
        async: true,
        url: url,
        success: function (res) {
        	//去除 script 标签
        	var html = document.createElement('div');
        	html.innerHTML = res;
        	var scripts = html.getElementsByTagName('script');

        	 for(var i = 0; i < scripts.length; i++){
        		 scripts[i].remove();        
        	 }
        	
        	
        	$("#${id!}_icon_list").html(html);
        	
        	$("#${id!}_choice").find(".ico-list i").on("click", function() {//选中事件
        		$('#${id!}').val($(this).attr('class'));
        		
        		$('#${id!}_addon').attr('class',$(this).attr('class'));
        		
        		$("#${id!}_choice").hide();
            });
        },
        error: function () {
            alert('加载图标列表失败' + url);
        }
    });
	
	$("#${id!}").focus(function() {
		if($("#${id!}").attr('readonly') != "readonly"){
      	  $("#${id!}_choice").show();
		}
    });
	
	//失去焦点关闭，效果不行
	/* $("#${id!}").blur(function() {
        $("#${id!}_choice").hide();
    }); */
	$(document).on("click", function (e) {
          // $("#${id!}_choice").hide();
           var obj = event.srcElement || event.target;
           if (!$(obj).is($("#${id!}"))) {
           		$("#${id!}_choice").hide();
           }
           
     });

   
});
	
 	    
</script>