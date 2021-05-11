<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 스크립트 릿 영역
	
	//한글 안깨지게 하는 영역
	request.setCharacterEncoding("UTF-8");

	// 데이터수신
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String userGender = request.getParameter("userGender");
	String userCity = request.getParameter("userCity");
	
	// 체크박스는 배열로
	String[] userSubject = request.getParameterValues("userSubject");
	
	// 배열은 null체크 필수~!
	
	String subjectStr = "";
	
	if(userSubject != null)
	{
		for(int i=0; i<userSubject.length; i++)
		{
			subjectStr += " [ " + userSubject[i].toString() + " ] ";
		}
	}
	
	// ※ 추후에는 수신된 데이터를 쿼리문을 통해 DB에 입력하는
	//	  과정 등이 포함될 것임을 염두하여 작업을 진행할 수 있도록 하자

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>

<div>
	<h2>가입 승인 내역</h2>
	
	<!-- <p>아이디 : superman</p> -->
	<p>아이디 : <%=userId %></p>
	
	<!-- <p>패스워드 : 1234</p> -->
	<p>패스워드 : <%=userPwd %></p>
	
	<!-- <p>이름 : 홍길동</p> -->
	<p>이름 : <%=userName %></p>
	
	<!-- <p>전화번호 : 010-1111-1111-</p> -->
	<p>전화번호 : <%=userTel %></p>
	
	<!-- <p>성별 : 여성</p> -->
	<p>성별 : <%=userGender %></p>
	
	<!-- <p>지역 : 서울</p> -->
	<p>지역 : <%=userCity %></p>
	
	<!-- <p>수강과목 : 자바기초</p> -->
	<p>수강과목 : <%=subjectStr %></p>
	
</div>


</body>
</html>