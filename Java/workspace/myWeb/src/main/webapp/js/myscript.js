/**
 * 
 */
 
 function bbsCheck(){
	// 게시판 유효성 검사
	
	// 1. 작성자 확인 ex. 작성자명 두글자 이상 입력시 true 
	let wname = document.getElementById("wname").value;
	wname = wname.trim(); 
	if (wname.length<2) {
        alert("작성자명은 두글자 이상 입력해주세요.");
	    document.getElementById("wname").focus();
	    return false;
    }//if end
    
	// 2. 제목 확인  ex. 제목 두 글자 이상 입력시 true 
	var subject = document.getElementById("subject").value;
	subject = subject.trim(); 
	if (subject.length<2) {
        alert("제목은 두글자 이상 입력해주세요.");
	    document.getElementById("subject").focus();
	    return false;
    }//if end

	// 3. 내용 확인  ex. 내용 두 글자 이상 입력시 true
	var content = document.getElementById("content").value;
	content = content.trim(); 
	if (content.length<2) {
        alert("내용은 두글자 이상 입력해주세요.");
	    document.getElementById("content").focus();
	    return false;
    }//if end

	// 4. 비밀번호 확인  ex. 네 글자 이상 && 숫자형만 입력시 true
	var passwd = document.getElementById("passwd").value;
	passwd = passwd.trim(); 
	if (passwd.length<4 || isNaN(passwd)) {
						// isNaN() : 매개변수가 숫자인지 검사하는 함수 (=Not a Number) : 문자일 경우 true을 반환 (숫자는 false반환)
        alert("비밀번호는 4글자 이상 숫자로만 입력해주세요.");
	    document.getElementById("passwd").focus();
	    return false;
    }//if end
	
	return true; // onsubmit 이벤트에서 서버로 전송  
}//bbsCh() end

 function pwCheck(){
	
	var passwd = document.getElementById("passwd").value;
	passwd = passwd.trim(); 
	if (passwd.length<4 || isNaN(passwd)) {
						// isNaN() : 매개변수가 숫자인지 검사하는 함수 (=Not a Number) : 문자일 경우 true을 반환 (숫자는 false반환)
        alert("비밀번호는 4글자 이상 숫자로만 입력해주세요.");
	    document.getElementById("passwd").focus();
	    return false;
    }//if end
	
	let message="삭제된 글은 복구되지 않습니다.\n계속 진행하시겠습니까?";
	if(confirm(message)){	// true = 확인 | false = 취소
		return true; 		// 서버로 전송
	}else{
		return false;
	}//if end
	
}//pwC()end


























