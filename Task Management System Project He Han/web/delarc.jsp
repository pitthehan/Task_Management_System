<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"  import="java.lang.*"%>
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
String sql;

int tablerow,p,no;
String rw=(String)request.getParameter("tablerow");
String pages=(String)request.getParameter("pages");
if(rw==null){tablerow=1;}else{tablerow=Integer.parseInt(rw);}
if(pages==null){p=1;}else{p=Integer.parseInt(pages);}

for(int i=1;i<=tablerow;i++){
no=i+(p-1)*tablerow;
String del=request.getParameter("del"+no);
if(del!=null){
sql="delete from arctask where id="+del;
st.executeUpdate(sql);
}
}
st.close();
con.close();
response.sendRedirect("arctable.jsp");
}else{
response.sendRedirect("login.jsp");
}
%>