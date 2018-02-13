<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<%
		Connection con = Database.getConnection();
		Statement st = con.createStatement();
		String query = "select * from reader_type";
		ResultSet rs = st.executeQuery(query);
	%>
<form action="AddReader" method="get">
<h1>Add Reader</h1>
First Name   <input name="fname" type="text"/><br><br>
Last Name       <input name="lname" type="text"/><br><br>
Number		<input name="umber" type="text"/><br><br>
Address		<input name="address" type="text"/><br><br>
Reader Type		
<select name="type">
  <option value=""></option>
  <% while(rs.next())
	{
%>
  <option value="<%=rs.getString("rt_id") %>"><%=rs.getString("rt_name") %></option>
  <%
	}
%>
</select>
<input type = "submit" value = "Submit" />
</form>
</head>
<body>

</body>
</html>