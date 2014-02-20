<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"  %>
<%
String password="hehan";
String managerpw=null;managerpw=(String)request.getParameter("managerpw");
String id=(String)request.getParameter("id");

if(password.equals(managerpw)){
session.setAttribute("pass","y");
if(id!=null){response.sendRedirect("show.jsp?id="+id);}else{response.sendRedirect("index.jsp");}
}else{ 
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="task.css">
<title>Login for Manager</title>
</head>

<body>
<br><br><br><br><br><br><br><br><br>
<form name="form1" method="post" action="">
<table align="center">
<th>Task Management</th>
  <tr>
    <td align="center">Password:<input name="managerpw" type="password" id="managerpw"></td>
  </tr>
  <tr>
  <td align="center">
  <input name="imageField" type="image" src="img/ok1.jpg" width="150" height="30" onMouseOut="this.src='img/ok1.jpg';" onMouseOver="this.src='img/ok2.jpg';" alt="ok"/>
   <% if(id!=null){%> <input name="id" type="hidden" id="id" value="<%=id%>"><% }%>
   <a href="index.jsp"><img src="img/back1.jpg" onMouseOut="this.src='img/back1.jpg';" onMouseOver="this.src='img/back2.jpg';" alt="back"/></a></td>
   </tr>
</table>
</form>
</body>
</html>

<% }%>