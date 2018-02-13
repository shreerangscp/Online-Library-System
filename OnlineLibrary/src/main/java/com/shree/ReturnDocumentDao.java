package com.shree;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class ReturnDocumentDao
{
	public boolean returnCopy(int copyid, int readerid, int docid, int borrowid) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			{
				String query1 = "update copy set copy_is_borrowed = ? where copy_id = ?";
				int copyisborrowed=0;
				PreparedStatement ps1 = (PreparedStatement) con.prepareStatement(query1);
				ps1.setInt(1, copyisborrowed);
				ps1.setInt(2, copyid);
				
				int insertQuery1 = ps1.executeUpdate();
				
				if(insertQuery1 != 0)
				{
					java.sql.Timestamp  sqlDate = new java.sql.Timestamp(new java.util.Date().getTime());
					String queryupdatecountborrowed = "update borrow set return_date_time = ? where borrow_id = ?";
					PreparedStatement pscountborrowed = (PreparedStatement) con.prepareStatement(queryupdatecountborrowed);
					pscountborrowed.setTimestamp(1, sqlDate);		
					pscountborrowed.setInt(2, borrowid);
					
					int insertQuery2 = pscountborrowed.executeUpdate();
					if(insertQuery1 != 0)
					{
						return true;
					}
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