<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- auth.jsp -->
<!-- 로그인 여부 공유 페이지 -->
<!-- = 로그인 상태 정보 확인 -->
<%
	String s_id     = "";
	String s_passwd = "";
	String s_mlevel = "";
	
	if(session.getAttribute("s_id") == null || session.getAttribute("s_passwd") == null || session.getAttribute("s_mlevel") == null){
		// 세션에 id or pw or level값이 존재하지 않는다 = 로그인되어있지않다
		
		// 로그인 하지 않은 상태
		// 세션이 존재하지 않다면(=로그아웃 상태) 게스트상태로 표시 (=guest 아이디는 사용할 수 없도록 JS에서 조건줘야함)
		s_id 	 = "guest";
		s_passwd = "guest";
		s_mlevel = "guest";
	}else{
		// 로그인 성공 상태 
		// 로그인에 성공했다면, 세션 변수값 가져오기
		s_id 	 = (String) session.getAttribute("s_id");
		s_passwd = (String) session.getAttribute("s_passwd");
		s_mlevel = (String) session.getAttribute("s_mlevel");
	}//if end

%>