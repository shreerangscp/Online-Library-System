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
	
	Statement st11 = con.createStatement();
	String query11 = "select * from login_history order by lh_id desc limit 1";
	ResultSet rs11 = st11.executeQuery(query11);
	
	while(rs11.next())
	{
	Statement st = con.createStatement();
	String query = "select * from copy c, reserves re, reader r, documents d where r.reader_id = '"+ rs11.getInt("lh_user_id")+"' and c.copy_id = re.reserves_copy_id and c.copy_is_reserved=1 and c.copy_is_borrowed=0 and re.reserves_reader_id = r.reader_id and d.doc_id = c.copy_doc_id ";
	ResultSet rs = st.executeQuery(query);
	
	Statement st1 = con.createStatement();
	String query1 = "select count(*) as total from copy where copy_is_reserved=1";
	ResultSet rs1 = st1.executeQuery(query1);
	
	while(rs1.next())
	{
		if(rs1.getInt("total")==0)
		{ %>
			<br><p><strong>No Documents Issued</strong></p>
	<% 	}
	}
	
		while(rs.next())
		{
			%>
			<form action="ReturnDocument" method="get">
			<p> Doc ID : <strong><%= rs.getString("copy_doc_id") %></strong>
				&emsp;&emsp;&emsp;Copy Num : <strong><%= rs.getInt("copy_num") %></strong>
				&emsp;&emsp;&emsp;Doc Title : <strong><%= rs.getString("doc_title") %></strong>
				&emsp;&emsp;&emsp;Reserved on : <%= rs.getTimestamp("reserves_date_time") %>
				&emsp;&emsp;&emsp;
				<input name="docid" type="hidden" value="<%= rs.getString("copy_doc_id") %>">
				<input name="copyid" type="hidden" value="<%= rs.getString("copy_id") %>">
				<input name="readerid" type="hidden" value="<%= rs.getString("reader_id") %>">
				<input name="reservesid" type="hidden" value="<%= rs.getString("reserves_id") %>">
			</p>
				
				
			</form>
		<% 
		}}
			%>
	
		<br>
		<a href="userpage.jsp">Back to previous Page</a>
</body>
</html>