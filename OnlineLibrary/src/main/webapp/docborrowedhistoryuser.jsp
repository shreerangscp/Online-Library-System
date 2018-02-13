<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Borrowed Documents</title>
</head>
<body>

	<%
		Connection con = Database.getConnection();
	
	Statement st11 = con.createStatement();
	String query11 = "select * from login_history";
	ResultSet rs11 = st11.executeQuery(query11);
	
	while(rs11.next())
	{
	Statement st = con.createStatement();
	String query = "select * from copy c, reader r, documents d, borrow b where r.reader_id = '"+ rs11.getInt("lh_user_id")+"' and c.copy_id = b.borrow_copy_id and d.doc_id = c.copy_doc_id and d.doc_is_deleted!=1";
	ResultSet rs = st.executeQuery(query);
	
	Statement st1 = con.createStatement();
	String query1 = "select count(*) as total from copy where copy_is_borrowed=1";
	ResultSet rs1 = st1.executeQuery(query1);
	
	
		while(rs.next())
		{
			%>
			<form action="ReturnDocument" method="get">
			<p><b>===================================================================================================</b> 
			<br>Doc ID : <strong><%= rs.getString("copy_doc_id") %></strong>
				&emsp;&emsp;&emsp;Copy Num : <strong><%= rs.getInt("copy_num") %></strong>
				&emsp;&emsp;&emsp;Doc Title : <strong><%= rs.getString("doc_title") %></strong>
				<br>Borrowed on : <%= rs.getTimestamp("borrow_date_time") %>
				&emsp;&emsp;&emsp;Returned on : <%= rs.getTimestamp("return_date_time") %>
				&emsp;&emsp;&emsp;
			<br><b>===================================================================================================</b> 
			</p>
				
				
			</form>
		<% 
		}}
			%>
	
		<br>
		<a href="userpage.jsp">Back to previous Page</a>
</body>
</html>