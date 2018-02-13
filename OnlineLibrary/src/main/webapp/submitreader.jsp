<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
Firstname ===== <%= request.getParameter("fname")%><br><br>
Lastname ===== <%= request.getParameter("lname")%><br><br>
number ===== <%= request.getParameter("number")%><br><br>
address ===== <%= request.getParameter("address")%><br><br>
type ===== <%= request.getParameter("type")%><br><br>

</head>
<body>

</body>
</html>