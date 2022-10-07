<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="net.testbean.*" %>
<jsp:useBean id="comp" class="net.testbean.Compute" scope="page"/>

<%-- 

	● Action Tag 
		○ <jsp:useBean id=""></jsp:useBean>
		→ 객체 생성 (Object) = new 연산자와 같다  
		
		○ <jsp:forward page=""></jsp:forward>
		→  페이지 이동시 사용 
		
		○ <jsp:include page=""></jsp:include> 
		→ 외부문서 끌어오기 = <%@include%>(인클루드 디렉티브)와 기능은 거의 흡사하다 


	● JAVA BEAN 객체 생성
		→ <jsp:useBean id="객체명" 
					   class="패키지명.클래스명"	※class에는 패키지명 생략하면 절대 안됨 
		   scope="page"/>
		
		ex.<jsp:useBean id="comp" 
						class="net.testbean.Compute" 
							   → net까지 하고 Ctrl+Space하면 알아서 추가됨
							   → import한 .java 클래스 파일(안에 함수만 있음)
		    scope="page"/>
	    				=> Compute comp = new Compute(); 와 같다!
	    			
	    			
	● scope의 유효 범위 ★아주 중요★ → bean(객체)을 어디까지 공유하겠냐는 뜻!
		○ scope = "page" 	
		→ 현재 페이지에서만 유효한(사용 가능한) bean(객체)이란 뜻 : scope생략시 기본 설정값
		
		○ scope = "request" 			 
		○ scope = "session" 	
		○ scope = "application" 	
		→ 다른 페이지에서도 유효한(사용 가능한) bean(객체) : 다른 페이지까지 공유하겠다! 
		
		
	※ [주의사항]
	  - Java Bean(id)가 제대로 생성 안될 수도 있음.
	  → 해당프로젝트 우클릭 Refresh
                      Validate
                      Project -> Clean하고 테스트할것!!
		
----------------------------------------------------------------------------------
		<jsp:forward page=""></jsp:forward>
		<jsp:forward page=""/>
		→ 여닫는 태그 한번에 처리 가능..! < 태그 /> 로 하면 된다..! 

 --%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>computeok3.jsp</title>
</head>
<body>
	<h3>계산 결과</h3>
	<h4> ③ Java Bean(=object)으로 property 생성해서 사용하기 </h4>
<%
	int num1=Integer.parseInt(request.getParameter("num1").trim());
	int num2=Integer.parseInt(request.getParameter("num2").trim());	
	
	out.print(num1 + " + " + num2 + " = " + comp.add(num1, num2));
	out.print("<hr>");
	out.print(num1 + " - " + num2 + " = " + comp.sub(num1, num2));
	out.print("<hr>");
	out.print(num1 + " * " + num2 + " = " + comp.mul(num1, num2));
	out.print("<hr>");
	out.print(num1 + " / " + num2 + " = " + comp.div(num1, num2));
	out.print("<hr>");
	out.print(num1 + " % " + num2 + " = " + comp.mod(num1, num2));
	out.print("<hr>");
%>
</body>
</html>