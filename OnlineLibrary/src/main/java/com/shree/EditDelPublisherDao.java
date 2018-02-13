package com.shree;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class EditDelPublisherDao 
{
	public boolean editPublisher(int publisherid, String fname, String address) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			Date formattedDate;
			formattedDate= new Date(System.currentTimeMillis()+24*1*60*20*60*1000);
			String queryupdatereader = "update publisher set publisher_name = ?, publisher_address=? where publisher_id = ?";
			PreparedStatement psreadercountborrowed = (PreparedStatement) con.prepareStatement(queryupdatereader);
			psreadercountborrowed.setString(1, fname);
			psreadercountborrowed.setString(2, address);
			psreadercountborrowed.setInt(3, publisherid);
			
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
	public boolean delPublisher(int publisherid) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			int del=1;
			String queryupdatereader = "update publisher set publisher_is_deleted = ? where publisher_id = ?";
			PreparedStatement psreadercountborrowed = (PreparedStatement) con.prepareStatement(queryupdatereader);
			psreadercountborrowed.setInt(1, del);
			psreadercountborrowed.setInt(2, publisherid);
			
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