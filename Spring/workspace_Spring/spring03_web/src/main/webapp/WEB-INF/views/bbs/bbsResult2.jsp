<%@page import="kr.co.itwill.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bbsResult2.jsp</title>
</head>
<body>

	<h3>* 결과 *</h3>

	<h4> JSP </h4>
<%
	BbsDTO dto = (BbsDTO)request.getAttribute("dto");
	
	out.println("작성자 : "  + dto.getWname()   + "<br>");
	out.println("제　목 : "  + dto.getSubject() + "<br>");
	out.println("내　용 : "  + dto.getContent() + "<br>");
	out.println("비밀번호 : " + dto.getPasswd()  + "<br>");
%>

<hr>

	<h5> EL </h5>
	<!--      ↓ DTO 클래스에 반드시 getter·setter가 있어야만 표현 가능 -->
	작성자 : ${dto.wname} <br>
	제　목 : ${dto.subject} <br>
	내　용 : ${dto.content} <br>
	비밀번호 : ${dto.passwd} <br>



</body>
</html>