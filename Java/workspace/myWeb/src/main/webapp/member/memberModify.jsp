<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %>
<%@ include file="auth.jsp" %>  
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 memberModify.jsp -->
	<h3 style="color:gray; font-weight:500;">회원정보 수정</h3><br>
	
<!-- 회원가입폼(memberForm)가져와서 일단 입력된 회원정보 보여주기 (hidden 으로 아이디넘겨주기)
     → 사용자가 새로운 값을 입력하면 request.getP로 가져와서 함수로 전송
     → 해당 값 받아서 update sql 실행 
     → 회원정보과 완전히 수정되면 마이페이지?처럼 보여주기? -->
<%	
	dto = dao.read(s_id);
	
	if(dto == null) {
		out.print ("회원 정보가 존재하지 않습니다.");
	}else {

%>	
		
<form name="memfrm" id="memfrm" action="memberModifyProc.jsp" onsubmit="return memberCheck()"><!-- myscript.js -->
	<table class="table">
	<tr>
	    <th>*아이디</th>
	    <td style="text-align: left">
	      <input type="text" name="id" id="id" size="15" value="<%= dto.getId() %>" readonly>

	    </td>
	</tr>
	<tr>
	    <th>*비밀번호</th>
	    <td style="text-align: left"><input type="password" name="passwd" id="passwd" size="15" required></td>
	</tr>
	<tr>
	    <th>*비밀번호 확인</th>
	    <td style="text-align: left"><input type="password" name="repasswd" id="repasswd" size="15" required></td>
	</tr>
	<tr>
	    <th>*이름</th>
	    <td style="text-align: left"><input type="text" name="mname" id="mname" size="15" value="<%= dto.getMname() %>"  maxlength="20" required></td>
	</tr>
	<tr>
	    <th>*이메일</th> 
	    <td style="text-align: left">
	      <input type="email" name="email" id="email" size="30" value="<%= dto.getEmail() %>" readonly>
	      <input type="button" value="Email 중복확인" onclick="emailCheck()"> <!-- myscript.js -->
	    </td>
	</tr>
	<tr>
	    <th>전화번호</th> 	<!-- 전화번호밑으로는 if문으로 null이면 공백문자띄우기 -->
	    <td style="text-align: left"><input type="text" name="tel" id="tel" size="15" value="
<%
		if (dto.getTel() == null){
			out.print("");
		}

%>
		"></td>
	</tr>
	<tr>
	    <th>우편번호</th>
	    <td style="text-align: left">
	      <input type="text" name="zipcode" id="zipcode" size="7"  value="
<%
		if (dto.getZipcode() == null){
			out.print("");
		}

%>
		" readonly>
	      <input type="button" value="주소찾기" onclick="DaumPostcode()">    
	    </td>
	</tr>
	<tr>  
	  <th>주소</th>
	  <td style="text-align: left"><input type="text" name="address1" id="address1" size="45" value="
<%
		if (dto.getAddress1() == null){
			out.print("");
		}

%>
		" readonly></td>
	</tr>
	<tr>  
	  <th>나머지주소</th>
	  <td style="text-align: left"><input type="text" name="address2" id="address2" size="45" value="
<%
		if (dto.getAddress2() == null){
			out.print("");
		}

%>
		"></td>
	</tr>
	<tr>  
	  <th>직업</th>
	  <td style="text-align: left">
	        <select name="job"  id="job">
<%
			switch(dto.getJob()){
			 case "A01" :
				  %>
			  		<option value="A01" selected>회사원</option>
		            <option value="A02">IT관련직</option>
		            <option value="A03">학생</option>
		            <option value="A04">주부</option> 
		            <option value="A05">기타</option>
				  <%
				  break;
			 case "A02" : 
				  %>
  			  		<option value="A01" >회사원</option>
		            <option value="A02" selected>IT관련직</option>
		            <option value="A03">학생</option>
		            <option value="A04">주부</option> 
		            <option value="A05">기타</option>
				  <%
		          break;
				  
			 case "A03" : 
				  %>
  			  		<option value="A01" >회사원</option>
		            <option value="A02" >IT관련직</option>
		            <option value="A03" selected>학생</option>
		            <option value="A04">주부</option> 
		            <option value="A05">기타</option>
		  		 <%
		          break;
				  
			 case "A04" : 
				  %>
  			  		<option value="A01" >회사원</option>
		            <option value="A02" >IT관련직</option>
		            <option value="A03" >학생</option>
		            <option value="A04" selected>주부</option> 
		            <option value="A05">기타</option>
				  <%
		          break;
				  
			 case "A05" : 
				  %>
   			  		<option value="A01" >회사원</option>
		            <option value="A02" >IT관련직</option>
		            <option value="A03" >학생</option>
		            <option value="A04" >주부</option> 
		            <option value="A05" selected>기타</option>
				  <%
		          break;
			}
	
%>
<!-- 
	          <option value="A01">회사원</option>
	          <option value="A02">IT관련직</option>
	          <option value="A03">학생</option>
	          <option value="A04">주부</option> 
	          <option value="A05">기타</option>
-->
	        </select>
	  </td>
	</tr>
	<tr>
	    <td colspan="2">
	        <input type="submit" value="수정"  class="btn btn-primary"/>
	        <input type="reset"  value="취소"  class="btn btn-primary"/>
	    </td>
	</tr>
	</table>
	
	<!-- ----- DAUM 우편번호 API 시작 ----- -->
	<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
	  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
	</div>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	    // 우편번호 찾기 화면을 넣을 element
	    var element_wrap = document.getElementById('wrap');
	
	    function foldDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_wrap.style.display = 'none';
	    }
	
	    function DaumPostcode() {
	        // 현재 scroll 위치를 저장해놓는다.
	        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = data.address; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수
	
	                // 기본 주소가 도로명 타입일때 조합한다.
	                if(data.addressType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('address1').value = fullAddr;
	
	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_wrap.style.display = 'none';
	
	                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	                document.body.scrollTop = currentScroll;
	                
	                $('#address2').focus();
	            },
	            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
	            onresize : function(size) {
	                element_wrap.style.height = size.height+'px';
	            },
	            width : '100%',
	            height : '100%'
	        }).embed(element_wrap);
	
	        // iframe을 넣은 element를 보이게 한다.
	        element_wrap.style.display = 'block';
	    }
	</script>
	<!-- ----- DAUM 우편번호 API 종료----- -->

</form>
	
<%

}// if end
%>
	
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->