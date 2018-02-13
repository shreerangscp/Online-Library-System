<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Documents</title>
</head>
<body>

	<%
		Connection con = Database.getConnection();
		
		Statement stbranch = con.createStatement();
		String querybranch = "select * from branch";
		ResultSet rsbranch = stbranch.executeQuery(querybranch);
		
		while(rsbranch.next())
		{
		Statement st = con.createStatement();
		String query = "select * from documents d, authors a, writes w where d.doc_lib_branch_id = '"+rsbranch.getInt("lib_branch_id")+"' and d.doc_is_deleted !=1 and d.doc_id=w.write_doc_id and a.author_id = w.write_author_id";
		ResultSet rs = st.executeQuery(query);
		
		while(rs.next())
		{
				Statement st10 = con.createStatement();
				String query10 = "select count(*) as total from copy where copy_doc_id = '"+rs.getInt("doc_id")+"'";
				ResultSet rs10 = st10.executeQuery(query10);
				
				Statement st2 = con.createStatement();
				String query2 = "select * from publisher where publisher_id = '"+rs.getInt("doc_publisher_id")+"'";
				ResultSet rs2 = st2.executeQuery(query2);
				
				Statement st3 = con.createStatement();
				String query3 = "select * from copy where copy_doc_id = '"+rs.getInt("doc_id")+"'";
				ResultSet rs3 = st3.executeQuery(query3);
				
				/* Statement st4 = con.createStatement();
				String query4 = "select * from branch where lib_branch_id";
				ResultSet rs4 = st4.executeQuery(query4);
 */
				while(rs2.next())
				{
					//while(rs4.next())
					{
				%>
					<br><p>
					<b>====================================================================================================</b><br>
					Title - <strong><%=rs.getString("doc_title") %></strong>
					&emsp;&emsp;&emsp;&emsp;Publisher - '<strong><%= rs2.getString("publisher_name") %></strong>'
					&emsp;&emsp;&emsp;&emsp;Author - '<strong><%= rs.getString("author_name") %></strong>'
					<br>Branch - <strong><%=rsbranch.getString("lib_branch_name") %>, <%=rsbranch.getString("lib_branch_location") %></strong>
					<%
					while(rs10.next())
					{
					%>
					&emsp;&emsp;&emsp;&emsp; No of copies - <%=rs10.getInt("total") %>
					&emsp;&emsp;&emsp;&emsp;<a href=editdocument.jsp?docid=<%= rs.getInt("doc_id") %>>Edit Document</a>
					<form action="EditDelDocument" method="get">
					<input name="docid" type="hidden" value="<%=rs.getInt("doc_id") %>">
					<input name="change" type="hidden" value="2">
					&emsp;&emsp;&emsp;&emsp;<input type="submit" value="Delete"></form></p>
					
					<% while(rs3.next())
						{
							Statement st66 = con.createStatement();
							String query66 =  "select * from copy_pos where copy_pos_id = '"+rs3.getInt("copy_position")+"'";
							ResultSet rs66 = st66.executeQuery(query66);
							
							
								%>	
					<p> Copy Number - <%=rs3.getInt("copy_num") %>
					&emsp;&emsp;<% 
					while(rs66.next())
					{ 
						%>	Copy Position - 
						<%= rs66.getString("copy_pos_location") %>
					&emsp;&emsp;<input name="copyid" type="hidden" value="<%= rs3.getInt("copy_id") %>">
						<%
						Statement st68 = con.createStatement();
						String query68 =  "select * from borrow where borrow_copy_id = '"+rs3.getInt("copy_id")+"'";
						ResultSet rs68 = st68.executeQuery(query68);
						
						while (rs68.next())
						{ 
							Statement st67 = con.createStatement();
							String query67 =  "select * from reader where reader_id = '"+ rs68.getInt("borrow_reader_id")+"'";
							ResultSet rs67 = st67.executeQuery(query67);
							%>
							<br>---Issued to 
							<% 
							while (rs67.next())
							{ %>
							<strong><%=rs67.getString("reader_fname") %> <%=rs67.getString("reader_lname") %></strong> on <strong><%=rs68.getTimestamp("borrow_date_time") %></strong>
							
							<% if (rs68.getDate("return_date_time") != null) 
							{
							%>
							and collected back on <strong><%=rs68.getTimestamp("return_date_time") %></strong>
							
							<%
							}
							else
							{
								%>
								and <strong>not collected back </strong>
								
								<%
							}
							}
						}
						%>
					<br>
					
			<%
					}
					
					}%>
					<b>====================================================================================================</b>
					
					<% }
				}
			} 
		}
		}
			%>
	
		<br><br><br>
	<a href="addcopy.jsp">Add a Copy of Document</a>
				<br><br><br>
		<a href="welcome.jsp">Back to previous Page</a>
</body>
</html>