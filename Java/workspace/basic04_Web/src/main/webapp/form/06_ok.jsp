<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>06_ok.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
		body { margin: 10px 10px 0px 10px; }
	</style>
</head>
<body>
	<h3> * 성적 결과 * </h3>
<%
	/*  
	 	● request 내부 객체 → 사용자가 요청한 모든 정보를 받아서 관리하는 객체 (입력 방식 및 내용 등) 
		
	 	○ request.getParameter("");  → 가장 많이 사용하는 함수 
		  → 사용자가 입력한 정보를 개별적으로 가져올 때 사용한다 (id, pw 등)
		  ex. <input type="text" name="uname">
	 		  → request.getParameter("uname");
	 		  = 식별자 name이 uname이라는 태그에 사용자가 입력한 정보를 가져온다
	 		  ※ 서버와 연결시에는 식별자로 무조건 name을 사용한다 (id, class는 front단에만 사용)
	
	out.print(request.getParameter("uname"));
	out.print("<hr>");
	out.print(request.getParameter("kor"));
	out.print("<hr>");
	out.print(request.getParameter("eng"));
	out.print("<hr>");
	out.print(request.getParameter("mat"));
	out.print("<hr>");
	
	// 실행 시 결과페이지가 아닌 부모페이지 (06_form.jsp)를 실행시킨다. 자식페이지(06_ok.jsp)를 실행시켜봤자 null나옴
	*/
	
	// method="post"에서 발생하는 한글 깨짐 현상 발생하므로 한글 인코딩 필수 (사용자 입력값 request가 2byte이상일 시 다시 재조합)
	request.setCharacterEncoding("UTF-8");
	// = 사용자가 입력한 값에 한글이 있다면 UTF-8(조합형)으로 인코딩해주세요 
	// 결과 페이지의 첫줄은 무조건 이걸로 시작해야한다 → 안그러면 다 깨짐 → 이거 빼먹는걸 방지하는게 xml.html파일임!(기본으로 입력되어있음)
	// request.setCharacterEncoding("EUC-KR"); 	→ 완성형
	
	// 사용자가 입력·요청한 정보를 개별적으로 가져오기
	String uname = request.getParameter("uname").trim();
	int kor = Integer.parseInt(request.getParameter("kor").trim());
	int eng = Integer.parseInt(request.getParameter("eng").trim());
	int mat = Integer.parseInt(request.getParameter("mat").trim());
	int aver = (kor+eng+mat)/3;	
%>
	<!-- 성적 결과 테이블에 출력 -->
	<div>	
	  <table class="table">
	    <thead class="table-success">
	      <tr>
	        <th>이름</th>
	        <th>국어</th>
	        <th>영어</th>
	        <th>수학</th>
	        <th>평균</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td><%=uname%></td>
	        <td><%=kor%></td>
	        <td><%=eng%></td>
	        <td><%=mat%></td>
	        <td><%=aver%></td>
	      </tr>
	    </tbody>
	  </table>
	</div>
</body>
</html>