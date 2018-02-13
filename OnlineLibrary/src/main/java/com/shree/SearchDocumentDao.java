package com.shree;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class SearchDocumentDao 
{
	public boolean searchonDocID(int docid, int searchtype) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			String query = "insert into search (search_st_id, search_doc_id) values (?,?)";
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, searchtype);
			ps.setInt(2, docid);
			
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
	public boolean searchonTitle(String title, int searchtype) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			String query = "insert into search (search_st_id, search_keyword) values (?,?)";
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, searchtype);
			ps.setString(2, title);
			
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