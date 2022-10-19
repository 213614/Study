<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>findID.jsp</title>
</head>
<body>
	<div style="text-align:center;">
		<h3>비밀번호 찾기</h3>
		<form action="findPWProc.jsp" onsubmit="return blankCheck()">
			아이디 : <input type="text" name="id" id="id" maxlength="10" autofocus><br>
			이메일 : <input type="text" name="email" id="email" maxlength="20"><br><br>
			<input type="submit" value="비밀번호 찾기"> 
		</form>
	</div>

	<script>
		function blankCheck() {
			let id = document.getElementById("id").value;
			id = id.trim(); 
			if (id.length<5) {
				alert("아이디는 5-10글자 이내로 입력해주세요.");
				return false;
			}
			
			let email = document.getElementById("email").value;
			email = email.trim(); 
			if (email.length<=0) {
				alert("이메일을 입력해주세요.");
				return false;
			}
			
			return true;
		}//blank() end
	</script>

</body>
</html>