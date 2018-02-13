<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Books</title>
</head>
<body>
	<%
		Connection con = Database.getConnection();
		Statement st = con.createStatement();
		String query = "select * from publisher";
		ResultSet rs = st.executeQuery(query);
	%>
<form action="AddDocument" method="get">
<h1>Add Book</h1>
Title   <input name="title" type="text"/><br><br>
No of copies		<input name="copies" type="text"/><br><br>
Publisher 
<select name="publisher">
<option value=""></option>
<% while(rs.next())
	{
%>	
  <option value="<%=rs.getString("publisher_id") %>"><%=rs.getString("publisher_name") %></option>
<%
	}
%>
</select><br><br>
Enter ISBN <input name="isbn" type="text">
<br><br>Branch 
<select name="branch">
<option value=""></option>
<% 
Statement st7 = con.createStatement();
String query7 = "select * from branch";
ResultSet rs7 = st7.executeQuery(query7);

while(rs7.next())
	{
%>	
  <option value="<%=rs7.getString("lib_branch_id") %>"><%=rs7.getString("lib_branch_name") %>, <%=rs7.getString("lib_branch_location") %></option>
<%
	}
%>
</select>
<br><br>Author 
<select name="authors">
<option value=""></option>
<% 
Statement st71 = con.createStatement();
String query71 = "select * from authors";
ResultSet rs71 = st71.executeQuery(query71);

while(rs71.next())
	{
%>	
  <option value="<%=rs71.getInt("author_id") %>"><%=rs71.getString("author_name") %></option>
<%
	}
%>
</select>
<input name="doctype" type="hidden" value='1'/><br><br>
<br><input type = "submit" value = "Submit" />
</form>
</body>
</html>