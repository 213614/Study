<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>emailCheckForm.jsp</title>
</head>
<body>
	<div style="text-align:center;">
		<h3> 이메일 중복 확인</h3>
		<form action="emailCheckProc.jsp" onsubmit="return blankCheck()">
			이메일 : <input type="text" name="email" id="email" maxlength="10" size="7" autofocus>
			@
			<select name="domainLi">
				<!-- 
				 	<option value="type" selected>직접 입력</option>
				 	→ 직접 입력 박스를 만드려면 js에서 value="type"값이 넘어오면 도메인text박스의 readonly를 해제시키고
				 	  작성하게끔 진행되어야하는데 우리는 팝업창(새창)으로 나누어져있기때문에 구현이 깔끔하지 않다. 
				 	  = [아이디] @ [도메인] [selectbox] 이렇게 구성되어서 다른 값들을 선택하면 도메인text박스가 readonly로 바뀌어야함
				 	  참조 : https://choiiis.github.io/web/toy-project-sign-up-and-in-page-2/
				-->
				<option value="@itwill.com">itwill.com</option>
				<option value="@soldesk.com">soldesk.com</option>
				<option value="@naver.com">naver.com</option>
				<option value="@daum.net" >daum.net </option>
				<option value="@gmail.com">gmail.com</option>
			</select>
			<input type="submit" value="중복 확인"> 
		</form>
	</div>

	<script>
		function blankCheck() {
			let email = document.getElementById("email").value;
			email = email.trim(); 
			if (email.length<5) {
				alert("잘못된 이메일 주소입니다.");
				return false;
			}
			return true;
		}//blank() end
	</script>

</body>
</html>