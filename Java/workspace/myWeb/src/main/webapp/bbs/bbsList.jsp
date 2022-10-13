<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
	<!-- 본문 시작 bbsList.jsp -->
	<h3>게시판</h3>
		<!-- <p><a href="bbsForm.jsp" class="btn btn-xs" id="wbt">글쓰기</a></p> -->
	<div class="container">
		<table id="bt" > 
					<tr>
						<td><a href="bbsForm.jsp" class="btn btn-sm" id="wbt">글쓰기</a></td>
					</tr>
		</table>

		<table class="table table-condensed" style="vertical-align:middle;">
			<thead>
				<tr>
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
				<td style="text-align: left" colspan="3" class="ti">
<%
				// 답변 이미지(대댓글 이미지) 출력
				for (int n=1; n<=dto.getIndent(); n++){
					out.println("<img src='../images/reply.gif'>");
				}//for end
%>	
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
						
				/*
				// 현재 게시판의 총 게시글의 수 
				int totalRecord = dao.count();
				out.println("<tr>");
				out.println("	<td colspan='7' class='lith'>");
				out.println("		글 개수 : <strong>" + totalRecord + "</strong>");
				out.println("	</td>");
				out.println("</tr>");
				*/
				
				// 검색된 게시글 총 개수
				int totalRecord = dao.count2(col, word);
				out.println("<tr>");
				out.println("	<td colspan='7' class='lith'>");
				out.println("		글 개수 : <strong>" + totalRecord + "</strong>");
				out.println("	</td>");
				out.println("</tr>");
%>
			<!-- 검색 시작 -->
			<tr>
				<td colspan="6" style="text-align:center; height:50px;">
					<form action="bbsList.jsp" onsubmit="return searchCheck()"> <!-- myscript.js -->
						<select name="col">
							<option value="subject_content"> 제목+내용
							<option value="subject">제목
							<option value="content">내용
							<option value="wname">작성자
						</select>
						<input type="text" name="word" id="word">
						<input type="submit" value="검색" class="btn btn-default">
					</form>
				</td>
			</tr>
			<!-- 검색 끝 -->
<%
				}//if end
%>
 
			</tbody>
		</table>
	</div>
	
	
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>