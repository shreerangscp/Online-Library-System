<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Journal Volume</title>
</head>
<body>
	<%
		Connection con = Database.getConnection();
		Statement st = con.createStatement();
		String query = "select * from publisher";
		ResultSet rs = st.executeQuery(query);
		
	%>
<form action="AddDocument" method="get">
<h1>Add Journal Volume</h1>
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
Volume Number <input name="volumenumber" type="text">
<br><br>Editor 
<select name="editor">
<option value=""></option>
<% 
Statement st1 = con.createStatement();
String query1 = "select * from chief_editor";
ResultSet rs1 = st1.executeQuery(query1);

while(rs1.next())
	{
%>	
  <option value="<%=rs1.getString("ce_id") %>"><%=rs1.getString("ce_fname") %><%=rs1.getString("ce_lname") %></option>
<%
	}
%>
</select>
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
<select name="author">
<option value=""></option>
<% 
Statement st11 = con.createStatement();
String query11 = "select * from authors";
ResultSet rs11 = st11.executeQuery(query11);

while(rs11.next())
	{
%>	
  <option value="<%=rs11.getInt("author_id") %>"><%=rs11.getString("author_name") %></option>
<%
	}
%>
</select>
<br>
<input name="doctype" type="hidden" value='2'/><br><br>
<br><input type = "submit" value = "Submit" />
</form>
</body>
</html>