/*myscript2.js*/

/*  
    【 함수 이름 설정 시 : 대체적으로 이렇게 사용함 】 
    get ~ 어쩌구 함수 : return값 있음
    set ~ 어쩌구 함수 : 특정값을 줄 때
    is ~ 어쩌구 함수  : 물어보는 용도로 주로 쓰임 (boolean값으로 도출)
    to ~ 어쩌구 함수  : 어쩌구한테 줘라 

    괄호안에 전달값이 없다 = getter : 값을 가져옴 
        → 사용자가 입력한 정보를 전달값에 담아서 가져옴 
        → id 작성시 사용자가 id를 입력하고 그걸 서버에 보내서 중복확인
    괄호안에 전달값이 있다 = setter : 값을 줌
        → 서버의 정보를 사용자에게 다시 돌려줌
        → 사용자가 지정한 id가 서버에 없을 경우(중복확인이 끝난 후) 그 정보를 다시 돌려줌으로써 아이디 적용
*/

//참조: https://www.w3schools.com/js/js_htmldom_document.asp

function getID(){
    //alert("중복 확인:getID Function 확인용 test"); 

/*
    <input type="text" name="uid" id="uid">에 접근해보기

    1. <form>의 컨트롤 요소 접근 시 name 사용 (문법적으론 허용되나 사용 비추)
        alert(document.memfrm.uid.value); → 적용이 안됨 (걍 적어만 놓는거)
            // → <body>안에서 name=memfrm을 찾아서 그 안에 id=uid의 value
        alert(document.getElementsByName("uid"));               // [object NodeList]  : NodeList : 자료를 모아놧다는 뜻으로 [index]로 접근해야함
        alert(document.getElementsByName("uid")[0].values);     // undefined
        alert(document.getElementsByName("uid").values); 

    ★2. <form>의 컨트롤 요소 접근 시 id="" 사용 (＊추천＊) : 가장 일반적임
        alert(document.getElementById("uid"));                  // [object HTMLInputElement]  : object가 나오면 잘 작동하고 있다는 뜻 : html안에 input요소에 접근했다 
        alert(document.getElementById("uid").value);            // 아이디 : text박스에 적은 값이 나옴

    3. <form>의 컨트롤 요소 접근 시 tag name으로 접근 
       본문에서 <input> 태그들에 접근 (ex. 3개의 input을 순서대로 접근 가능 : 배열처럼 0번째 1번째 2번째)
        alert(document.getElementsByTagName("input"));          // [object HTMLCollection]  : Collection : input이 여러개라는 뜻 (같은 이름이 여러개)
    
    3-1. <input>태그들 중에서 0번째 태그에 접근하기 
        alert(document.getElementsByTagName("input")[0]);       // [object HTMLInputElement] : 특정 태그를 지정했기때문에 Collection이 빠짐
        alert(document.getElementsByTagName("input")[0].value); // <input> 0번째가 가지고있는 value값 확인 → 실제 값 → 아이디 : text박스에 적은 값이 나옴
*/

    // 4. style 접근 : class로 접근 시 순서대로 접근(3.input처럼)
    alert(document.getElementsByClassName("line"));         // [object HTMLCollection]

}//getID() end
 
function setID(){
        
    let str="itwill";           // 중복확인을 해야지만 아이디 사용 가능 (확인 전에는 값을 대입하지 못하도록 막아놓는 경우도 있음) 

/*
    <input type="text" name="uid" id="uid" class="line">에 값 대입하기
    
    // 1. id 접근 (추천)
    document.getElementById("uid").value = str;              // id 적용버튼을 누르면 아이디 : text 칸에 value값이 나타남 

    // 2. tag name으로 접근
    document.getElementsByTagName("input")[0].value = str;   // id 적용버튼을 누르면 아이디 : text 칸에 value값이 나타남 

    // 3. name으로 접근 
    document.getElementsByName("uid")[0].value = str;        // id 적용버튼을 누르면 아이디 : text 칸에 value값이 나타남 
*/
}//setID() end

