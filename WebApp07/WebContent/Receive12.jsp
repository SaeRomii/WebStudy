<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect12.jsp로부터 get 방식으로 넘겨받은 데이터 수신
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String cal = request.getParameter("cal");
	String result = request.getParameter("result");
	
	if(cal.equals("1"))
		cal = " + ";
	else if(cal.equals("2"))
		cal = "-";
	else if(cal.equals("3"))
		cal = "*";
	else if(cal.equals("4"))
		cal = "/";
	
	String resultStr = String.format("%s %s %s = %s", num1, cal, num2, result);
	
	/* // 데이터 수신
	String num1Str = request.getParameter(name)

	// object로 반환돼서 String 문자열로 다운캐스팅
	String resultStr = (String)request.getAttribute("resultStr");

	//String resultStr = (String)request.getSession().getAttribute("resultStr"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive12.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>

<div>
	<h2>최종 수신 페이지(Receive12.jsp)</h2>
	정수1: <%=num1 %><br>
	정수2: <%=num2 %><br>
	연산 결과 : <%=resultStr %>
</div>

</body>
</html>