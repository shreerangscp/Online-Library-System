package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddAuthor")
public class AddAuthor extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String authorname = request.getParameter("authorname");
		
		//System.out.println(fname+" "+lname+" "+address+" "+number+" "+type);
		AddAuthorDao aaDao = new AddAuthorDao();
		try 
		{
			if(aaDao.addAuthor(authorname))
			{
				response.sendRedirect("superadminpage.jsp");
			}
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}