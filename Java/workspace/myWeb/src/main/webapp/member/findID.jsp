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
		<h3> 아이디 찾기</h3>
		<form action="findIDProc.jsp" onsubmit="return blankCheck()">
			이　름 : <input type="text" name="mname" id="mname" maxlength="10" autofocus><br>
			이메일 : <input type="text" name="email" id="email" maxlength="20"><br><br>
			<input type="submit" value="아이디 찾기"> 
		</form>
	</div>

	<script>
		function blankCheck() {
			let mname = document.getElementById("mname").value;
			mname = mname.trim(); 
			if (mname.length<2) {
				alert("이름은 2글자 이상 입력해주세요.");
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