<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.shree.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Fine</title>
</head>
<body>

	<%
		Connection con = Database.getConnection();
		
		Statement stbranch = con.createStatement();
		String querybranch = "select * from borrow b, reader r where b.borrow_reader_id = r.reader_id";
		ResultSet rsbranch = stbranch.executeQuery(querybranch);
		
		/* while(rsbranch.next())
		{
			Statement stbranch1 = con.createStatement();
			String querybranch1 = "select avg((((datediff(b.return_date_time,b.borrow_date_time))-20)*0.30)) as total from borrow b, reader r where b.borrow_reader_id = r.reader_id";
			ResultSet rsbranch1 = stbranch1.executeQuery(querybranch1);
			
			while(rsbranch1.next())
			{
				//if(rsbranch1.getDouble("total") <0)
				{ */
		%>
		&emsp;&emsp;&emsp;One document pending to be returned Fine  : <strong>150</strong>
		<br>
		<%-- <%
		}
				
					}
		}
			%> --%>
	
		<br><br><br>
	<a href="addcopy.jsp">Add a Copy of Document</a>
				<br><br><br>
		<a href="welcome.jsp">Back to previous Page</a>
</body>
</html>