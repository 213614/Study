<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %>  
<%@ include file="auth.jsp" %>   
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 loginForm.jsp -->

<!-- id or pw or level값이 하나라도 guest라면 = 로그인하지 않은 상태라면 로그인 폼을 보여준다 -->	
<% if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")) { 
	//-- 아이디 저장 쿠키 확인 -------------------------------------
	//request.getCookies();  → 서버가 사용자PC에 저장해놓은 모든 쿠키를 불러온다 (그래서 배열로 리턴됨)
	Cookie [] cookies = request.getCookies();
	String c_id = "";
	
	if (cookies != null) {
		// 쿠키 값이 존재한다면
		for (int i=0; i<cookies.length; i++){  // 모든 쿠키 값 검색
			Cookie cookie = cookies[i];  	   // 쿠키 하나씩 배열에 저장
				if(cookie.getName().equals("c_id") == true ){
					//cookie = new Cookie ("c_id",id);  → "c_id"에 저장해놓은 쿠키 찾기 
					c_id = cookie.getValue();
					// 쿠키값이 살아있다면 c_id변수에 저장된 값을(쿠키에 저장된 아이디) 넣어준다 = c_id값을 아이디 value에 출력해주면 된다 	
				}//if end
		}//for end
	}//if end
	//--------------------------------------------------------
%>

	<form name="loginfrm" id="loginfrm" action="loginProc.jsp" onsubmit="return loginCheck()"> <!-- myscript.js -->
		<table class="table">
			<tr>
			    <td>
				   <input type="text" name="id" id="id" value="<%= c_id %>" placeholder="아이디" maxlength="10" required>
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
			   	  <!-- 만일 사용자가 체크박스를 체크했다면 로그아웃을 하더라도 그 설정값을 살려서 체크되어있어야 한다 (if문) -->
			      <label><input type="checkbox" name="c_id" value="SAVE" <% if(!(c_id.isEmpty())){out.print("checked");} %>>아이디 저장</label>			  
				  															<!-- c_id가 공백이 아니라면 / (c_id.length != 0 ) -->
				  &nbsp;&nbsp;&nbsp;
				  <a href="agreement.jsp">회원가입</a>
				  &nbsp;&nbsp;&nbsp;
  				  <!-- 10/19 과제  -->
				  <a onclick="findID()">아이디 찾기</a>
				  &nbsp;&nbsp;&nbsp;
				  <a onclick="findPW()">비밀번호 찾기</a>
  				  &nbsp;&nbsp;&nbsp;
  				  <!-- 강사님(10/20) -->
				  <a href="T_findid.jsp">아이디/비밀번호 찾기</a>

			
			   </td>
			</tr>	
				  
		</table>	
	</form>
<% } else {
	// 로그인에 성공했다면 로그아웃버튼 만들어주기 
	out.println("<strong style='font-size:30px;'> " + s_id + "</strong> 님 <br>");
	out.println("<a href='logout.jsp'>로그아웃</a>");
	out.println("&nbsp;&nbsp;");
	out.println("<a href='memberModify.jsp'>회원정보수정</a>");
	out.println("&nbsp;&nbsp;");
	out.println("<a href='memberWithdraw.jsp'>탈퇴</a>");
	
	
	
	
}//if end %>
	<!-- 본문 끝 -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->