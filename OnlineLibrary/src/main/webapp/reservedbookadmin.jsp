<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reserved Document</title>
</head>
<body>

	<%
		Connection con = Database.getConnection();
	
	Statement st = con.createStatement();
	String query = "select * from copy c, reserves re, reader r, documents d where c.copy_id = re.reserves_copy_id and c.copy_is_reserved=1 and re.reserves_reader_id = r.reader_id and d.doc_id = c.copy_doc_id ";
	ResultSet rs = st.executeQuery(query);
	
	Statement st1 = con.createStatement();
	String query1 = "select count(*) as total from copy where copy_is_reserved=1";
	ResultSet rs1 = st1.executeQuery(query1);
	
	while(rs1.next())
	{
		if(rs1.getInt("total")==0)
		{ %>
			<br><p><strong>No Documents Reserved</strong></p>
	<% 	}
	}
	
		while(rs.next())
		{
			%>
			<form action="IssueCopy" method="get">
			<p> Doc ID : <strong><%= rs.getString("copy_doc_id") %></strong>
				&emsp;&emsp;&emsp;Doc Title : <strong><%= rs.getString("doc_title") %></strong>
				&emsp;&emsp;&emsp;Copy Num : <strong><%= rs.getInt("copy_num") %></strong>
				<br>Reserved on : <strong><%= rs.getTimestamp("reserves_date_time") %></strong>
				&emsp;&emsp;&emsp;Reserved by : <strong><%= rs.getString("reader_fname") %> <%= rs.getString("reader_lname") %></strong>
				&emsp;&emsp;&emsp;
				<input name="docid" type="hidden" value="<%= rs.getString("copy_doc_id") %>">
				<input name="copyid" type="hidden" value="<%= rs.getString("copy_id") %>">
				<input name="reader" type="hidden" value="<%= rs.getString("reader_id") %>">
				<input type="submit" value="Issue a Copy">
			</p>
				
				
			</form>
		<% 
		}
			%>
	
		<br>
		<a href="superadminpage.jsp">Back to previous Page</a>
</body>
</html>