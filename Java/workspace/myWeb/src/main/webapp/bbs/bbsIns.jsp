<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->
	<!-- 본문 시작 bbsIns.jsp -->
<%
	// 사용자가 입력 요청한 정보 불러오기
	String wname = request.getParameter("wname").trim();
	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content").trim();
	String passwd = request.getParameter("passwd").trim();
	String ip = request.getRemoteAddr(); // 요청 PC의 ip주소 return

	// dto 객체에 담기
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);
	
	int cnt = dao.create(dto);
	
	if(cnt==0) {
		out.println("<p>게시글 작성 실패</p>");
		out.println("<p><a href='javascript:history.back()'>[다시 시도]</a></p>");
	} else {
		out.println("<script>");
		out.println("	alert('게시글이 작성되었습니다.');");
		out.println("	location.href='bbsList.jsp';");	// 목록페이지로 이동
		out.println("</script>");
	}//if end
%>	
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->