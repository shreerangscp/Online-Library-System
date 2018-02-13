package com.shree;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class AddDocumentDao 
{
	public boolean addBook(String title, int copies, int publisher, int doc_type, int isbn, int branch, int author) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			Statement st = (Statement) con.createStatement();
			String count = "select count(*) as total from documents";
			ResultSet rs = st.executeQuery(count);
			int docid;
			while(rs.next())
				{
				docid = rs.getInt("total")+1;
				
			String query = "insert into documents (doc_id,doc_title, doc_publisher_id, doc_dt_id, doc_lib_branch_id) values (?,?,?,?,?)";
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, docid);
			ps.setString(2, title);
			ps.setInt(3, publisher);
			ps.setInt(4, doc_type);
			ps.setInt(5, branch);
			
			int insertQuery = ps.executeUpdate();
			if(insertQuery!=0)
			{
				String query1 = "insert into book (book_doc_id, book_isbn) values (?,?)";
				PreparedStatement ps1 = (PreparedStatement) con.prepareStatement(query1);
				ps1.setInt(1, docid);
				ps1.setInt(2, isbn);
				
				int insertQuery1 = ps1.executeUpdate();
				
				if(insertQuery1!=0)
				{
					String query11 = "insert into writes (write_doc_id, write_author_id) values (?,?)";
					PreparedStatement ps11 = (PreparedStatement) con.prepareStatement(query11);
					ps11.setInt(1, docid);
					ps11.setInt(2, author);
					
					int insertQuery11 = ps11.executeUpdate();
					if(insertQuery11!=0)
					{
						return true;
					}
				}
				//System.out.println("hello");
			}
		} }
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean addJournalVolume(String title, int copies, int publisher, int doc_type, int volumenumber, int editor, int branch, int author) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			Statement st = (Statement) con.createStatement();
			String count = "select count(*) as total from documents";
			ResultSet rs = st.executeQuery(count);
			int docid;
			while(rs.next())
				{
				docid = rs.getInt("total")+1;
				
			String query = "insert into documents (doc_id,doc_title, doc_publisher_id, doc_dt_id, doc_lib_branch_id) values (?,?,?,?,?)";
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, docid);
			ps.setString(2, title);
			ps.setInt(3, publisher);
			ps.setInt(4, doc_type);
			ps.setInt(5, branch);
			
			int insertQuery = ps.executeUpdate();
			if(insertQuery!=0)
			{
				String query1 = "insert into journal_volume (jv_vol_num, jv_doc_id, jv_editor_id) values (?,?,?)";
				PreparedStatement ps1 = (PreparedStatement) con.prepareStatement(query1);
				ps1.setInt(1, volumenumber);
				ps1.setInt(2, docid);
				ps1.setInt(3, editor);
				
				int insertQuery1 = ps1.executeUpdate();
				
				if(insertQuery1!=0)
				{
					String query11 = "insert into writes (write_doc_id, write_author_id) values (?,?)";
					PreparedStatement ps11 = (PreparedStatement) con.prepareStatement(query11);
					ps11.setInt(1, docid);
					ps11.setInt(2, author);
					
					int insertQuery11 = ps11.executeUpdate();
					if(insertQuery11!=0)
					{
						return true;
					}
				}
				//System.out.println("hello");
			}
		} }
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	public boolean addJournalIssue(int issuenumber, int volumenumber, int docid) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			Statement st = (Statement) con.createStatement();
			String query = "insert into journal_issue (ji_issue_num,ji_jv_id,ji_doc_id) values (?,?,?)";
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, issuenumber);
			ps.setInt(2, volumenumber);
			ps.setInt(3, docid);
			
			int insertQuery = ps.executeUpdate();
			if(insertQuery!=0)
			{
				return true;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
}