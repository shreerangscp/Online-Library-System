package com.shree;

import com.mysql.jdbc.PreparedStatement;

import java.sql.Connection;
import java.sql.DriverManager;

public class AddReaderDao 
{
	public boolean addReader(String fname, String lname, String address, int number, int type) throws ClassNotFoundException
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
			//String query = "select * from login where username='"+username+"' and password='"+password+"'";
			String query = "insert into reader (reader_fname, reader_lname, reader_address, reader_phone_number, reader_type_rt_id) values (?,?,?,?,?)";
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, address);
			ps.setInt(4, number);
			ps.setInt(5, type);;
			
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