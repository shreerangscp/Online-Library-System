package com.shree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddDocument")
public class AddDocument extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int doc_type = Integer.parseInt(request.getParameter("doctype"));
		
		if(doc_type==1)
		{
		int isbn = Integer.parseInt(request.getParameter("isbn"));
		String title = request.getParameter("title");
		int copies = Integer.parseInt(request.getParameter("copies"));
		int publisher_id = Integer.parseInt(request.getParameter("publisher"));
		int branch = Integer.parseInt(request.getParameter("branch"));
		int author = Integer.parseInt(request.getParameter("authors"));
		
		//System.out.println(title+" "+copies+" "+publisher_id+ " "+doc_type+" "+isbn+" "+author+" "+branch);
		AddDocumentDao adDao = new AddDocumentDao();
		try 
		{
			if(adDao.addBook(title, copies, publisher_id, doc_type, isbn, branch, author))
			{
				response.sendRedirect("superadminpage.jsp");
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		}
		if(doc_type==2)
		{
			int volumenumber = Integer.parseInt(request.getParameter("volumenumber"));
			int editor = Integer.parseInt(request.getParameter("editor"));
			String title = request.getParameter("title");
			int copies = Integer.parseInt(request.getParameter("copies"));
			int publisher_id = Integer.parseInt(request.getParameter("publisher"));
			int branch = Integer.parseInt(request.getParameter("branch"));
			int author = Integer.parseInt(request.getParameter("author"));
			
			//System.out.println(volumenumber+" "+editor+" "+title+ " "+copies+" "+publisher_id+ " "+branch);
			AddDocumentDao adDao = new AddDocumentDao();
			try 
			{
				if(adDao.addJournalVolume(title, copies, publisher_id, doc_type, volumenumber, editor, branch, author))
				{
					response.sendRedirect("superadminpage.jsp");
				}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		if(doc_type==3)
		{
			int issuenumber = Integer.parseInt(request.getParameter("issuenumber"));
			int volume = Integer.parseInt(request.getParameter("volume"));
			int docid = Integer.parseInt(request.getParameter("docid"));
			//System.out.println(issuenumber+"    "+volume+"      "+docid);
			
			AddDocumentDao adDao = new AddDocumentDao();
			try 
			{
				if(adDao.addJournalIssue(issuenumber, volume, docid))
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
}