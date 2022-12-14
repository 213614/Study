<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %> 
<%@ include file="../member/auth.jsp" %>
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->
	<!-- 본문 시작 bbsRead.jsp -->
	<h3>게시글</h3>
	
	<div class="container">
		<table id="bt1" > 
					<tr>
						<td>
							<a href="bbsForm.jsp" class="ud">작성</a>
							&nbsp;
							<!--<a href="bbsList.jsp" class="ud">목록</a>-->
							<!--<a href="bbsList.jsp?col=<%= col %>&word=<%= word %>" class="ud">목록</a>-->
							<a href="bbsList.jsp?col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>" class="ud">목록</a>
						</td>
					</tr>
		</table>
	
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
					
						<td colspan="8" style="text-align:left; padding-left:10px;"><br>
<%
						String content = Utility.convertChar(dto.getContent());
						out.print(content);

%>
						</td>
					</tr>
			</table>

			<br>
			<div class="btn-group">
			<input type="button" value="답변" class="btn btn-default" onclick="location.href='bbsReply.jsp?bbsno=<%= bbsno %>&col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>'">
			<input type="button" value="수정" class="btn btn-default" onclick="location.href='bbsUpdate.jsp?bbsno=<%= bbsno %>&col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>'">

<%			if(s_mlevel.equals("A1")) { %>
				<input type="button" value="삭제" class="btn btn-default" onclick="location.href='bbsDel.jsp?bbsno=<%= bbsno %>&col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>'">
<%  		}//if end %>
			
			</div>
<%
		}//if end
%>	
	</div>
	
	
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->