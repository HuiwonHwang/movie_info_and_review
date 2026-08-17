/*********join**********/
function memberJoin(){
	if(checkEmpty(mem.id,"ID를 입력하세요"))return;
	if(mem.id_check.value=="") {
	         alert("ID 중복 검사 하시오.");
	         return;
	      }
	if(mem.id_check.value!="사용가능") {
		alert("사용불가한 ID입니다.");
		mem.id.focus();
		return;
	}
	if(checkEmpty(mem.nickname,"닉네임을 입력하세요"))return;
	if(checkEmpty(mem.password,"비밀번호를 입력하세요"))return;
	if(checkEmpty(mem.password_check,"비밀번호 확인란을 입력하세요"))return;
	if(mem.password.value!=mem.password_check.value){
		alert("비밀번호를 확인하세요");
		mem.passwordCheck.focus();
		return;
	}
	if(checkEmpty(mem.email_1,"이메일 입력하세요"))return;
	if(checkEmpty(mem.email_2,"이메일 입력하세요"))return;
	if(checkEmpty(mem.favorite_movie,"최애영화를 입력하세요"))return;
	if(checkEmpty(mem.agree,"개인정보 수집 약관에 동의하세요"))return;
	
	mem.t_gubun.value="memberSave";
	mem.method="post";
	mem.action="Member";
	mem.submit();
}

function checkId(){
  		if(checkEmpty(mem.id,"아이디 입력"))return;
		var id = mem.id.value;
  	 	$.ajax({
		type :"POST",
		url : "MemberCheckId",
		async:false,
		data: "id="+id,
		dataType : "text",
		error : function(){
			alert('통신 실패!!!!!');
		},
		success : function(data){
			var result=$.trim(data);
			mem.id_check.value=result;
			//alert("=="+result+"==")
			}
		});	
 }

 function setEmpty(){
		mem.id_check.value="";
}
//회원가입 선호장르 최대 3개
function count_check(obj){
	var chkBox = document.getElementsByName("genre"); // name 값 chk 들 불러옴
	var chkCnt = 0; // chkCnt 변수에 초깃값을 0으로 설정
	for(var i = 0; i < chkBox.length; i++){ // 반목문으로 초깃값, 조건식, 증감식 설정
		if(chkBox[i].checked){ // 조건문으로 chkBox가 checked 됐을 경우
			chkCnt++; // 1씩 증가
		}
	}
	if(chkCnt > 3){ // 조건문으로 chkCnt가 2개 보다 클 경우
		alert("3개까지 체크할 수 있습니다."); // alert를 띄움
		obj.checked = false; // false을 주어 alert를 띄운 뒤에 check 되지 않도독 설정
		return false;
	}
}


/*********login**********/
function goLogin(){
	if(checkEmpty(mem.id,"ID를 입력하세요"))return;
	if(checkEmpty(mem.password,"비밀번호를 입력하세요"))return;

	mem.t_gubun.value="memberlogin";
	mem.method="post";
	mem.action="Member";
	mem.submit();
}
function goFindId(){
	if(checkEmpty(mem.email,"이메일을 입력하세요"))return;
	if(checkEmpty(mem.favorite_movie,"최애 영화를 입력하세요"))return;

	mem.t_gubun.value="findId";
	mem.method="post";
	mem.action="Member";
	mem.submit();
}


/*********update**********/
function memberUpdate(){
	if(checkEmpty(mem.nickname,"닉네임을 입력하세요"))return;
	if(checkEmpty(mem.email_1,"이메일 입력하세요"))return;
	if(checkEmpty(mem.email_2,"이메일 입력하세요"))return;
	
	
	mem.t_gubun.value="memberUpdate";
	mem.method="post";
	mem.action="Member";
	mem.submit();
}
/*********delete**********/
function memberDelete(){
	if(confirm("정말 탈퇴하시겠습니까?")){
		mem.t_gubun.value="memberDelete";
		mem.method="post";
		mem.action="Member";
		mem.submit();
	}	
}
