<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %> 
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 pdsIns.jsp -->
	<h3>사진 업로드 결과</h3>
<%
	try {
		
			// 1. 첨부된 파일 storage에 저장
			String saveDirectory = application.getRealPath("/storage");
			int maxPostSize = 1024*1024*10;
			String encoding = "UTF-8";
			MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			//										   ↑ 사용자가 입력한 정보(및 파일)의 원본을 불러오란 뜻의 매개변수
			
			// 2. 1단계에서 저장한 텍스트 정보(파일명,파일크기) 가져오기
			// dto에 담아서 테이블에 저장하기 
			String filename = "";	// 파일명
			long filesize = 0;		// 파일크기
			File file = null;		// 실제 파일 담기 
			String item = ""; 		// <name="filename">을 담을 변수 
			
			// mr에서 <input type="file"> 전부 수거 
			Enumeration files = mr.getFileNames();
			
			// 첨부 파일이 여러개일 경우 한개씩 처리하기 → 하나의 파일에 모든 처리(while문 내부 코드)가 차례대로 끝나고나면 다음 파일로 넘어감 
			while(files.hasMoreElements()) {
				
				item = (String) files.nextElement(); 	//input name인 filename을 한개씩 담는다
				filename = mr.getFilesystemName(item);	//mr객체에서 item이 가지고있는 실제 파일명(리네이밍된 파일명) 저장 (오리지널은 mr.getOriginalFileName(item)
				if(filename != null){
				// 파일네임이 null값이 아니라면 (=제대로 잘 불러왔다면) file변수에 담는다 (=사이즈 구하기위해)
					file = mr.getFile(item); 			//mr에서 실제 파일 저장
					if(file.exists()){
					// 실제 파일이 존재한다면 
						filesize = file.length();		//해당 파일의 크기를 파일사이즈변수에 저장 
					}//if end
				}//if end		
				
			}//while end
		
			// 3. tb_pds테이블에 텍스트 텍스트 정보 저장 (파일명,파일크기, 게시글 작성자, 제목, 비밀번호)
			String wname   = mr.getParameter("wname").trim();
			String subject = mr.getParameter("subject").trim();
			String passwd  = mr.getParameter("passwd").trim();
		
			dto.setWname(wname);
			dto.setSubject(subject);
			dto.setPasswd(passwd);
			dto.setFilename(filename);
			dto.setFilesize(filesize);
		
			int cnt = dao.create(dto);
			if(cnt == 0) {
				out.println("<p>이미지 업로드 실패</p>");
				out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
			}else{
				out.println("<script>");
				out.println("	alert('이미지가 업로드되었습니다.');");
				out.println("	location.href='pdsList.jsp';");
				out.println("</script>");
			}//if end
			
	}catch(Exception e){
		out.print(e);
		out.print("<p> 파일 업로드 실패 </p>");
		out.print("<a href='javascript:history.back();'> 다시시도 </a>");
	}//try end
%>		
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->