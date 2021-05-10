<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="8kb" autoFlush="true" %> 기본 속성 구성 --%>
<%-- <%@ page buffer="1kb" autoFlush="false" %> --%>
<!-- 2번째 줄이 default값인데 buffer 크기를 8에서 1로 줄이고 다 차면 밖으로 나가게 하지 못해라
해서 에러발생함 -->
<%-- <%@ page buffer="10kb" autoFlush="false" %> 일 경우 정상 처리 (default 값보다 커서 가능) --%>
<%-- <%@ page buffer="1kb" autoFlush="true" %> --%>
<!-- buffer를 1로 줄였지만 다차면 밖으로 내보내기 true 해서 정상 처리 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>page 디렉티브 buffer 속성 및 autoFlush 실습</h1>
	<hr>
</div>

<div>
	<h2>반복문 구성</h2>
	<% 
	for(int i=1; i<=1000; i++)
	{
	%>1234<% 
	} 
	%>
</div>

</body>
</html>