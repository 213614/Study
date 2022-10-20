<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 T_findid.jsp -->
	<h3>아이디/비밀번호 찾기</h3>
	<form method="post" action="T_findidProc.jsp" onsubmit="return findIDCheck()"><!-- myscript.js -->
		이　름 : <input type="text" name="mname" id="mname"><br>
		이메일 : <input type="text" name="email" id="email"><br>
		<input type="submit" value="찾기">
		
	
	</form>
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->