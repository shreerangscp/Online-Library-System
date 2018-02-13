package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EditDelDocument")
public class EditDelDocument extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int change = Integer.parseInt(request.getParameter("change"));
		
		if(change==1)
		{
		int docid = Integer.parseInt(request.getParameter("docid"));
		String fname = (request.getParameter("authorname"));
		
		//System.out.println(readerid+" "+fname+" "+lname+" "+address+" "+number+" "+type);
		
		/*EditDelDocumentDao edDao = new EditDelDocumentDao();
		try 
		{
			if(edDao.editDocument(docid))
			{
				response.sendRedirect("displaydocuments.jsp");
			}
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		}
		
		if(change==2)
		{
			int docid = Integer.parseInt(request.getParameter("docid"));
			EditDelDocumentDao edDao = new EditDelDocumentDao();
			try 
			{
				if(edDao.delDocument(docid))
				{
					response.sendRedirect("displaydocuments.jsp");
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