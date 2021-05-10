<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역
	
	// 한글 안깨지게 하는 영역
	request.setCharacterEncoding("UTF-8");

	// 이름 데이터 수신
	String name = request.getParameter("name");					//-- 텍스트박스... 단일값 수신
	
	// 성별 데이터 수신
	String gender = request.getParameter("gender");				//-- 라디오버튼... 단일값 수신
	
	// 전공 데이터 수신
	String major = request.getParameter("major");				//-- 선택상자..... 단일값 수신
	
	// 취미 데이터 수신 (배열로)
	//-- 다중 선택이 가능한 선택상자일 경우... 배열 형태로 수신
	String[] hobby = request.getParameterValues("hobby");
	
	String genderStr = "";
	
	if(gender != null)
	{
		if(gender.equals("M"))
			genderStr = "남자";
		else if(gender.equals("F"))
			genderStr = "여자";
	}
	else
		genderStr = "확인불가";
	
	// url에서 직접 name=이새롬 이렇게 지정할 수 있는데 이 때 문제 안생기게 하려고 해주는거~!
	
	
	String hobbyStr = "";
	
	if(hobby != null)
	{
		for(String h : hobby)
		{
			hobbyStr += " [ " + h + " ] ";
		}
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습</h1>
	<hr>
	<p>RadioSelect.jsp → RadioSelect_ok.jsp ●</p>
</div>

<div>
	<h2>radio, select 데이터 수신</h2>
	
	<div>
		<h3>수신한 데이터</h3>
		
		<!-- <p>이름 : 박나현</p> -->
		<p>이름 : <%=name %></p>
		
		<!-- <p>성별 : F(여자)</p> -->
		<p>성별 : <%=genderStr %></p>
		
		<!-- <p>전공 : 국문학</p> -->
		<p>전공 : <%=major %></p>
				
		<!-- <p>취미 : [ 음악감상 ] [산악등반] </p> -->
		<p>취미 : <%=hobbyStr %></p>
	</div>
	
</div>


<%-- <div>
	<h2>수신 데이터</h2>
	
	<p>이름 : <%=name %></p>
	
	<p>성별 : <%=genderStr %></p>
	
	<p>전공 : <%=major %></p>
	
	<p>취미 : <%=hobbyStr %></p>
</div> --%>

</body>
</html>