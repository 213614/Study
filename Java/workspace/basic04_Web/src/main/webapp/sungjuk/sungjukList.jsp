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
	<title>sungjukList.jsp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
		body { 
			margin-top: 20px; 
			text-align: center;
		}
		.hov:hover { background-color: #E5EEF4; }
		#title {
			 background-color: #a2c3d7;
			 color : white;
		}
		.btn { color: #a2c3d7; }
		.btn:hover {
			 background-color: #a2c3d7;
		 	 color : white;
		}
		a { color : black; }
		a:hover, a:active {
			color : black;
			font-weight: bolder;
			text-decoration: none;
		} 
		
	</style>
</head>
<body>
	<h3>성적 목록</h3><br>
	
	<div class="container">
	<table class="table table-bordered">
		<tr id="title">
			<th>번호</th>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>등록일</th>
		</tr>
	
<%
	//한글 인코딩 
	request.setCharacterEncoding("UTF-8");
	
	Connection con = null;
	PreparedStatement pstmt = null;	
	ResultSet rs = null;
	
	try {
	
		String url 		="jdbc:oracle:thin:@localhost:1521:xe\r\n";
		String user 	= "system";		
		String password = "1234";
		String driver   = "oracle.jdbc.driver.OracleDriver"; 	
		Class.forName(driver);	
		con = DriverManager.getConnection(url, user, password);
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT snum, uname, kor, eng, mat, wdate ");
		sql.append(" FROM sungjuk ");
		sql.append(" ORDER BY snum DESC ");

		pstmt = con.prepareStatement(sql.toString()); // SQL문 변환 작업
		
		rs = pstmt.executeQuery(); 		
		
		if (rs.next()) {
			
			do {
%>
				 <tr class="hov">
				 	<td><%=rs.getString("snum") %></td>
				 	<td><a href="sungjukRead.jsp?snum=<%=rs.getInt("snum") %>"><%=rs.getString("uname") %></a></td>
				 	<td><%=rs.getString("kor") %></td>
				 	<td><%=rs.getString("eng") %></td>
				 	<td><%=rs.getString("mat") %></td>
				 	<td><%=rs.getString("wdate").substring(0, 10) %></td>
				 </tr>
<%
			}while(rs.next()); 	
			
		} else { 
			out.println("<tr>"); 
			out.println("	<td colspan='6'> 내용 없음 </td>"); 
			out.println("</tr>"); 
		}//if end

	}catch(Exception e){
		out.println("오라클 DB 연결 실패 : " + e);
	}finally {
		try {
			if(rs != null) { rs.close(); }
		}catch(Exception e) {}
		try{
			if(con !=null) { pstmt.close(); }
		}catch(Exception e){}
		try{
			if(con !=null) { con.close(); }
		}catch(Exception e){}
	}//end
%>
	</table>
	</div>
	
	<p><a href="sungjukForm.jsp" type="button" class="btn btn-light btn-sm">작성</a></p>
	
</body>
</html>