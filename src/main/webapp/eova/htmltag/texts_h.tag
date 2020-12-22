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
if( isTrue(isReadonly!) ||isTrue(view!)){
	disabled = 'readonly';
	verify = '';
}
//style="width:200px; height:100px"

value = isEmpty( value! ) ? defaultValue!:value!;
%>
<textarea class="form-control" id="${id!}" name="${name}" style="${style!}"  placeholder="${placeholder!}" ${disabled!} bb-verify="${verify!}" ${strutil.replace(verify!,';',' ')}>${value!}</textarea>
