<%@page import="java.io.PrintWriter"%>
<%@page import="javax.print.DocFlavor.READER"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Application Test</title>
</head>
<body>
	<h3>Application 내장객체</h3>
<%
	/*
		● [Application 내장객체]
		- ServletContext application
		ex. int a = 3; 을 어플리케이션에 올리면 그걸 보는 모든 페이지들이 a = 3값을 본다. 
		= 사용자 모두가 공유하는 전역적 의미의 객체 
		= 서버에 대한 정보(누구에게나 같은 정보여야하니까)
		
	*/

	// \bbs폴더의 실제 물리적 경로 → 파일을 첨부할 때 물리적 경로로 저장되어야하기때문 
	out.print(application.getRealPath("/bbs"));
	out.print("<hr>");
	/*
		= I:\java202207\workspace
					   \.metadata
					   \.plugins
					   \org.eclipse.wst.server.core
					   \tmp0
					   \wtpwebapps
					  ----------------------→ 여기까진 이클립스때문에 생겨난 경로로 실제 서비스시에 서버에는 나오지 않는다
					   \myweb
					   \bbs	
	   
					   = 웹경로 : http://localhost:9090/myweb/bbs 
					   (→ 이클립스 경로는 지워짐)
					   
		→ application.getRealPath(); : 추천 
		→ request.getRealPath(); 	 : 비추
		→ 결과는 같게 나옴
		
	*/ 
	out.print(request.getRealPath("/bbs")); 	//비추
	out.print("<hr>");
	
	// application 내부 변수 
	application.setAttribute("uid", "ITWILL");
	// 		→ 모든 사용자가 "ITWILL"이라는 uid변수를 공유하게 된다
	out.print(application.getAttribute("uid"));
	out.print("<hr>");
	
	//----------------------------------------------------------------------------
	
	// ● [Response 내장객체] 
	// : 요청한 사용자에게 응답할 때(어떠한 정보를 응답할지)
	// response.sendRedirect(""); 	// 페이지 이동
	
	// 요청한 사용자에게 응답할 때에 어떠한 메세지를 응답할 것인가 = 응답 메세지 전송 (AJAX에서 많이 사용)
	PrintWriter print = response.getWriter();
	// → printwriter에 메세지를 보내면 사용자 피시에 보여짐?
			
	
	
	
	
%>
</body>
</html>