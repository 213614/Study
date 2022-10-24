<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file = "ssi.jsp" %>
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 pdsRead.jsp -->
	<h3>포토갤러리 상세보기</h3>
	<p><a href="pdsForm.jsp">사진올리기</a></p>
<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno"));
	
	dto = dao.read(pdsno);
	if(dto == null){
		out.println("게시글 없음");
	}else {
		dao.incrementCnt(pdsno); //조회수증가
%>
	<table class="table table-condensed" style="vertical-align:middle; font-size:15px;">
		<tr> 
			<th>글제목</th>
			<td><%= dto.getSubject()%></td>
		</tr>
		<tr>
			<th>사진</th>
			<td><img src="../storage/<%= dto.getFilename()%>" style="width:50%; height:50%;"></td>
		</tr>
		<tr>
			<th>파일 크기</th>
			<td><%= Utility.toUnitStr(dto.getFilesize()) %></td>
			<!--       ↑ KB로 계산해주는 객체	 -->
		</tr>	
		<tr>
			<th>작성자</th>
			<td><%= dto.getWname() %></td>
		</tr>	
		<tr>
			<th>조회수</th>
			<td><%= dto.getReadcnt() %></td>
		</tr>	
		<tr>
			<th>작성일</th>
			<td><%= dto.getRegdate().substring(0, 10) %></td>
		</tr>
	</table>
	
	<div class="btn-group">
		<input type="button" value="수정" class="btn btn-default" onclick="location.href='pdsUpdate.jsp?pdsno=<%=pdsno%>'">
		<input type="button" value="삭제" class="btn btn-default" onclick="location.href='pdsDel.jsp?pdsno=<%=pdsno%>'">
	</div>
<%
	}
%>
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->