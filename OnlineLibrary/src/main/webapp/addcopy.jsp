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
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		Statement st3 = con.createStatement();
		String query1 = "select * from documents where doc_is_deleted != 1";
		ResultSet rs1 = st1.executeQuery(query1);
		String query2 = "select * from copy_pos";
		ResultSet rs2 = st2.executeQuery(query2);
		String query3 = "select * from branch";
		ResultSet rs3 = st3.executeQuery(query3);
	%>
<form action="AddCopy" method="get">
<h1>Add Copy of a Document</h1>
Document 		<select name="document">
  <option value=""></option>
   <% while(rs1.next())
	{
%>
  <option value="<%=rs1.getString("doc_id") %>"><%=rs1.getString("doc_title") %></option>
  <%
	}
%>
</select><br><br>
Copy Number       <input name="copynum" type="text"/><br><br>
Branch		
<select name="branch">
  <option value=""></option>
   <% while(rs3.next())
	{
%>
  <option value="<%=rs3.getString("lib_branch_id") %>"><%=rs3.getString("lib_branch_name") %>, <%=rs3.getString("lib_branch_location") %></option>
  <%
	}
%>
</select><br><br>
Copy Position	
<select name="copyposition">
  <option value=""></option>
   <% while(rs2.next())
	{
%>
  <option value="<%=rs2.getString("copy_pos_id") %>"><%=rs2.getString("copy_pos_location") %></option>
  <%
	}
%>
</select><br><br>

<input type = "submit" value = "Submit" />
</form>
	<br><br><br><br><br><br>
		<a href="welcome.jsp">Back to previous Page</a>
</body>
</html>