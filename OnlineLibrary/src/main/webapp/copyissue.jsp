<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Issue Copy</title>
</head>
<body>

		<%
		Connection con = Database.getConnection();
		Statement st = con.createStatement();
		int docid = Integer.parseInt(request.getParameter("docid"));
		String query = "select * from documents d, copy c, copy_pos cp where d.doc_id = '"+docid+"' and c.copy_doc_id = d.doc_id and cp.copy_pos_id = c.copy_position and c.copy_is_reserved=0 and c.copy_is_borrowed!=1";
		ResultSet rs = st.executeQuery(query);
			
		while(rs.next())	
			{ %>
				
			<form action="IssueCopy" method="GET">
					<p>Copy Number -  <%=rs.getInt("copy_num") %>
					
					&emsp;&emsp;&emsp;&emsp;Copy Position - <%= rs.getString("copy_pos_location") %>
					&emsp;&emsp;&emsp;&emsp;
					
					<select name="reader">
  					<option value=""></option>
  					<% 
						Statement st1 = con.createStatement();
						String query1 = "select * from reader where reader_doc_borrowed < 10";
						ResultSet rs1 = st1.executeQuery(query1);
						
						while (rs1.next())
						{
					%>	
						<option value="<%=rs1.getInt("reader_id") %>"><%=rs1.getInt("reader_id") %> - <%=rs1.getString("reader_fname") %> <%=rs1.getString("reader_lname") %></option>
						<% 
						} 
						%>
						</select>
						
						<% 

						Statement st11 = con.createStatement();
						String query11 = "select * from reader where reader_doc_borrowed < 10";
						ResultSet rs11 = st11.executeQuery(query11);
						while(rs11.next())
							{
							int db = rs11.getInt("reader_doc_borrowed");
							
							//if(db>9)
							
							{
							%>
							<% 
							}
							}
							%>
					&emsp;&emsp;&emsp;&emsp;
					<input name="copyid" type="hidden" value="<%=rs.getInt("copy_id") %>">
					<input name="docid" type="hidden" value="<%= Integer.parseInt(request.getParameter("docid")) %>">
					<input type = "submit" value = "Issue" />
					<br>Reader cannot borrow more than 10 documents
					</p>
					</form>
			<%
			}
			%>
</body>
</html>