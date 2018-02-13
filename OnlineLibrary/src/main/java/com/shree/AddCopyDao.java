package com.shree;

import com.mysql.jdbc.PreparedStatement;

import java.sql.Connection;
import java.sql.DriverManager;

public class AddCopyDao 
{
	public boolean addCopy(int copynum, int document, int branch, int copyposition) throws ClassNotFoundException
	{
		try 
		{
			Connection con = Database.getConnection();
			String query = "insert into copy (copy_num, copy_doc_id, copy_lib_branch_id,copy_position) values (?,?,?,?)";
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, copynum);
			ps.setInt(2, document);
			ps.setInt(3, branch);
			ps.setInt(4, copyposition);
			
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