<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file = "ssi.jsp" %>
<%@ include file="../member/auth.jsp" %>
<%@ include file = "../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 noticeRead.jsp -->
	<h3>공지사항</h3><br>
	
	<div class="container">
		<table id="bt1" > 
					<tr>
						<td>
							<%if(s_mlevel == "A1"){%>	
								<a href="noticeForm.jsp" class="ud">작성</a>
								&nbsp;
							<%}//if end%>
							
							<a href="noticeList.jsp?col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>" class="ud">목록</a>
						</td>
					</tr>
		</table>
<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));

	dto = dao.read(noticeno);
	if(dto == null) {
		out.print("존재하지 않는 게시글입니다.");
	}else {
%>

			<table class="table table-condensed">
					<tr>
						<td><%= dto.getNoticeno()%></td>
						<td colspan="6" class="ti"><%= dto.getSubject()%></td>
						<td><%= dto.getRegdt().substring(0, 10) %></td>
					</tr>

					<tr>
					
						<td colspan="8" style="text-align:left; padding-left:10px;"><br>
<%
						String content = Utility.convertChar(dto.getContent());
						out.print(content);

%>
						</td>
					</tr>
			</table>
<%			if(s_mlevel.equals("A1")) { %>
			<br>
			<div class="btn-group">
				<input type="button" value="수정" class="btn btn-default" onclick="location.href='noticeUpdate.jsp?noticeno=<%= noticeno %>&col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>'">
				<input type="button" value="삭제" class="btn btn-default" onclick="location.href='noticeDel.jsp?noticeno=<%= noticeno %>&col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>'">
<%  		}//if end %>
			
			</div>
<%
	}//if end
%>	
	</div>
	
	
	
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->