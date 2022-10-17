<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Session Test</title>
</head>
<body>
	<h3>Session 내장객체</h3>
<%
	/*
		● [session 내장객체]
	    ○ HttpSession session 
	    - 요청한 사용자에게 개별적으로 접근(나만의 캐비넷)
	    - 선언한 세션 변수(내 캐비넷 번호를 지정할 수 있음)는 전역적 상태로 유지
	      = 즉, 페이지를 어디로 이동하던(블로그-카페-메일 등) 세션 변수(내 캐비넷 번호)는 변하지 않는다 
	    - 요청한 정보의 상태를 유지하기 위해 세션변수 사용
	    - 일정시간동안 이벤트가 발생되지 않으면 자동으로 삭제된다.(시간이라는 개념이 있음)
		
	    ★ 이벤트 : 서버가 사용자가 해당 세션을 사용하고 있는지를 알 수 있는 지표가 된다.
	           : 이벤트가 발생하지 않으면 강제로 임시 세션(임시 캐비넷)을 삭제한다.
	      	
	*/

	// 세션 내장 객체에서 발급해주는 임시 아이디(= 웹페이지→F12→Network→'cookie')
	// 임시 아이디라 새로고침마다 아이디가 바뀜
	// 사용자가 웹서버에(=JSP컨테이너 : 우린 tomcat서버)
	//session.getId();
	
	out.print("세션 임시 아이디 : ");
	out.print(session.getId());	
	out.print("<hr>");

	// 세션 변수 (고유 캐비넷을 부여해주는 것) 
	// → 별도의 자료형이 없음 
	// → 해당 프로젝트의 모든 페이지내에서 공유되는 전역 변수임(선언된 시점부터 전역 변수)
	// ex. 한번 로그인하면 메일, 카페, 블로그 등 로그인 없이 사용할 수 있음
	
	// 세션변수 선언
	session.setAttribute("s_id", "itwill");
	session.setAttribute("s_pw", "12341234");
	
	// 세션변수값을 가져오기
	Object obj  = session.getAttribute("s_id");
	String s_id = (String)obj; 		  					// 가져온 후 다형성
	
	String s_pw = (String)session.getAttribute("s_pw");	// 아예 변환해서 가져오기
	
	// 세션이 null이냐 아니냐 : 로그인
	// 세션에 올라와있는 변수 삭제(removeAttribute~): 로그아웃
	
	out.print("세션 변수 s_id : " + s_id + "<hr>");
	out.print("세션 변수 s_pw : " + s_pw + "<hr>");
	
	// 세션변수 삭제 (out.print시 null값)
	session.removeAttribute("s_id");
	session.removeAttribute("s_pw");
	
	out.print("세션 변수 삭제 후 <hr>");	
	out.print("세션 변수 s_id : " + session.getAttribute("s_id") + "<hr>");
	out.print("세션 변수 s_pw : " + session.getAttribute("s_pw") + "<hr>");
	
	// 세션 하나하나 remove말고 세션 영역에 있는 모든 값 전부 강제 삭제
	session.invalidate();
	
	//-------------------------------------------------------------------------------
	
	// 세션 시간 (이벤트 발생하지 않을 시 로그인 유지 시간) = 개발자가 임의로 설정 가능 
	// → 설정하지 않으면 톰캣은 30분이 기본 설정 = 30분동안 아무런 이벤트를 발생하지 않을시 강제 세션 삭제
	// 								  = 아무런 이벤트(클릭,스크롤 등) 발생하지않고 30분간은 로그인 유지 가능
	// 돈, 보안관련은 세션시간을 길게 주지않는다.(은행 사이트 등은 5분정도이다)
	
	out.print("현재 세션 유지 시간 : ");
	out.print(session.getMaxInactiveInterval());	// 초단위
	out.print("초(=30분)");
	out.print("<hr>");
	
	// 세션 시간 설정
	session.setMaxInactiveInterval(60*10); // 60초*10 = 600초 = 10분
	
	out.print("변경된 세션 유지 시간 : ");
	out.print(session.getMaxInactiveInterval());	// 초단위
	out.print("초(=10분)");
	out.print("<hr>");
	
	// 세션시간은 모든 페이지에 공통된 시간으로 준다(이메일은10분, 카페는 5분 이런식으로하진않음)
	
	/*
		\WEB-INF\web.xml → 배치관리자에서 세션시간 변경 
	    
		<!-- 세션 유지 시간 설정(20분) : 모든 페이지에 동일 적용 -->
	    <session-config>
	  		<session-timeout>20</session-timeout>
	    </session-config>
	*/
	
	
	
%>
</body>
</html>