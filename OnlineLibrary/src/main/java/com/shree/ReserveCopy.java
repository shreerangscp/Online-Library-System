package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ReserveCopy")
public class ReserveCopy extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int copyid = Integer.parseInt(request.getParameter("copyid"));
		int readerid = Integer.parseInt(request.getParameter("readerid"));
		int docid = Integer.parseInt(request.getParameter("docid"));
		
		//System.out.println(readerid+" "+copyid+" "+docid);
		
		ReserveCopyDao rcDao = new ReserveCopyDao();
		try 
		{
			if(rcDao.reserveCopy(copyid, readerid, docid))
			{
				response.sendRedirect("userpage.jsp");
			}
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}