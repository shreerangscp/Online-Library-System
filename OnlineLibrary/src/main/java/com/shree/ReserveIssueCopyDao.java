package com.shree;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class ReserveIssueCopyDao 
{
	public boolean issueCopy(int copyid, int readerid, int docid, int reservesid) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			Date formattedDate;
			formattedDate= new Date(System.currentTimeMillis()+24*1*60*20*60*1000);
			String query = "insert into borrow (borrow_copy_id, borrow_reader_id, bt_doc_id, expected_return) values (?,?,?,?)";
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, copyid);
			ps.setInt(2, readerid);
			ps.setInt(3, docid);
			ps.setDate(4, formattedDate);
			
			int insertQuery = ps.executeUpdate();
			
			if(insertQuery!=0)
			{
				String query1 = "update copy set copy_is_borrowed = ?, copy_is_reserved=? where copy_id = ?";
				int copyisborrowed=1;
				int copyisreserved=0;
				PreparedStatement ps1 = (PreparedStatement) con.prepareStatement(query1);
				ps1.setInt(1, copyisborrowed);
				ps1.setInt(2, copyisreserved);
				ps1.setInt(3, copyid);
				
				int insertQuery1 = ps1.executeUpdate();
				
				if(insertQuery1 != 0)
				{
					
					int count=0;
					/*Statement st10 = (Statement) con.createStatement();
					String query10 = "select * from documents where doc_id = '"+docid+"'";
					ResultSet rs10 = st10.executeQuery(query10);
					*/
					//while(rs10.next())
					{
					/*count = rs10.getInt("doc_count_borrowed")+ 1;
					String queryupdatecountborrowed = "update documents set doc_count_borrowed = ? where doc_id = ?";
					PreparedStatement pscountborrowed = (PreparedStatement) con.prepareStatement(queryupdatecountborrowed);
					pscountborrowed.setInt(1, count);
					pscountborrowed.setInt(2, docid);
					
					int insertQuery2 = pscountborrowed.executeUpdate();
					if(insertQuery2 != 0)
					*/{

						int readercountborrowed=0;
						Statement st11 = (Statement) con.createStatement();
						String query11 = "select * from reader where reader_id = '"+readerid+"'";
						ResultSet rs11 = st11.executeQuery(query11);
						
						while(rs11.next())
						{
							readercountborrowed = rs11.getInt("reader_doc_borrowed")+ 1;
							String queryupdatereader = "update reader set reader_doc_borrowed = ? where reader_id = ?";
							PreparedStatement psreadercountborrowed = (PreparedStatement) con.prepareStatement(queryupdatereader);
							psreadercountborrowed.setInt(1, readercountborrowed);
							psreadercountborrowed.setInt(2, readerid);
						
							int insertQuery3 = psreadercountborrowed.executeUpdate();
							if(insertQuery3 != 0)
							{
								Statement st111 = (Statement) con.createStatement();
								int resrves=0;
								String queryupdatereader1 = "update reserves set reserves_is_available = ? where reserves_id = ?";
								PreparedStatement psreadercountborrowed1 = (PreparedStatement) con.prepareStatement(queryupdatereader);
								psreadercountborrowed.setInt(1, resrves);
								psreadercountborrowed.setInt(2, reservesid);
								
								int insertQuery33 = psreadercountborrowed.executeUpdate();
								
								if(insertQuery33 != 0)
								{
									return true;
								}
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