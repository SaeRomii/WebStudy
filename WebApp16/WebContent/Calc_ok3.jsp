<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="ob" class="com.test.Calc" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"></jsp:setProperty>
<!-- 서블릿이 알아서 값 입력한거 정해서 나오게하는거 -->
<!-- 대신 Calc.jsp에서 name이랑 Calc.java 함수명 같아야함 -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok3.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>세 번째 방법 처리 결과</h1>
	<hr>
</div>

<div>
	<h2><%=ob.result() %></h2>
</div>

</body>
</html>