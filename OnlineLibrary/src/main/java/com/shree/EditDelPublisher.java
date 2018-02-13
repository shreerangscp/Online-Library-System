package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EditDelPublisher")
public class EditDelPublisher extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int change = Integer.parseInt(request.getParameter("change"));
		
		if(change==1)
		{
		int publisher = Integer.parseInt(request.getParameter("publisherid"));
		String name = (request.getParameter("fname"));
		String address = (request.getParameter("address"));
		
		//System.out.println(readerid+" "+fname+" "+lname+" "+address+" "+number+" "+type);
		
		EditDelPublisherDao edDao = new EditDelPublisherDao();
		try 
		{
			if(edDao.editPublisher(publisher, name, address))
			{
				response.sendRedirect("displaypublisher.jsp");
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
			int publisherid = Integer.parseInt(request.getParameter("publisherid"));
			EditDelPublisherDao edDao = new EditDelPublisherDao();
			try 
			{
				if(edDao.delPublisher(publisherid))
				{
					response.sendRedirect("displaypublisher.jsp");
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