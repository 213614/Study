<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>findPWProc.jsp</title>
</head>
<body>
	<div style="text-align:center;">
		<h3> 비밀번호 찾기 결과</h3>
<%
	String id = request.getParameter("id").trim();
	String email = request.getParameter("email").trim();

	int cnt = dao.findPW(id, email);
	
	if(cnt == 0) {
		out.println("입력하신 정보와 일치하는 계정이 없습니다.");
		out.println("<p><a href='javascript:history.back()'> 다시 시도 </a></p>");
	}else {
		
		// 해당 계정이 있으면 임시 비밀번호(랜덤10자리)발급 후 아이디와 비밀번호 이메일로 전송 
		// DB엔 그 임시 비밀번호로 UPDATE
		
		out.println("입력하신 이메일 주소로<br>");
		out.println("임시 비밀번호 발급 완료하였습니다.<br>");
		
	}//if end
%>
	<br>

		<a href="javascript:window.close()">닫기</a>
	</div>

</body>
</html>