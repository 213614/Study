<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 memberModify.jsp -->
	<h3 style="color:gray; font-weight:500;">회원정보수정</h3><br>
	
<!-- 회원가입폼(memberForm)가져와서 일단 입력된 회원정보 보여주기 (hidden 으로 아이디넘겨주기)
     → 사용자가 새로운 값을 입력하면 request.getP로 가져와서 함수로 전송
     → 해당 값 받아서 update sql 실행 
     → 회원정보과 완전히 수정되면 마이페이지?처럼 보여주기? -->
	
	
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->