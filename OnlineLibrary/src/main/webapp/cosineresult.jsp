<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Result</title>
</head>
<body>
		<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b><u>'Search Results'</u></b>
		<%
		Connection con = Database.getConnection();
		Statement st = con.createStatement();
		String query = "select * from search s, search_type st where s.search_keyword is not null order by search_id desc limit 1";
		ResultSet rs = st.executeQuery(query);
			
		while(rs.next())	
			{ 
			
			%>
			<p><b>------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</b>
			<br>
			Search Keyword - <strong><u>'<%= rs.getString("search_keyword") %>'</u></strong> 
			<br><b>------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</b>
			<br>
			<%
			Statement st1 = con.createStatement();
			String query1 = "select * from documents d, publisher p, documents_type dt, writes w, authors a where d.doc_is_deleted!=1 and (d.doc_title like '%"+rs.getString("search_keyword")+"%' or p.publisher_name like '%"+rs.getString("search_keyword")+"%' or a.author_name like '%"+rs.getString("search_keyword")+"%') and d.doc_publisher_id = p.publisher_id and d.doc_dt_id = dt.dt_id and d.doc_id = w.write_doc_id and w.write_author_id = a.author_id";
			ResultSet rs1 = st1.executeQuery(query1);
			
			while(rs1.next())
			{
			%>
			<br><b>------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</b>
			<br>Doc Title - <strong><%= rs1.getString("doc_title") %> </strong> 
			&emsp;&emsp;&emsp;Publisher - <strong><%= rs1.getString("publisher_name") %></strong> 
 			&emsp;&emsp;&emsp;Document Type - <strong><%= rs1.getString("dt_name") %></strong> 
 			&emsp;&emsp;&emsp;Author - <strong><%= rs1.getString("author_name") %></strong> 
 			<br><b>------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</b>
			
 		</p> 
 			<% 	}}
	%>
	<a href="userpage.jsp">Back to previous page</a>
</body>
</html>