<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

%>

<jsp:useBean id="ob" class="com.test.FriendDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!-- 이상형 배열이라서 반복문으로 출력 -->

<%
	String str = "";
	
	if(ob.getBoys() != null)
	{
		for(String s : ob.getBoys())
			str += s + " ";
	}

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SampleTest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>선택 결과</h1>
	<hr>
</div>

<div>
	<h2>이름 : <%=ob.getUserName() %></h2>
	<h2>나이 : <%=ob.getUserAge() %></h2>
	<h2>성별 : <%=ob.getGender() %></h2>
	<h2>이상형 : <%=str %></h2>
</div>

</body>
</html>