package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddReader")
public class AddReader extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String address = request.getParameter("address");
		int number = Integer.parseInt(request.getParameter("number"));
		int type = Integer.parseInt(request.getParameter("type"));
		
		//System.out.println(fname+" "+lname+" "+address+" "+number+" "+type);
		AddReaderDao arDao = new AddReaderDao();
		try 
		{
			if(arDao.addReader(fname, lname, address, number, type))
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