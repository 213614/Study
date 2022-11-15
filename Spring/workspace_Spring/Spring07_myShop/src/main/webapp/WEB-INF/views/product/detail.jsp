<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>detail.jsp</title>
	<!--          ※ 경로 잘 체크 : 페이지소스보기에서 js나 css white label page뜨면 경로부터 조절해보기 -->
	<!--          ↓ 이건 절대 경로 -->
	<script src="/js/jquery-3.6.1.min.js"></script>
	<link href="/css/main.css" rel="stylesheet" type="text/css">
	<script>
		function product_update(){
			document.form1.action="/product/update";
			document.form1.submit();
		}//product_update() end
		
		 function product_delete(){
				if(confirm("영구히 삭제됩니다. \n진행할까요?")){
					document.form1.action="/product/delete";
					document.form1.submit();
				}//if end
	}//product_delete() end
	</script>
</head>
<body>
	<h3> 상품 상세보기 / 상품 수정 / 상품 삭제 </h3>
	<p>
		<button type="button" onclick="location.href='/product/list'">상품 전체 목록</button>
	</p>
	
	<form name="form1" method="post" action="insert" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>상품명</td>
				<td> <input type="text" name="product_name" value="${product.PRODUCT_NAME}"> </td>
			</tr>
			
			<tr>
				<td>가　격</td>
				<td> <input type="number" name="price" value="${product.PRICE}"> </td>
			</tr>
			
			<tr>
				<td>설　명</td>
				<td>								       <!-- textarea는 value에 적으면 안됨!! -->
					<textarea rows="5" cols="60" name="description">${product.DESCRIPTION}</textarea>
				</td>
			</tr>
			
			<tr>
				<td>사　진</td>
				<td> 
					<c:if test="${product.FILENAME != '-'}">
						<img src="/storage/${product.FILENAME}" width="100px">
					</c:if>
					
					<br>
					
					<input type="file" name="img"> 
				</td>
			</tr>
	
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="product_code" value="${product.PRODUCT_CODE}">
					<input type="button" value="상품 수정" onclick="product_update()">
					<!-- ※ 상품 수정시 반드시 파일 첨부해야함! -->
					<input type="button" value="상품 삭제" onclick="product_delete()">
				</td>
			</tr>
	
		</table>
	</form>
	
	<hr>
	
	<!-- 댓글란 -->
	<div class="container">
		<label for="content"> 댓글 </label>
		
		<form name="commentInsertForm" id="commentInsertForm">
			<div>
				<input type="hidden" name="pno" id="pno" value="${product.PRODUCT_CODE}">
				<input type="text" name="content" id="content" placeholder="내용을 입력해주세요.">
				<button type="button" name="commentInsertBtn" id="commentInsertBtn"> 등록 </button>
			</div>
		</form>
	</div>
	
	<hr>
	
	<div class="container">
		<div class="commentList"></div>
	</div>
	
	<!-- 댓글 관련 JavaScript -->
	<!-- 페이지단위가 아닌 문자 단위이기때문에 제이쿼리를 활용하려면 자바스크립트를 사용해야한다 src로 연결필수 -->
	<script>
		let pno = ${product.PRODUCT_CODE}; 		// 부모글번호 필수 
		
		$('#commentInsertBtn').click(function(){// 댓글 등록 버튼 클릭 시 
			// <form id="commentInsertForm">안의 내용 가져와서 insertDate라는 변수에 담기
			let insertDate = $('#commentInsertForm').serialize();		
			//alert(insertDate);
			commentInsert(insertDate); 			// 함수 호출(아래에 댓글 등록 함수)
		});//click() end

		// 댓글 등록 함수
		function commentInsert(insertDate){
			
			//alert("댓글 등록 함수 호출" + insertDate);
				
			$.ajax({
						 url     : "/comment/insert"		// 명령어
						,type    : "post"					// 전송타입 
						,data    : insertDate				// 데이터 (변수명)
						,success : function(data){			// 성공시 실행할 함수 (= callback함수)
									     //  ↑ : callback시(호출한 장소로 되돌아옴) 가지고 올 값(retrun값)
							//alert(data);
							// data값이 1 이면 성공 
		
							if(data == 1){
								commentList();  		// 댓글 작성 후 댓글 목록 함수 호출
								$("#content").val('');	// 기존 댓글 내용 지우고 시작(작성중이던 댓글내용 등록 누르면 지워짐)
							}//if end
						
						}//suc end
			});//ajax() end
		
		}//commentInsert() end
		
			
		// 댓글 목록 보기 
		function commentList(){
			$.ajax({
						 url     : "/comment/list"
						,type    : "get"
						,data    : {'pno':pno}			// 부모 글번호
						,success : function(data) {
							
							//alert(data);
							
							let a = "";
							$.each(data, function(key, value){
								
								/*
								alert(key);			// 댓글 순서(작성순) index
								alert(value);
								alert(value.cno);
								alert(value.pno);
								alert(value.content);
								alert(value.wname);
								alert(value.regdate);
								*/
								
								a += "<div class='commentArea' style='border-bottom : 1px solid darkgray; margin-bottom : 15px;'>";
								a += "	<div class = 'commentInfo" + value.cno + "'>";	
								a += "		댓글번호 : " + value.cno + " / 작성자 : " + value.wname + " / 작성일 : " + value.regdate;
								//															   ↓ 온점 아니고 쉼표 주의!				
								a += "		<a href='javascript:commentUpdate(" + value.cno + ",\"" + value.content + "\");'>수정</a>";
								//													↑ 수정할 댓글 번호 		↑ 수정할 댓글 내용을 함수에다 넘겨준다 : input박스에 띄울 수 있도록
								a += " | ";
								a += "		<a href='javascript:commentDelete(" + value.cno + ");'>삭제</a>";
								a += "	</div>";	
								a += "	<div class='commentContent" + value.cno + "'>";
								a += "		<p> 내용 : " + value.content + "</p>";
								a += "	</div>";
								a += "</div>";
								
							})//each() end
							
							$(".commentList").html(a);
							
						}//suc() end
			})//$.ajax() end
		}//commentList() end
	
		
		// 페이지 로딩시 댓글 목록 자동 출력 (이거없으면 댓글 등록해야만 목록이 보임)
		$(document).ready(function(){
			commentList();		// 댓글 목록 함수 호출(위에)
		})//ready() end
		
		
		// 댓글 수정 : 댓글 내용 출력을 input폼으로 변경하고 원래 적혀있던 댓글내용 띄워주기 
		function commentUpdate(cno, content){
			
			let a = '';
			a += "<div class ='input-group'>";
			//a += "<input type ='text' name ='content_"+ cno + "' value ='" + content + "'>"; 
			a += "	<input type='text' id='content_" + cno + "' value='" + content + "'>";
			a += "	<button type='button' onclick='commentUpdateProc(" + cno + ")'>수정</button>";
			a += "</div>";
			
			$(".commentContent" + cno).html(a);
			//    ↑ 댓글목록 <div class="commentContent">	
			
		}//commentUpdate() end
		
		
		function commentUpdateProc(cno){
			
			//let updateContent = $("[name=#content_" + cno + "]").val();
			let updateContent = $("#content_" + cno).val();
			
			$.ajax({
				 		 url     : "/comment/update"
						,type    : "post"
						,data    : {'content':updateContent, 'cno':cno}
						,success : function(data) {
							if(data == 1){
								commentList();	// 댓글 수정 후 목록 출력을 위한 목록 함수 호출
							}//if end
						}//suc() end					
			});//ajax() end
		}//commentUpdateProc() end
	
		
		// 댓글 삭제
		function commentDelete(cno) {
			
			//alert(cno);		
			
			$.ajax({					// ↓ 뒤에 cno가 붙어야하니 / 필수 ?delete=cno값 넘겨야니까 				
		 		 url     : "/comment/delete/" + cno
				,type    : "post"		// get도 가능
				,success : function(data) {
					if(data == 1){
						commentList();	// 댓글 삭제 후 목록 출력을 위한 목록 함수 호출
					}//if end
				}//suc() end					
			});//ajax() end
			
		}//commentDelete() end
		
	</script>
</body>
</html>