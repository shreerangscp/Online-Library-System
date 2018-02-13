<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reserve Copy</title>
</head>
<body>

		<%
		Connection con = Database.getConnection();
		Statement st = con.createStatement();
		int docid = Integer.parseInt(request.getParameter("docid"));
		String query = "select * from documents d, copy c, copy_pos cp where d.doc_id = '"+docid+"' and c.copy_is_reserved!=1 and c.copy_doc_id = d.doc_id and cp.copy_pos_id = c.copy_position and c.copy_is_borrowed!=1";
		ResultSet rs = st.executeQuery(query);
			
		while(rs.next())	
			{
			Statement st1 = con.createStatement();
			String query1 = "select * from login_history order by lh_id desc limit 1";
			ResultSet rs1 = st1.executeQuery(query1);
			
			%>
				
			<form action="ReserveCopy" method="GET">
					<p>Copy Number -  <%=rs.getInt("copy_num") %>
					
					&emsp;&emsp;&emsp;&emsp;Copy Position - <%= rs.getString("copy_pos_location") %>
					&emsp;&emsp;&emsp;&emsp;
					<% while(rs1.next())
						{
							
						%>
					<input name="readerid" type="hidden" value="<%=rs1.getInt("lh_user_id") %>">
					&emsp;&emsp;&emsp;&emsp;
					<input name="copyid" type="hidden" value="<%=rs.getInt("copy_id") %>">
					<input name="docid" type="hidden" value="<%= Integer.parseInt(request.getParameter("docid")) %>">
					<input type = "submit" value = "Reserve a Copy" />
					</p>
					</form>
			<%
			}}
			%>
</body>
</html>