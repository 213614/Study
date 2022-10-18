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
			<select name="emche">
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