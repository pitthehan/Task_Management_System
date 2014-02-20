package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class show_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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

    public String dohtm1(String txt) {
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

    public String dohtm2(String txt) {
        if (txt != null) {
            txt = replace(txt, " ", "&nbsp;");
            txt = "<p>" + txt + "</p>";
            txt = replace(txt, "\n", "</p><p>");
        }
        return txt;
    }

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');

    String id = (String) request.getParameter("id");
    String host = "localhost:3307";
    String user = "root";
    String pw = "hehan";
    String db = "taskdb";
    String pass = null;
    pass = (String) session.getAttribute("pass");

    int alt;
    if (id == null) {
        id = "0";
    } else {
        for (int i = 0; i < id.length(); i++) {
            alt = id.charAt(i);
            if (alt < 48 || alt > 57) {
                id = "0";
                break;
            }
        }
    }


    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String url = "jdbc:mysql://" + host + "/" + db;
    Connection con = DriverManager.getConnection(url, user, pw);
    Statement st = con.createStatement();
    String sql = "select*from task where id=" + id;
    ResultSet taskdb = st.executeQuery(sql);
    taskdb.next();
    if (taskdb.getRow() == 0) {
        out.print(" <font color=#FF0000><h3>Parameter Error, or this task has been deleted</h3></font>");
    } else {

      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"task.css\">\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Task Content</title>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <div align=\"center\"><img src=\"img/header.jpg\"  width=\"1000\" height=\"80\"></div>\r\n");
      out.write("        <br>\r\n");
      out.write("        <table align=\"center\">\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td><a href=\"index.jsp\">Home Page &nbsp;&gt;&nbsp;</a><span class=\"style1\">Task Information</span></td>\r\n");
      out.write("                <td class=\"l\"><div align=\"right\"><a href=\"index.jsp\"><img src=\"img/back1.jpg\" width=\"69\" height=\"20\" border=\"0\" onMouseOut=\"this.src = 'img/back1.jpg'\" onMouseOver=\"this.src = 'img/back2.jpg'\"></a>\r\n");
      out.write("                        ");
 if ("y".equals(pass)) {
      out.write("<a href=\"drop.jsp?id=");
      out.print(id);
      out.write("\"><img src=\"img/del1.jpg\" width=\"76\" height=\"21\" border=\"0\" onMouseOver=\"this.src = 'img/del2.jpg'\" onMouseOut=\"this.src = 'img/del1.jpg'\"></a> \r\n");
      out.write("                            ");
 } else {
      out.write("\r\n");
      out.write("                        <a href=\"addtask.jsp\"><img src=\"img/send1.jpg\" width=\"77\" height=\"21\" border=\"0\" onMouseOut=\"this.src = 'img/send1.jpg'\" onMouseOver=\"this.src = 'img/send2.jpg'\"></a> <a href=\"login.jsp?id=");
      out.print(id);
      out.write("\"><img src=\"img/admin1.jpg\" width=\"77\" height=\"21\" border=\"0\" onMouseOut=\"this.src = 'img/admin1.jpg'\" onMouseOver=\"this.src = 'img/admin2.jpg'\"></a>\r\n");
      out.write("                        ");
 }
      out.write("&nbsp;&nbsp;</div></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("          <td height=\"2\"></td>\r\n");
      out.write("          </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("        <table align=\"center\">\r\n");
      out.write("            <tr> \r\n");
      out.write("                <td class=\"l\"><div align=\"right\">Task Title:</div></td>\r\n");
      out.write("                <td><span class=\"style2\">");
      out.print(taskdb.getString(2));
      out.write("</span></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td class=\"l\"><div align=\"right\">Post By:</div></td>\r\n");
      out.write("                <td><span class=\"style2\">");
      out.print(taskdb.getString(3));
      out.write("</span></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td class=\"l\"><div align=\"right\">Leader:</div></td>\r\n");
      out.write("                <td><span class=\"style2\">");
      out.print(taskdb.getString(6));
      out.write("</span></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td class=\"l\"><div align=\"right\">Task Member:</div></td>\r\n");
      out.write("                <td><span class=\"style2\">");
      out.print(taskdb.getString(4));
      out.write("</span></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td class=\"l\"><div align=\"right\">Post Time:</div></td>\r\n");
      out.write("                <td><span class=\"style2\">");
 String time = taskdb.getString(8);
                            out.print(time.substring(0, 16));
      out.write("</span></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td class=\"l\"><div align=\"right\">Priority:</div></td>\r\n");
      out.write("                <td><span class=\"style2\">");
      out.print(taskdb.getString(7));
      out.write("</span></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td class=\"l\"><div align=\"right\">Related Material URL:</div></td>\r\n");
      out.write("                <td><span class=\"style2\">");
 if (taskdb.getString(5).compareTo("") != 0) {
                        out.print("<a href=" + taskdb.getString(5) + " target=_blank>" + taskdb.getString(5) + "</a>");
                    }
      out.write("</span></td>\r\n");
      out.write("            </tr> \r\n");
      out.write("             <tr>\r\n");
      out.write("          <td height=\"2\"></td>\r\n");
      out.write("          </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("        <table align=\"center\" cellspacing=\"5\">\r\n");
      out.write("            <tr> <td align=\"center\" class=\"l\"><div align=\"center\">Task Content:</div></td></tr>\r\n");
      out.write("            <tr>            \r\n");
      out.write("                <td align=\"center\"> ");
      out.print(dohtm1(taskdb.getString(9)));
      out.write("\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("        <table align=\"center\" cellspacing=\"5\">\r\n");
      out.write("            <tr> <td align=\"center\" class=\"l\"><div align=\"center\">Latest Status:</div></td></tr>\r\n");
      out.write("            <tr>            \r\n");
      out.write("                <td align=\"center\"> ");
      out.print(dohtm2(taskdb.getString(10)));
      out.write("\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("             <tr>\r\n");
      out.write("          <td height=\"2\"></td>\r\n");
      out.write("          </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("        <br>\r\n");
      out.write("        ");
 if ("y".equals(pass)) {
      out.write("\r\n");
      out.write("        <form name=\"form1\" method=\"post\" action=\"actre.jsp\">\r\n");
      out.write("            <table align=\"center\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <table cellspacing=\"1\">\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <th><span class=\"style2\">Reply</span></th>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                        </table>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td><div align=\"center\">\r\n");
      out.write("                            <table cellspacing=\"5\">\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                    <td><div align=\"center\">\r\n");
      out.write("                                            <br>\r\n");
      out.write("                                            <textarea name=\"text\" cols=\"100\" rows=\"8\" id=\"text\" overflow:auto;\"></textarea>\r\n");
      out.write("                                        </div></td>\r\n");
      out.write("                                </tr>\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                    <th><input name=\"imageField\" type=\"image\" src=\"img/ok1.jpg\" width=\"69\" height=\"20\" border=\"0\" onMouseOut=\"this.src = 'img/ok1.jpg'\" onMouseOver=\"this.src = 'img/ok2.jpg'\">\r\n");
      out.write("                                        <input name=\"id\" type=\"hidden\" id=\"id\" value=\"");
      out.print(id);
      out.write("\">\r\n");
      out.write("                                        <a href=\"http://www.taskdb.com\"><img src=\"img/back1.jpg\" width=\"69\" height=\"20\" border=\"0\" onMouseOver=\"this.src = 'img/back2.jpg'\" onMouseOut=\"this.src = 'img/back1.jpg'\"></a></th>\r\n");
      out.write("                                </tr>\r\n");
      out.write("                            </table>\r\n");
      out.write("                        </div></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("        </form>");
}
      out.write("\r\n");
      out.write("        <br>\r\n");
      out.write("        <table align=\"center\">\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td class=\"l\"><div align=\"center\" class=\"style2\">Welcome&nbsp;&nbsp;<font color=\"#ffffff\">All Right Reserved &copy;&nbsp;2013</font></div></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </table>\r\n");
      out.write("</html>\r\n");
 }
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
