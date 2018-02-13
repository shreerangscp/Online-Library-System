package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckFine")
public class CheckFine extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int copy_id = Integer.parseInt(request.getParameter("copyid"));
		int reader_id = Integer.parseInt(request.getParameter("readerid"));
		int doc_id = Integer.parseInt(request.getParameter("docid"));
		int borrow_id = Integer.parseInt(request.getParameter("borrowid"));
		//System.out.println(reader_id+" "+copy_id+" "+doc_id);
		
		CheckFineDao cfDao = new CheckFineDao();
		try 
		{
			cfDao.checkFine(copy_id, reader_id, doc_id, borrow_id);
			//if(cfDao.checkFine(copy_id, reader_id, doc_id, borrow_id))
			{
				response.sendRedirect("checkfine.jsp");
			}
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}