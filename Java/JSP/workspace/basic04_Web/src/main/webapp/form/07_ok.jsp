<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>07_ok.jsp</title>
	<style>
		.re { font-weight : bold; }
	</style>
</head>
<body>
	<h3>* 계산기 연습 *</h3><hr>
<%
	// 한글 인코딩
	request.setCharacterEncoding("UTF-8");
	
	//사용자가 입력·요청한 정보를 개별적으로 가져오기
	String op = request.getParameter("op").trim();
	int num1 = Integer.parseInt(request.getParameter("num1").trim());
	int num2 = Integer.parseInt(request.getParameter("num2").trim());

	int result = 0;
	
    switch (op) {
	     case "+" :
	   	    result = num1 + num2;
	   	    out.print(num1 + op + num2 + "= <span class=re>" + result + "</span><hr>");
	        break;
	     case "-" :
	   	    result = num1 - num2;
	   	    out.print(num1 + op + num2 + "= <span class=re>" + result + "</span><hr>");
	        break;
	     case "*" :
	   	    result = num1 * num2;
	   	    out.print(num1 + op + num2 + "= <span class=re>" + result + "</span><hr>");
	        break;
	     case "/" :
	   	    double result0 = (double) num1 / num2;
	   	    out.print(num1 + op + num2 + "= <span class=re>" + result0 + "</span><hr>");
	        break;
	     case "%" :
	   	    result = num1 % num2;
	   	    out.print(num1 + op + num2 + "= <span class=re>" + result + "</span><hr>");
	        break;
	      default :
	   	    result = 0; 
	   	    out.print("<span class=re> 다시 입력해주세요. </span><hr>");
	   	    break;
    }
    
    // 강사님 코드
    int re1 = 0;
    double re2 = 0.0;
    
    if (op.equals("+")){
    	re1 = num1 + num2;
    } else if (op.equals("-")){
    	re1 = num1 - num2;
    } else if (op.equals("*")){
    	re1 = num1 * num2;
    } else if (op.equals("/")){
    	re2 = (double) num1 / num2;
    } else if (op.equals("%")){
    	re1 = num1 % num2;
    } //if end
%>
<!-- 출력 (강사님) -->
<div class ="container">
	<table class="table">
		<tr>
			<td><%=num1%></td>
			<td><%=op%></td>
			<td><%=num2%></td>
			<td> = </td>
			<td>
<%
			if(op.equals("/")){
				out.print(String.format("%.1f", re2));	
				// 소수점 한자리수로 문자열 출력 = ex. "0.6"
			}else { out.print(re1); }
%>
			</td>
		</tr>
	</table>
</div>
	
	

</body>	
</html>