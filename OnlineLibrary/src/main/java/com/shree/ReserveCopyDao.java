package com.shree;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class ReserveCopyDao 
{
	public boolean reserveCopy(int copyid, int readerid, int docid) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			String query = "insert into reserves (reserves_copy_id, reserves_reader_id, reserves_doc_id) values (?,?,?)";
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, copyid);
			ps.setInt(2, readerid);
			ps.setInt(3, docid);
			
			int insertQuery = ps.executeUpdate();
			
			if(insertQuery!=0)
			{
				String query1 = "update copy set copy_is_reserved = ? where copy_id = ?";
				int copyisreserved=1;
				PreparedStatement ps1 = (PreparedStatement) con.prepareStatement(query1);
				ps1.setInt(1, copyisreserved);
				ps1.setInt(2, copyid);
				
				int insertQuery1 = ps1.executeUpdate();
				
				if(insertQuery1 != 0)
				{
					
					int count=0;
					Statement st10 = (Statement) con.createStatement();
					String query10 = "select * from documents where doc_id = '"+docid+"'";
					ResultSet rs10 = st10.executeQuery(query10);
					
					while(rs10.next())
					{
					count = rs10.getInt("doc_reserved_count")+ 1;
					String queryupdatecountborrowed = "update documents set doc_reserved_count = ? where doc_id = ?";
					PreparedStatement pscountborrowed = (PreparedStatement) con.prepareStatement(queryupdatecountborrowed);
					pscountborrowed.setInt(1, count);
					pscountborrowed.setInt(2, docid);
					
					int insertQuery2 = pscountborrowed.executeUpdate();
					if(insertQuery2 != 0)
					{

						int readercountreserved=0;
						Statement st11 = (Statement) con.createStatement();
						String query11 = "select * from reader where reader_id = '"+readerid+"'";
						ResultSet rs11 = st11.executeQuery(query11);
						
						while(rs11.next())
						{
							readercountreserved = rs11.getInt("reader_reserve_count")+ 1;
							String queryupdatereader = "update reader set reader_reserve_count = ? where reader_id = ?";
							PreparedStatement psreadercountborrowed = (PreparedStatement) con.prepareStatement(queryupdatereader);
							psreadercountborrowed.setInt(1, readercountreserved);
							psreadercountborrowed.setInt(2, readerid);
						
							int insertQuery3 = psreadercountborrowed.executeUpdate();
							if(insertQuery3 != 0)
							{
								return true;
							}
						}
					}
					}
				}
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