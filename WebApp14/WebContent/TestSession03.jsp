<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신(TestSession02.jsp)
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	String userName = (String)session.getAttribute("userName");
	String userBirth = (String)session.getAttribute("userBirth");
	
	session.removeAttribute("userName");
	session.removeAttribute("userBirth");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
</head>
<body>

<div>
	<h1>이름, 생일, 아이디, 패스워드 출력</h1>
	<hr>
</div>

<div>
	<h2>이름 : <%=userName %></h2>
	<h2>생일 : <%=userBirth %></h2>
	<h2>아이디 : <%=userId %></h2>
	<h2>패스워드 : <%=userPwd %></h2>
</div>

</body>
</html>