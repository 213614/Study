<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>write.jsp</title>
	<link href="../css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h3> 상품 등록 </h3>
	<p>
		<button type="button" onclick="location.href='list'">상품 전체 목록</button>
	</p>
	
	<form name="form1" method="post" action="insert" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>상품명</td>
				<td> <input type="text" name="product_name"> </td>
			</tr>
			
			<tr>
				<td>가　격</td>
				<td> <input type="number" name="price"> </td>
			</tr>
			
			<tr>
				<td>설　명</td>
				<td>
					<textarea rows="5" cols="60" name="description"></textarea>
				</td>
			</tr>
			
			<tr>
				<td>사　진</td>
				<td> <input type="file" name="img"> </td>
			</tr>
	
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="상품 등록">
				</td>
			</tr>
	
		</table>
	</form>
	
</body>
</html>