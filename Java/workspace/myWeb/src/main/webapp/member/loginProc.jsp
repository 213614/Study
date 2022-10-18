<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %> 
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->
	<!-- 본문 시작 loginProc.jsp -->
	<h3>로그인 결과</h3>
<%
	String id 	  = request.getParameter("id").trim();
	String passwd = request.getParameter("passwd").trim();
	
	dto.setId(id);
	dto.setPasswd(passwd);

	String mlevel = dao.loginProc(dto);
	if (mlevel == null ) {
		out.println("<p>로그인에 실패하였습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
	} else {
		//로그인 성공
		//out.println(id + "님 환영합니다. <br>");
		//out.println("회원 등급 : " + mlevel + "<br>");
		
		// 다른 페이지로 이동해도 로그인이 유지되려면
		// = 다른 페이지에서 로그인 상태 정보를 공유할 수 있도록 
		session.setAttribute("s_id", id);
		session.setAttribute("s_passwd", passwd);
		session.setAttribute("s_mlevel", mlevel);
		// get했을때 값이 없으면 null이 나옴 = if(s_id==null){로그인안된상태}
		
		//--쿠키 시작---------------------------------------------------
		//→ 하나의 웹서버가 사용자PC에 저장하는 텍스트 파일(메모장 파일)로 된 정보
	    //→ 각 브라우저의 쿠키삭제의 영향을 받는다
	    //→ 쉽게 열어 볼 수 있다 = 보안에 취약하다 = 공개되어도 괜찮을 정보만 저장한다
	    //→ ex.아이디저장, 오늘창그만보기, 클락한상품목록
		//→ ex.오늘창그만보기는 자바스크립트 쿠키.(참조 : https://www.w3schools.com/js/js_cookies.asp )
		
		//<input type="checkbox" name="c_id" value="SAVE"> 아이디 저장 → 체크표시해야 value값이 살아있음
		//request.getParameter("c_id");  	→ checked : SAVE  |  unchecked : null
		//						 ↓ null값을 "" 빈 문자열로 변환해주는 함수  
		String c_id = Utility.checkNull(request.getParameter("c_id"));
		Cookie cookie = null; 
		
		if(c_id.equals("SAVE")){ // 아이디 저장 체크했다면
			// class라서 생성자 함수에 변수명 넘겨주면 됨
			// = 쿠키변수 선언 new Cookie("변수명",값);
			cookie = new Cookie ("c_id",id);
			
			// 쿠키 변수의 생존 기간 설정(한달)
			cookie.setMaxAge(60*60*24*30);  // 60초 * 60 = 1시간 * 24 = 하루 *30 = 한달
			// 생존기간이 길어도 각 브라우저에서 쿠키삭제하면 삭제됨	
		}else {
			// 아이디 저장 체크하지 않았을 경우 빈 문자열을 넣어준다
			cookie = new Cookie("c_id", ""); 
			cookie.setMaxAge(0);
			
		}//if end
		
		// 요청한 사용자 PC에 쿠키값을 저장하는 함수
		response.addCookie(cookie);
		
		// → 로그인 폼에서 if(cookie!=null){있으면 출력} 
		//--쿠키 　끝---------------------------------------------------
		
		// 로그인 성공시 첫 페이지(인트로페이지)로 이동	
		// http://localhost:9090/myweb/index.jsp
		//            ↑ SpringBoot에서 도메인(~.com)으로 바꾸는 객체가 존재
		String root = Utility.getRoot(); //"/myweb"반환
		response.sendRedirect(root+"/index.jsp");
		
	}//if end
%>
	
	
	<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->