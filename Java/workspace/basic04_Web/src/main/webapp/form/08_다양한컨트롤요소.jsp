<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>08_다양한 컨트롤 요소.jsp</title>
</head>
<body>
	<h3>* 다양한 컨트롤 요소들 연습 *</h3><hr>
	<form method="post" action="08_ok.jsp">
		아이디 : <input type="text" name="uid"> 
	    <hr>
	    비번   : <input type="password" name="upw">
	    <hr>
	    이름   : <input type="text" name="uname">
	    <hr>
	    내용   : <textarea rows="5" cols="20" name="content"></textarea>
	    <hr>
	    숫자1 : <input type="text" name="num"> <br>
	    숫자2 : <input type="text" name="num"> <br>
	    숫자3 : <input type="text" name="num"> <br>
	    <hr>
	    
	    성별  :
	    <input type="radio" name="gender" value="M"> 남
	    <input type="radio" name="gender" value="F"> 여
	   	<!--                                ↑ 필수는 아니고 개발자가 알아보기 편하도록 임의로 설정(본인이알아보면됨) 
	   		      ↑ 선택박스 둘 중 하나만 선택할 수 있음 (type="radio"의 특성)
	  	-->
	    
	    <hr>
	    약관 동의 :
	    <input type="checkbox" name="agree" value="Y">
	    
	    <hr>
	    SMS : 
	    <input type="checkbox" name="sms">
	    <!-- value값은 생략 가능 -->
	    
	    <hr>
  		통신회사 : 
  		<select name="telecom">
	        <option value="sk">SK
	        <option value="lg">LG U+
	        <option value="ktf">KTF
        </select>
        
        <hr>
        <!-- 폼 컨트롤 요소지만 본문에는 출력되지않는 요소 -->
        <input type="hidden" name="page" value="5">
	    
	    <hr>
	    첨부 파일 : 
	    <input type="file" name="attach">
	    <!-- type="file"을 form에 넣고싶다면 form enctype을 적용시켜야한다!
	         → 파일을 첨부하여 서버에 전송하려면 <form enctype="multipart/from-data">를 추가해야함-->
	    
	    
	    <input type="submit" value="전송">
	</form>
</body>
</html>