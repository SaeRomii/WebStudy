<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역
	
	// 한글 안깨지게 하는 영역
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지로(Gugudan.jsp)부터 데이터 수신 → 스크립트 릿 영역
	// request 객체의 getParameter() 메소드 활용 → 이름(name) 식별자
	String danStr = request.getParameter("dan");
	
	int n = 0;
	
	try
	{
		n = Integer.parseInt(danStr);	
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
<title>Gugudan_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>Gugudan.jsp → Gugudan_ok.jsp ●</p>
</div>

<div>
	<h2>구구단 출력</h2>
</div>

<!-- html 주석문 -->
<!-- html 주석문은 서블릿 컨테이너 눈에 보여서 그려짐-->
<!-- JSP 컨테이너라는건 없음 JSP 컨테이너라고 하면 서블릿 컨테이너라고 보면됨 -->
<%-- JSP 주석문 --%>

<%-- <%
	for(int i=1; i<=9; i++)
	{%>
		<!-- 자바가 아닌 영역에 보여줘야 바디에 보임 -->
		<%=n %> * <%=i %> = <%=(n*i) %><br>
		<!-- out.print(n + " * " + i + " = " + (n*i) + "<br>"); -->
	<%}

%> --%>

<%
	for(int i=1; i<=9; i++)
	{
		out.print(n + " * " + i + " = " + (n*i) + "<br>");
	}
%>

</body>
</html>