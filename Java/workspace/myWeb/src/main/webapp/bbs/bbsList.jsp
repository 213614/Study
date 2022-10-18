<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
	<!-- 본문 시작 bbsList.jsp -->
	<h2>게시판</h2>
		<!-- <p><a href="bbsForm.jsp" class="btn btn-xs" id="wbt">글쓰기</a></p> -->
	<div class="container">
		<table id="bt" > 
					<tr>
						<td><a href="bbsForm.jsp" class="btn btn-sm" id="wbt">글쓰기</a></td>
					</tr>
		</table>
<br>
		<table class="table table-condensed" style="vertical-align:middle; font-size:15px;">
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
				// 한 페이지당 출력할 게시글의 개수
				int recordPerPage = 10;

				/* ArrayList<BbsDTO> list = dao.list(); → 전체 게시글 리스트 */
				/* ArrayList<BbsDTO> list = dao.list2(col, word); → 검색된 글 리스트 */
				ArrayList<BbsDTO> list = dao.list3(col, word, nowPage, recordPerPage); //→ 페이징 리스트
				if (list==null){
					out.println("<tr>");
					out.println("	<td colspan='2'>");
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
				<!-- <a href="bbsRead.jsp?bbsno=<%= dto.getBbsno()%>"><%= dto.getSubject()%></a> -->
				<!-- <a href="bbsRead.jsp?bbsno=<%= dto.getBbsno()%>&col=<%= col %>&word=<%= word %>"><%= dto.getSubject()%></a> -->
				<!-- ↑ 검색어와 칼럼값을 같이 전달해준다(다시 검색된 글 리스트로 오기 위해) / href안에 공백문자 절대 불가! -->
				
				<a href="bbsRead.jsp?bbsno=<%= dto.getBbsno()%>&col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>"><%= dto.getSubject()%></a>
				<!-- ↑ 3페이지의 글을 상세보기 후 목록을 눌러도 다시 3페이지에 돌아오기 위해 nowPage값을 넘겨준다 -->
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
				out.println("   <td colspan='5'></td>");
				out.println("	<td class='lith' style='font-size:15px; text-align:center; border-bottom:none;'>");
				out.println("		글 개수 : <strong>" + totalRecord + "</strong>");
				out.println("	</td>");
				out.println("</tr>");
				
				
				// 페이지 리스트
				out.println("<tr>");
				out.println("	<td colspan='7' class='lith' style='height:50px; border-top:none;'>");
				
				String paging = new Paging().paging2(totalRecord, nowPage, recordPerPage, col, word, "bbsList.jsp");
				//																			          → filenm = 틀이 될 페이지 = 현재 페이지(페이지가 바뀌어도 틀은 그대로니까)
				out.println(paging);
				
				out.println("	</td>");
				out.println("</tr>");				
%>
			<!-- 검색 시작 -->
			<tr>
				<td colspan="6" style="text-align:center; height:50px; border-top:none;">
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
		<!--  
		<table border="0" style="vertical-align:middle; font-size:15px;">
		<tr>
				<td colspan="6" style="text-align:center; height:50px;">
					<form action="bbsList.jsp" onsubmit="return searchCheck()">  
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
		</table>
		-->
		
	</div>
	
	
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>