<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %>
<%@ include file = "../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 noticeUpdate.jsp -->
	<h3>게시글 수정</h3>
<div class="container">
<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));

	dto = dao.read(noticeno);
	if(dto == null) {
		out.print("존재하지 않는 게시글입니다.");
	}else {
%>
	<form name="notifrm" id="notifrm" method="post" action="noticeUpdateProc.jsp?noticeno=<%= noticeno %>" onsubmit="return notiCheck()">
										      <!-- 제대로 입력되었는지 확인 후 서버로 submit → myscript.js에 함수 작성 -->
			<table class="table table-condensed">
			
				<tr>
				   <td colspan="2" style="border-top:none;"><input type="text" name="subject" id="subject"  placeholder="제목" value="<%= dto.getSubject() %>" class="form-control" maxlength="100" required></td>
				</tr>
				
				<tr>
				   <td colspan="2" style="border-top:none;"><textarea rows="10"  class="form-control" name="content" id="content" placeholder="내용"><%= dto.getContent() %></textarea></td>
				</tr>
				
			</table>
		
			<div class="btn-group">
		       <input type="submit" value="수정" class="btn btn-default">
	       	   <input type="reset"  value="취소" class="btn btn-default">
		       <a href="noticeList.jsp?col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>" class="btn btn-default">목록</a>	
			</div>
		</form>
<%
	}//if end
%>	
	</div>
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->