<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>findIDProc.jsp</title>
</head>
<body>
	<div style="text-align:center;">
		<h3> 아이디 찾기 결과</h3>
<%
	String mname = request.getParameter("mname").trim();
	String email = request.getParameter("email").trim();

	dto = dao.findID(mname, email);
	
	if(dto == null) {
		out.println("입력하신 정보와 일치하는 계정이 없습니다.");
	}else {
		out.println("입력한 정보와 일치하는 아이디는 <br>");
		out.println("<strong style='font-size:20px;'>" + dto.getId() + " </strong>");
		out.println("입니다. <br>");
	}//if end
%>
	<br>

		<a href="javascript:window.close()">닫기</a>
	</div>

</body>
</html>