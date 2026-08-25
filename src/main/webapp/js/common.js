/**

 */
function checkEmpty(obj,msg){
	if(obj.value == ""){
		alert(msg);
		obj.focus();
		return true;
	} else {
		return false;
	}
}

function showPreparationAlert(){
	alert("🚧 페이지 준비 중입니다.");
	return false;
}
