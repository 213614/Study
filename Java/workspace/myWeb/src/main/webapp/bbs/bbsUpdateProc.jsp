<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->
	<!-- 본문 시작 bbsUpdateProc.jsp -->
	<!-- 수정 요청한 정보를 가져와서, DB에 가서 행 수정 -->
	<h3>수정 결과</h3>
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));

	// 사용자가 입력한 정보(수정한 정보) 불러오기
	String wname = request.getParameter("wname");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String passwd = request.getParameter("passwd");
	String ip = request.getRemoteAddr();
	
	// 객체에 담기
	dto.setBbsno(bbsno);
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);

	int cnt = dao.updateproc(dto);
	
	if(cnt==0) {
		out.println("<p>비밀번호가 일치하지 않습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
	} else {
		out.println("<script>");
		out.println("	alert('게시글이 수정되었습니다.');");
		out.println("	location.href='bbsList.jsp?col="+col+"&word="+word+"&nowPage="+nowPage+"';");
		//ex. = http://localhost:9090/myweb/bbs/bbsList.jsp?col=&word=&nowPage=5
		
		//out.println("	location.href='bbsList.jsp?col="+col+"&word="+word+"';");
		//ex. = http://localhost:9090/myweb/bbs/bbsList.jsp?col=subject_content&word=test
		
		//out.println("	location.href='bbsList.jsp';");	// 목록페이지로 이동
		out.println("</script>");
	}//if end
%>
	
	
	
	
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->
