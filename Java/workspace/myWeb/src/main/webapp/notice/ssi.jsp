<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ssi.jsp 공통 코드 --%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%@ page import="net.utility.*" %>
<%@ page import="net.notice.*" %>

<jsp:useBean id="dao" class="net.notice.NoticeDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.notice.NoticeDTO" scope="page"></jsp:useBean>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	//검색
	String word = request.getParameter("word"); //검색어
	String col  = request.getParameter("col");  //검색칼럼(제목,내용,작성자등)
	 
	word = Utility.checkNull(word); 			// 문자열값이 null이면 빈 문자열("")로 치환
	col	 = Utility.checkNull(col);
	
	
	//페이징 (현재페이지)
	int nowPage = 1;		// 아무런 값을 넘겨받지 못했다면(페이지를 이동하지 않았다면) 기본으로 1페이지를 보여준다 
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}//if end
	

%>