<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Journal Issue</title>
</head>
<body>
	<%
		Connection con = Database.getConnection();
		
		
	%>
<form action="AddDocument" method="get">
<h1>Add Journal Issue</h1>
Journal Volume
<select name="volume">
<option value=""></option>
<% 
Statement st1 = con.createStatement();
String query1 = "select * from documents d, journal_volume j where d.doc_id = j.jv_doc_id and d.doc_is_deleted!=1";
ResultSet rs1 = st1.executeQuery(query1);

while(rs1.next())
	{
%>	
  <option value="<%=rs1.getString("j.jv_id") %>"><%=rs1.getString("doc_title") %></option>
<%
	}
%>
</select>

<% 
Statement st2 = con.createStatement();
String query2 = "select * from documents d, journal_volume j where d.doc_id = j.jv_doc_id and d.doc_is_deleted!=1";
ResultSet rs2 = st2.executeQuery(query2);

while(rs2.next())
	{
%>	
  <input name="docid" type="hidden" value="<%=rs2.getInt("j.jv_doc_id") %>"/>
<%
	}
%>
</select>
 
	
Issue Number <input name="issuenumber" type="text">
<input name="doctype" type="hidden" value='3'/><br><br>
<br><input type = "submit" value = "Submit" />
</form>
</body>
</html>