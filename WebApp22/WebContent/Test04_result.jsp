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
<title>Test04_result.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) forEach문을 이용한 자료구조 활용 실습</h1>
	<hr>
</div>

<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
		
		<!-- 향상된 for문과 같은 구조
		for(자료형 변수명 : 자료구조)
		{
		} 
		-->
		
		<!-- for(MyData dto : request.getAttribute("lists")) -->
		<!-- ↑ 이 구문 간단하게 만든게 ↓ -->
		
		<!-- 컬렉션 객체를 처리하기 위한 반복문 구성 -->
		<!-- items 속성에는 collection  들어감 -->
		<%-- <c:forEach var="변수" items="컬렉션"></c:forEach> --%>
		<c:forEach var="dto" items="${lists }">
		<tr>
			<td style="text-align: center;">${dto.name }</td>
			<td style="text-align: center;">${dto.age }</td>
		</tr>
		</c:forEach>
		
	</table>
</div>

</body>
</html>