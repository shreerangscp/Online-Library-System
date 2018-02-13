package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ReserveIssueCopy")
public class ReserveIssueCopy extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int copy_id = Integer.parseInt(request.getParameter("copyid"));
		int reader_id = Integer.parseInt(request.getParameter("readerid"));
		int doc_id = Integer.parseInt(request.getParameter("docid"));
		int reserves_id = Integer.parseInt(request.getParameter("reservesid"));
		
		//System.out.println(reader_id+" "+copy_id+" "+doc_id+" "+reserves_id);
		
		ReserveIssueCopyDao rcDao = new ReserveIssueCopyDao();
		try 
		{
			if(rcDao.issueCopy(copy_id, reader_id, doc_id,reserves_id))
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