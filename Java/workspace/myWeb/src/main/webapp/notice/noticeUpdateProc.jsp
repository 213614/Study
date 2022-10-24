<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %>
<%@ include file = "../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 noticeUpdateProc.jsp -->
<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));

	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content");
	
	dto.setNoticeno(noticeno);
	dto.setSubject(subject);
	dto.setContent(content);
	
	int cnt = dao.updateProc(dto);
	
	if(cnt == 0){
		out.println("<p>게시글 수정에 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
	}else {
		out.println("<script>");
		out.println("	alert('게시글이 수정되었습니다.');");
		out.println("	location.href='noticeList.jsp?col="+col+"&word="+word+"&nowPage="+nowPage+"';");
		out.println("</script>");
	}//if end
%>	

	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->