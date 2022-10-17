<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Scope Test</title>
</head>
<body>
	<h3>내장객체 및 내부변수</h3>	
<%
	/*
		● [JSP 내장객체]
		: 서버(우린 TOMCAT)안에 서블릿(HttpServlet)이라는 class 활용한다. 
		: 서블릿 = 서버에 사용자가 페이지 요청을 했을 때 사용자의 정보 및 전송되는 모든(전반적인) 정보들을 저장·관리해주는 인터페이스 
		
		- JSP페이지가 서블릿에서 변환될 때 (= .class로 변환될 때) JSP 컨테이너(=Tomcat Web Server)가 자동적으로
		  제공해주고 있다. (= 내장객체, 내부객체)
		- JSP페이지내에서 제공하는 특수한 레퍼런스 변수(참조타입 변수)
		- 객체가 생성 없이(이미 제공중이라) 바로 사용할 수 있는 JSP의 객체이다
		
		★ Request : 요청한 정보에 관련한 객체
		★ Session : 나만의 공간 
		
		①. out 
			→ 출력 객체 (out.println~)
		
		②. PageContext
		
		③. Request 
			→ 요청한 정보에 관한 객체 (request.getParm~())
			→ 요청한 사용자에대한 모든 정보를 갖고있음

		④. Response
			→ 응답에 관한 정보 객체 (요청한 pc에 응답을 줄 때 사용)
			
		⑤. Session
			→ 요청받은 정보에 관한 정보 객체 = 요청에 관한 Context 제공 
		
		⑥. Application
			→ 서블릿 및 외부 환경 정보 Context 제공
			
		--------------------------------------------------------------------
		
		● [Scope의 종류]
		- 하나의 프로젝트에서 현재 페이지에서 만든걸 다른 페이지에다가 끌어쓰는 경우 사용된다 			
		= myweb 프로젝트에서 페이지들간에 값을 공유하기 위해 사용 
		ex. 블로그에서 로그인한 후 메일 혹은 카페로 페이지를 옮겨도 로그인 정보가 유지되는 것 
		
		= 내장 객체에서 지원해준다 
		
		①. pageContext	: 현재 페이지에서만 유효	(default)
		②. Request 		: 부모페이지와 자식페이지에서만 유효(ex. bbsList-bbsRead)
		③. Session		: 하나의 프로젝트안에 모든 페이지내에서 유효(ex. myweb프로젝트안 모든 페이지 유효)
						→ 사용자 개별로 접근 가능(=나만 유효함), 시간
		④. Application  : 프로젝트 안 모든 페이지 내에서 유효 
						→ 모든 사용자가 접근 가능, 서버 정보 제공(서버환경 등)
	
		--------------------------------------------------------------------				

		● [내부(내장) 변수 선언 형식] 
		: 별도의 자료형(String,int···.)이 존재하지 않는다 → 가져다가 형변환하여 사용한다.	
			
		①. pageContext.setAttribute("변수명", ← 변수에 넣을 값);

		②. request.setAttribute("변수명", 값);
		
		③. session.setAttribute("변수명", 값);
		
		④. application.setAttribute("변수명", 값);
		
		
		● [내부(내장) 변수값 가져오기] 
		: 가져올때는 .get~()로 가져온다.
		
		①. pageContext.getAttribute("변수명");
	
		②. request.getAttribute("변수명");
		
		③. session.getAttribute("변수명");
		
		④. application.getAttribute("변수명");		
		
		
		∴ 순서대로 기억해놓는 것이 좋다(pageContext - request - session - application)
							  : 현재 페이지만  나랑 관련된 애만   나만         모두 다 
				
	*/
		
	// 각 내부 변수에 값 올리기 (내장 객체 유효범위 테스트)
	pageContext.setAttribute("kor", 100);
	request.setAttribute    ("eng", 200);
	session.setAttribute    ("mat", 300);
	application.setAttribute("uname", "itWill");
	//						    ↑ 내부변수는 자료형이 존재하지 않는다 
	
	// 내부 변수 값 가져오기
	out.print(pageContext.getAttribute("kor"));
	out.print("<hr>");
	out.print(request.getAttribute("eng"));
	out.print("<hr>");
	out.print(session.getAttribute("mat"));
	out.print("<hr>");
	out.print(application.getAttribute("uname"));
	out.print("<hr>");
	
	Object obj = pageContext.getAttribute("kor");
	int kor = (int) obj;
	
	int    eng   = (int) request.getAttribute("eng");
	int    mat   = (int) session.getAttribute("mat");
	String uname = (String)application.getAttribute("uname");
	
	out.print("①. pageContext 영역 : " + kor   + "<hr>");
	out.print("②. request 영역 : " 	  + eng   + "<hr>");
	out.print("③. session 영역 : " 	  + mat   + "<hr>");
	out.print("④. application 영역 : " + uname + "<hr>");
	
	// 내부 변수 삭제 (out.print하면 null이 나옴)
	pageContext.removeAttribute("kor");
	request.removeAttribute("eng");	
	session.removeAttribute("mat");
	application.removeAttribute("uname");
	
	out.print("<p><strong> Scope영역 내부 변수 삭제 후 </strong></p>");
	// 로그인했는지 안했는지는 session이 null이냐 물어보면 됨
	out.print("①. pageContext 영역 : " + pageContext.getAttribute("kor")   + "<hr>");
	out.print("②. request 영역 : " 	  + request.getAttribute("eng") 	  + "<hr>");
	out.print("③. session 영역 : " 	  + session.getAttribute("mat")       + "<hr>");
	out.print("④. application 영역 : " + application.getAttribute("uname") + "<hr>");
	

		

	
%>
</body>
</html>