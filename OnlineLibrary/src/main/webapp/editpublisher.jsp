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
		int publisher = Integer.parseInt(request.getParameter("publisherid"));
		Statement st = con.createStatement();
		String query = "select * from publisher where publisher_id = '"+publisher+"'";
		ResultSet rs = st.executeQuery(query);
	 while(rs.next())
	{
%>
<form action="EditDelPublisher" method="get">
<h1>Edit Publisher</h1>
Name   <input name="fname" type="text" value="<%=rs.getString("publisher_name") %>"/><br><br>
Address		<input name="address" type="text" value="<%=rs.getString("publisher_address") %>"/><br><br>
<input name="publisherid" type="hidden" value="<%=rs.getString("publisher_id") %>"/>
<input name="change" type="hidden" value="1"/>
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