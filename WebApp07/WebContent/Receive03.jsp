<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	//한글 안깨지게 하는 영역
	request.setCharacterEncoding("UTF-8");

	/* // 정수 1 데이터 수신
	String su1Str = request.getParameter("su1");
	
	// 연산 데이터 수신
	String operationStr = request.getParameter("operation");
	
	// 정수 2 데이터 수신
	String su2Str = request.getParameter("su2");
	
	
	int su1, su2;
	su1=su2=0;
	int result=0;
	
	try
	{
		su1 = Integer.parseInt(su1Str);
		su2 = Integer.parseInt(su2Str);
		
		result = su1+su2;

	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	} */
	
	// 이전 페이지(Send03.html)로 부터 데이터 수신
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("op");
	
	String result = "";
	int num1=0;
	int num2=0;
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if(op.equals("+"))
			result = String.valueOf(num1+num2);
		else if(op.equals("-"))
			result = String.valueOf(num1-num2);
		else if(op.equals("*"))
			result = String.valueOf(num1*num2);
		else if(op.equals("/"))
			//result = String.valueOf(num1/num2);
			//result = String.valueOf((double)(num1/num));
			//result = String.valueOf(num1/(double)num2);   이렇게 해야함
			result = String.format("%.1f", num1/(double)num2);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습03</h1>
	<hr>
</div>

<%-- <div>
	<h2>연산 결과</h2>
	<!-- 『입력하신 45와 32의 연산 결과는 77 입니다.』 -->
	입력하신 <span><%=su1 %></span>와 <span><%=su2 %></span>의 연산 결과는 <span><%=result %></span>입니다.
</div> --%>

<div>
	<p>
		입력하신 <span><%=num1 %></span>과(와) <span><%=num2 %></span>의 연산 결과는
		<span><%=result %></span>입니다.
	</p>
</div>

</body>
</html>