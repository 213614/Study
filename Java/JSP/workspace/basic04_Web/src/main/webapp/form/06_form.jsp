<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>06_form.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
	<style>
		body { margin-left:10px; margin-top:10px; }
	</style>  
</head>
<body>
	<h3> * 성적 입력 * </h3><hr>
	
	<form name="sungjukfrm" id="sungjukfrm" method="post" action="06_ok.jsp">
		이름 :  <input type="text" name="uname" id="uname" size="10" maxlength="20" placeholder="이름" required> 
	<hr>
		국어 :  <input type="number" name="kor" id="kor" size="5" min="0" max="100">
	<hr>
		영어 :  <input type="number" name="eng" id="eng" size="5" min="0" max="100">
	<hr>
		수학 :  <input type="number" name="mat" id="mat" size="5" min="0" max="100">
	<hr>
	  	<input type="submit" class="btn btn-outline-success btn-sm" value="전송">
	  	<input type="reset"  class="btn btn-outline-success btn-sm" value="취소">
	</form>
	
	<!-- 
		  ● [<form>과 관련된 다양한 속성들]
		  - 사용자가 입력한 정보를 서버로 전송하기 위한 양식 	
		  
		  <form name="sungjukfrm" id="sungjukfrm" method="get" action="06_ok.jsp">
		  ○ name 	: 폼 이름,  서버에서 식별하기 위한 이름 
		  ○ id	 	: 폼 아이디, 프론트단에서 식별자로 사용
		  ○ method  : 폼을 전송하기 위한 방식 →  get  |  post  → 생략하면 기본으로 get방식 
		  ○ action  : 폼을 서버로 전송했을 때 그 폼을 받을 파일 (톰캣으로 보냈으면 .jsp로 받아야함)
		  			= 사용자가 요청한 정보를 서버가 받아서 처리할 결과 페이지   
		  ○ enctype : 폼에서 파일을 첨부해서 서버로 전송하고자 할 때 추가한다 
		  			→ enctype="multipart  |  form-data" 추가 
		  			
		  ● [<form> 전송 방식]
		  ○ method = "get"		
		  	- method 생략시 기본 설정값
		  	- 사용자가 입력해서 요청한 정보가 URL상에 그대로 노출되는 방식
		  	- 한글을 전송해도 깨지지 않음
		  	- url : ok.jsp?서버로전송되는값 
		  	- 형식 → 요청페이지(or 명령어)?변수=값&변수=값&···.
		  	= ex. http://페이지 or 명령어/06_ok.jsp?uname=무궁화&kor=40&eng=40&mat=40
		  	※ 노출되면 안되는 중요한 정보(비밀번호, 주민 등)은 절대 get방식으로 전송하지 않는다! 
		  	→ post 방식에 비해 속도가 빠르다 (검색 등에 get방식을 사용함 → 검색어 입력창(type="text"))
		  	
		  ○ method = "post"
		  	- 사용자가 요청한 정보가 URL상에 노출되지 않는다 → 패키지화해서(하나로 감싸서) 전송되기때문 	
		  	- 영문은 괜찮으나 한글 전송시 깨짐
		  	- url : /06_ok.jsp 
		  	- 형식 → http://페이지 or 명령어/06_ok.jspㄴ 
			→ 비밀번호, 주민등록번호, 카드번호 등은 method="post"로 서버에 전송해야한다
			
			※ 방식이 어떠하든 한글은 깨지면 안된다(그대로 DB 저장시 수정이 아주 아주 어려움)
			
	 -->
</body>
</html>