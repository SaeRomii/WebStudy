<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역
	
	// 한글 안깨지게 하는 영역
	request.setCharacterEncoding("UTF-8");
	
	/* // 이름 데이터 수신
	String name = request.getParameter("userName");
	
	// 국어점수 데이터 수신
	int kor = Integer.parseInt(request.getParameter("userKor"));
	
	// 영어점수 데이터 수신
	int eng = Integer.parseInt(request.getParameter("userEng"));
	
	// 수학점수 데이터 수신
	int mat = Integer.parseInt(request.getParameter("userMat")); */
	
	String userName = request.getParameter("userName");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor, eng, mat;
	kor=eng=mat=0;
	int tot=0;
	double avg=0;
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		tot = kor + eng + mat;
		avg = tot / 3.0;
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
<title>Receive02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type = "text/css">
	span {color: blue; font-weight: : bold; font-size: 15pt;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 01</h1>
	<hr>
</div>

<div>
	<h2>점수 확인</h2>
	<span><%=userName %></span>님, 성적 처리가 완료되었습니다.<br>
	회원님의 점수는 국어:<span><%=kor %></span>, 영어:<span><%=eng %></span>, 수학:<span><%=mat %></span>입니다.<br>
	총점은 <span><%=tot %></span>, 평균은 <span><%=String.format("%.1f", avg) %></span>
</div>

<!-- 『000님, 성적 처리가 완료되었습니다.
	       회원님의 점수는 국어:90점, 영어:80점, 수학:70점 입니다.
	       총점은 240점, 평균은 80.0점 입니다.』 -->


</body>
</html>