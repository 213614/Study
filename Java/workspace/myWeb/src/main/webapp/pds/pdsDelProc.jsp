<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file = "ssi.jsp" %>
<%@ include file = "../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 pdsDelProc.jsp -->
	<h3>사진 삭제 결과</h3>
<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno"));
	String passwd = request.getParameter("passwd").trim();
	
	String saveDir = application.getRealPath("/storage");
	// → 첨부된 파일을 삭제하기 위해 파일이 저장된 실제 경로값을 변수에 저장
	
	int cnt = dao.delete(pdsno, passwd, saveDir);
	if (cnt == 0){
		out.println("<p>비밀번호가 일치하지 않습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
	}else {
		out.println("<script>");
		out.println("	alert('사진이 삭제되었습니다.');");
		out.println("	location.href='pdsList.jsp';");
		out.println("</script>");
	}//if end
%>
	
	
	
	
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->