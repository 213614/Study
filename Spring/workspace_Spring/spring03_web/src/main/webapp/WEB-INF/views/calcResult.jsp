<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>calcResult.jsp</title>
</head>
<body>
	<h1>계산 결과</h1>
	
	<h2> JSP 접근 </h2>
	<%= request.getAttribute("message") %> 
	첫번째 숫자 : <%= request.getAttribute("no1") %> <br>
	두번째 숫자 : <%= request.getAttribute("no2") %> <br>
	결과 : <%= request.getAttribute("result") %> <br>
	<%= request.getAttribute("img") %>
	<hr>
	
	<h2> EL 접근 </h2>
	${requestScope.message} 
	첫번째 숫자 : ${requestScope.no1} <br>
	두번째 숫자 : ${requestScope.no2} <br>
	결과 : ${requestScope.result} <br>
	${requestScope.img}
	<hr>
	
	<h2> EL 접근 - Scope 생략 </h2>
	${message} 
	첫번째 숫자 : ${no1} <br>
	두번째 숫자 : ${no2} <br>
	결과 : ${result} <br>
	${img==null ? "" : img} 	<!-- EL안에서 삼항연산자 가능 -->
	<hr>
</body>
</html>