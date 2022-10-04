<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_배열.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<h3>배열</h3>
<%
	String[] uname= {"라일락","진달래","개나리","무궁화","홍길동"};
	int[] kor= {100, 50, 95, 80, 60};
	int[] eng= {100, 55, 95, 85, 40};
	int[] mat= {100, 60, 35, 90, 30};
	int size=uname.length; //5
	
	// 평균
	int[] aver = {0, 0, 0, 0, 0};
	for(int i=0; i<size; i++){
		aver[i] = (kor[i]+eng[i]+mat[i])/3;
	}//for end
	
	// 등수
	int[] rank = {1, 1, 1, 1, 1};
	for(int i=0; i<size; i++){
		for(int j=0; j<size; j++){
			if(aver[i]<aver[j]){
				rank[i] += 1;
			}// if end
		}//for end
	}//for end
	
%>
	<!-- 출력 -->
	<div class="container">
		<table class="table table-striped">
		    <thead>
		      <tr>
		        <th>이름</th>
		        <th>국어</th>
		        <th>영어</th>
		        <th>수학</th>
		        <th>평균</th>
		        <th>등수</th>
		        <th>결과</th>
		      </tr>
		    </thead>
		    <tbody>
<%
			for(int i=0; i<size; i++){		// for문을 끊어서 사용한다:<tr>은 body영역에서 작성하는게 쉬우니까 → 옛날 방식이라 비추 
%>		
			<tr>
				<td><%= uname[i] %></td>
				<td><%= kor[i] %></td>
				<td><%= eng[i] %></td>
				<td><%= mat[i] %></td>
				<td><%= aver[i] %></td>
				<td><%= rank[i] %></td>
						
				<td>	
<%
				if(aver[i]>=70){
					if(kor[i]<40 || eng[i]<40 || mat[i]<40){
						out.print("재시험 &nbsp;");
					}else { out.print("합　격 &nbsp;"); }
				}else { out.print("불합격 &nbsp;"); }//if end
				
				for(int star=0; star<aver[i]/10; star++){
					out.print("*");
				}//for end
				
				// 평균 95이상 장학생
				if(aver[i]>=95){
					out.print("<span style='font-weight:bold;'>");
					out.print("&nbsp; 장학생");
					out.print("</span>");
					}//if end
%>
				<td>
			</tr>
<%		
			}//for end

%>
		    </tbody>
		  </table>
	</div>


</body>
</html>