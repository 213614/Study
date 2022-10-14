<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->
	<!-- 본문 시작 bbsForm.jsp -->
	<h3>글 작성</h3>
	
		<div class="container">
		<form name="bbsfrm" id="bbsfrm" method="post" action="bbsIns.jsp" onsubmit="return bbsCheck()">
										      <!-- 제대로 입력되었는지 확인 후 서버로 submit → myscript.js에 함수 작성 -->
			<table class="table table-condensed">
				<tr>
				   <td><input type="text" name="wname" id="wname" placeholder="작성자" class="form-control" maxlength="20" required ></td>
				   <td><input type="password" name="passwd" id="passwd" placeholder="비밀번호" class="form-control" maxlength="10" required></td>
				</tr>
				
				<tr>
				   <td colspan="2"><input type="text" name="subject" id="subject"  placeholder="제목" class="form-control" maxlength="100" required></td>
				</tr>
				
				<tr>
				   <td colspan="2"><textarea rows="10"  class="form-control" name="content" id="content" placeholder="내용"></textarea></td>
				</tr>
			</table>
		
			<div class="btn-group">
		       <input type="submit" value="작성" class="btn btn-default">
	       	   <input type="reset"  value="취소" class="btn btn-default">
		       <a href="bbsList.jsp" class="btn btn-default">목록</a>	
			</div>
		</form>
		</div>
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->