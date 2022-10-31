<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %>
<%@ include file="../member/auth.jsp" %>
<%@ include file = "../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 noticeList.jsp -->
	<h3>공지사항</h3><br>
	
<div class="container">
		<table id="bt">
					<tr>
						<%  if(s_mlevel.equals("A1")){     // 관리자등급일때만 작성 버튼 보여주기 %>
							<td style="text-align: left;"><a href="noticeForm.jsp" class="btn btn-sm" id="wbt">글쓰기</a></td>
						<%	}//if end %>
						
						<!-- 검색 시작 -->
						<td style="text-align: right;">
							<form action="noticeList.jsp" onsubmit="return searchCheck()"> <!-- myscript.js -->
								<select name="col" style="outline:none; border:none;">
									<option value="subject_content"> 제목+내용
									<option value="subject">제목
									<option value="content">내용
								</select>
								<input style="outline:none; text-decoration:none;" class="underline" type="text" name="word" id="word" size="10">
								<input type="image" src="../images/search_icon.png" style="width:14px; height:15px;" alt="검색">
							</form>
						</td>
						<!-- 검색 끝 -->

					
					</tr>
		</table>
<br>
		<table class="table table-condensed" style="vertical-align:middle; font-size:15px;">
			<thead>
				<tr>
					<th colspan="7" class="lith ti">제목</th>
					<th class="lith">작성일</th>
				</tr>
			</thead>
			<tbody>
<%
				// 한 페이지당 출력할 게시글의 개수
				int recordPerPage = 10;

				ArrayList<NoticeDTO> list = dao.list(col, word, nowPage, recordPerPage); //→ 페이징 리스트
				
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
				<td style="text-align: left" colspan="7" class="ti">
					<a href="noticeRead.jsp?noticeno=<%= dto.getNoticeno() %>&col=<%= col %>&word=<%= word %>&nowPage=<%= nowPage %>"><%=  dto.getSubject()%></a>
				</td>
				<td><%= dto.getRegdt().substring(0, 10) %></td>
			</tr>
<%
				}//for end
						

				int totalRecord = dao.count(col, word);
				out.println("<tr>");
				out.println("   <td colspan='7'></td>");
				out.println("	<td class='lith' style='font-size:15px; text-align:center; border-bottom:none;'>");
				out.println("		글 개수 : <strong>" + totalRecord + "</strong>");
				out.println("	</td>");
				out.println("</tr>");
				
				
				// 페이지 리스트
				out.println("<tr>");
				out.println("	<td colspan='8' class='lith' style='height:50px; border-top:none;'>");
				
				String paging = new Paging().paging2(totalRecord, nowPage, recordPerPage, col, word, "noticeList.jsp");
				//																			          → filenm = 틀이 될 페이지 = 현재 페이지(페이지가 바뀌어도 틀은 그대로니까)
				out.println(paging);
				
				out.println("	</td>");
				out.println("</tr>");				

				}//if end
%>
 
			</tbody>
		</table>
	
		
	</div>

	
	
	
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->
