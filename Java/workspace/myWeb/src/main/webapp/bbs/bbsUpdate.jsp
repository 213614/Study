<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->
	<!-- 본문 시작 bbsUpdate.jsp -->
	<h3>게시글 수정</h3>
	<div class="container">
	
	<!-- bbsno가 일치하는 행을 가져와서 수정 폼에 출력 -->
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	
	dto=dao.read(bbsno);
	
	if(dto==null){
		out.println("존재하지않는 게시글입니다.");
	}else{
%>
	<form name="bbsfrm" id="bbsfrm" method="post" action="bbsUpdateProc.jsp?col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>" onsubmit="return bbsCheck()">
												 <!-- 제대로 입력되었는지 확인 후 서버로 submit → myscript.js에 함수 작성 -->
		<input type="hidden" name="bbsno" value="<%= bbsno %>">
		
		<!--  
		<input type="hidden" name="col" value="<%= col %>">
		<input type="hidden" name="word" value="<%= word %>">
		-->
		
		<table class="table table-condensed">
			<tr>
			   <td><input type="text" name="wname" id="wname" value="<%= dto.getWname() %>" class="form-control" maxlength="20" required></td>
			   <td><input type="password" name="passwd" id="passwd" placeholder="비밀번호" class="form-control" maxlength="10" required></td>
			</tr>
			
			<tr>
			   <td colspan="2"><input type="text" name="subject" id="subject" value="<%= dto.getSubject() %>" class="form-control" maxlength="100" required></td>
			</tr>
			
			<tr>
			   <td colspan="2"><textarea rows="10"  class="form-control" name="content" id="content"><%= dto.getContent() %></textarea></td>
			</tr>
		</table>				
		<div class="btn-group">
	       <input type="submit" value="수정" class="btn btn-default">
	       <input type="reset"  value="취소" class="btn btn-default">
	       <a href="bbsList.jsp?col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>" class="btn btn-default">목록</a>
		</div>
		
	</form>	
<%
	}//if end
%>
	
	</div>	
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->