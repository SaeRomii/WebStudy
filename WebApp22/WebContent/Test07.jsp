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
<title>Test07.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) import문 실습</h1>
	<hr>
</div>

<div>
	<p>『c:import』는 URL 처리에 관여하며,
	URL을 사용하여 다른 자원의 결과를 삽입할 때 사용하게 된다.</p>
</div>
<br>

<!-- 변수 지정(url) -->
<!-- url에 들어가는 값 = Gugudan.jsp -->
<c:set var="url" value="Gugudan.jsp"></c:set>

<!-- c:import 활용 -->
<!-- Gugudan.jsp를 import 시키면서 파라미터 값으로 받는거 -->
<!-- gugudan.jsp한테 dan을 7로 구성한거 넘겨줌 그래서 페이지 실행하면 7단 나옴 -->
<c:import url="${url }" var="impt">
	<c:param name="dan" value="7"></c:param>
</c:import>

<!-- 결과 화면 출력 -->
<c:out value="${impt }" escapeXml="false"></c:out>

<!-- 결과 화면 출력 -->
<!-- 결과 화면 출력 과정에서 HTML 코드를 함께 출력하는 구문 -->
<!-- escapeXml 속성의 기본값(default)은 true 로 설정되어 있다.
     xml을 빠져나간다(excape) -->
<!-- false 안써주면 default가 true라서 true 결과값 보여줌 -->
<c:out value="${impt }"></c:out>

</body>
</html>