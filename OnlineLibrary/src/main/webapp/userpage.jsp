<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Library</title>
<a href="displaydocuments.jsp"><h2>Display Documents</h2></a>
<a href="toptendocuments.jsp"><h2>Top 10 Document</h2></a>
<form action="CosineSearch" method="get"><p><b>Search Documents</b><input type="text" name="search"><input type="submit" value="Search">
<br><a href="searchondocid.jsp">Doc ID</a>
<a href="searchontitle.jsp">Title</a>
</p></form>
<a href="reservebookuser.jsp"><h2>Reserve a Document</h2></a>
<a href="reservedbookuser.jsp"><h2>Reserved Documents</h2></a>
<a href="docborrowedhistoryuser.jsp"><h2>Documents Borrowed</h2></a>
</head>
<body>

</body>
</html>