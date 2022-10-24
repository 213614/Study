<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %>
<%@ include file = "../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 noticeIns.jsp -->
<%
	// 사용자가 입력한 값 passwd,subject,content\
	String passwd  = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	dto.setSubject(subject);
	dto.setContent(content);
	
	int cnt = dao.create(dto);
	if(cnt == 0){
		out.println("<p>작성 실패</p>");
		out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
	}else {
		out.println("<script>");
		out.println("	alert('새로운 공지사항이 작성되었습니다.');");
		out.println("	location.href='noticeList.jsp';");
		out.println("</script>");
	}//if end
%>	
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->