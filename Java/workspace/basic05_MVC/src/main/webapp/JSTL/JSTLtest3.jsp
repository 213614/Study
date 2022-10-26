<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTLtest3.jsp</title>
</head>
<body>
	<h3>* JSTL 함수 *</h3>
	
	<c:set var="txt" value="   white   space   "></c:set>
	글자 개수 : ${fn:length(txt)}
	
	<hr>
	
	공백 제거 : @<c:out value="${fn:trim(txt)}"></c:out>@
	
	<hr>
	
	<c:set var="str" value="Hi My name is Waldo"></c:set>
 	문자열 자르기 : ${fn:substring(str, 3, 9)}	<!-- My nam -->
	 	
	<hr>
	
	${fn:toLowerCase(str)} <br>
	${fn:toUpperCase(str)} <br>
	
	<hr>
	
<%
	// 참조 : https://jeaha.dev/71 
	// 엔터를 <br>로 바꾸기
	// ①. JSP 문법
	String content = "";
	content = content.replace("\n", "<br>");
	
	// ②. EL / JSTL 문법
	pageContext.setAttribute("cn", "\n");	
%>
    <c:set var="content" value = "
    								Hi 
    								My name is
    								Waldo
    								
    							 "></c:set>
    ${content}
    
  	<hr>
  	
  	${fn:replace(content, cn, "<br>")}
  	
  	<hr>
  	
  	<!-- 3. < > & ' 등 특수문자 변환 -->
  	<c:set var="text" value="Hi
  							 My <name> is
  							 '  Wal d  o'"></c:set>
  	${fn:escapeXml(text)}
  	
  	<hr>
  	
  	${fn:replace(fn:escapeXml(text), cn, "<br>")}
  	${fn:replace(fn:replace(fn:escapeXml(text), cn, "<br>"), ' ' , '&nbsp;')}
  	
  	
  	
</body>
</html>