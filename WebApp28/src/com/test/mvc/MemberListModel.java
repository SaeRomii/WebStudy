/*================================
   MemberListModel.java
================================*/

package com.test.mvc;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListModel 
{
	public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, SQLException
	{
		String result = "";
		
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO dao = new MemberDAO();
		
		try 
		{
			dao.connection();
			
			request.setAttribute("lists", dao.lists());
		} 
		catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		finally
		{
			try 
			{
				dao.close();
			} 
			catch (Exception e2) 
			{
				System.out.println(e2.toString());
			}
		}
		  
	    result = "WEB-INF/view/MemberList.jsp";

		return result;
		
		
	}
}
