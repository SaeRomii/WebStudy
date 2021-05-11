<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//한글 안깨지게 하는 영역
	request.setCharacterEncoding("UTF-8");

	//데이터 수신
	String danStr = request.getParameter("dan");
	
	int dan=0;
	String result = "";
	
	try
	{
		dan = Integer.parseInt(danStr);
		
		for(int i=1; i<=9; i++)
			result += String.format("%d * %d = %d<br>", dan, i, (dan*i));
		
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
<title>Receive05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습05</h1>
	<hr>
</div>
	<h2>구구단 출력</h2>
	<div>
		<%=result %>
	</div>
	
<%-- <%
	for(int i=1; i<10; i++)
	{%>
		<%=dan %> * <%=i %> = <%=dan*1 %><br>
	<%}

%> --%>

</body>
</html>