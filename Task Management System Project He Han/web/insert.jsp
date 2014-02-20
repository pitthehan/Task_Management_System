<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>

<%
String host="localhost:3307";
String user="root";
String pw="hehan";
String db="taskdb";

Class.forName("com.mysql.jdbc.Driver").newInstance();
String url="jdbc:mysql://"+host+"/"+db;
Connection con=DriverManager.getConnection(url,user,pw);
Statement st=con.createStatement();

String title=request.getParameter("title");
String name=request.getParameter("name");
String taskmember=request.getParameter("taskmember");
String web=request.getParameter("web");
String leader=request.getParameter("leader");
String priority=request.getParameter("priority");
String txt=request.getParameter("text");
if("http://".equals(web)){web="";}

String sql="insert into task values(0,'"+title+"','"+name+"','"+taskmember+"','"+web+"','"+leader+"','"+priority+"',now(),'"+txt+"','','n')";
st.executeUpdate(sql);
st.close();
con.close();
response.sendRedirect("index.jsp");
%>