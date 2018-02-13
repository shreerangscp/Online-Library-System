package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EditDelReader")
public class EditDelReader extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int change = Integer.parseInt(request.getParameter("change"));
		
		if(change==1)
		{
		int readerid = Integer.parseInt(request.getParameter("readerid"));
		String fname = (request.getParameter("fname"));
		String lname = (request.getParameter("lname"));
		String address = (request.getParameter("address"));
		int number = Integer.parseInt(request.getParameter("number"));
		int type = Integer.parseInt(request.getParameter("type"));
		
		//System.out.println(readerid+" "+fname+" "+lname+" "+address+" "+number+" "+type);
		
		EditDelReaderDao edDao = new EditDelReaderDao();
		try 
		{
			if(edDao.editReader(readerid, type, number, fname, lname, address))
			{
				response.sendRedirect("displayreader.jsp");
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
			int readerid = Integer.parseInt(request.getParameter("readerid"));
			EditDelReaderDao edDao = new EditDelReaderDao();
			try 
			{
				if(edDao.delReader(readerid))
				{
					response.sendRedirect("displayreader.jsp");
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