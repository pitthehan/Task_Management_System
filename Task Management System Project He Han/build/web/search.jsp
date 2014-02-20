<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>
<%
    String host = "localhost:3307";
    String user = "root";
    String pw = "hehan";
    String db = "taskdb";
    String permission = "n";
    String pass = null;
    pass = (String) session.getAttribute("pass");

    int i = 0, x = 0;
    int tablerow = 8;
    int pages = 0;
    int start;
    
    String myname = (String) request.getParameter("search");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String url = "jdbc:mysql://" + host + "/" + db;
    Connection con = DriverManager.getConnection(url, user, pw);
    Statement st = con.createStatement();
    String sql = "select id,title,name,leader,taskmember,time,priority,status from task where taskmember like '%"+myname+"%'";
    ResultSet taskdb = st.executeQuery(sql);
    String getpages = (String) request.getParameter("pages");

    int judge = 1, pagenum;
    if (getpages == null) {
        judge = 1;
    } else {
        for (int i1 = 0; i1 < getpages.length(); i1++) {
            pagenum = getpages.charAt(i1);
            if (pagenum < 48 || pagenum > 57) {
                judge = 1;
                break;
            } else {
                judge = 2;
            }
        }
    }
    if (judge == 1) {
        pages = 1;
    } else {
        pages = Integer.parseInt(getpages);
    }

    taskdb.last();
    int count = taskdb.getRow();
    int rest;
    int pa = count / tablerow;
    if (count % tablerow > 0) {
        pa = pa + 1;
        rest = count % tablerow;
    } else {
        rest = tablerow;
    }
    if (pages < 0) {
        pages = 1;
    }
    if (pages > pa) {
        pages = pa;
    }
    start = (pages - 1) * tablerow + 1;
