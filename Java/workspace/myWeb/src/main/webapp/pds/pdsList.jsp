<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file = "ssi.jsp" %>
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 pdsList.jsp -->
	<h3>포토갤러리</h3>
	<p><a href="pdsForm.jsp">사진올리기</a></p>
<%
	ArrayList<PdsDTO> list = dao.list();
	if(list == null){
		out.println("관련 자료 없음");
	}else {
%>

	<table class="table table-condensed" style="vertical-align:middle; font-size:15px;">
		<thead>
			<tr>
				<th class="lith">제목</th>
				<th class="lith">사진</th>
				<th class="lith">조회수</th>
				<th class="lith">작성자</th>
				<th class="lith">작성일</th>
			</tr>
		</thead>
		
		<tbody>
<%
			for(int i=0; i<list.size(); i++){
				dto = list.get(i);			
%>
				<tr>
					<td><a href="pdsRead.jsp?pdsno=<%= dto.getPdsno() %>"><%= dto.getSubject() %></a></td>
					<td><img src="../storage/<%= dto.getFilename() %>" width="50"></td>
					<td><%= dto.getReadcnt() %></td>
					<td><%= dto.getWname() %></td>
					<td><%= dto.getRegdate().substring(0, 10) %></td>
				</tr>

<%
			}//for end
			out.print("		</tbody>");
			out.print("</table>");
			out.println("전체 글 개수 : " + list.size());
	}//if end

%>
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->