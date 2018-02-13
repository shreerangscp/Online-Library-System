<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Top 10 Readers</title>
</head>
<body>
		<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b><u>'Top 10 Readers'</u></b>
		<%
		Connection con = Database.getConnection();
		Statement st = con.createStatement();
		String query = "select * from reader order by reader_doc_borrowed desc limit 10";
		ResultSet rs = st.executeQuery(query);
			
		while(rs.next())	
			{ 
			
			%>
			<p><b>==================================================================================================</b>
			<br>Reader ID - <strong><%= rs.getInt("reader_id") %></strong>
			&emsp;&emsp;&emsp;Reader Name - <strong><%= rs.getString("reader_fname") %> <%= rs.getString("reader_lname") %></strong>
			&emsp;&emsp;&emsp;Borrowed - <strong><%= rs.getInt("reader_doc_borrowed") %> Documents</strong>
			<br><b><u>Documents Borrowed</u></b>
			<% 
			Statement st1 = con.createStatement();
			String query1 = "select * from documents d, borrow b where b.borrow_reader_id = '"+rs.getInt("reader_id")+"' and d.doc_id = b.bt_doc_id";
			ResultSet rs1 = st1.executeQuery(query1);
			
			while (rs1.next())
			{ %>
				<br> <%= rs1.getString("doc_title") %> on 
				<%= rs1.getDate("borrow_date_time") %>, <%= rs1.getTime("borrow_date_time") %> and returned on 
				<%= rs1.getDate("return_date_time") %>, <%= rs1.getTime("return_date_time") %>
			<% }
			%>
		</p>
			<%
			}
			%>
</body>
</html>