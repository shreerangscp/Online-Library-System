<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Top 10 Documents</title>
</head>
<body>
		<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b><u>'Top 10 Documents'</u></b>
		<%
		Connection con = Database.getConnection();
		Statement st = con.createStatement();
		String query = "select * from documents d, publisher p, documents_type dt where d.doc_publisher_id = p.publisher_id and d.doc_dt_id = dt.dt_id and d.doc_is_deleted!=1 order by d.doc_count_borrowed desc";
		ResultSet rs = st.executeQuery(query);
			
		while(rs.next())	
			{ 
			%>
			<p><b>==================================================================================================</b>
			<br>
			Doc ID - <strong><%= rs.getInt("doc_id") %></strong>
			&emsp;&emsp;&emsp;Borrowed - <strong><%= rs.getInt("doc_count_borrowed") %> times</strong>
			&emsp;&emsp;&emsp;Doc Type - <strong><%= rs.getString("dt_name") %></strong>
			&emsp;&emsp;&emsp;Doc Name - <strong><%= rs.getString("doc_title") %></strong>
			<br><b><u>Borrowed by</u></b>
			
			
			
			<% 
			Statement st1 = con.createStatement();
			String query1 = "select * from borrow b, reader r where b.bt_doc_id = '"+rs.getInt("doc_id")+"' and b.borrow_reader_id = r.reader_id";
			ResultSet rs1 = st1.executeQuery(query1);
			
			while (rs1.next())
			{ %>
				<br>'<%= rs1.getString("reader_fname") %> <%= rs1.getString("reader_lname") %>' on 
				'<%= rs1.getDate("borrow_date_time") %>, <%= rs1.getTime("borrow_date_time") %>' and returned on 
				'<%= rs1.getDate("return_date_time") %>, <%= rs1.getTime("return_date_time") %>'
			<% 
			}
			}
			%></p>
</body>
</html>