<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- JSTL을 사용하기 위해 taglib 다이렉티브 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list.jsp</title>
	<style>
		*{ 
		   font-family: gulim; 
		   font-size: 24px;
		 }
	</style>
	<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="title">미디어 그룹 목록</div>
	
	<div class="content">
		<input type="button" value="그룹 등록" onclick="location.href='create.do'">
	</div>
	
	<!--      = ${requestScope.count == 0} -->
	<c:if test="${count == 0}">
		<table><tr><td>게시글이 존재하지 않음</td></tr></table>
	</c:if>
	
	<c:if test="${count > 0}">
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>수정 · 삭제</th>
			</tr>
		
			<!-- JSTL의 반복문을 통해 list에서 한줄씩 가져옴 -->
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.mediagroupno}</td>
					<td>${dto.title}</td>
					<td>
						<input type="button" value="수정">
						<input type="button" value="삭제">
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
	
	<!-- 페이징(페이지 리스트) -->
	<c:if test="${count > 0}">
		<c:set var="pageCount" value="${totalPage}"/>
		<c:set var="startPage" value="${startPage}"/>
		<c:set var="endPage" value="${endPage}"/>
		
		<div class="content">
			<c:if test="${endPage > startPage}">
				<c:set var="endPage" value="${pageCount+1}"/>
			</c:if>
			
			<c:if test="${startPage > 0}">
				<a href="./list.do?pageNum=${startPage}">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage + 1}" end="${endPage - 1}">
				<c:choose>
					<c:when test="${pageNum == i}">
						<span style="font-weight: bold;"> ${i} </span>
					</c:when>
					<c:when test="${pageNum != i}">
						<a href="./list.do?pageNum=${i}">[ ${i} ]</a>
					</c:when>
				</c:choose>
			</c:forEach>
			
			<c:if test="${endPage < pageCount}">
				<a href="./list.do?pageNum=${startPage + 11}">다음</a>
			</c:if>

		</div>
	</c:if>
	

</body>
</html>