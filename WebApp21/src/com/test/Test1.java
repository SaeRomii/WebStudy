/*=====================
	Test1.java
=====================*/

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//get호출
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	//post호출
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	//둘 다
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		/* ①
		  setContentType이란 응답을 어떤형식으로 줄건지 정하는건데
		  아래 구문은 응답을 html형식으로 줄거고 text기반임(html 환경이 안되면 곳이라면 text로 받게)
		  인코딩 방식은 UTF-8로
		response.setContentType("text/html;charset=UTF-8");
		  출력 스트림 (아래 pw.println부분 출력하겠다.)
		PrintWriter pw = response.getWriter();
		
		pw.println("<html><body>");
		pw.println("<h1>name : " + "박민지" + "</h1>");
		pw.println("<h1>age : " + "13" + "</h1>");
		pw.println("</body></html>");
		*/
		
		/* ②
		String name = "선혜연";
		String age = "11";
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html><body>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		pw.println("</body></html>");
		*/
		
		
		// ③ servletconfig 활용 
		/* 『web.xml』 에 『<init-param>』 추가 후 */
		/*
		// 『servletConfig』
		//-- 컨테이너가 서블릿을 초기화 할 대 서블릿 당 하나씩 ServletConfig 을 생성하게 된다.
		//   서블릿 할 객체를 생성? 이런 느낌
		ServletConfig config = getServletConfig();
		
		// name, age를 서블릿 객체에서 얻어와서 쓰는거 
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html><body>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		pw.println("</body></html>");
		*/
		
		/* ④ 『web.xml』 에 『<context-param>』 추가 후 */ 
		ServletConfig config = getServletConfig();
		
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		// 서블릿이 제공하는 컨텐츠 관리 객체
		// 컨텐츠 관리 얻어오기
		ServletContext context = getServletContext();
		// type얻어오기 (web.xml에서 context-param 추가 한 부분)
		String type = context.getInitParameter("type");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html><body>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		
		pw.println("<h1>type : " + type + "</h1>");
		
		pw.println("</body></html>");
	}
	
}