function validate(){
    // 회원가입 폼에 대한 유효서 검사 함수 (조건에 맞지 않으면 서버로 전송하지 않음)
    // DB 연동해서 사용 : 조건 줄 때 DB테이블 감안해서 조건을 줘야함 

    // 1. ID 글자 갯수가 8~12자 사이인지 확인하는 유효성 검사    
    //    만약, 위의 조건을 만족하지 않을 시 경고창(alert)을 내보냄 
    //       → ID를 다시 입력할 수 있도록 #uid에 커서를 생성해줌(focus) → 서버로 전송하는것을 차단한다(조건이 틀렸으니까)
    let uid=document.getElementById("uid").value;
    uid = uid.trim();   // 맨앞과 맨 뒤 공백 제거 (필수사항은 아님, 개발자 재량)
    let uil = uid.length; 
    if (!(uil>=8 && uil<=12)) {  // ! ← 부정 연산자 = uid의 글자 갯수(ul)이 8글자 이상, 12글자 이하가 되지 않는다면 (!말고 8글자 미만, 12글자 초과로 or연산자로 묶을수도있음)
        alert("아이디는 8~12글자 이내로 입력해주세요.");
                // 조건에 맞지 않아 alert창을 내보냄 
        document.getElementById("uid").focus();
                // ID를 다시 입력할 수 있도록 #uid에 커서를 생성해줌(focus)
        return false;
                // 서버로 전송하는것을 차단
    }//if end

    // 2. PW 글자 갯수가 5~10자 사이인지 확인하는 유효성 검사  
    let upw=document.getElementById("upw").value;
    upw = upw.trim();   
    let upl = upw.length; 
    if (!(upl>=5 && upl<=10)) {  
        alert("비밀번호는 5~10글자 이내로 입력해주세요.");
        document.getElementById("upw").focus();
        return false;
    }//if end

    // 3. 주민등록번호 앞칸이 숫자형 데이터인지, 글자 갯수가 6자인지 확인하는 유효성 검사  
    let jumin1=document.getElementById("jumin1").value;
    jumin1 = jumin1.trim();  
    let j1l = jumin1.length;
    if (j1l!=6 || isNaN(jumin1)){       
        // → 주민1의 글자수가 6글자와 같지 않고, 주민1이 문자라면(ture면 문자열데이터니까) {} 
                                        // isNaN : 매개변수(jumin1)가 숫자형인지 확인하는 함수 : 많이 쓰임 
                                        // → boolean값으로 return값을 가진다  : 문자열이면 true | 숫자형이면 false로 반환
                                        // 참조 : https://www.w3schools.com/jsref/jsref_isnan.asp
        alert('주민등록번호 앞자리는 숫자 6글자로만 입력해주세요.');
        document.getElementById("jumin1").value="";     // 틀린 입력값을 지우기 위해 빈 문자열 대입
        document.getElementById("jumin1").focus();
        return false;
    }   

    // 3-1. 주민등록번호 뒷칸 숫자형 데이터인지, 글자 갯수가 7자인지 확인하는 유효성 검사
    let jumin2 = document.getElementById("jumin2").value;
    jumin2 = jumin2.trim();

    let j2l = jumin2.length;
    if (j2l != 7 || isNaN(jumin2)){
        alert('주민등록번호 뒷자리는 숫자 7글자로만 입력해주세요.');
        document.getElementById("jumin2").value="";
        document.getElementById("jumin2").focus();
        return false;
    }
    /* 이거 지금 오류남 : 맞게 해도 자꾸 alert이 뜸 → if 조건문에 != 6을 7로 바꿔야는데 안함 그니까 조건이 자꾸 false지 이휴 등신  
    let jumin2=document.getElementById("jumin2").value;
    jumin2 = jumin2.trim();  
    let j2l = jumin2.length;
    if (j2l!=6 || isNaN(jumin2)){       
        alert('주민등록번호 뒷자리는 숫자 7글자로만 입력해주세요.');
        document.getElementById("jumin2").value="";  
        document.getElementById("jumin2").focus();
        return false;
    }   
    */
    // 4. 약관동의에 체크했는지 확인하는 유효성 검사 
    if (document.getElementById("agree").checked==false){     // 체크를 안했다면(false라면) 
        alert("약관에 동의해주세요.");
        return false;
    }//if end

    alert("회원가입 폼을 서버로 전송합니다.");
    return true;    // <form name="memfrm">을 서버로 전송

}//validate() end

function validate2() {
    let frm = document.getElementById("memfrm");    // <form name="memfrm">전체를 frm함수에 담을 수 있음 (경로를 유연하게 접근)
    //alert(frm);         // [object HTMLFormElement] : FormElement : <form name="memfrm">전체를 담았으니까 

    frm.action = "ok2.jsp";    // <form action="ok2.jsp"></form>과 동일한 기능의 JS 속성

    frm.submit();              // <input type="submit">과 동일한 기능의 JS 함수
    
    //frm.reset();               // <input type="reset">과 동일한 기능의 JS 함수 
                                 // 폼 양식내에 있는 폼 컨트롤 요소가 가지고 있던 최초의 상태로 복귀 = 처음 상태로 리셋됨
}//validate2() end

