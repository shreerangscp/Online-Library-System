package com.shree;

import java.io.*;
import javax.servlet.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class LoginDao 
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
			String query = "select * from users";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			if(rs.next())
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