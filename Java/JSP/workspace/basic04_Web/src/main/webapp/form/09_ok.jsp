<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>09_ok.jsp</title>
</head>
<body>
	<h3>* request 내부 객체의 다양한 메소드들 *</h3><hr>
<%
	// 1. 한글 인코딩
	request.setCharacterEncoding("UTF-8");
	
	// 2. 사용자가 입력한 정보 가져오기
	out.print(request.getParameter("uid"));
	out.print("<hr>");

	// 3. 요청한 사용자의 다양한 정보
	out.print(request.getRemoteAddr());
	// → 사용자 PC의 ip 주소값을 가져온다 
	// → ip 6.ver로 나오는데 사물인터넷(IoT)가 아니고선 ip 4.ver을 사용한다 = 서버환경을 바꾸고 이클립스 껐켰  
	out.print("<hr>");
	out.print(request.getRemoteHost());
	out.print("<hr>");
	out.print(request.getRemotePort());
	out.print("<hr>");
	out.print(request.getRemoteUser());
	out.print("<hr>");
	
	/////////////////////////////////////////////////////////////////////
	
	out.print(request.getContextPath());	// /basic04_Web → 프로젝트 명이 나옴
	// 배포시에는 URL에 프로젝트명이 아니라 ~.com으로 나와야하기때문에 명령어로 context를 ~.com으로 변경 및 제어한다 
	out.print("<hr>");
	
	out.print(request.getRequestURL());		// http://localhost:9090/basic04_Web/form/09_ok.jsp
	// 사용자가 요청한 페이지(또는 명령어)의 전체 경로 
	out.print("<hr>");	
	
	out.print(request.getRequestURI());		// /basic04_Web/form/09_ok.jsp
	// 사용자가 요청한 페이지명 또는 명령어의 경로(간략한 버전)
	out.print("<hr>");
	
	/////////////////////////////////////////////////////////////////////
	
	out.print(request.getRealPath("/images"));		// 비추
	// I:\java202207\workspace\.metadata\···\basic04_Web\images
	// 내 컴퓨터 입장에서 images폴더의 실제 물리적 경로를 파악할 때 사용
	out.print("<hr>");
	out.print(application.getRealPath("/images"));	// 추천(앞이 application임)
	// I:\java202207\workspace\.metadata\···\basic04_Web\images (결과는 같음)
	out.print("<hr>");
	/*
		I:\java202207\workspace
								\.metadata
								\.plugins
								\org.eclipse.wst.server.core
								\tmp0
								\wtpwebapps
								\basic04_Web
								\images
		
		→ \.metadata\···\wtpwebapps : 이클립스로 실행하기때문에 존재하는 폴더(위치), 환경이 다르면 존재하지 않는 경로다
		→ 파일을 서버로 전송시 저 위치에 가서 잘 전송되었는지 확인해야할때가 있음
	
	*/
	
	/////////////////////////////////////////////////////////////////////
	
	// ★ 내부 변수 : 자료형(int,String,char 등)이 존재하지 않는다 = 자료형 선언 필요 X
	// request.setAttribute("변수명", 값);	→ 변수 선언시 사용 
	// request.getAttribute("변수명");	→ 변수 호출시 사용
	request.setAttribute("user", "Korea");		// user = "Korea"; (자료형 필요치X)
	Object obj = request.getAttribute("user");  // 리턴값이 Object
	String str = (String) obj;					// 다형성 = 부모(Object)가 자식의 형태(String)으로 변환한 후에 대입할 수 있다
	out.print(str);								// "Korea"
%>
	
</body>
</html>