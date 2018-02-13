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
		int authorid = Integer.parseInt(request.getParameter("authorid"));
		Statement st = con.createStatement();
		String query = "select * from authors where author_id = '"+authorid+"'";
		ResultSet rs = st.executeQuery(query);
	 while(rs.next())
	{
%>
<form action="EditDelAuthor" method="get">
<h1>Edit Author</h1>
Name   <input name="authorname" type="text" value="<%=rs.getString("author_name") %>"/><br><br>
<input type="hidden" name="authorid" value="<%=rs.getInt("author_id") %>"/>
<input name="change" type="hidden" value="1"/>
<input type = "submit" value = "Submit" />
</form>
<%} %>
</head>
<body>

</body>
</html>