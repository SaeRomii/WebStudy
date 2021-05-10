<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	//한글 안깨지게 하는 영역
	request.setCharacterEncoding("UTF-8");

	// 정수 1 데이터 수신
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

<div>
	<h2>연산 결과</h2>
	<!-- 『입력하신 45와 32의 연산 결과는 77 입니다.』 -->
	입력하신 <span><%=su1 %></span>와 <span><%=su2 %></span>의 연산 결과는 <span><%=result %></span>입니다.
</div>

</body>
</html>