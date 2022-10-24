<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file = "ssi.jsp" %>
<%@ include file="auth.jsp" %>  
<%@ include file = "../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 memberWithdrawProc.jsp -->
	<h3>회원 탈퇴 결과</h3>
<%
	String passwd = request.getParameter("passwd").trim();

	dto.setId(s_id);
	dto.setPasswd(passwd);

	int cnt = dao.withdrawProc(dto);
	
	if(cnt==0){
	      out.println("<p> 비밀번호가 일치하지 않습니다. </p>");
	      out.println("<p><a href='javascript:history.back()'> 다시 시도 </a></p>");
	} else{
	      out.println("<script>");
	      out.println("   alert('회원 탈퇴가 완료되었습니다.');");
	      
	      session.invalidate();
	      //→ 탈퇴 후 세션정보 모두 삭제(=로그아웃처리)
	      
	      out.println("	location.href='loginForm.jsp';");
	      out.println("</script>");
	      
	}//if end

%>
	
	
	
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->