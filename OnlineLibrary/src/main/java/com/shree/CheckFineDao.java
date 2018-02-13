package com.shree;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CheckFineDao
{
	public void checkFine(int copyid, int readerid, int docid, int borrowid) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			{
				
				String query = "select * from borrow b where borrow_copy_id = '"+copyid+"' and borrow_id = '"+borrowid+"' order by borrow_date_time desc limit 1";
				Statement st = (Statement) con.createStatement();
				ResultSet rs = st.executeQuery(query);
				if(rs.next())
				{
					Date borrowdate = rs.getDate("borrow_date_time");
					Date returndate = rs.getDate("return_date_time");
					String borrowdatetime = rs.getString("borrow_date_time");
					String return_date_time = rs.getString("return_date_time");
				    
				    SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm:ss");

				    Date d1 = null;
				    Date d2 = null;
				    try {
				        d1 = (Date) format.parse(borrowdatetime);
				        d2 = (Date) format.parse(return_date_time);
				       
				    } catch (Exception e) {
				        e.printStackTrace();
				    }

				    // Get msec from each, and subtract.
				    long diff = d2.getTime() - d1.getTime();
				    long days = diff / (60 * 60 * 1000*24);
				    System.out.println("Time in hours: " + days + " Days.");
					//return true;
					//System.out.println("hello");
				}
				}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		//return false;
	}
}