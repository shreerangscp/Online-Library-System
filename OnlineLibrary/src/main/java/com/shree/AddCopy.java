package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddCopy")
public class AddCopy extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int doc_id = Integer.parseInt(request.getParameter("document"));
		int copynum = Integer.parseInt(request.getParameter("copynum"));
		int branch_id = Integer.parseInt(request.getParameter("branch"));
		int copy_position = Integer.parseInt(request.getParameter("copyposition"));
		
		//System.out.println(doc_id+" "+copynum+" "+branch_id+" "+copy_position);
		AddCopyDao acDao = new AddCopyDao();
		try 
		{
			if(acDao.addCopy(copynum, doc_id, branch_id, copy_position))
			{
				response.sendRedirect("superadminpage.jsp");
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}