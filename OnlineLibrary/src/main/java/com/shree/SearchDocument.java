package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SearchDocument")
public class SearchDocument extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int search_type = Integer.parseInt(request.getParameter("searchtype"));
		
		//System.out.println(search+" "+search_type);
		
		if(search_type==1) // search on doc id 
		{
			int docid = Integer.parseInt(request.getParameter("search"));
			SearchDocumentDao sDDao = new SearchDocumentDao();
			try 
			{
				if(sDDao.searchonDocID(docid, search_type))
				{
					response.sendRedirect("searchondocidresult.jsp");
				}
			} 
			catch (Exception e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(search_type==2) // search on title
		{
			String title = (request.getParameter("search"));
			SearchDocumentDao sDDao = new SearchDocumentDao();
			try 
			{
				if(sDDao.searchonTitle(title, search_type))
				{
					response.sendRedirect("searchontitleresult.jsp");
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
