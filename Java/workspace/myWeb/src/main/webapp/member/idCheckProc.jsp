<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>idCheckProc.jsp</title>
</head>
<body>
	<div style="text-align:center;">
		<h3> 아이디 중복 확인 결과</h3>
<%
	// duplecateID에서 1이 넘어오면 이미 아이디가 존재한다는 뜻 → id는 PK라 count(id) = 0 이여야 중복된 아이디가 DB에 없는 것
	String id = request.getParameter("id").trim();
	
	int cnt = dao.duplecateID(id);
	
	out.println("입력 ID : <strong>" + id + "</strong>");
	
	if(cnt == 0) {
		out.println("<p>사용 가능한 아이디 입니다.</p>");
%>		
		<!-- 사용 가능한 id(자식창에서 중복체크 후 사용가능하다 나온 아이디)를 부모창에 전달한다. -->
		<a href="javascript:apply('<%= id %>')">적용</a>
		<script>
			function apply(id) {
				//alert(id);
				opener.document.memfrm.id.value = id;
				//오프너. 부모페이지에 id="memfrm"인 폼에 가서 id="id"인 곳의 value값을 id에 넣어라
				window.close();
			}//apply() end
		</script>
<%
	}else {
		out.println("<p style='color:red; font-weight:bolder;'>이미 사용중인 아이디입니다.</p>");
	}//if end
%>
	<br>
		<a href="javascript:history.back()">다시 검색</a>
		&nbsp;&nbsp;
		<a href="javascript:window.close()">창 닫기</a>
	</div>

</body>
</html>