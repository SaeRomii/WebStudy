<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신
	request.setCharacterEncoding("UTF-8");

	// 자기자신 페이지로부터 수신 후 처리하는 부분
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	// Calendar 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	// 표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 페이지 최초 요청이 아닐 경우
	// → 수신한 데이터로 표시할 달력의 년, 월 구성
	if(sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	// 확인한 날짜로 년도 select option 구성]
	String yOptions = "";
	String mOptions = "";
	
	
	// 그려야할 달력의 1일이 무슨 요일인지 확인
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	if(selectYear%4==0 && selectYear%100==0 || selectYear%400==0)
		months[1]=29;
	
	// 총 날수 누적 변수
	int nalsu;
	
	// 요일 항목 배열 구성
	String[] weekName = {"일", "월", "화", "수", "목", "금", "토"};
	
	nalsu = (selectYear - 1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear - 1) / 400;
	
	for(int i=0; i<selectMonth-1; i++)
	{
		nalsu += months[i];
	}
	nalsu++;
	
	
	int week = nalsu%7;	//요일변수
	int lastDay = months[selectMonth-1];	//마지막날짜
		

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 08
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   
	   						
	   ◀ 2021년 5월 ▶
	   
	   ------------------------------
	   ------------------------------
	   
	   - 『◀』 이나 『▶』클릭 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	     
	   - 사용자 최초 요청 주소는
	     http://localhost:8090/WebApp07/SendAndReceive08.jsp
	     로 한다.
	     
	○ SendAndReceive08.jsp

 -->

<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>

<div>
	<form method="post">
		<button>◀</button>
		
		<input type="text" id="year" name="year" readonly="readonly">년
		<input type="text" id="month" name="month" readonly="readonly">월
		
		<button>▶</button>
	</form>
</div>

</body>
</html>