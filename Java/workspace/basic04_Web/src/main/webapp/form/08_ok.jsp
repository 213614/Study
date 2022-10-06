<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>08_ok.jsp</title>
</head>
<body>
	<h3>* 다양한 컨트롤 요소 결과 *</h3><hr>
<%
	request.setCharacterEncoding("UTF-8");

	String uid     = request.getParameter("uid");
	String upw     = request.getParameter("upw");
	String uname   = request.getParameter("uname");
	String content = request.getParameter("content");
	
	out.print(uid     + "<hr>");
	out.print(upw     + "<hr>");
	out.print(uname   + "<hr>");
	out.print(content + "<hr>");
	
	// content에서 textarea값에 엔터를(\n) <br>로 만들어서 줄바꿈도 먹히게 코딩
	content = content.replace("\n", "<br>");
	out.print(content + "<hr>");
	
	// name이 동일한 경우(숫자1,2,3)의 값을 request객체로 가져오기 → <input type="text" name="num">
	String[] num = request.getParameterValues("num");
	for(int i=0; i<num.length; i++){
		out.print(num[i] + "<br>");
	}//for end
	
	out.print("<hr>");
	out.print("성별 : " + request.getParameter("gender"));
	// 이러면 name="gender"의 value값이 넘어온다
			
	out.print("<hr>");
	out.print("약관 동의 : " + request.getParameter("agree"));		
	// 만약 사용자가 체크하지 않으면 null이 넘어온다 (if문으로 활용 가능)
	// = 사용자가 체크하지 않으면 request.getParameter("agree"));에 아무런 값이 담기지 않아서
	//   값을 가져올 수가 없어서 null이 대신 나온거임 (아무런 값을 넘겨받지 못했다는 뜻)
	if(request.getParameter("agree")==null){
		out.print("약관에 동의하지 않았습니다.");
	} else { out.print("약관에 동의하였습니다."); }
	// 하지만 체크박스에 체크하지않았다면 서버로 넘기면 안됨! → JS에서 체크박스 if로 fales로 설정해서 submit되지 않도록 한다
	
	out.print("<hr>");
	out.print("SMS : " + request.getParameter("sms"));
	// value값이 없다면(작성해놓지않으면) 체크해도 on값이 넘어온다 = on값이면 체크했다는 뜻 
			
	out.print("<hr>");
	out.print("통신 회사 : " + request.getParameter("telecom"));
	// <select> <option> </select>은 체크된 옵션의 value값이 넘어온다 
	
	out.print("<hr>");
	out.print("페이지 : " + request.getParameter("page"));
	// 사용자한테는 hidden이여도 getPar하면 value값이 넘어옴
	
	out.print("<hr>");
	out.print("첨부 파일 : " + request.getParameter("attach"));
	// 파일명이 넘어옴(걍 string임 파일자체에 접근하려면 다른 방식을 사용해야함)
	/* =
	   첨부된 파일을 가져오려면 다른 방식으로 request객체에 접근해야 한다.
       request.getParameter("attach")는 실제 파일을 가지고 있는 것이
       아니라 단순 파일명이 String으로 출력됐을 뿐이다.
	*/
%>




</body>
</html>