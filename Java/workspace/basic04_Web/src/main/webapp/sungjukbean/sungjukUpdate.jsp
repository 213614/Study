<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukUpdate.jsp</title>
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
 	</style>
</head>
<body>
	<h3>성적 수정</h3><br>
	
	<p>
		<a href="sungjukForm.jsp">작성</a>
		<a href="sungjukList.jsp">목록</a>
	</p>
	
<%

	int snum=Integer.parseInt(request.getParameter("snum"));

	dto = dao.read(snum); 
		
	if (dto == null) {
		out.println("내용 없음");
	} else {
%>


		<form name="sungjukFrm" id="sungjukFrm" method="post" action="sungjukUpdateProc.jsp">
		
		<input type="hidden" name="snum" value="<%= snum %>" >
		
		<div class="container">
		<table  class="table table-bordered">
			<tr>
			  <th>이름　</th>
			  <td><input type="text" name="uname" value="<%= dto.getUname() %>" maxlength="20" required autofocus class="form-control"></td>
			  <!-- value값을 getPar~하면 된다 -->
			</tr> 
			
			<tr>
			  <th>국어　</th>
			  <td><input type="number" name="kor" value="<%= dto.getKor() %>" size="5" min="0" max="100" placeholder="숫자만 입력" class="form-control"></td>
			</tr>
			
			<tr>
			  <th>영어　</th>
			  <td><input type="number" name="eng" value="<%= dto.getEng() %>" size="5" min="0" max="100" placeholder="숫자만 입력" class="form-control"></td>
			</tr> 
			
			<tr>
			  <th>수학　</th>
			  <td><input type="number" name="mat" value="<%= dto.getMat() %>" size="5" min="0" max="100" placeholder="숫자만 입력" class="form-control"></td>
			</tr>
			
			<tr>
			  <th>주소　</th>
			  <td>
			  <% String addr = dto.getAddr(); %>
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
			     <input type="submit" value="수정">
			     <input type="reset"  value="취소">
			  </td>
			</tr>
		</table>
		</div>
	</form>							
<%
	}//if end

%>
	
</body>
</html>