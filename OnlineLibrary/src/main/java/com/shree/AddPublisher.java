package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddPublisher")
public class AddPublisher extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String publishername = request.getParameter("publishername");
		String address = request.getParameter("address");
		
		//System.out.println(fname+" "+lname+" "+address+" "+number+" "+type);
		AddPublisherDao aaDao = new AddPublisherDao();
		try 
		{
			if(aaDao.addPublisher(publishername, address))
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