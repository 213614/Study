<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file = "ssi.jsp" %>
<%@ include file="auth.jsp" %>  
<%@ include file = "../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 memberWithdraw.jsp -->
	<h3> 회원 탈퇴 </h3>
<%
	//DELETE 말고 등급을 F1으로 UPDATE 후 세션 정보 모두 삭제(로그인되어있는 상태 해제)
	//String id = request.getParameter("id");
	//회원정보수정 및 탈퇴는 id값을 받아오는게 아니라 현재 세션의 값 (=로그인되어져있는 아이디)를 가져와야한다 = auth.jsp → s_id
%>
	<form class="form-inline" method="post" action="memberWithdrawProc.jsp" onsubmit="return pwCheck3()"><!-- myscript.js -->
		<input type="password" name="passwd" id="passwd" size="30" placeholder="비밀번호" class="form-control" required>
		<input type="submit" value="탈퇴" class="btn btn-default">
	</form>
	
	
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->