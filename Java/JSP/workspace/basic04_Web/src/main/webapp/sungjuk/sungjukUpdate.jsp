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
	<title>sungjukUpadate.jsp</title>
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
		th { 
			text-align:center;
			vertical-align: middle;
			background-color: #a2c3d7;
			color: white;
		}
		.btn { color: #a2c3d7; }
		.btn:hover {
			 background-color: #a2c3d7;
		 	 color : white;
		}
		form { 
			display: inline-block; 
			text-align: left;
			width:500px;
		}
		.sr { 
			color : #8c8c8c;
			border: none;
			background-color: white;  
		}
	</style>
</head>
<body>
	<h3>성적 수정</h3><br>
	
<%
	// 수정하고자 하는 행을 가져온다
	// ex. sungjukUpdate.jsp?snum=수정하고싶은행
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
			// ②. ①의 내용을 폼에 출력한다. sungjukForm.jsp 참조
%>			
	<form name="sungjukFrm" id="sungjukFrm" method="post" action="sungjukUpdateProc.jsp">
		
		<input type="hidden" name="snum" value="<%=rs.getInt("snum") %>" >
		
		<div class="container">
		<table  class="table table-bordered">
			<tr>
			  <th>이름　</th>
			  <td><input type="text" name="uname" value="<%=rs.getString("uname") %>" maxlength="20" required autofocus class="form-control"></td>
			  <!-- value값을 getPar~하면 된다 -->
			</tr> 
			
			<tr>
			  <th>국어　</th>
			  <td><input type="number" name="kor" value="<%=rs.getInt("kor") %>" size="5" min="0" max="100" placeholder="숫자만 입력" class="form-control"></td>
			</tr>
			
			<tr>
			  <th>영어　</th>
			  <td><input type="number" name="eng" value="<%=rs.getInt("eng") %>" size="5" min="0" max="100" placeholder="숫자만 입력" class="form-control"></td>
			</tr> 
			
			<tr>
			  <th>수학　</th>
			  <td><input type="number" name="mat" value="<%=rs.getInt("mat") %>" size="5" min="0" max="100" placeholder="숫자만 입력" class="form-control"></td>
			</tr>
			
			<tr>
			  <th>주소　</th>
			  <td>
			  <% String addr = rs.getString("addr"); %>
			      <select name="addr" class="form-control">
		              <option value="Seoul" <% if(addr.equals("Seoul")) { out.print("selected"); } %>>서울</option>
		              <option value="Jeju"  <% if(addr.equals("Jeju")) { out.print("selected"); } %> >제주</option>
		              <option value="Suwon" <% if(addr.equals("Suwon")) { out.print("selected"); } %>>수원</option>
		              <option value="Busan" <% if(addr.equals("Busan")) { out.print("selected"); } %>>부산</option>
			      </select> 
			  </td>
			</tr>
			
			<tr>
			  <td colspan="2" align="center">
			     <input type="submit" value="수정" class="sr">
			     <input type="reset"  value="취소" class="sr">
			  </td>
			</tr>
		</table>
		</div>
	</form>
		
	<p><a href="sungjukList.jsp" type="button" class="btn btn-light btn-sm">목록</a></p>
		
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