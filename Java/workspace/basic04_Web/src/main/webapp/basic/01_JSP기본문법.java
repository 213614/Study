<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%-- JSP 코드 주석(<!---->은 html이니까 사용금지) --%>
<%-- JSP 주석 자동 코딩 Ctrl + Shift + / --%>
<%--
	  ● [한글 인코딩] → 섞어사용하지 않도록 주의(하나의 프로젝트 안에서)
	  - 조합형(UTF-8)   : 초성 + 중성 + 조성 : 더 많은 한글 표현 가능
	  - 완성형(EUC-KR)  : MS949
	  
	  ● JSP Directive(지시자) 
	    (JSP 페이지 코딩 시 저장할 때 .jsp로 저장)
	  - <%@ page %>
	  - <%@ include %>  : 포함시키다
	  - <%@ taglib %>	: 외부 태그들을 가져와서 사용
	   
	  ● .jsp 파일 → 지시자가 가장 첫줄에 항상 와야함
	  			   <%@ page  		 
	    		   language=""		  → 생략 가능
	    		   contentType=" ; "  → 필수 요소(속성 중복 사용시 ;으로 구분) → 생략하면 오류 
	    		   pageEncoding=""    → 생략 가능
	    		   import=""		  → 여러개 작성 가능, 속성 안으로 들어갈 수도 있음
	    		   				      → ex. import="java.io.*"
	    		   				            import="java.sql.*"
	    		   				            import="java.util.*"
	    		   %>
	    		   → 간략히 <%@ page contentType="text/html; charset=UTF-8" %>만 적는 경우도 있다
	    		   
	  ※ 첫줄에 디렉토리(지시자)를 써놓지 않으면 오류가 난다
	   
	  ● .jsp에서(JSP 페이지에서) 사용 가능한 문법
	  - HTML tag
	  - CSS        	  → <style></style>
	  - JavaScript	  → <script></script>
	  - JSP 	      → <% %>
	  
	  ● JSP코드 작성 영역 선언 
	  - <%   여기다 작성   %>  →  스크립트릿(Scriptlet)
	  
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_JSP 기본 문법.jsp</title>
</head>

<body>

	<!--  
			.html과 다르게 .jsp는 조금 더 역동적인 페이지를 만들 수 있다
	 -->
	 <h3> JSP 기본 문법 </h3>
	 <hr>
	 <h4> 대한민국 </h4>
	 1+2+3
	 <br>
	 
<%
	 //  한줄 주석
	 /*  여러줄 주석 */
	 // <!---> 은 사용하면 안됨~! 
	 /*
	 	 스크립트릿(Scriptlet)
	 	 - JSP 코드 작성 영역 
	 	 - Tomcat WAS에 의해 JSP코드가 해석이 되고, 그 결과값을 HTML문서로 변환하여 요청한 frontend단으로 응답해 준다
	     → 사용자 : jsp로 요청 → Tomcat WAS : jsp를 html로 번역 → 서버 : 번역한 요청을 토대로 html로 사용자에게 돌려줌
	 */
	 
	 out.print("무궁화"   +"<br>");
  	 out.print(123+456  +"<br>");
	 out.print(5+7      +"<br>");
	 out.print(8.9      +"<br>");
	 out.print('A'      +"<hr>");

	 /*
	 	 ● 결과확인
       	   http://localhost:9090/basic04_web/basic/01_JSP기본문법.jsp
         - http://                프로토콜
         - localhost:9090/        내시스템:port번호
         - basic04_web            Context Path 프로젝트명
         - /basic/01_JSP기본문법.jsp 경로명 및 파일명
	 	 
         ● 가상의 경로 basic04_web (=Context Root)
	       basic04_web의 실제 물리적 경로(src/main/webapp)는 외부에서 접근 불가능(보안상의 이유)
	       → 프로젝트명 basic04_web으로 접근해야 한다
	     ※ error! → http://localhost:9090/src/main/webapp/basic/01_JSP기본문법.jsp
	 */
	 
	 // HTML 태그를 JSP에서 사용하는 경우 문자열 안에서 작성한다 = ""안에 작성 = JAVA 문법과 동일 
	 out.print("<h1> flower </h1>");
	 out.print("<img src='../images/flower2.png'>");
	 out.print("<hr>");
	
%>
	
<%
	// 스크립트릿은 한 문서에 여러번 올 수 있다(= <script></script>처럼)
	out.println("<style> .txt{color:lightblue; font-weight:bold;} </style>");
	out.println("<span class = txt> 꽃 </span>");
%> 
	 
</body>

</html>
