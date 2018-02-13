package com.shree;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class CosineSearchDao 
{
	public boolean searchCosine(String search) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			String query = "insert into search (search_keyword) values (?)";
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setString(1, search);
			
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