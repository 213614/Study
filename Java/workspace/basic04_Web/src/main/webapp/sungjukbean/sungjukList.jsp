<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="net.sungjuk.*" %>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukList.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
 	<style>
 		body{
 			margin: 10px 0px 0px 10px;
 		}
 		table {
 			text-align: center;
 		}
		#aa {
			text-decoration:none;
			color : black;
		}
		#aa:hover {
			font-weight : bolder;
			font-style : italic;
		}
 	</style>
</head>
<body>
	<h3>성적 목록</h3>

<div class="container mt-3">	
	<table class="table">
		<tr class="table-dark">
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>등록일</th>
		</tr>
<%
	ArrayList<SungjukDTO> list = dao.list();
	if (list == null) {
		out.println("<tr>"); 
		out.println("	<td colspan='6'> 내용 없음 </td>"); 
		out.println("</tr>"); 
	}else {
		for(int i=0; i<list.size(); i++){
			dto = list.get(i);
%>
			<tr>
				<td><a href="sungjukRead.jsp?snum=<%=dto.getSnum()%>" id="aa"><%= dto.getUname() %></a></td>
				<td><%= dto.getKor() %></td>
				<td><%= dto.getEng() %></td>
				<td><%= dto.getMat() %></td>
				<td><%= dto.getWdate().substring(0, 10) %></td>
			</tr>
<%
		}
	}//if end
%>
	</table>
</div>

	<p><a href="sungjukForm.jsp">작성</a></p>
	
</body>
</html>