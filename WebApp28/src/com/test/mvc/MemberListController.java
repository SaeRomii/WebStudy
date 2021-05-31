/*============================
	MemberListController.java
	- 서블릿 샘플
============================*/

package com.test.mvc;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//get호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	//post호출
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	//둘 다
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 서블릿 관련 코딩
		
		// Model 객체 연결 
		MemberListModel model = new MemberListModel();
		String view = null;
		
		try 
		{
			view = model.process(request, response);
		} 
		catch (UnsupportedEncodingException | SQLException e) {
			
			e.printStackTrace();
		}
		
		// View 객체 연결
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
		
		
	}
	
}