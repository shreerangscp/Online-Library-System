<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Document Issue</title>
</head>
<body>

	<%
		Connection con = Database.getConnection();
		
	Statement st4 = con.createStatement();
	String query4 = "select * from branch b, documents d, publisher p where d.doc_publisher_id = p.publisher_id and d.doc_lib_branch_id = lib_branch_id and d.doc_is_deleted!=1";
	ResultSet rs4 = st4.executeQuery(query4);
	
		//int docid = Integer.parseInt(request.getParameter("docid"));
		while(rs4.next())
		{
			
				%>
					<br><p>Title - <strong><%=rs4.getString("doc_title") %></strong>
					&emsp;&emsp;&emsp;&emsp;Publisher - '<strong><%= rs4.getString("publisher_name") %></strong>'
					<br>Branch - <strong><%=rs4.getString("lib_branch_name") %>, <%=rs4.getString("lib_branch_location") %></strong>
					&emsp;&emsp;&emsp;&emsp;<a href=copyissue.jsp?docid=<%= rs4.getInt("doc_id") %>>Issue a Copy</a>
		<%
		}
			
			%>
		<br><br><br>
		<a href="welcome.jsp">Back to previous Page</a>
</body>
</html>