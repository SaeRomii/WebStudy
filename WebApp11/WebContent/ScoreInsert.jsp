<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//한글 안깨지게 하는 영역
	request.setCharacterEncoding("UTF-8");

	//ScoreList.jsp
	String userName = request.getParameter("userName");
	String userKor = request.getParameter("userKor");
	String userEng = request.getParameter("userEng");
	String userMat = request.getParameter("userMat");
	
	ScoreDAO dao = null;
	
	try
	{
		dao = new ScoreDAO();
		
		// ScoreDTO 구성
		ScoreDTO score = new ScoreDTO();
		score.setNAME(userName);
		score.setKOR(userKor);
		score.setENG(userEng);
		score.setMAT(userMat);
		
		// dao의 add() 메소드 호출 → insert 쿼리문 수행
		dao.add(score);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 클라이언트가 요청해야 할 때 주소 전달
	response.sendRedirect("ScoreList.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>큰주제</h1>
	<hr>
</div>

<div>
	<h2>작은주제</h2>
	<form>
	</form>
</div>

</body>
</html>