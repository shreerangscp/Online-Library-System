package com.shree;

import java.io.*;
import javax.servlet.*;

import com.mysql.jdbc.PreparedStatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserLoginDao 
{
	String url="jdbc:mysql://localhost:3306/test";
	String username="root";
	String password="";
	public boolean check(String uname, String pwd) throws ClassNotFoundException
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
			//String query = "select * from login where username='"+username+"' and password='"+password+"'";
			String query = "select * from reader where reader_fname = '"+uname+"' and reader_lname = '"+pwd+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			if(rs.next())
			{
				int userid = rs.getInt("reader_id");
				String query1 = "insert into login_history (lh_username, lh_user_id) values (?,?)";
				PreparedStatement ps = (PreparedStatement) con.prepareStatement(query1);
				ps.setString(1, uname);
				ps.setInt(2, userid);
				
				int insertQuery = ps.executeUpdate();
				if(insertQuery!=0)
				{
					return true;
				//System.out.println("hello");
				}
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
}