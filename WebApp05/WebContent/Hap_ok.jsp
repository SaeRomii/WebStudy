<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역
	
	// ※ 『request』 : JSP 내장 객체
	
	// request로 받는건 기본적으로 문자열
	// 이전 페이지(Hap.jsp)로 부터 데이터 수신
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	
	int sum = 0;
	
	try
	{
		// 문제 발생할 수 있는 부분 try catch로 잡아서 클라이언트한테는 안보이고
		// 서버 콘솔창에만 나오게
		// 입력창에서 정수를 넣어야하는데 문자열을 넣는다거나 하면 오류발생
		// 그걸 try catch 로 잡음
		// 만약 Hap부터 실행안하고 Hap_ok부터 실행하게 되면 9-10번째 줄에서 값을 받아와야하는데 받아온 값이 없어서
		// null값됨 그럼 클라이언트 화면상에는 0으로 표시되고 서버 콘솔창에는 number어쩌구exception나옴
		int n1 = Integer.parseInt(s1);
		int n2 = Integer.parseInt(s2);
		
		sum = n1 + n2;
	}
	catch(Exception e)
	{
		// 예외 발생 시
		// 클라이언트의 브라우저 화면에 출력되지 않고
		// 서버의 콘솔 창에 오류 메세지가 나오도록 구성
		System.out.println(e.toString());
		
		// 예외 발생 시
		// 해당 내용을 서버 로그 기록으로 남기는 처리
		getServletContext().log("오류 : " + e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hap_ok.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>Hap.jsp → Hap_ok.jsp ●</p>
</div>

<div>
	<h2>결과 : <%=sum %></h2>
	<!-- ※ Hap.jsp 의 정수1 또는 정수2 항목에
	        정수 형태의 숫자가 아닌
	        변환이 불가능한 문자나 빈 공백을 입력했을 경우
	        결과 확인 버튼 클릭 시
	        클라이언트의 화면 처리 결과를
	        try ~ catch 블럭에 의해 항상 0으로 출력되는 것을
	        확인할 수 있다. -->
</div>

</body>
</html>