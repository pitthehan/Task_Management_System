<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"  %>

<%
String host="localhost:3307";
String user="root";
String pw="hehan";
String db="taskdb";
String pass=null;pass=(String)session.getAttribute("pass");

if("y".equals(pass)){
Class.forName("com.mysql.jdbc.Driver").newInstance();
String url="jdbc:mysql://"+host+"/"+db;
Connection con=DriverManager.getConnection(url,user,pw);
Statement st=con.createStatement();
String id=request.getParameter("id");
String txt=request.getParameter("text");

String sql="update task set retxt='"+txt+"',status='y' where id="+id;
st.executeUpdate(sql);
st.close();
con.close();
response.sendRedirect("show.jsp?id="+id);
}else{
response.sendRedirect("login.jsp");
}
%>