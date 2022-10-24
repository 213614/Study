<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file = "../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 noticeForm.jsp -->
	<!-- 제목, 내용에 빈 문자열이 입력되지 않도록 자바스크립트 유효성 검사 추가 -->
	<h3>공지사항 작성</h3>
	<!-- mlevel = 'A1'만 작성할 수 있음 = 비밀번호 노필요 -->
	
	<div class="container">
		<form name="notifrm" id="notifrm" method="post" action="noticeIns.jsp" onsubmit="return notiCheck()">
										      <!-- 제대로 입력되었는지 확인 후 서버로 submit → myscript.js에 함수 작성 -->
			<table class="table table-condensed">
			
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
		       <a href="noticeList.jsp" class="btn btn-default">목록</a>	
			</div>
		</form>
	</div>
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->