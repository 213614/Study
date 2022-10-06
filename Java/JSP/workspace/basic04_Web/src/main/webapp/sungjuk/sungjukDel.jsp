<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import = "java.sql.Connection" %>
<%@page import = "java.sql.PreparedStatement" %>
<%@page import = "java.sql.DriverManager" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukDel.jsp</title>
</head>
<body>
	<h3>성적 삭제</h3>
<%
	//한글 인코딩 
	request.setCharacterEncoding("UTF-8");

	int snum = Integer.parseInt(request.getParameter("snum"));

	Connection con = null;
	PreparedStatement pstmt = null;	
	
	try {
	
		String url 		="jdbc:oracle:thin:@localhost:1521:xe\r\n";
		String user 	= "system";		
		String password = "1234";
		String driver   = "oracle.jdbc.driver.OracleDriver"; 	
		Class.forName(driver);	
		con = DriverManager.getConnection(url, user, password);
		
		//out.println("오라클 DB 서버 연결 성공");
		
		StringBuilder sql = new StringBuilder();
		sql.append(" DELETE FROM sungjuk ");
		sql.append(" WHERE snum = ? ");
		
		pstmt = con.prepareStatement(sql.toString()); // SQL문 변환 작업
		pstmt.setInt(1, snum);


		int cnt = pstmt.executeUpdate();
		
		if(cnt==0) {
			out.println("<p>성적 삭제 실패</p>");
			out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
		} else {
			out.println("<script>");
			out.println("	alert('성적이 삭제되었습니다.');");
			out.println("	location.href='sungjukList.jsp';");	// 목록페이지로 이동
			out.println("</script>");
		}//if end

	}catch(Exception e){
		out.println("오라클 DB 연결 실패 : " + e);
	}finally {
		try{
			if(con !=null) { pstmt.close(); }
		}catch(Exception e){}
		try{
			if(con !=null) { con.close(); }
		}catch(Exception e){}
	}//end
	
	
%>
	<p>
		<a href="sungjukForm.jsp" type="button" class="btn btn-light btn-sm">작성</a>
		　
		<a href="sungjukList.jsp" type="button" class="btn btn-light btn-sm">목록</a>
	</p>
</body>
</html>