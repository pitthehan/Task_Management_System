<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"  %>
<%
String pass=null;pass=(String)session.getAttribute("pass");
if("y".equals(pass)){
String id=request.getParameter("id");

if(id==null){out.print("<h3><font color=#FF0000>ERROR!</font></h3>");}else{
String host="localhost:3307";
String user="root";
String pw="hehan";
String db="taskdb";

Class.forName("com.mysql.jdbc.Driver").newInstance();
String url="jdbc:mysql://"+host+"/"+db;
Connection con=DriverManager.getConnection(url,user,pw);
java.sql.Statement st=con.createStatement();

String sql="delete from task where id="+id;
String arcsql="insert into arctask select * from task where id="+id;
st.executeUpdate(arcsql);
st.executeUpdate(sql);
st.close();
con.close();
response.sendRedirect("index.jsp");
}
}else{
response.sendRedirect("log.jsp");
}
%>