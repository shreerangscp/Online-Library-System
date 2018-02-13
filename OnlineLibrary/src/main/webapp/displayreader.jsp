<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Readers</title>
</head>
<body>

	<%
		Connection con = Database.getConnection();
		Statement st = con.createStatement();
		String query = "select * from reader r, reader_type rt where r.reader_type_rt_id = rt.rt_id and r.reader_is_deleted!=1 order by r.reader_id asc";
		ResultSet rs = st.executeQuery(query);
	%>
	<br><p><strong>&emsp;&emsp;&emsp;&emsp;List of Readers</strong></p>
	<table class="table" border="1">
			<caption style="text-align:center"></caption>
			<thead>
				<tr>
					<th>Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Phone Number</th>
					<th>Address</th>
					<th>Reader Type</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<% while(rs.next())
					{
				%>
				<tr>
					<td><%=rs.getInt("reader_id") %></td>
					<td><%=rs.getString("reader_fname") %></td>
					<td><%=rs.getString("reader_lname") %></td>
					<td><%=rs.getInt("reader_phone_number") %></td>
					<td><%=rs.getString("reader_address") %></td>
					<td><%=rs.getString("rt_name") %></td>
					<td><a href=editreader.jsp?readerid=<%= rs.getInt("reader_id") %>>Edit Reader</a></td>
					<form action="EditDelReader" method="get">
					<td><input name="readerid" type="hidden" value="<%=rs.getInt("reader_id") %>">
					<input name="change" type="hidden" value="2">
					<input type="submit" value="Delete"></td></form>
					
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<br><br><br><br><br><br>
		<a href="welcome.jsp">Back to previous Page</a>
</body>
</html>