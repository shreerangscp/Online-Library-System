package com.shree;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class EditDelAuthorDao 
{
	public boolean editAuthor(int authorid, String fname) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			Date formattedDate;
			formattedDate= new Date(System.currentTimeMillis()+24*1*60*20*60*1000);
			String queryupdatereader = "update authors set author_name = ? where author_id = ?";
			PreparedStatement psreadercountborrowed = (PreparedStatement) con.prepareStatement(queryupdatereader);
			psreadercountborrowed.setString(1, fname);
			psreadercountborrowed.setInt(2, authorid);
			
			int insertQuery3 = psreadercountborrowed.executeUpdate();
			if(insertQuery3 != 0)
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
	public boolean delAuthor(int authorid) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			int del=1;
			String queryupdatereader = "update authors set author_is_deleted = ? where author_id = ?";
			PreparedStatement psreadercountborrowed = (PreparedStatement) con.prepareStatement(queryupdatereader);
			psreadercountborrowed.setInt(1, del);
			psreadercountborrowed.setInt(2, authorid);
			
			int insertQuery3 = psreadercountborrowed.executeUpdate();
			if(insertQuery3 != 0)
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