<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Authors</title>
</head>
<body>

	<%
		Connection con = Database.getConnection();
		Statement st = con.createStatement();
		String query = "select * from authors where author_is_deleted!=1 order by author_id asc";
		ResultSet rs = st.executeQuery(query);
	%>
	<br><p><strong>&emsp;&emsp;&emsp;&emsp;List of Authors</strong></p>
	<table class="table" border="1">
			<caption style="text-align:center"></caption>
			<thead>
				<tr>
					<th>Id</th>
					<th>Author Name</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<% while(rs.next())
					{
				%>
				<tr>
					<td><%=rs.getInt("author_id") %></td>
					<td><%=rs.getString("author_name") %></td>
					<td><a href=editauthor.jsp?authorid=<%= rs.getInt("author_id") %>>Edit Author</a></td>
					<form action="EditDelAuthor" method="get">
					<td><input name="author" type="hidden" value="<%=rs.getInt("author_id") %>">
					<input name="change" type="hidden" value="2">
					<input type="submit" value="Delete"></td></form>
					
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<br><br><br><br><br><br>
		<a href="superadminpage.jsp">Back to previous Page</a>
</body>
</html>