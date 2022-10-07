<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukDel.jsp</title>
</head>
<body>
	<h3>성적 삭제</h3>
<%
	int snum=Integer.parseInt(request.getParameter("snum"));
	int cnt =dao.delete(snum);
	
	if(cnt==0) {
		out.println("<p>성적 삭제 실패</p>");
		out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
	} else {
		out.println("<script>");
		out.println("	alert('성적이 삭제되었습니다.');");
		out.println("	location.href='sungjukList.jsp';");	// 목록페이지로 이동
		out.println("</script>");
	}//if end
%>

	<p>
		<a href="sungjukForm.jsp">작성</a>
		　
		<a href="sungjukList.jsp">목록</a>
	</p>
</body>
</html>