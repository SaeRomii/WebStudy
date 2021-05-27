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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) 문제</h1>
	<h2>회원 정보 입력</h2>
	<hr>
</div>

<div>
	<form action="MemberInsert.jsp" method="post">
		<%-- <table class="table">
			<tr>
				<th>이름</th>
				<td>
					<!-- <input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text"> -->
					
					<c:set var="result" value="1"></c:set>
					<c:forEach var="a" begin="1" end="5" step="1">
						<input type="text" name="name${result }">
						<c:set var="result" value="${result+1 }"></c:set>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<!-- <input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text"> -->
					
					<c:set var="result" value="1"></c:set>
					<c:forEach var="a" begin="1" end="5" step="1">
						<input type="text" name="tel${result }">
						<c:set var="result" value="${result+1 }"></c:set>
					</c:forEach>
				</td> 
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<!-- <input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text"> -->
					
					<c:set var="result" value="1"></c:set>
					<c:forEach var="a" begin="1" end="5" step="1">
						<input type="text" name="addr${result }">
						<c:set var="result" value="${result+1 }"></c:set>
					</c:forEach>					
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" style="width: 100%;" class="btn">입력</button>
				</td>
			</tr>
		</table> --%>
		
		<%-- <c:forEach var="member" begin="1" end="5" step="1">
			이　　름 : <input type="text" class="txt" name="name"><br>
			전화번호 : <input type="text" class="txt" name="tel"><br>
			주　　소 : <input type="text" class="txt" name="addr"><br><br>
		</c:forEach> 
		
		<button type="submit" class="btn" style="width: 200px; font-size: 16pt;">입력</button> --%>
		
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<!-- 
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
				    -->
				   	<c:forEach var="a" begin="1" end="5" step="1">
				   		<input type="text" name="name">
				    </c:forEach>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<!-- 
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
					-->
					<c:forEach var="a" begin="1" end="5" step="1">
				   		<input type="text" name="tel"> 
				    </c:forEach>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<!-- 
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
					-->
					<c:forEach var="a" begin="1" end="5" step="1">
				   		<input type="text" name="addr"> 
				    </c:forEach>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<button type="submit" style="width: 100%" class="btn">입력</button>
				</td>
			</tr>
		</table>
		
	</form>
</div>

</body>
</html>