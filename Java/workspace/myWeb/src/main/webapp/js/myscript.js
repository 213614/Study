/**
 * 
 */
 
 function bbsCheck(){
	// 게시판 유효성 검사
	
	// 1. 작성자 확인 ex. 작성자명 두글자 이상 입력시 true 
	let wname = document.getElementById("wname").value;
	wname = wname.trim(); 
	if (wname.length<1) {
        alert("작성자명은 한글자 이상 입력해주세요.");
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

 function searchCheck(){
	// 검색어를 입력해야만 서버로 접속
	let word = document.getElementById("word").value;
	word = word.trim();
	if(word.length==0){
		alert("검색어를 입력해주세요.");
		return false;
	}// if end
	
	return true;
}//searchCh()end

 function loginCheck() {
	// 로그인 유효성 검사
	
	// ①. id 5-10글자 이내인지 검사
	let id = document.getElementById("id").value;
	id = id.trim(); 
	if (!(id.length>=5 && id.length<=10)) {
        alert("아이디는 5-10자 이내로 입력해주세요.");
	    document.getElementById("id").focus();
	    return false;
    }//if end
		
	// ②. pw 5-10글자 이내인지 검사
	let passwd = document.getElementById("passwd").value;
	passwd = passwd.trim(); 
	if (!(passwd.length>=5 && passwd.length<=10)) {
        alert("비밀번호는 5-10자 이내로 입력해주세요.");
	    document.getElementById("passwd").focus();
	    return false;
    }//if end
    
	return true;
}//loginCh() end
  
 function idCheck() {
	// 아이디 중복 확인

	// ● 모달창 → 부모창과 자식창이 한 몸으로 구성되어 있음 = 자식창을 close하지않는이상 부모창엔 클릭 못함
	// https://www.w3schools.com/bootstrap/bootstrap_modal.asp
	
	// ● 새창 → 부모창창과 자식창이 별개로 구성되어 있음 = 자식창과 상관없이 부모창 클릭 가능
	// https://www.w3schools.com/jsref/met_win_open.asp
	// window.open("파일명", "새창이름", "다양한 옵션들");
	window.open("idCheckForm.jsp", "idwin", "width=400, height=350");
	
	
}//idCh() end

 function emailCheck() {
	// 이메일 중복 확인
	
	window.open("emailCheckForm.jsp","emailwin","width=400, height=350");
	
}//emailCh() end

 function memberCheck(){
	// 회원가입 유효성 검사
	
	// ①. 아이디 5~10글자 인지?
	let id = document.getElementById("id").value;
	id = id.trim(); 
	if (!(id.length>=5 && id.length<=10)) {
        alert("아이디는 5-10자 이내로 입력해주세요.");
	    document.getElementById("id").focus();
	    return false;
    }else if(id == "guest"){
		alert("'guest'는 아이디로 사용하실 수 없습니다.");
	    document.getElementById("id").focus();
	    return false;
    }//if end
    
    // ②. 비밀번호 5~10글자 인지?
	let passwd = document.getElementById("passwd").value;
	passwd = passwd.trim(); 
	if (!(passwd.length>=5 && passwd.length<=10)) {
        alert("비밀번호는 5-10자 이내로 입력해주세요.");
	    document.getElementById("passwd").focus();
	    return false;
    }//if end
	
    // ③. 비밀번호와 비밀번호확인이 서로 일치하는지?
	let repasswd = document.getElementById("repasswd").value;
	repasswd = repasswd.trim();
	if(passwd != repasswd) {
        alert("비밀번호가 서로 일치하지 않습니다.");
	    document.getElementById("repasswd").focus();
	    return false;
	}
	
    // ④. 이름 2글자 이상 인지?
    let mname = document.getElementById("mname").value;
    mname = mname.trim();
    if (mname.length < 2) {
        alert("이름은 2글자 이상 입력해주세요.");
	    document.getElementById("mname").focus();
	    return false;
	}

    // ⑤. 이메일이 입력되었는가 
	let email = document.getElementById("email").value;
    email = email.trim();
    if (email.length <= 0) {
        alert("이메일을 입력해주세요.");
	    document.getElementById("mname").focus();
	    return false;
	}
	
	return true;
}//memCh() end


 function findID() {
	// 아이디 찾기 

	window.open("findID.jsp", "findIDwin", "width=400, height=350");

}//findID() end

 function findPW() {
	// 비밀번호 찾기 

	window.open("findPW.jsp", "findPWwin", "width=400, height=350");

}//findPW() end

 function findIDCheck(){
	// 아이디,비밀번호찾기(강사님)
	
	
}//findIDCheck() end 

 function pdsCheck(){
	// 포토갤러리 이미지만 업로드할 수 있게 제약 = 파일 이름에서 substring으로 확장자명만 뜯어서 이미지파일인지 확인(.jsp, .png 등)
	//								 → oop0908.Test04_Quiz.java 참조
		
	// ①. 작성자 1글자이상 입력 필수
	let wname = document.getElementById("wname").value;
	wname = wname.trim(); 
	if (wname.length<1) {
        alert("작성자명은 한글자 이상 입력해주세요.");
	    document.getElementById("wname").focus();
	    return false;
    }//if end
    
	// ②. 제목 1글자이상 입력 필수
	let subject = document.getElementById("subject").value;
	subject = subject.trim(); 
	if (subject.length<2) {
        alert("제목은 두글자 이상 입력해주세요.");
	    document.getElementById("subject").focus();
	    return false;
    }//if end
    
	// ③. 비밀번호 4글자이상 필수
	let passwd = document.getElementById("passwd").value;
	passwd = passwd.trim(); 
	if (passwd.length<4 || isNaN(passwd)) {
						// isNaN() : 매개변수가 숫자인지 검사하는 함수 (=Not a Number) : 문자일 경우 true을 반환 (숫자는 false반환)
        alert("비밀번호는 4글자 이상 숫자로만 입력해주세요.");
	    document.getElementById("passwd").focus();
	    return false;
    }//if end
	
	
	// ④. 이미지 첨부파일인지 제한  (.png / .jpg / .gif → html문서에서 출력되는 이미지 확장자만, 더 추가해도 되긴하는데 화면에 안뜰수도있음)
	let filename = document.getElementById("filename").value;
    filename = filename.trim();
    if(filename.length == 0) {
	// 이미지를 첨부하지 않았음 
        alert("파일이 첨부되지않았습니다.");
	    return false;
	}else{
		//filename 변수값에서 마지막 .의 순서값 가져오기 
		let dot = filename.lastIndexOf(".");	// .의 인덱스값을 dot에 저장
		
		//확장명 뽑기 : 마지막 .의 인덱스값(dot)이후의 문자열들만 불러오면 됨
		let ext = filename.substr(dot+1);
		
		//확장명을 전부 소문자로 변환
		ext = ext.toLowerCase();
		
		//확장자명이 이미지파일이라면 서버로 전송 아니라면 알림창 띄우고 false
		if(ext.equals("png") || ext.equals("jpg") || ext.equals("gif") || ext.equals("heif")) {
			return true;
		} else {
			alert("이미지 파일만 전송 가능합니다. (.png/.jpg /.gif)");
			return false;
		}//if end

	}//if end
    
}//pdsCh() end

 function pwCheck2(){
	
	var passwd = document.getElementById("passwd").value;
	passwd = passwd.trim(); 
	if (passwd.length<4 || isNaN(passwd)) {
						// isNaN() : 매개변수가 숫자인지 검사하는 함수 (=Not a Number) : 문자일 경우 true을 반환 (숫자는 false반환)
        alert("비밀번호는 4글자 이상 숫자로만 입력해주세요.");
	    document.getElementById("passwd").focus();
	    return false;
    }//if end
	
	let message="첨부하신 파일도 삭제됩니다.\n계속 진행하시겠습니까?";
	if(confirm(message)){	// true = 확인 | false = 취소
		return true; 		// 서버로 전송
	}else{
		return false;
	}//if end
}//pwCh2()end

 function pwCheck3(){
	// 회원탈퇴시 비밀번호 유효성 검사
	let passwd = document.getElementById("passwd").value;
	passwd = passwd.trim(); 
	
	if (!(passwd.length>=5 && passwd.length<=10)) {
        alert("비밀번호는 5-10자 이내로 입력해주세요.");
	    document.getElementById("passwd").focus();
	    return false;
    }//if end
    return true;
}//pwCh3() end

 function notiCheck(){
	// 공지사항 작성 유효성 검사
	
	// 제목, 내용 필수 작성 (빈문자열도 안됨)
	var subject = document.getElementById("subject").value;
	subject = subject.trim(); 
	if (subject.length == 0) {
        alert("제목을 입력해주세요.");
	    document.getElementById("subject").focus();
	    return false;
    }else if(subject.length<2){
	    alert("제목은 두 글자 이상 입력해주세요.");
	    document.getElementById("subject").focus();
	    return false;
	}//if end

	var content = document.getElementById("content").value;
	content = content.trim(); 
	if (content.length == 0) {
        alert("내용을 입력해주세요.");
	    document.getElementById("content").focus();
	    return false;
    }else if(content.length<2){
	    alert("내용은 두 글자 이상 입력해주세요.");
	    document.getElementById("content").focus();
	    return false;
	}//if end
	
	// 비밀번호 숫자 네자리 (게시글 비밀번호는 유효성검사 통일)
	let passwd = document.getElementById("passwd").value;
	passwd = passwd.trim(); 
	if (passwd.length<4 || isNaN(passwd)) {
        alert("비밀번호는 4글자 이상 숫자로만 입력해주세요.");
	    document.getElementById("passwd").focus();
	    return false;
    }//if end
    
    return true;
}//noticeCh()end







