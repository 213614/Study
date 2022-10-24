<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file = "../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 pdsDel.jsp -->
	<!-- pdsno와 passwd가 일치하면 행 삭제 및 첨부파일 삭제하기 -->
	<h3>사진 삭제</h3>
<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno"));
%>
	<p><a href="pdsList.jsp">포토갤러리</a></p>
	<form method="post" action="pdsDelProc.jsp" onsubmit="return pwCheck2()"><!-- myscript.js -->
		<input type="hidden" name="pdsno" value="<%=pdsno%>">
		<table class="table table-condensed">
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd" id="passwd" class="form-control" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="삭제" class="btn btn-default">
				</td>
			</tr>
		</table>
	</form>
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->