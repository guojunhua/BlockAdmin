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
if(isTrue(isReadonly!) ||isTrue(view!)){
	disabled = 'readonly';
	verify = '';
}


value = isEmpty( value! ) ? defaultValue!:value!;
%>
<input type="text" id="${id!}" name="${name!}" class="form-control" value="${value!}"  aria-invalid="false"  placeholder="${placeholder!}" ${disabled!} bb-verify="${verify!}" ${strutil.replace(verify!,';',' ')}>