<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginResult.jsp</title>
</head>
<body>
	<h3> 로그인 결과 </h3>

	<h5>JSP</h5>
	<%=request.getAttribute("message") %>
	아이디(세션) : <%= session.getAttribute("s_id") %> <br>
	비밀번호(세션) : <%= session.getAttribute("s_pw") %> <br>

<hr> 

	<h5>EL</h5>
	${requestScope.message}
	아이디(세션) : ${requestScope.s_id} <br>
	비밀번호(세션) : ${requestScope.s_pw} <br>

<hr> 

	<h5>EL-Scope생략</h5>
	${message}
	아이디(세션) : ${s_id} <br>
	비밀번호(세션) : ${s_pw} <br>	
	
</body>
</html>