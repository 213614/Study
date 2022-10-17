<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Scope Test</title>
</head>
<body>
	<h3>웹 페에지의 Scope(유효범위)</h3>
	<!-- 페이지간의 이동 -->
<%-- 
	● [페이지 이동]
	① <a href=""></a> 	: 앵커 태그
	② <form action=""></form>
	③ location.href=""  : 자바스크립트로 페이지 이동
	④ <jsp:forward page=""/>   : JSP 액션태그 
	⑤ response.sendRedirect("");
--%>

<%
pageContext.setAttribute("one", 100);
request.setAttribute    ("two", 200);
session.setAttribute    ("three", 300);
application.setAttribute("uid", "itWill");
// → 위의 정보를(각 변수에 담은 값들)을 서블릿 컨텍스트에 저장한다 		
// Servlet Context : 웹 어플리케이션 단위로 정보를 서버쪽에 유지할 수 있게 하는 객체 
%>

	<!-- 페이지를 이동했을 경우 위 변수들에 저장된 값들이 어디까지 살아있는지(유효한지) 확인 -->

	<!-- ①. request.getAttribute("two")가 NULL값으로 나옴 
	<a href="02_scopeResult.jsp"> [Scope 결과 페이지 이동] </a>	-->
	
	<!-- ②. request.getAttribute("two")가 NULL값으로 나옴
	<form action="02_scopeResult.jsp">
		<input type="submit" value="[Scope 결과 페이지로 이동]">
	</form>	  -->
	
	<!-- ③. 위와 결과값 동일 : request값이 공유되지않고있음 -->
	<!--<script type="text/javascript"></script> 	← Old Version(비추)-->
	<!--<script>
		alert("[Scope 결과 페이지]로 이동합니다.");
		location.href="02_scopeResult.jsp";
	</script>	-->
	
	<%-- ④. 액션태그 페이지 이동(바로 이동됨) 
	     ★ request.getAttribute("two")가 값이 나옴!! = 접근 가능
	     ※ request값을 페이지 이동별로 가져가고싶다면 액션태그를 사용해야한다 
	     → request 내부 변수는 부모페이지와 자식페이지에서만 유효하다.
	     = 호출한 페이지(부모페이지=02_scopetest)와 결과페이지(자식페이지=02_scoperesult)
	     = 부모/자식페이지를 제외한 다른 페이지에서는 request가 null값이 나온다
	     
	     → 액션태그는 jsp를 받아드리는데에 한계가 있기때문에 추천사항은 X → 많은 양의 코드를 소화하지 못함
	     
   	<jsp:forward page="02_scopeResult.jsp"></jsp:forward>	
   	(액션태그는 html주석 안먹히니까 주의하기) 	--%>

<%
	// ⑤. 바로 이동됨 : 부모자식간의 값을 교류할 일이 없으면 사용
	// request.getAttribute("two") = null (접근불가)
	//response.sendRedirect("02_scopeResult.jsp");
	
	// ⑥. 명령어 사용(제일 많이 사용) : 현재 작업중인걸 가져가라는 뜻
	// 						   : 부모-자식페이지 값을 서로 교류하면 사용 
	// request.getAttribute("two") = 200 (접근가능)
	String view = "02_scopeResult.jsp";
	RequestDispatcher rd = request.getRequestDispatcher(view);
	rd.forward(request, response);

	/*
		   내부 변수 		  	  02_scopeTest.jsp(부모) 		  	  02_scopeResult.jsp(자식)
		------------------------------------------------------------------------------------
		pageContext					   O								X
		request						   O							  O or X
		session		      			   O								O
		application					   O 								O
	
	
	
	
	*/
%>
	
	
	
	
	
	
	
</body>
</html>