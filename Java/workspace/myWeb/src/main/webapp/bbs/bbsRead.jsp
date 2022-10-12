<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %> 
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->
	<!-- 본문 시작 bbsRead.jsp -->
	<h3>게시글</h3>
	<p>
		<a href="bbsForm.jsp" class="btn btn-link">작성</a>
		&nbsp;&nbsp;  
		<a href="bbsList.jsp" class="btn btn-link">목록</a>
	</p>
	
	<div class="container">
<%
		int bbsno = Integer.parseInt(request.getParameter("bbsno"));
		
		dto = dao.read(bbsno);
		
		if (dto == null) {
			out.print("해당 글 없음");
		}else {
			dao.incrementCnt(bbsno); 	//→ 조회수 증가
%>

			<table class="table table-condensed">
					<tr>
						<td><%= dto.getBbsno()%></td>
						<td colspan="3" class="ti"><%= dto.getSubject()%></td>
						<td><%= dto.getWname() %></td>
						<td><%= dto.getIp() %></td>
						<td><%= dto.getReadcnt() %></td>
						<td><%= dto.getRegdt().substring(0, 10) %></td>
					</tr>
					<tr>
						<td colspan="8" style="text-align:left;">
<%
						String content = Utility.convertChar(dto.getContent());
						out.print(content);

%>
						</td>
					</tr>
			</table>
			
			<br>
			<input type="button" value="답변" class="btn btn-link" onclick="location.href='bbsReply.jsp'">
			<input type="button" value="수정" class="btn btn-link" onclick="location.href='bbsUpdate.jsp?bbsno=<%= bbsno %>'">
			<input type="button" value="삭제" class="btn btn-link" onclick="location.href='bbsDel.jsp?bbsno=<%= bbsno %>'">
<%
		}//if end
%>	
	</div>
	
	
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->