<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search/Doc ID</title>
</head>
<body>
<form action="SearchDocument" method="GET">
					
				<%
		Connection con = Database.getConnection();
		Statement st = con.createStatement();
		String query = "select * from branch";
		ResultSet rs = st.executeQuery(query);
		%>
				<br>
					Enter the Doc ID - <input name="search" type="text"> </input>
					<input name="searchtype" type="hidden" value="1">
					<br><br><input type = "submit" value = "Search" />
					</p>
					</form>
</body>
</html>