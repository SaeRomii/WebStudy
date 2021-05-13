<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//ScoreList.jsp
	
	// 데이터 수신
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("name");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor,eng,mat;
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
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 (insert)
	String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", uName, kor, eng, mat);
	
	// DB 액션 처리 → 작업 객체 필요
	Statement stmt = conn.createStatement();
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if(result < 1)
	{
		// 에러 페이지로 이동
		response.sendRedirect("Err002.jsp");
	}
	else 
	{
		// Test002.jsp 페이지 요청		
		response.sendRedirect("ScoreList.jsp");
	}
	
%>
