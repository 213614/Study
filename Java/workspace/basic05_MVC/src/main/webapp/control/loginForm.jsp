<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginForm.jsp</title>
</head>
<body>
	<h3>* 회원 로그인(MVC) *</h3>
	
	<!-- 							↓ 명령어로 페이지 호출 -->
	<form method="post" action="loginproc.do">
		아이디 : <input type="text" name="uid"><br>
	    비번  : <input type="password" name="upw"><br>
	           <input type="submit" value="확인">
	</form>
	
<!-- 
	①. JSP 페이지 호출
	→ http://localhost:9090/basic05_MVC/control/loginForm.jsp

	②. 서블릿을 이용한 JSP 페이지 호출 (= 명령어 호출)
	→ http://localhost:9090/basic05_MVC/login.do

 -->
</body>
</html>