<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//스크립트 릿 영역
	
	// 한글 안깨지게 하는 영역
	request.setCharacterEncoding("UTF-8");
	
	// 이름 데이터 수신
	String name = request.getParameter("name");
	
	// 메모 데이터 수신
	String memo = request.getParameter("memo");
	
	// 이상형 데이터 수신
	String[] checkGroup = request.getParameterValues("checkGroup");
	
	String str = "";
	
	// 수신된 데이터 없으면 null됨
	if (checkGroup != null)
	{
		for (String s : checkGroup)
		{
			str += " [" + s + "]";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkbox_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>Chckbox.jsp → Checkbox_ok.jsp ●</p>
</div>

<div>
	<h2>이름 : <%=name %></h2>
	<h3>메모</h3>
	<p><%=memo %></p>
	<h3>이상형 : <%=str %></h3>
</div>

</body>
</html>