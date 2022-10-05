<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>04_함수</title>
	<link rel="stylesheet" href="../css/reset.css">
	<script src="../js/jquery-3.6.1.min.js"></script>
	
</head>
<body>
	<h3> 사용자 정의 함수 </h3>
	<hr>
	최대값 : <%=max(3,5)%>
	<br>
	두 수 사이의 차이 : <%=diff(2,6)%>	<!-- =가 있어야함 -->

<%!
	// JSP에서 함수 작성 영역 (잘 사용하지 않음) : !가 있어야함 
	public int max(int a, int b){
		return Math.max(a, b);
	}// max() end
	
	public int diff (int a, int b){
		return Math.abs(a-b);
	}//diff() end
%>

</body>
</html>