%>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="task.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task Management</title>
    </head>

    
    <body <% if ("y".equals(pass)) {%> bgcolor="#B8FFB8" <% }%>>
        <br> 
        <div  align="center"><img src="img/header.jpg" alt="header" class="header" /> </div>
            <br>
            
            <div align="center"><% if ("y".equals(pass)) {%>Welcome to log in administrator mode, please manage your tasks <% }%></div>
            <div align="center"><% if ("y".equals(pass)) {%><a href="arctable.jsp">Go to manage archived tasks</a><% }%></div>
            <div align="center"><% if ("y".equals(pass)) {%><a href="logout.jsp">log out from administrator mode</a> <% }%></div>
               <br>
               
          <form name="form0" method="post" action="search.jsp" >
         <table align="center">
                <tr>                 
                    <td class="l">Search tasks assigned to you by entering your name:</td> </tr>
                       <tr>          <td><input name="search" type="text" id="search">
                               <input type="submit" value="Submit">
                                 </td>
                                 
                            </tr>
                    </table>
        </form>
        
        <form name="form1" method="post" action="delete.jsp" onSubmit="return check();">

            <table align="center">      
                <tr>
                    <td><a href="index.jsp">Home Page</a><a> &nbsp;&gt;&nbsp;</a><span class="style1">Task Management</span></td>
                </tr>
                <tr>
                                    
                    <td width="50%" class="l">Current Page: <%=pages%>&nbsp;&nbsp;&nbsp; Totally <%=pa%> Pages
                        <% if (pages > 1) {%>
                        <a href="index.jsp">Home Page</a> 
                        <a href="index.jsp?pages=<%=pages - 1%>">Previous Page</a> 
                        <%}
                            if (pages < pa) {%>
                        <a href="index.jsp?pages=<%=pages + 1%>">Next Page</a> 
                        <a href="index.jsp?pages=<%=pa%>">End Page</a><% }%>
                    </td>
                    <td width="50%" class="l"><div align="right">
                            <% if ("y".equals(pass)) {%>
                            <input name="imageField" type="image" src="img/del1.jpg" width="150" height="30" onMouseOut="this.src = 'img/del1.jpg';" onMouseOver="this.src = 'img/del2.jpg';" alt="delete"/>
                            <input name="tablerow" type="hidden" id="tablerow" value="<%=tablerow%>">
                            <input name="pages" type="hidden" id="pages" value="<%=pages%>"> 
                            <% } else {
                                if (permission.equals("n")) {%>
                            <a href="addtask.jsp"><img src="img/add1.jpg" onMouseOut="this.src = 'img/add1.jpg';" onMouseOver="this.src = 'img/add2.jpg';" alt="add"/></a> <% }%>
                            <a href="login.jsp"><img src="img/admin1.jpg" onMouseOut="this.src = 'img/admin1.jpg';" onMouseOver="this.src = 'img/admin2.jpg';" alt="admin"/></a>
                                <% }%>
                    </td>
                </tr>
            </table>
            <br>
            <table align="center">
                <tr>
                    <th><span class="style2"><% if ("y".equals(pass)) {
                            out.print("<input type=\"checkbox\" id=\"a\" onclick=\"return allcheck()\">");
                        } else {
                            out.print("ID");
                        }%></span></th>
                    <th width="300"><span class="style2">Task Title</span></th>
                    <th width="80"><span class="style2">Post By</span></th>
                    <th width="80"><span class="style2">Leader</span></th>
                    <th width="100"><span class="style2">Task Member</span></th>
                    <th width="100"><span class="style2">Post Time</span></th>
                    <th width="80"><span class="style2">Priority</span></th>
                    <th width="80"><span class="style2">Status</span></th>
                </tr>
                <%
                    taskdb.absolute(start);
                    taskdb.previous();
                    while (taskdb.next()) {
                %>
                <tr>
                    <td><div align="center"><% if ("y".equals(pass)) {
                            out.print("<input name=\"del" + taskdb.getRow() + "\" type=\"checkbox\" value=\"" + taskdb.getString(1) + "\">");
                        } else {
                            out.print(taskdb.getRow());
                        }%></div></td>
                    <td><div align="center"><a href="show.jsp?id=<%=taskdb.getString(1)%>" target="_blank"><%=taskdb.getString(2)%></a></div></td>
                    <td><div align="center"><%=taskdb.getString(3)%></div></td>
                    <td><div align="center"><%=taskdb.getString(4)%></div></td>
                    <td><div align="center"><%=taskdb.getString(5)%></div></td>
                            <td><div align="center"><% String time = taskdb.getString(6);
                        out.print(time.substring(0, 16));%></div></td>
                    <td><div align="center"><%=taskdb.getString(7)%></div></td>
                    <td><div align="center" class="style1"><% if (taskdb.getString(8).equals("y")) {
                            out.print("Updated");
                        }%></div></td>
                </tr>
                <%
                        i++;
                        if (i == tablerow) {
                            break;
                        }
                    }
                %>
            </table>
            <br>
            <%
                taskdb.close();
                st.close();
                con.close();
            %>
             <table align="center">
                <tr>
                    <td class="l"><div align="center" >
                            <%
                                if (pa <= 5) {
                                    for (int j = 1; j < pa + 1; j++) {
                                        if (j == pages) {%><font color=#ff0000>Page <%=pages%></font>&nbsp;<% } else {%><a href="index.jsp?pages=<%=j%>">Page <%=j%></a>&nbsp;<% }
                                            }
                                        } else if (pages < 4) {
                                            for (int k = 1; k < pages + 3; k++) {
                                                if (k == pages) {%><font color=#ff0000>Page <%=k%></font>&nbsp;<% } else {%><a href="index.jsp?pages=<%=k%>">Page <%=k%></a>&nbsp;<% }
                                                    }
                                                } else if ((pa - pages) < 4) {
                                                    for (int l = pa - 5; l <= pa; l++) {
                                                        if (l == pages) {%><font color="#FF0000">Page <%=l%></font>&nbsp;<% } else {%><a href="index.jsp?pages=<%=l%>">Page <%=l%></a>&nbsp;<% }
                                                            }
                                                        } else {
                                                            for (int m = pages - 3; m < pages + 3; m++) {
                                                                if (m == pages) {%><font color="#FF0000">Page <%=m%></font>&nbsp;<% } else {%><a href="index.jsp?pages=<%=m%>">Page <%=m%></a>&nbsp;<% }
                                               }
                                           }%>&nbsp;&nbsp;&nbsp;Totally <%=pa%> Pages &nbsp;&nbsp;&nbsp;There are <%=count%> tasks</div></td>

                </tr>
            </table>
        </form>
        <%
            if (!"y".equals(pass)) {
                if (permission.equals("y")) {
        %>     
        <% }
               }%>


        <table align="center" background="">
            <tr>
                <td class="l"><div align="center" class="style2">Designed by He Han &nbsp;&nbsp;All Rights Reserved &copy;&nbsp;2013</div></td>
            </tr>
        </table>
    </body>
</html>