<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// JsonTest04_ok.jsp
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String result = "";
	
	// JSON 데이터(배열)
	// [{"이름1":"값1", "이름2":"값2", "이름3":"값3"}, {"이름4":"값4", "이름5":"값5", "이름6":"값6"}]
	
	// {"num":"1", "name":"조은선1", "content":"내용"}
	// {"num":"2", "name":"조은선2", "content":"내용"}
	// {"num":"3", "name":"조은선3", "content":"내용"}
	// {"num":"4", "name":"조은선4", "content":"내용"}
	// {"num":"5", "name":"조은선5", "content":"내용"}
			
	// {"num":"1", "name":"조은선1", "content":"내용"},
	// {"num":"2", "name":"조은선2", "content":"내용"},
	// {"num":"3", "name":"조은선3", "content":"내용"},
	// {"num":"4", "name":"조은선4", "content":"내용"},
	// {"num":"5", "name":"조은선5", "content":"내용"},
	
	// {"num":"1", "name":"조은선1", "content":"내용"},
	// {"num":"2", "name":"조은선2", "content":"내용"},
	// {"num":"3", "name":"조은선3", "content":"내용"},
	// {"num":"4", "name":"조은선4", "content":"내용"},
	// {"num":"5", "name":"조은선5", "content":"내용"}
	
	// [{"num":"1", "name":"조은선", "content":"내용"}
	// , {"num":"2", "name":"조은선", "content":"내용"}
	// , {"num":"3", "name":"조은선", "content":"내용"}
	// , {"num":"4", "name":"조은선", "content":"내용"}
	// , {"num":"5", "name":"조은선", "content":"내용"}]
	
    /*
	for(int n=1; n<=5; n++)	// 1 ~ 5
	{
		StringBuffer sb = new StringBuffer();
		sb.append("{\"num\":\"" + n + "\"");
		sb.append(",\"name\":\"" + name + n + "\"");
		sb.append(",\"content\":\"" + content + n + "\"},");	// check~!!! 『,』
		
		result += sb.toString();
		
	}
	
	result = result.substring(0, result.length()-1);		// 24~28번째 줄에서 28번째줄 마지막은 구문 끝나는거라서
															// 콤마 지워주는 거임
	result = "[" + result + "]";
	
	out.println(result);
	*/
	
	JSONArray jsonArray = new JSONArray();
	
	for(int n=1; n<=5; n++)	// 1 ~ 5
	{
		JSONObject jsonObject = new JSONObject();		// JSON배열은 JSONObject들이 채워져 있을거라서 객체 생성
		
		jsonObject.put("num", n);
		jsonObject.put("name", name+n);
		jsonObject.put("content", content+n);
		
		jsonArray.add(jsonObject);
	}
	
	// 테스트
	System.out.println(jsonArray.toString());
	//--==>> [{"num":1,"name":"이새롬1","content":"내용 확인1"},{"num":2,"name":"이새롬2","content":"내용 확인2"},{"num":3,"name":"이새롬3","content":"내용 확인3"},{"num":4,"name":"이새롬4","content":"내용 확인4"},{"num":5,"name":"이새롬5","content":"내용 확인5"}]
	
	
	out.println(jsonArray.toString());			// Test04에 jsonObj로 넘겨줌 

	
%>