<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %> 
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->
	<!-- 본문 시작 bbsDel.jsp -->
	<h3> 삭제 </h3>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	
	// 성적 게시판과 다르게 글 작성 비밀번호와 일치해야 삭제 가능 (글번호:bbsno와 passwd값이 일치해야 삭제)
	// 비밀번호는 사용자에게 입력받는 값! = 비밀번호를 작성할 수 있는 form양식을 만들어줘야함 
%>
	<div class="container">
		<form class="form-inline" method="post" action="bbsDelProc.jsp" onsubmit="return pwCheck()"><!-- myscript.js -->
			<input type="hidden" name="bbsno" id="bbsno" value="<%= bbsno %>">
			
			<input type="hidden" name="col" value="<%= col %>">
			<input type="hidden" name="word" value="<%= word %>">
			<input type="hidden" name="nowPage" value="<%= nowPage %>">
			
			<table style=" border:none; margin-left:auto; margin-right:auto;">
				<tr>
					<td>
						<input type="password" name="passwd" id="passwd" size="30" placeholder="비밀번호" class="form-control" required>
						<input type="submit" value="삭제" class="btn btn-default">
						<a href="bbsList.jsp?col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>" class="btn btn-default">목록</a>
					</td>
					
				</tr>
				
			</table>
		</form>
	</div>
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->