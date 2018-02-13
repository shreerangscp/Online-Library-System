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
		String query = "select * from search s, search_type st, documents d, publisher p, branch b where s.search_doc_id = d.doc_id and d.doc_publisher_id = p.publisher_id and d.doc_lib_branch_id = b.lib_branch_id and s.search_st_id = st.st_id order by search_id desc limit 1";
		ResultSet rs = st.executeQuery(query);
			
		while(rs.next())	
			{ 
			
			%>
			<p><b>--------------------------------------------------------------------------------------------------------------------------</b>
			<br>Doc ID - <strong><%= rs.getInt("search_doc_id") %></strong>
			&emsp;&emsp;&emsp;Doc Title - <strong><%= rs.getString("doc_title") %> </strong> 
			&emsp;&emsp;&emsp;Publisher - <strong><%= rs.getString("publisher_name") %></strong> 
 			<br>
 			Branch - <strong><%= rs.getString("lib_branch_name") %>, <%= rs.getString("lib_branch_location") %></strong> 
 			<br><b>--------------------------------------------------------------------------------------------------------------------------</b>
			<br>
 		</p> 
 			<% 	}
	%>
	<a href="userpage.jsp">Back to previous page</a>
</body>
</html>