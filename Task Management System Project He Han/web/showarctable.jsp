<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"  %>
<%!
    public String[] split(String str, String div) {
        int arr = 0, index, indexto, d_length = div.length();
        if (str.compareTo("") != 0) {
            if (str.indexOf(div) > -1) {
                index = str.indexOf(div);
                for (int i = 1;; i++) {
                    if (str.indexOf(div, index + d_length) > -1) {
                        arr = i;
                        index = str.indexOf(div, index + d_length);
                    } else {
                        arr += 2;
                        break;
                    }
                }
            } else {
                arr = 1;
            }
        } else {
            arr = 0;
        }

        String[] restr = new String[arr];

        if (str.compareTo("") != 0) {
            if (str.indexOf(div) > -1) {
                index = str.indexOf(div);
                restr[0] = str.substring(0, index);
                for (int j = 1;; j++) {
                    if (str.indexOf(div, index + d_length) > -1) {
                        indexto = str.indexOf(div, index + d_length);
                        restr[j] = str.substring(index + d_length, indexto);
                        index = str.indexOf(div, index + d_length);
                    } else {
                        restr[j] = str.substring(index + d_length, str.length());
                        break;
                    }
                }
            } else {
                restr[0] = str;
                return restr;
            }
        } else {
            return restr;
        }

        return restr;
    }

    public String donull(String str) {
        String restr = null;
        if (str == null) {
            restr = "";
        } else {
            restr = str;
        }
        return restr;
    }

    public Object donull(Object obj) {
        Object reobj = null;
        if (obj == null) {
            reobj = (Object) ("");
        } else {
            reobj = obj;
        }
        return reobj;
    }

    public String replace(String str, String oldstr, String newstr) {
        String[] strarr = split(str, oldstr);
        String restr = null;
        if (strarr.length > 0) {
            restr = strarr[0];
            for (int i = 1; i < strarr.length; i++) {
                restr = donull(restr) + newstr + strarr[i];
            }
        }
        return donull(restr);
    }

    public String txthtml(String txt) {
        if (txt != null) {
            txt = replace(txt, "&", "&amp;");
            txt = replace(txt, "<", "&lt;");
            txt = replace(txt, ">", "&gt;");
            txt = replace(txt, " ", "&nbsp;");
            txt = "<p>" + txt + "</p>";
            txt = replace(txt, "\n", "</p><p>");
        }
        return txt;
    }

    public String retxthtml(String txt) {
        if (txt != null) {
            txt = replace(txt, " ", "&nbsp;");
            txt = "<p>" + txt + "</p>";
            txt = replace(txt, "\n", "</p><p>");
        }
        return txt;
    }
%>
<%
    String id = (String) request.getParameter("id");
    String host = "localhost:3307";
    String user = "root";
    String pw = "hehan";
    String db = "taskdb";
    String pass = null;
    pass = (String) session.getAttribute("pass");

    int pagenum;
    if (id == null) {
        id = "0";
    } else {
        for (int i = 0; i < id.length(); i++) {
            pagenum = id.charAt(i);
            if (pagenum < 48 || pagenum > 57) {
                id = "0";
                break;
            }
        }
    }


    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String url = "jdbc:mysql://" + host + "/" + db;
    Connection con = DriverManager.getConnection(url, user, pw);
    Statement st = con.createStatement();
    String sql = "select*from arctask where id=" + id;
    ResultSet taskdb = st.executeQuery(sql);
    taskdb.next();
    if (taskdb.getRow() == 0) {
        out.print("<font color=#FF0000><h3>Parameter Error, or this arctask has been deleted</h3></font>");
    } else {
%><html>
    <head>
        <link rel="stylesheet" type="text/css" href="task.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Content</title>
    </head>

    <body bgcolor="#FFD699">
        <br>
        <div align="center"><img src="img/archived.jpg"  alt="header" class="header" /></div>
        <br>
        
        <table align="center">
            <tr>
                <td><a href="arctable.jsp">Home Page of Archived Tasks</a><a>&nbsp;&gt;&nbsp;</a><span class="style1">Archived Task Information</span></td>
                <td class="l"><div align="right"><a href="arctable.jsp"><img src="img/back1.jpg" onMouseOut="this.src = 'img/back1.jpg';" onMouseOver="this.src = 'img/back2.jpg'; " alt="back"/> </a>
                        <% if ("y".equals(pass)) {%><a href="droparc.jsp?id=<%=id%>"><img src="img/del3.jpg"  onMouseOver="this.src = 'img/del3.jpg';" onMouseOut="this.src = 'img/del4.jpg';" alt="delete"/></a> 
             
   
                        <% }%>&nbsp;&nbsp;</div></td>
            </tr>
            <tr>
          <td height="2"></td>
          </tr>
        </table>
            
        <table align="center">
            <tr> 
                <td class="l"><div align="right">Task Title:</div></td>
                <td><span class="style2"><%=taskdb.getString(2)%></span></td>
            </tr>
            <tr>
                <td class="l"><div align="right">Post By:</div></td>
                <td><span class="style2"><%=taskdb.getString(3)%></span></td>
            </tr>

            <tr>
                <td class="l"><div align="right">Leader:</div></td>
                <td><span class="style2"><%=taskdb.getString(6)%></span></td>
            </tr>
            <tr>
                <td class="l"><div align="right">Task Member:</div></td>
                <td><span class="style2"><%=taskdb.getString(4)%></span></td>
            </tr>
            <tr>
                <td class="l"><div align="right">Post Time:</div></td>
                <td><span class="style2"><% String time = taskdb.getString(8);
                            out.print(time.substring(0, 16));%></span></td>
            </tr>
            <tr>
                <td class="l"><div align="right">Priority:</div></td>
                <td><span class="style2"><%=taskdb.getString(7)%></span></td>
            </tr>
            <tr>
                <td class="l"><div align="right">Related Material URL:</div></td>
                <td><span class="style2"><% if (taskdb.getString(5).compareTo("") != 0) {
                        out.print("<a href=" + taskdb.getString(5) + " target=_blank>" + taskdb.getString(5) + "</a>");
                    }%></span></td>
            </tr> 
             <tr>
          <td height="2"></td>
          </tr>
        </table>
        <table align="center" cellspacing="5">
            <tr> <td align="center" class="l"><div align="center">Task Content:</div></td></tr>
            <tr>            
                <td align="center"> <%=txthtml(taskdb.getString(9))%>
                </td>
            </tr>
        </table>
        <table align="center" cellspacing="5">
            <tr> <td align="center" class="l"><div align="center">Latest Status:</div></td></tr>
            <tr>            
                <td align="center"> <%=retxthtml(taskdb.getString(10))%>
                </td>
            </tr>
             <tr>
          <td height="2"></td>
          </tr>
        </table><br>

        <br>
         <table align="center">
                    <tr>
                        <td class="l"><div align="center" class="style2">Designed by He Han &nbsp;&nbsp;All Rights Reserved &copy;&nbsp;2013</div></td>
                    </tr>
                </table>
    </body>
</html>
<% }%>