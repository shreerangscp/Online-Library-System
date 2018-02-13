package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CosineSearch")
public class CosineSearch extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//System.out.println(search+" "+search_type);
		
		//if(search_type==1) // search on doc id 
		{
			String search = (request.getParameter("search"));
			CosineSearchDao sDDao = new CosineSearchDao();
			try 
			{
				if(sDDao.searchCosine(search))
				{
					response.sendRedirect("cosineresult.jsp");
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
