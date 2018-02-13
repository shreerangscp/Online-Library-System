package com.shree;

import com.mysql.jdbc.PreparedStatement;

import java.sql.Connection;
import java.sql.DriverManager;

public class AddAuthorDao 
{
	public boolean addAuthor(String authorname) throws ClassNotFoundException
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
			//String query = "select * from login where username='"+username+"' and password='"+password+"'";
			String query = "insert into authors (author_name) values (?)";
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setString(1, authorname);
			
			int insertQuery = ps.executeUpdate();
			if(insertQuery!=0)
			{
				return true;
				//System.out.println("hello");
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
}