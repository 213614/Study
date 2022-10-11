<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukUpdateProc.jsp</title>
</head>
<body>
	<h3>수정 결과</h3>

<%
	// 사용자가 입력한 정보를 가져와서 변수에 담기
	int snum	 = Integer.parseInt(request.getParameter("snum"));	
	String uname = request.getParameter("uname").trim();
	int kor 	 = Integer.parseInt(request.getParameter("kor").trim());
	int eng 	 = Integer.parseInt(request.getParameter("eng").trim());
	int mat 	 = Integer.parseInt(request.getParameter("mat").trim());
	String addr  = request.getParameter("addr").trim();
	int aver = (kor+eng+mat)/3;
	
	// dto 객체에 담기
	dto.setSnum(snum);
	dto.setUname(uname);
	dto.setKor(kor);
	dto.setEng(eng);
	dto.setMat(mat);
	dto.setAddr(addr);
	dto.setAver(aver);
	
	int cnt = dao.updateproc(dto);
	
	if(cnt==0) {
		out.println("<p>성적 수정 실패</p>");
		out.println("<p><a href='javascript:history.back()'>[다시 시도]</a></p>");
	} else {
		out.println("<script>");
		out.println("	alert('성적이 수정되었습니다.');");
		out.println("	location.href='sungjukList.jsp';");	// 목록페이지로 이동
		out.println("</script>");
	}//if end

%>


</body>
</html>