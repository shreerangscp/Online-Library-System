<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection con = Database.getConnection();
		Statement st = con.createStatement();
		String query = "select * from publisher";
		ResultSet rs = st.executeQuery(query);
	%>
<form action="AddDocument" method="get">
<h1>Add Document</h1>
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
</select>
<br><br><br><input type = "submit" value = "Submit" />
</form>
</body>
</html>