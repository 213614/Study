<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ELtest2ok.jsp</title>
</head>
<body>
	<h3>* EL 파라미터 결과 *</h3>
	
	①. JSP 방식 <br>
	아이디 : <%= request.getParameter("id") %> <br>
	비밀번호 : <%= request.getParameter("pw") %> <br>
	
	<hr>
	
	②. EL 방식(비추) <br>
	아이디 : ${param.id} <br>
	비밀번호 : ${param.pw} <br>
	
</body>
</html>