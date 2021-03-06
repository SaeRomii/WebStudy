<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Test003.jsp
	
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");

	// 데이터 수신 → Test002.jsp로부터 (name, tel)
	String uName = request.getParameter("userName");
	String uTel = request.getParameter("userTel");
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 (insert) → 적용된 행의 갯수 반환 (int ...)
	String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
         + "VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", uName, uTel);
	
	// 작업 객체 생성
	Statement stmt = conn.createStatement();
	
	// 쿼리문 실행 → 적용된 행의 개수 반환
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	//conn.close();	// check!
	//-- conn 객체를 닫는 것
	DBConn.close();
	//-- DBConn 에 설계해둔 close 메소드를 호출한 것.
	//   두 개는 의미가 완전히 다르다.
	
	// 반환된 행의 개수가 1보다 작은 상황이면
	// → 따라오세요~ 에러페이지 로 안내
	// 그 이외의 상황이면
	// → 따라오세요~ Test002.jsp 로 안내
	if(result < 1)
	{
		// 에러 페이지를 다시 요청해라
		response.sendRedirect("Error02.jsp");
	}
	else
	{
		// Test002.jsp 페이지를 다시 요청해라
		response.sendRedirect("Test002.jsp");
	}
%>