package com.shree;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class EditDelReaderDao 
{
	public boolean editReader(int readerid, int type, int number, String fname, String lname, String address) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			Date formattedDate;
			formattedDate= new Date(System.currentTimeMillis()+24*1*60*20*60*1000);
			String queryupdatereader = "update reader set reader_fname = ?, reader_lname=?, reader_address=?, reader_phone_number=?, reader_type_rt_id=? where reader_id = ?";
			PreparedStatement psreadercountborrowed = (PreparedStatement) con.prepareStatement(queryupdatereader);
			psreadercountborrowed.setString(1, fname);
			psreadercountborrowed.setString(2, lname);
			psreadercountborrowed.setString(3, address);
			psreadercountborrowed.setInt(4, number);
			psreadercountborrowed.setInt(5, type);
			psreadercountborrowed.setInt(6, readerid);
			
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
	public boolean delReader(int readerid) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			int del=1;
			String queryupdatereader = "update reader set reader_is_deleted = ? where reader_id = ?";
			PreparedStatement psreadercountborrowed = (PreparedStatement) con.prepareStatement(queryupdatereader);
			psreadercountborrowed.setInt(1, del);
			psreadercountborrowed.setInt(2, readerid);
			
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