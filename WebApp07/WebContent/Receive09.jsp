<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String danStr = request.getParameter("dan");
	
	int dan=0;
	String result = "";
	
	try
	{
		dan = Integer.parseInt(danStr);
		
		for(int i=1; i<=9; i++)
		{
			result += String.format("%d * %d = %d<br>", dan, i, dan*i);
		}
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
<title>Receive09.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>구구단</h1>
	<div>
		<%=result %>
	</div>
	<hr>
</div>


</body>
</html>