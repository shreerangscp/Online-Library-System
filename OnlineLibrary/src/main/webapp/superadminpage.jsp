<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
<a href="addreader.jsp"><h2>Add Reader</h2></a>
<p><b>Add Documents</b>
<br><a href="addjournalvolume.jsp">Journal Volume</a>
<a href="addbook.jsp">Book</a>
<a href="addjournalissue.jsp">Journal Issue</a></p>
<a href="displayreader.jsp"><h2>Display Reader</h2></a>
<a href="displayauthor.jsp"><h2>Display Author</h2></a>
<a href="addauthor.jsp"><h2>Add Author</h2></a>
<a href="addpublisher.jsp"><h2>Add Publisher</h2></a>
<a href="displaydocuments.jsp"><h2>Display Documents</h2></a>
<a href="displaypublisher.jsp"><h2>Display Publisher</h2></a>
<a href="documentissue.jsp"><h2>Issue a Document</h2></a>
<a href="returndocument.jsp"><h2>Return a Document</h2></a>
<a href="toptendocuments.jsp"><h2>Popular Document</h2></a>
<a href="toptenreaders.jsp"><h2>Popular Borrower</h2></a>
<form action="CosineSearch" method="get"><p><b>Search Documents</b><input type="text" name="search"><input type="submit" value="Search">
<br><a href="searchondocid.jsp">Doc ID</a>
<a href="searchontitle.jsp">Title</a>
</p></form>
<a href="reservedbookadmin.jsp"><h2>Reserved Books</h2></a>
<a href="checkfine.jsp"><h2>Check fine</h2></a>

</head>
<body>

</body>
</html>