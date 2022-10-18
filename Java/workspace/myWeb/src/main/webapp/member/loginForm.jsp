<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %>     
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->
	<!-- 본문 시작 loginForm.jsp -->
	<h3> 로그인 </h3>
	
	<form name="loginfrm" id="loginfrm" action="loginProc.jsp">
		<table class="table">
			<tr>
			    <td>
				   <input type="text" name="id" id="id" placeholder="아이디" maxlength="10" required>
			    </td>
			    <td rowspan="2">
				   <input type="image" src="../images/bt_login.gif">		   
			    </td>
			</tr>
			
			<tr>
			   <td>
			      <input type="password" name="passwd" id="passwd" placeholder="비밀번호" maxlength="10" required>
			   </td>
			</tr>
			
			<tr>
			   <td colspan="2">
			      <label><input type="checkbox" name="c_id" value="SAVE">아이디 저장</label>			  
				  &nbsp;&nbsp;&nbsp;
				  회원가입
				  &nbsp;&nbsp;&nbsp;
				  아이디/비밀번호찾기
			   </td>
			</tr>	
				  
		</table>	
	</form>

	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->