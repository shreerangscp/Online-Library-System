<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Publishers</title>
</head>
<body>

	<%
		Connection con = Database.getConnection();
		Statement st = con.createStatement();
		String query = "select * from publisher p where p.publiher_is_deleted!=1 order by p.publisher_id asc";
		ResultSet rs = st.executeQuery(query);
	%>
	<br><p><strong>&emsp;&emsp;&emsp;&emsp;List of Publishers</strong></p>
	<table class="table" border="1">
			<caption style="text-align:center"></caption>
			<thead>
				<tr>
					<th>Id</th>
					<th>Publisher Name</th>
					<th>Publisher Address</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<% while(rs.next())
					{
				%>
				<tr>
					<td><%=rs.getInt("publisher_id") %></td>
					<td><%=rs.getString("publisher_name") %></td>
					<td><%=rs.getString("publisher_address") %></td>
					<td><a href=editpublisher.jsp?publisherid=<%= rs.getInt("publisher_id") %>>Edit Publisher</a></td>
					<form action="EditDelPublisher" method="get">
					<td><input name="publisherid" type="hidden" value="<%=rs.getInt("publisher_id") %>">
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