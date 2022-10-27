<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginResult.jsp</title>
</head>
<body>
	<h3>* 로그인 결과 *</h3>
	
	① JSP <br>
	아이디 : <%= request.getAttribute("r_uid")%><br>
	비밀번호 : <%= request.getAttribute("r_upw") %><br>
	
	② EL (표현 언어) <br>
	아이디 : ${requestScope.r_uid}<br>
	비밀번호 : ${requestScope.r_upw}<br>
	
	<!-- Scope 생략가능 -->
	아이디 : ${r_uid}<br>
	비밀번호 : ${r_upw}<br>
</body>
</html>