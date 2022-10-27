<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	 ● Directive (지시자)의 종류
	  ○ <%@ page %> 
	  ○ <%@ include %> : 다른 파일(페이지)연결 (공통 코드 삽입 : ssi.jsp연결시)
	  ○ <%@ taglib %>  : custom tag(사용자 정의 태그) 사용시 지정하고 사용해야한다
--%> 

<%-- JSTL을 사용하려면 Directive를 지정한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTLtest1.jsp</title>
</head>
<body>
	<h3>* JSTL(JSP Standard Tag Library) : JSP 전용 태그 *</h3>
	
	1. JSP 변수 선언 <br>
	<% int a = 3; %>
	a: <%= a %>
	
	<hr>
	
	2. JSTL<br>
	<!-- 태그 형태대로 if문,for문 같은 제어문,반복문 사용 가능 -->
	<c:set var = "b" value = "5"></c:set>		<!-- int b=5; -->
	<c:set var = "c" value = "7"/> 				<!-- int c=7; -->
	b　　: ${b}<br>
	c　　: ${c}<br>
	b+c : ${b+c}<br>
	b*c : ${b*c}<br>
	
	3. 출력 <br>
	<c:out value=" d : 2"></c:out><br>
	<c:out value=" b : ${b}"></c:out><br>
	<c:out value=" c : ${c}"></c:out><br>
	<c:out value="b+c : ${b+c}"></c:out><br>
	<c:out value="b*c : ${b*c}"></c:out><br>
	
	<hr>
	
	4. b,c 변수 제거 <br>
	<c:remove var="b"/>
	<c:remove var="c"/>
	
	<c:out value=" b : ${b}"></c:out><br>		<!-- 빈 문자열 -->
	<c:out value=" c : ${c}"></c:out><br>		<!-- 빈 문자열 -->
	<c:out value="b+c : ${b+c}"></c:out><br>	<!-- 0 -->
	
	<hr>
	
	5. 자바 객체 선언도 가능 <br>
	<c:set var="dt" value="<%= new Date() %>"></c:set>
	오늘 날짜 : ${dt} <br>
	오늘 날짜 : <c:out value="${dt}"></c:out> <br> 
	
	
	
		
</body>
</html>