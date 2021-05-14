<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;
	
	String scoreCount = "<span id='scoreCount'>전체 인원 수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		scoreCount += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th></tr>");
		
		// MemberDAO 객체의 lists() 메소드 호출
		//-- 반복문을 통해 <table> 하위 엘리먼트 생성
		for(ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" + score.getSID() + "</td>");
			str.append("<td>" + score.getNAME() + "</td>");
			str.append("<td>" + score.getKOR() + "</td>");
			str.append("<td>" + score.getENG() + "</td>");
			str.append("<td>" + score.getMAT() + "</td>");
			str.append("<td>" + score.getTOT() + "</td>");
			str.append("<td>" + score.getAVG() + "</td>");
			str.append("</tr>");
		}
		str.append("</table>");
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	input {width: 200px; border-radius: 6px;}
	button {width: 408px; height: 50px; font-family: 맑은 고딕; font-weight: bold;}
	.record {text-align: center;}
	.errMsg {color: red; font-size: small; display: none;}
	th {text-align: left;}
</style>

<script type="text/javascript">

	function formCheck() 
	{
		// 테스트
		//alert("ok");
		
		var userName = document.getElementById("userName");
		
		var nameMsg = document.getElementById("nameMsg");
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		var userKor = document.getElementById("userKor");
		var userEng = document.getElementById("userEng");
		var userMat = document.getElementById("userMat");
		var kor = Number(userKor.value);
		var eng = Number(userEng.value);
		var mat = Number(userMat.value);
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if(userName.value=="")
		{
			nameMsg.style.display = "inline";
			userName.focus();
			
			return false;
		}
		
		if(userKor.value=="" || isNaN(userKor.value) || kor<0 || kor>100)
		{
			korMsg.style.display = "inline";
			userKor.focus();
			
			return false;
		}
		
		if(userEng.value=="" || isNaN(userEng.value) || eng<0 || eng>100)
		{
			engMsg.style.display = "inline";
			userEng.focus();
			
			return false;
		}
		
		if(userMat.value=="" || isNaN(userMat.value) || mat<0 || mat>100)
		{
			matMsg.style.display = "inline";
			userMat.focus();
			
			return false;
		}
		
		return true;
		
	}
	
</script>

</head>
<body>

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="userKor" name="userKor">
					<span class="errMsg" id="korMsg">0 ~ 100 사이 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="userEng" name="userEng">
					<span class="errMsg" id="engMsg">0 ~ 100 사이 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="userMat" name="userMat">
					<span class="errMsg" id="matMsg">0 ~ 100 사이 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" id="btnAdd" class="btn">성적 추가</button>
				</td>
			</tr>
		</table>
	</form>
	
	<div>
		<!-- 인원 수 -->
		<%=scoreCount %>
		<!-- 번호  이름  전화번호 -->
		<%=str.toString() %>
	</div>
</div>

</body>
</html>