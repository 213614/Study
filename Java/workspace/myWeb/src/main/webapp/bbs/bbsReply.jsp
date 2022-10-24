<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->
	<!-- 본문 시작 bbsReply.jsp -->
	<h3> 답변 </h3>
	
<div class="container">
	<form name="bbsfrm" id="bbsfrm" method="post" action="bbsReplyProc.jsp" onsubmit="return bbsCheck()">
		<!-- ↓ 부모글의 글번호 가져가기(댓글/답변만, 최초글은 부모글이 없으므로 가져갈 필요 X) -->
		<input type="hidden" name="bbsno" value="<%= request.getParameter("bbsno")%>">																<!-- myscirpt.js에서 유효성검사 -->
		
		<input type="hidden" name="col" value="<%= col %>">
		<input type="hidden" name="word" value="<%= word %>">
		<input type="hidden" name="nowPage" value="<%= nowPage %>">
		
		<table class="table table-condensed">
				<tr>
				   <td style="border-top:none;"><input type="text" name="wname" id="wname" placeholder="작성자" class="form-control" maxlength="20" required ></td>
				   <td style="border-top:none;"><input type="password" name="passwd" id="passwd" placeholder="비밀번호" class="form-control" maxlength="10" required></td>
				</tr>
				
				<tr>
				   <td colspan="2" style="border-top:none;"><input type="text" name="subject" id="subject"  placeholder="제목" class="form-control" maxlength="100" required></td>
				</tr>
				
				<tr>
				   <td colspan="2" style="border-top:none;"><textarea rows="10"  class="form-control" name="content" id="content" placeholder="내용"></textarea></td>
				</tr>
		</table>		
			
			<div class="btn-group">
		       <input type="submit" value="작성" class="btn btn-default">
	       	   <input type="reset"  value="취소" class="btn btn-default">
		       <a href="bbsList.jsp?col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>" class="btn btn-default">목록</a>	
			</div>	
	</form>
</div>
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->
