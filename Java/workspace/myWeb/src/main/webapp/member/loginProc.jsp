<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %> 
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->
	<!-- 본문 시작 loginProc.jsp -->
	<h3>로그인 결과</h3>
<%
	String id 	  = request.getParameter("id").trim();
	String passwd = request.getParameter("passwd").trim();
	
	dto.setId(id);
	dto.setPasswd(passwd);

	String mlevel = dao.loginProc(dto);
	if (mlevel == null ) {
		out.println("<p>로그인에 실패하였습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
	} else {
		//로그인 성공
		out.println(id + "님 환영합니다. <br>");
		out.println("회원 등급 : " + mlevel + "<br>");
	}//if end
%>
	
	
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->