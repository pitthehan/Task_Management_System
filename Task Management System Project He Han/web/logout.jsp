<%@ page language="java" contentType="text/html"%>
<html>
<head>
<title>Log Out</title>
<link rel="stylesheet" type="text/css" href="task.css">
</head>
<body>
<br><br><br><br><br><br><br><br><br>
<%
 response.setHeader("refresh","2;url=index.jsp");
 session.invalidate();
%>
<h3 align="center">Log out from the management system successfully, you will go back to home page after 2 seconds</h3>
<h3 align="center">If you want to log in again,<a href="login.jsp"> click here</a></h3>
</body>
</html>