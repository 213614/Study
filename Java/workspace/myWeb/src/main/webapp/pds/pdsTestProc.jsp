<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>pdsTestProc</title>
</head>										
<body>											
	<h3> 파일 첨부 테스트 결과 </h3>					
<%
/*
	request.setCharacterEncoding("UTF-8");
	out.print(request.getParameter("uname"));
	out.print("<hr>");
	out.print(request.getParameter("subject"));
	out.print("<hr>");
	out.print(request.getParameter("content"));
	out.print("<hr>");
	out.print(request.getParameter("filenm"));
	out.print("<hr>");
	
	● <form>에  enctype="multipart/form-data"속성이 추가되면
	  request객체가 가지고 있는 값을 제대로 가져올 수 없다 = request.getP~()의 리턴값이 String이기때문에
	  = 해당 속성을 form태그에 추가하고 request.getParameter("")로 값을 불러오면 null값이 나옴
	  → cos.jar을 사용해야하는 이유 : String은 string끼리 file은 file끼리 알아서 재조합해줌
	  
	  참조: http://pretyimo.cafe24.com/lectureRead.do?lectureno=220
*/

	try{
			// ① 첨부된 파일 저장
			// 첨부된 파일을 저장하는 폴더 생성 → src/main/webapp/storage
			
			// 실제 물리적 경로
			String saveDirectory = application.getRealPath("/storage");
			//out.print(saveDirectory);
			/*
					I:\java202207\workspace
								 \.metadata
								 \.plugins
								 \org.eclipse.wst.server.core
								 \tmp0
								 \wtpwebapps
								 \myweb
								 \storage
			*/
			
			// 저장 최대 용량 조정 가능 (10m)
			int maxPostSize = 1024*1024*10; // = 10 메가
			
			// 한글 인코딩
			String encoding = "UTF-8";
			
			MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			// ★★ mr에서 .getParameter로 꺼내와야함!! 안그러면 null나옴 → request.getParameter() 안됨
			
			//////////////////////////////////////////////////////////////////////////////////////
			
			// ②. mr 참조변수가 가리키고 있는 텍스트 정보 가져오기
			out.print(mr.getParameter("uname"));
			out.print("<hr>");
			out.print(mr.getParameter("subject"));
			out.print("<hr>");
			out.print(mr.getParameter("content"));
			out.print("<hr>");
			
			// ③. storage 폴더에 저장된 파일명(DB에 저장해야함) 불러오기
			// 	  3-1. mr이 가지고 있는 <input type="file">을 전부 수거하기 
			Enumeration files = mr.getFileNames();
			//= enumeration n.열거형 = 배열과 비슷 → Enumeration enum = {"","",""} 로 배열로도 저장 가능 → 자료형 지정할 필요XX
			//→ 만일 첨부된 파일이 3개였다면 files = {<input type="file">, <input type="file">, <input type="file">}로 수거됨
			
			// 	  3-2. 1에서 수거한 파일들을 개별적으로 불러오려면 name=""으로 접근한다
			//         첨부 <input type="file" name="filenm">  (name="filenm2", name="filenm3"···.) 
			String item = (String) files.nextElement(); 	// filenm 
			// = 실제 파일을 담고있는 변수값을 가져온 것, 파일이 여러개라면 반복문으로 가져오가
			
			// 	  3-3. 2의 item(input name을 가지고 있는 변수)와 일치되는 storage폴더에 저장되어있는 실제 파일을 mr객체에서 가져오기
			String ofileName = mr.getOriginalFileName(item);
			// item(filenm)과 일치되는 실제 파일의 오리지널 이름
			out.print("원본 파일 명 : " + ofileName);
			out.print("<hr>");
			
			String fileName = mr.getFilesystemName(item);
			// item(filenm)과 일치되는 실제 파일의 리네이밍된 이름
			out.print("변경된 파일 명 : " + fileName);
			out.print("<hr>");
			
			// 첨부된 파일이 여러개라면 3-2~3-3을 반복문 돌린다. 
			// 파일 사이즈는 제공되는 객체가 없기때문에 oop0919_Test05_File.class 이용하기
			
			// ④. storage폴더에 저장된 파일의 기타 정보(파일사이즈, 파일명, 확장자명 등) 확인하기
			File file = mr.getFile(item);
			if (file.exists()) {
			// = 파일이 존재하는가?
				out.print("파일 이름 : " + file.getName());
				out.print("<hr>");
				out.print("파일 크기 : " + file.length() + "byte");
				out.print("<hr>");
					
			}else {
				out.print("해당 파일이 존재하지 않습니다.");
			}// if end
			
		
		
		
	}catch(Exception e) {
		out.print(e);
		out.print("<p> 파일 업로드 실패 </p>");
		out.print("<a href='javascript:history.back();'> 다시시도 </a>");
	}
%>
</body>
</html>