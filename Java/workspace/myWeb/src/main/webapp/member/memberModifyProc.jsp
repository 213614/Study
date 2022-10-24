<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file = "ssi.jsp" %>
<%@ include file="auth.jsp" %>  
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 memberModifyProc.jsp -->
	<h3>회원정보 수정 결과</h3>
<%	
	// 사용자가 입력한 정보(수정한 정보) 불러오기
	// 비밀번호, 이름, 이메일, 전화번호, 우편번호, 주소, 나머지 주소, 직업 
	String passwd   = request.getParameter("passwd").trim(); 
	String mname    = request.getParameter("mname").trim();
	String email    = request.getParameter("email").trim();
	String tel      = request.getParameter("tel").trim();
	String zipcode  = request.getParameter("zipcode").trim();
	String address1 = request.getParameter("address1").trim();
	String address2 = request.getParameter("address2").trim();
	String job 	    = request.getParameter("job").trim();
	
	// 객체에 담기
	dto.setId(s_id);
	
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setEmail(email);
	dto.setTel(tel);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);

	int cnt = dao.ModifyUpdateProc(dto);
	
	if(cnt==0) {
		out.println("<p>수정에 실패하였습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
	} else {
		out.println("<script>");
		out.println("	alert('회원정보가 수정되었습니다.');");
		out.println("	location.href='loginForm.jsp';");
		out.println("</script>");
	}//if end
%>
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->