<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ELtest3.jsp</title>
</head>
<body>
	<h3>* EL 내장객체 : Collection *</h3>
<%
	// 1. JSP 내장객체 
	// → pageContext, request, session, application
	
	// 내부 변수 선언 → myweb/scope/ 참조
	pageContext.setAttribute("kor", 100);	// 현재 페이지에서만 사용가능한 변수		
	request.setAttribute("eng", 200);		// 부모-자식간의 전역변수 
											// → A 페이지에서 B 페이지를 호출하면 부모(A)-자식(B)간이 성립된다
	session.setAttribute("mat", 300);		// 전역 변수 : 모든 페이지에서 유효, 개인 사용자를 지칭, 유효 시간 존재
	application.setAttribute("aver", 400);	// 전역 변수 : 모든 페이지에서 유효, 모든 사용자에게 공유
%>
	①. JSP <br>
	KOR  : <%= pageContext.getAttribute("kor")  %> <br>
	ENG  : <%= request.getAttribute("eng")      %> <br>
	MAT  : <%= session.getAttribute("mat")      %> <br>
	AVER : <%= application.getAttribute("aver") %> <br>

	<hr>

<!-- 
	   2. EL 내장객체 Collection
	   → param, pageScope, requestScope, sessionScope, applicationScope
-->
	
	②. EL <br>
	KOR  : ${pageScope.kor}<br>
	ENG  : ${requestScope.eng}<br>
	MAT  : ${sessionScope.mat}<br>
	AVER : ${applicationScope.aver}<br>
	
	<hr>
	
<!-- 
		 EL에서는 내장객체 명을 생략할 수 있다(pageScope, requestScope ~ 등 생략가능) 
	     → kor이라는 변수를 찾기위해 EL은 page로 가서 찾아본다 있으면 호출하고 없다면 request~application으로
	       찾고자하는 변수를 찾을때까지 작은 영역부터 큰 영역으로 순차적으로 찾아간다. 
	       = 변수명을 동일하게 주지 않는다(p_kor, r_kor , s_kor, a_kor 이런식으로 구분지어 준다) 
-->
	KOR  : ${kor}<br>
	ENG  : ${eng}<br>
	MAT  : ${mat}<br>
	AVER : ${aver}<br>
	
	<!--  각 Scope에서 내장 변수명이 동일한 경우 가장 먼저 발견한 변수를 호출하고 끝낸다. -->
<%
	pageContext.setAttribute("num", 100);	
	request.setAttribute("num", 200);			
	session.setAttribute("num2", 300);		
	application.setAttribute("num2", 400);
%>	
	num : ${num}		<!-- 100 --><br>
	num2 : ${num2}		<!-- 300 -->
	<!-- = 내장객체명이 생략되면 자동으로 작은 영역 순으로 찾게 된다
		 → 지정된 값을 찾고싶다면 변수명을 다르게하던가, 앞에 내장객체명(ex.pageScope)를 생략하지 않는다  -->
	<hr>
	
	<!-- 각 Scope의 내장변수가 없는 경우 반환 상태 -->
	JSP :  <%= request.getAttribute("uname") %>		<!-- null -->
	<br>
	EL　:  #${requestScope.uname}#					<!-- ## : 빈 문자열이 나옴 -->
	<br>
	
	
	

	
</body>
</html>