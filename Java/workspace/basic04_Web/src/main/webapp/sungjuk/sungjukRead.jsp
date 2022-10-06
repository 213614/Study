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
	<title>sungjukRead.jsp</title>
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
		#title {
			 background-color: #a2c3d7;
			 color : white;
		}
		.btn { color: #a2c3d7; }
		.btn:hover {
			 background-color: #a2c3d7;
		 	 color : white;
		}
		/*
		.ud { 
			  display: inline-block;
			  color : #a2c3d7; 
			  font-size : 15px;
		}
		.ud:hover {
			  color: #a2c3d7;
			  text-decoration:none;
			  font-weight:bolder;
			  text-align: center;
		}
		
		#up {
	  		  position: absolute;
			  right : 220px;
		}
		*/
		#del:hover {
	  		  background-color: #991A1A;
	  		  color: white;
		}
		
	</style>
</head>
<body>
	<h3>상세보기</h3><br>
	
<%
	
	// sungjukList.jsp에서 snum 가져와서 그 해당 번호에 맞는 사람의 성적을 상세 페이지에서 보여줘야함 
	// ex. sungjukRead.jsp?snum=3
	int snum=Integer.parseInt(request.getParameter("snum"));

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
		sql.append(" SELECT snum, uname, kor, eng, mat, aver, addr, wdate ");
		sql.append(" FROM sungjuk ");
		sql.append(" WHERE snum = ? ");

		pstmt = con.prepareStatement(sql.toString()); // SQL문 변환 작업
		pstmt.setInt(1, snum);
		
		rs = pstmt.executeQuery(); 		
		
		if (rs.next()) {
%>
		
		<div class="container" style="position:relative">
			<table class="table table-bordered">
				<tr id="title">
					<th>번호</th>
					<th>이름</th>
					<th>국어</th>
					<th>영어</th>
					<th>수학</th>
					<th>평균</th>
					<th>주소</th>
					<th>등록일</th>
				</tr>
				
				<tr>
					<td><%=rs.getInt("snum") %></td>
					<td><%=rs.getString("uname") %></td>
					<td><%=rs.getInt("kor") %></td>
					<td><%=rs.getInt("eng") %></td>
					<td><%=rs.getInt("mat") %></td>
					<td><%=rs.getInt("aver") %></td>
					<td>
<%
					switch(rs.getString("addr")){
					case "Seoul" : out.print("서울");  break;
					case "Suwon" : out.print("수원");  break;
					case "Jeju"  : out.print("제주도"); break;
					case "Busan" : out.print("부산");  break;
					}
%>
					</td>					
					<td><%=rs.getString("wdate") %></td>
				</tr>
				
				
			</table>
		</div>
		
	<p>
		<a href="sungjukUpdate.jsp?snum=<%=snum%>" class="btn btn-light btn-sm">수정</a>
		&nbsp;
		<a href="sungjukDel.jsp?snum=<%=rs.getInt("snum")%>" class="btn btn-light btn-sm" id="del">삭제</a>
		<!-- snum와 rs.getInt("snum") 같은 값을 가지고 감 -->
		&nbsp;
		<a href="sungjukList.jsp" type="button" class="btn btn-light btn-sm">목록</a>
		<!--<a href="sungjukForm.jsp" type="button" class="btn btn-light btn-sm">작성</a>-->
	</p>
		
<%			
		} else { 
			out.println("내용 없음"); 
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
	
</body>
</html>