<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukForm.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
		body { 
			margin-top: 20px; 
			text-align: center;
		}
		th { 
			text-align:center;
			vertical-align: middle;
			background-color: #a2c3d7;
			color: white;
		}
		.btn { color: #a2c3d7; }
		.btn:hover {
			 background-color: #a2c3d7;
		 	 color : white;
		}
		form { 
			display: inline-block; 
			text-align: left;
			width:500px;
		}
		.sr { 
			color : #8c8c8c;
			border: none;
			background-color: white;  
		}
	</style>
</head>
<body>
	<h3>성적 입력</h3><br>
	
	<form name="sungjukFrm" id="sungjukFrm" method="post" action="sungjukIns.jsp">
	<!-- 원래는 onsubmit="" 으로 JS에서 유효성검사를 먼저 하고 가는것이 맞다(지금은 생략) -->
		<div class="container">
		<table class="table table-bordered">		 
			<tr>
			  <th>이름　</th>
			  <td><input type="text" name="uname" maxlength="20" required autofocus class="form-control"></td>
			</tr> 

			
			<tr>
			  <th>국어　</th>
			  <td><input type="number" name="kor" size="5" min="0" max="100" placeholder="숫자만 입력" class="form-control"></td>
			</tr>
			
			<tr>
			  <th>영어　</th>
			  <td><input type="number" name="eng" size="5" min="0" max="100" placeholder="숫자만 입력" class="form-control"></td>
			</tr> 
			
			<tr>
			  <th>수학　</th>
			  <td><input type="number" name="mat" size="5" min="0" max="100" placeholder="숫자만 입력" class="form-control"></td>
			</tr>
			
			<tr>
			  <th>주소　</th>
			  <td>
			      <select class="form-control" name="addr">
		              <option value="Seoul">서울</option>
		              <option value="Jeju" >제주</option>
		              <option value="Suwon">수원</option>
		              <option value="Busan">부산</option>
			      </select> 
			  </td>
			</tr>
			
			<tr>
			  <td colspan="2" align="center">
			     <input type="submit" value="전송" class="sr">
			     <input type="reset"  value="취소" class="sr">
			  </td>
			</tr>
		</table>
		</div>
	</form>
	
	<p><a href="sungjukList.jsp" type="button" class="btn btn-light btn-sm">목록</a></p>
	
</body>
</html>