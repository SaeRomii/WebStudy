<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>


<%
	// 수정하기 눌러서 넘어오면 처리하기..?
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	dto.setNum(num);
	dto.setIpAddr(request.getRemoteAddr());
	
	dao.updateData(dto);
	
	DBConn.close();
	
	// 수정하면 그 페이지로 넘어가게
	response.sendRedirect("List.jsp?pageNum=" + pageNum);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Updated_ok.jsp</title>
</head>
<body>

</body>
</html>