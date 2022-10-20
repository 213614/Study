<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- logout.jsp --%>
<%
	// 세션 전부 비우기 (로그인 정보값 다 삭제) == null값 만들기
	session.removeAttribute("s_id");
	session.removeAttribute("s_passwd");
	session.removeAttribute("s_mlevel");

	// 세션 전부 비운 뒤 페이지 이동시켜주기 
	response.sendRedirect("loginForm.jsp");


%>
