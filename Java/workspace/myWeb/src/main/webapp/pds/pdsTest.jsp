<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>pds Test</title>
</head>											<!-- 참조: http://pretyimo.cafe24.com/lectureRead.do?lectureno=409 -->
<body>											<!-- ↓ 첨부된 파일을 form과 함께 서버로 전송하려면 필수로 적아야한다 -->
	<h3> 파일 첨부 테스트 </h3>						<!-- = String(type="text")와 file(type="file")을 함께 서버로 전송하겠다는 뜻 -->
	<form method="post" action="pdsTestProc.jsp" enctype="multipart/form-data">
		이름: <input type="text" name="uname"> <br>
		제목: <input type="text" name="subject"> <br>
		내용: <textarea rows="5" cols="20" name="content"></textarea> <br>
		첨부: <input type="file" name="filenm" id="filenm"> <br>
		<input type="submit" value="전송">
	</form>
</body>
</html>