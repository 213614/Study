<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>02_scopeResult.jsp</title>
</head>
<body>
	<h3>웹 페이지의 Scope(유효범위) 결과</h3>
<%
	out.print("①. pageContext 영역 : " + pageContext.getAttribute("one")   + "<hr>");
	out.print("②. request 영역 : " 	  + request.getAttribute("two") 	  + "<hr>");
	out.print("③. session 영역 : " 	  + session.getAttribute("three")     + "<hr>");
	out.print("④. application 영역 : " + application.getAttribute("uid")   + "<hr>");
%>
</body>
</html>