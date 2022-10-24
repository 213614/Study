<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file = "ssi.jsp" %>
<%@ include file = "../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 pdsUpdate.jsp -->
	<h3>포토갤러리 수정</h3>
<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno"));

	dto = dao.read(pdsno);
	if (dto == null){
		out.println("존재하지않는 게시글입니다.");
	}else {
%>
	<form method="post" action="pdsUpdateProc.jsp?pdsno=<%=pdsno %>" enctype="multipart/form-data" onsubmit="return pdsCheck()"><!-- myscript.js -->
	<!-- method="get"은 파일 전송 안됨 										  이미지만 업로드할 수 있도록 자바스크립트에서 제한을 건다-->
	
		<table class="table">
			<tr>
			    <th>작성자</th>
			    <td style="text-align: left"><input type="text" name="wname" id="wname" size="20" maxlength="100" value="<%= dto.getWname() %>" required autofocus></td>
			</tr>
			
			<tr>
			    <th>제목</th>
			    <td style="text-align: left">
			    	<textarea rows="5" cols="30" name="subject" id="subject"><%= dto.getSubject() %></textarea>
			    </td>
			</tr>
			
			<tr>
			    <th>비밀번호</th>
			    <td style="text-align: left"><input type="password" name="passwd" id="passwd"></td>
			</tr>
			
			<tr>
			    <th>첨부파일</th>
			    <td style="text-align: left"><input type="file" name="filename" id="filename">
			    	 현재 첨부된 이미지 : 
			    	 <img src="../storage/<%= dto.getFilename()%>" style="width:20%; height:20%;">
			    </td>
			
			</tr>

		</table>
			<div class="btn-group">
			    <input type="submit" value="수정" class="btn btn-default">
			    <input type="reset"  value="취소" class="btn btn-default">
			    <a href="pdsList.jsp" class="btn btn-default">목록</a>
			</div>
	</form>

<%
}//if end
%>
	
	
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->