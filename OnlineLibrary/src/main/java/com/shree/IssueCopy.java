package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/IssueCopy")
public class IssueCopy extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int copy_id = Integer.parseInt(request.getParameter("copyid"));
		int reader_id = Integer.parseInt(request.getParameter("reader"));
		int doc_id = Integer.parseInt(request.getParameter("docid"));
		//System.out.println(reader_id+" "+copy_id+" "+doc_id);
		
		IssueCopyDao icDao = new IssueCopyDao();
		try 
		{
			if(icDao.issueCopy(copy_id, reader_id, doc_id))
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