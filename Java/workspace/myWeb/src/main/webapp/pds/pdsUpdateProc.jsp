<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file = "ssi.jsp" %>
<%@ include file = "../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 pdsUpdateProc.jsp -->
	<h3>포토갤러리 수정 결과</h3>
<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno"));
	/*
	// 사용자가 수정한 값 불러오기 
	String wname = request.getParameter("wname").trim();
	String subject = request.getParameter("subject").trim();
	String passwd = request.getParameter("passwd").trim();
	*/
	try{
		
		String saveDirectory = application.getRealPath("/storage");
		int maxPostSize = 1024*1024*10;
		String encoding = "UTF-8";
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		
		String filename = "";	
		long filesize = 0;		
		File file = null;		
		String item = ""; 	
		
		Enumeration files = mr.getFileNames();
		
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
		
		String wname   = mr.getParameter("wname").trim();
		String subject = mr.getParameter("subject").trim();
		String passwd  = mr.getParameter("passwd").trim();

		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setPasswd(passwd);
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		dto.setPdsno(pdsno);
		
		int cnt = dao.UpdateProc(dto);
		
		if(cnt == 0) {
			out.println("<p>이미지 수정 실패</p>");
			out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
		}else{
			out.println("<script>");
			out.println("	alert('이미지가 수정되었습니다.');");
			out.println("	location.href='pdsList.jsp';");
			out.println("</script>");
		}//if end
		
	}catch(Exception e){
		out.print(e);
		out.print("<p> 파일 수정 실패 </p>");
		out.print("<a href='javascript:history.back();'> 다시시도 </a>");
	}//try end
	
%>	
	
	
	
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->