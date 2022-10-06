<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import = "java.sql.Connection" %>
<%@page import = "java.sql.PreparedStatement" %>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukUpadateProc.jsp</title>
</head>
<body>
	<h3>성적 수정 결과</h3>
	
<% 
	request.setCharacterEncoding("UTF-8");
	
	//사용자가 입력한(수정한) 정보를 가져와서 변수에 담는다
	int snum	 = Integer.parseInt(request.getParameter("snum"));	
	String uname = request.getParameter("uname").trim();
	int kor 	 = Integer.parseInt(request.getParameter("kor").trim());
	int eng 	 = Integer.parseInt(request.getParameter("eng").trim());
	int mat 	 = Integer.parseInt(request.getParameter("mat").trim());
	int aver 	 = (kor+eng+mat)/3;
	String addr  = request.getParameter("addr").trim();

	
	Connection con = null;
	PreparedStatement pstmt = null;	
	
	try {
	
		String url 		="jdbc:oracle:thin:@localhost:1521:xe\r\n";
		String user 	= "system";		
		String password = "1234";
		String driver   = "oracle.jdbc.driver.OracleDriver"; 	
		Class.forName(driver);	
		con = DriverManager.getConnection(url, user, password);
				
		StringBuilder sql = new StringBuilder();
		sql.append(" UPDATE sungjuk ");
		sql.append(" SET uname = ? ");
		sql.append("	,kor = ? ");
		sql.append(" 	,eng = ? ");
		sql.append(" 	,mat = ? ");
		sql.append("    ,aver = ? ");
		sql.append("    ,addr = ? ");
		sql.append("    ,wdate = sysdate ");
		sql.append(" WHERE snum = ? ");

		pstmt = con.prepareStatement(sql.toString()); // SQL문 변환 작업

		pstmt.setString(1, uname);
		pstmt.setInt   (2, kor);
		pstmt.setInt   (3, eng);
		pstmt.setInt   (4, mat);
		pstmt.setInt   (5, aver);
		pstmt.setString(6, addr);
		pstmt.setInt   (7, snum);

		int cnt = pstmt.executeUpdate();
		
		if(cnt==0) {
			out.println("<p>성적 수정 실패</p>");
			out.println("<p><a href='javascript:history.back()'>[다시 시도]</a></p>");
		} else {
			out.println("<script>");
			out.println("	alert('수정이 완료되었습니다.');");
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










</body>
</html>