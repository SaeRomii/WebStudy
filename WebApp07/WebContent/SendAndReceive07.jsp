<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
/* 	// 데이터 수신
	request.setCharacterEncoding("UTF-8");
	
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	
	// calendar 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 현재 날짜 확인
	int pYear = cal.get(Calendar.YEAR);
	int pMonth = cal.get(Calendar.MONTH);
	int pDay = cal.get(Calendar.DAY_OF_MONTH); */
	
	// 자기 자신 페이지로부터 데이터 수신 후 처리하는 부분
	String sYear = request.getParameter("year");		//-- 페이지 최초 요청 시 null
	String sMonth = request.getParameter("month");		//-- 페이지 최초 요청 시 null
	
	// Calendar 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);			//-- 2021
	int nowMonth = cal.get(Calendar.MONTH);			//-- 5
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//-- 11
	
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
	
	// 확인한 날짜로 년도 select option 구성 ------------------------------------
	/*
	<option value="2011">2011</option>
	<option value="2012">2012</option>
	<option value="2013">2013</option>
						  :
	<option value="2021">2021</option>
						  :
	<option value="2029">2029</option>
	<option value="2030">2030</option>
	<option value="2031">2031</option>
	*/
	
	String yOptions = "";
	for (int year=(selectYear-10); year<=(selectYear+10); year++ )
	{
		// 상황1. 페이지 최초 요청일 때 → sYear 는 null 이면서 현재 년도와 옵션값이 같을 때
		// 상황2. 페이지 최초 요청이 아닐 때 (2022년 선택하고 다음 월 선택할 때 페이지 갱신되면서 초기화되는데
		//									  그렇게 안하고 그대로 남게 해주려고)
		// 상황3. 나머지
		if(sYear==null && year==nowYear)
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		}
		else if(sYear!=null && Integer.parseInt(sYear)==year)
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		}
		else
		{
			yOptions += "<option value='" + year + "'>" + year + "</option>";
		}
		
		
		yOptions += "<option value='" + year + "'>" + year + "</option>";
	}
	
	
	// ------------------------------------ 확인한 날짜로 년도 select option 구성
	
	// 확인한 날짜로 월 select option 구성 ---------------------------------------
	
	String mOptions = "";
	for (int month=1; month<=12; month++)
	{
		if(sMonth==null && month==nowMonth)
		{
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		}
		else if(sMonth!=null && Integer.parseInt(sMonth)==month)
		{
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		}
		else
		{
			mOptions += "<option value='" + month + "' >" + month + "</option>";
		}
	}
	
	
	// --------------------------------------- 확인한 날짜로 월 select option 구성
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산 -------------------
	// (만년달력)
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if(selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
		months[1] = 29;
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항목 배열 구성
	String[] weekName = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 현재년도 → 입력받은 년도의 이전 년도까지의 날 수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재월 → 입력받은 월의 이전 월까지의 날 수 추가
	for(int i=0; i<selectMonth-1; i++)
		nalsu += months[i];
	nalsu++;		//+1 월은 1일 추가
	
	int week = nalsu%7;						//-- 1일의 요일 변수(1일의 요일 뭔지)
	int lastDay = months[selectMonth-1];	//-- 마지막 날짜 변수(마지막 날짜 언제까지인지)
		
	// ------------------- 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
	
	// 달력 그리기 ---------------------------------------------------------------
	String calStr = "";
	calStr += "<table border='1'>";
	calStr += "<tr>";
	
	for(int i=0; i<weekName.length; i++)
	{
		if(i==0)
			calStr += "<th style='color: red;'>" + weekName[i] + "</th>";		//일요일 빨간색으로 표시
		else if(i==6)
			calStr += "<th style='color:blue;'>" + weekName[i] + "</th>";		//토요일 파란색으로 표시
		else
			calStr += "<th>" + weekName[i] + "</th>";		
	}
	
	calStr += "</tr>";
	calStr += "</table>";
	
	// --------------------------------------------------------------- 달력 그리기
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">

	function formCalendar(obj)		// obj 는 form 객체
	{
		obj.submit();
	}

</script>

</head>
<body>

<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>

<!--  
	○ 데이터 송수신 실습 07
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다. (단독 페이지)
	   - 연도 구성은 현재 년도 기준 이전 10년, 이후 10년으로 구성한다.
	   - 월은 1부터 12월 까지로 구성한다.
	   
	   [ 2021 ▼ ] 년 [ 5 ▼ ] 월
	   
	   -----------------------
	   -----------------------
	   
	   - 연도 select box나 월select box 내용 변화 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	     
	   - 현재 날짜를 확인하는 과정에서 Calendar 클래스를 활용한다.
	     
	   - 사용자 최초 요청 주소는
	     http://localhost:8090/WebApp07/SendAndReceive07.jsp
	     로 한다.
	     
	○ SendAndReceive07.jsp

-->


<div>
	<!-- form 의 action 속성 값 생략 → 데이터의 수신처는 자기 자신(요청하는 페이지도 자기 자신) -->
	<form action="" method="post">
		<!-- <select name="year" id="year" onchange="formCalendar(this.form)"></select>년
		<select name="month" id="month" onchange="formCalendar(this.form)"></select>월 -->
		<select id="year" name="year" onchange="formCalendar(this.form)">
			<!-- <option value="2021">2021</option>
			<option value="2022">2022</option> -->
			<%=yOptions %>
		</select>년
		<select id="month" name="month" onchange="formCalendar(this.form)">
			<!-- <option value="5">5</option>
			<option value="6">6</option> -->
			<%=mOptions %>
		</select>월
	</form>
</div>
<br>

<div>
	<!-- 달력을 그리게 될 지점 -->
	<%=calStr %>
</div>


</body>
</html>