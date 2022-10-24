<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %> 
<%@ include file = "../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 noticeDel.jsp -->
	<h3> 삭제 </h3>
	
<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));
%>

<div class="container">
		<form method="post" action="noticeDelProc.jsp?noticeno=<%= noticeno %>">
					
					<p style="text-align:center;">
						해당 공지사항을 삭제하시겠습니까?
					</p>
					
					<div class="btn-group">
						<input type="submit" value="삭제" class="btn btn-default">
						<a href="noticeRead.jsp?noticeno=<%= noticeno %>&col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>" class="btn btn-default">취소</a>
					</div>
		</form>
	</div>
	
	
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->