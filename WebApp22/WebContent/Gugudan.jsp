<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core)를 활용한 구구단 출력</h1>
	<hr>
</div>

<div>
	<form>
		원하는 단 입력 <input type="text" name="dan"><br><br>
		
		<button type="submit" class="btn"
		style="width: 200px; font-size: 16pt;">결과 확인</button>
	</form>
</div>
<br>

<div>
	<c:if test="${!empty param.dan }">
	<ul>
		<!-- 
		<li>2 * 1 = 2</li>
		<li>2 * 2 = 4</li>
		<li>2 * 3 = 6</li>
		<li> : </li> 
		-->
		<c:forEach var="su" begin="1" end="9">
		<li>${param.dan } * ${su } = ${param.dan*su }</li>
		</c:forEach>
	</ul>
	</c:if>
</div>

</body>
</html>