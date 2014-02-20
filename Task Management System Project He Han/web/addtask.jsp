<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"  %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="task.css">
        <title>Task Management</title>

        <script language="JavaScript" type="text/JavaScript">
            function checkform(formcontent)
            {
            if (formcontent.text.value=="")
            {
            alert("You need to add a task title！");
            formcontent.text.focus();
            return false;
            }
            if (formcontent.title.value=="")
            {
            alert("You need to add a title");
            formcontent.title.focus();
            return false;
            }
            if (formcontent.name.value=="")
            {
            alert("You need to add your name");
            formcontent.name.focus();
            return false;
            }
            }
        </script>
    </head>

    <body>
        <br>
        <form name="form1" method="post" action="insert.jsp" onSubmit="return checkform(this);">
            <div align="center"><img src="img/header.jpg"  alt="header" class="header" /></div>
            <table align="center">
                <tr>
                    <td class="l"><a href="index.jsp">Home Page </a><a>&nbsp;&gt&nbsp;</a> <span class="style1">Please Assign Task</span> </td>
                </tr>
            </table>
            <br>
            <table align="center">
                <tr>                 
                     <td class="l"><div align="right">Task Title:</div></td>
                                <td><input name="title" type="text" id="title">
                                    <span class="style1">*</span></td>
                            </tr>
                            <tr>
                                <td class="l"><div align="right">Post By:</div></td>
                                <td><input name="name" type="text" id="name">
                                    <span class="style1">*</span></td>
                            </tr>
                            <tr>
                                <td class="l"><div align="right">Leader:</div></td>
                                <td><input name="leader" type="text" id="leader"></td>
                            </tr>
                            <tr>
                                <td class="l"><div align="right">Task Member:</div></td>
                                <td><input name="taskmember" type="text" id="taskmember" ></td>
                            </tr>
                            <tr>
                                <td class="l"><div align="right">Related Materials URL:</div></td>
                                <td><input name="web" type="text" id="web"  value="http://"></td>
                            </tr>
                            <tr>
                                <td class="l"><div align="right">Priority:</div></td>
                                <td><input type="radio" name="priority" value="High">High<br> 
                                    <input type="radio" name="priority" value="Medium">Medium<br> 
                                    <input type="radio" name="priority" value="Low">Low<br> 
                                </td>
                          
                </tr>
                <tr>
                    <td height="8"></td>
                </tr>
                <tr>
                    <td colspan="2" class="l"><div align="center">Content<span class="style1">*</span></div></td>
                </tr>
                <tr>
                    <td colspan="2"><div align="center">
                            <textarea name="text" cols="100" rows="8" id="text"  overflow:auto;"></textarea>
                        </div></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input name="imageField" type="image" src="img/ok1.jpg"  width="150" height="30" onMouseOut="this.src = 'img/ok1.jpg';" onMouseOver="this.src = 'img/ok2.jpg';"  alt="ok"/>
                        <a href="index.jsp"><img src="img/back1.jpg"  onMouseOver="this.src = 'img/back2.jpg';" onMouseOut="this.src = 'img/back1.jpg';" alt="back"/></a></td>
                </tr>
            </table>

        </form>

         <table align="center">
                    <tr>
                        <td class="l"><div align="center" class="style2">Designed by He Han &nbsp;&nbsp;All Rights Reserved &copy;&nbsp;2013</div></td>
                    </tr>
                </table>
    </body>
</html>