/*=============================
   HelloReceive03Model.java
=============================*/

package com.test.logic;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive03Model
{
	public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String result = "";
		
		request.setCharacterEncoding("UTF-8");
		//-- 운영체제 상에서 해당 인코딩이 발견되지 않았을 시 예외가 발생
		
		// 데이터 수신
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		// 추가적인 업무 처리 삽입 가능
		lastName = "[" + lastName + "]";
		
		// 데이터 전달 
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);

		// 상황에 따른 View 선택 가능 
		result = "WEB-INF/view/HelloReceive03.jsp";
		
		return result;
	}
}