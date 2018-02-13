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
		
%>
<form action="AddPublisher" method="get">
<h1>Add Publisher</h1>
Name   <input name="publishername" type="text" /><br><br>
Address   <input name="address" type="text" /><br><br>
<input type = "submit" value = "Submit" />
</form>
</head>
<body>

</body>
</html>