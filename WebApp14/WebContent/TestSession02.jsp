<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신(TestSession01.jsp)
	request.setCharacterEncoding("UTF-8");

	//데이터 수신 (TestSession01.jsp 페이지로부터)
	// → userName, userBirth
	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth");
	
	session.setAttribute("userName", userName);
	session.setAttribute("userBirth", userBirth);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>

<script type="text/javascript">

	function sendIn()
	{
		// 테스트
		//alert("ok");
		
		var f = document.forms[0];
		
		if(!f.userId.value)
		{
			alert("아이디 입력");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert("비밀번호 입력");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
	}

</script>

</head>
<body>

<div>
	<h1>아이디, 패스워드</h1>
	<hr>
</div>

<div>
	<form action="TestSession03.jsp" method="post">
		<%-- <input type="hidden" name="userName" value="<%=userName %>">
		<input type="hidden" name="userBirth" value="<%=userBirth %>"> --%>
		<table class="table">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="text" name="userPwd">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" onclick="sendIn()" style="width: 250px;">전송</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>