<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>errorTest.jsp</title>
</head>
<body>
	<h3>!에러 메세지 확인</h3>
<%
	// 에러가 발생하는 경우, 에러 메세지를 직접적으로 화면에 노출시키지 않는다
	// → /WEB-INF/web.xml : 배치관리자에서 대체 페이지 설정 가능 
	
	// 1. HTTP 상태 404 - 찾을 수 없음 (404 NOT FOUND)
	// → http://localhost:9090/basic05_MVC/ERROR/list.jsp
	
	// 2. HTTP 상태 500 - 내부 서버 오류 
	// → http://localhost:9090/basic05_MVC/ERROR/errorTest.jsp
	int num = Integer.parseInt(request.getParameter("kor"));
	out.print("num : " + num);
	// = 페이지에서 넘겨받을 값 kor이 존재하지 않기때문에 생겨난 오류 
	// → 에러 해결 : .jsp? 뒤에 Query String 값으로 kor값을 넘겨야 에러가 발생하지 않음
	// → http://localhost:9090/basic05_MVC/ERROR/errorTest.jsp?kor=30	
%>
</body>
</html>