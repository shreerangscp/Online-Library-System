package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EditDelAuthor")
public class EditDelAuthor extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int change = Integer.parseInt(request.getParameter("change"));
		
		if(change==1)
		{
		int authorid = Integer.parseInt(request.getParameter("authorid"));
		String fname = (request.getParameter("authorname"));
		
		//System.out.println(readerid+" "+fname+" "+lname+" "+address+" "+number+" "+type);
		
		EditDelAuthorDao edDao = new EditDelAuthorDao();
		try 
		{
			if(edDao.editAuthor(authorid, fname))
			{
				response.sendRedirect("displayauthor.jsp");
			}
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		if(change==2)
		{
			int authorid = Integer.parseInt(request.getParameter("author"));
			EditDelAuthorDao edDao = new EditDelAuthorDao();
			try 
			{
				if(edDao.delAuthor(authorid))
				{
					response.sendRedirect("displayauthor.jsp");
				}
			} 
			catch (Exception e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}