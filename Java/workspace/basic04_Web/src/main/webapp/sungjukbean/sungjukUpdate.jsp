<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukUpdate.jsp</title>
</head>
<body>
	<h3>성적 수정</h3><br>
	
	
<%

	int snum=Integer.parseInt(request.getParameter("snum"));

	dto = dao.read(snum); 
		
	if (dto == null) {
		out.println("내용 없음");
	} else {
%>
				<table>
					<tr>
						<th>번호</th>
						<td><%= dto.getSnum() %></td>
					</tr>
					
					<tr>
						<th>이름</th>
						<td><%= dto.getUname() %></td>
					</tr>
					
					<tr>
						<th>국어</th>
						<td><%= dto.getKor() %></td>
					</tr>
					
					<tr>
						<th>영어</th>
						<td><%= dto.getEng() %></td>
					</tr>
					
					<tr>
						<th>수학</th>
						<td><%= dto.getMat() %></td>
					</tr>
					
					<tr>
						<th>평균</th>
						<td><%= dto.getAver() %></td>
					</tr>
					
					<tr>
						<th>주소</th>
						<td><%= dto.getAddr() %></td>
					</tr>
					
					<tr>
						<th>등록일</th>
						<td><%= dto.getWdate() %></td>
					</tr>
				</table>
				
				<br>
				<a href="sungjukUpdate.jsp?snum=<%=snum%>">수정</a>
				&nbsp;&nbsp;
				<a href="sungjukDel.jsp?snum=<%=snum%>">삭제</a>
<%
	}//if end

%>

	<p>
		<a href="sungjukForm.jsp">작성</a>
		<a href="sungjukList.jsp">목록</a>
	</p>
		
	
	
	
</body>
</html>