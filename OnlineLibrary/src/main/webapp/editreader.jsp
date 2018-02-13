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
		int readerid = Integer.parseInt(request.getParameter("readerid"));
		Statement st = con.createStatement();
		String query = "select * from reader_type rt, reader r where r.reader_id = '"+readerid+"' and rt.rt_id = r.reader_type_rt_id";
		ResultSet rs = st.executeQuery(query);
	 while(rs.next())
	{
%>
<form action="EditDelReader" method="get">
<h1>Edit Reader</h1>
First Name   <input name="fname" type="text" value="<%=rs.getString("reader_fname") %>"/><br><br>
Last Name   <input name="lname" type="text" value="<%=rs.getString("reader_lname") %>"/><br><br>
Number		<input name="number" type="text" value="<%=rs.getString("reader_phone_number") %>"/><br><br>
Address		<input name="address" type="text" value="<%=rs.getString("reader_address") %>"/><br><br>
<input name="readerid" type="hidden" value="<%=rs.getString("reader_id") %>"/>
<input name="change" type="hidden" value="1"/>
Reader Type		
<select name="type">
  <option value=""></option>
  
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