<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
	<!-- 본문 시작 bbsList.jsp -->
	<h3>*글 목록*</h3>
		<p><a href="bbsForm.jsp" class="btn btn-link">작성</a></p>
	<div class="container">
		<table class="table table-condensed">
			<thead>
				<tr>
					<th class="lith">글번호</th>
					<th colspan="3" class="lith ti">제목</th>
					<th class="lith">작성자</th>
					<th class="lith">조회수</th>
					<th class="lith">작성일</th>
				</tr>
			</thead>
			<tbody>
<%
				ArrayList<BbsDTO> list = dao.list();
				if (list==null){
					out.println("<tr>");
					out.println("	<td colspan='4'>");
					out.println("		<strong> 관련 자료 없음 </strong>");
					out.println("	</td>");
					out.println("</tr>");
				}else {	
					
						// 오늘 날짜를 문자열("")로 변환
						String today = Utility.getDate();
						
						for(int i=0; i<list.size(); i++){
									dto = list.get(i);
%>
			<tr>
				<td><%= dto.getBbsno()%></td>
				<td style="text-align: left" colspan="3" class="ti">
				<a href="bbsRead.jsp?bbsno=<%= dto.getBbsno()%>"><%= dto.getSubject()%></a>
				
<%
				// 오늘 작성한 글 제목 뒤에 new 이미지 출력 
				// → 작성일(regdt)에서 년/월/일만 자른 후 작성일==오늘날짜라면 new이미지 출력
				String regdt = dto.getRegdt().substring(0,10);
				if (regdt.equals(today)){
					out.println("<img src='../images/new2.png'>");
				}//if end
				
				// 조회수 10 이상이면 hot 이미지 출력
				if(dto.getReadcnt() >= 10) {
					out.println("<img src='../images/hot.gif'>");
				}//if end
%>				
				</td>
				<td><%= dto.getWname() %></td>
				<td><%= dto.getReadcnt() %></td>
				<td><%= dto.getRegdt().substring(0, 10) %></td>
			</tr>
<%
				}//for end
						
				int totalRecord = dao.count();
				out.println("<tr>");
				out.println("	<td colspan='7' class='lith'>");
				out.println("		글 개수 : <strong>" + totalRecord + "</strong>");
				out.println("	</td>");
				out.println("</tr>");
			}//if end
%>			</tbody>
		</table>
	</div>
	
	
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>