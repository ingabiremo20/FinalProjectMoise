

<%@page import="enginees.Application"%>
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.*"%>
<%
    User u = (User) session.getAttribute("Admin");
    if (u == null) {
%>
<jsp:forward page="../examples/LoginOfficer.jsp"/>
<%
    }
    Staff stu = Staff.getStudentFromUser_ID(u.getUser_id() + "");
%>

<html>

    <head>
        <link rel="shortcut icon" type="image/png" href="img/im.PNG"/>
        <meta charset="UTF-8" />
        <title>Engineers Report</title>
        <link href="styless/fonts.css" rel="stylesheet" />
        <link href="styless/bootstrap.css" rel="stylesheet" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/bootstrap.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>

        <script language="javascript" type="text/javascript">
            function printDiv(divID) {
                //Get the HTML of div
                var divElements = document.getElementById(divID).innerHTML;
                //Get the HTML of whole page
                var oldPage = document.body.innerHTML;

                //Reset the page's HTML with div's HTML only
                document.body.innerHTML =
                        "<html><head><title></title></head><body><center>" +
                        divElements + "</center></body>";

                //Print Page
                window.print();

                //Restore orignal HTML
                document.body.innerHTML = oldPage;


            }
        </script>

    </head>

    <body>
    <center>
        <div id="s">
            <%                        String date = new GregorianCalendar().get(Calendar.DAY_OF_MONTH) + "/" + (new GregorianCalendar().get(Calendar.MONDAY) + 1) + "/" + (new GregorianCalendar().get(Calendar.YEAR));

            %>
            <div id="ds" style="width: 95%;height: auto;background-color: white;color: black;border: 0px #000 solid">

                 <div style="width: 100%;height: auto;margin-top: 0px;border:  3px black solid;border-radius: 0px;background-color: whitesmoke">
                    <div style="width: 100%;height: auto;border-bottom:   0px black solid;background-color: white">
                         <center>
                            <img src="../examples/img/header.JPG" width="1144.5" height="250" alt="toplogo"/>
                                                       
                        </center>
                    </div>

                    <div style="width: 100%;height: auto;border-bottom:   0px black solid;background-color: white;">
                        <h3>User Reports</h3>
                        <br>
                        <center>    
                            <table class="table table-striped">
                                <%                                  List<User> ls = User.getUserList();

                                %>
                                <thead  style=" border: 1px; font-size: 24px; font-style: inherit">
                                    <tr>
                                        <th>No</th>
                                        <th>Names</th>
                                        <th>Username</th>
                                        
                                        <th>User Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                                  int no = 1;
                                        for (int i = 0; i < ls.size(); i++) {
                                            String name = "System Admin";
                                            Staff v = Staff.getStudentFromUser_ID(ls.get(i).getUser_id() + "");
                                            if (v != null) {
                                                name = v.getFname() + " " + v.getLname();
                                            }
                                    %>
                                    <tr style="font-size: 20px">
                                        <td><%=no%></td>
                                        <td><%=name%></td>

                                        <td><%=ls.get(i).getUsername()%></td>
                                        
                                        <%
                                            if (ls.get(i).getStatus().equalsIgnoreCase("locked")) {
                                        %>
                                        <td><%=ls.get(i).getStatus()%> <img src="../examples/img/icon-box-error.png" width="25" height="25" alt="Locked"/></td>
                                            <%
                                            } else {
                                            %>
                                        <td><%=ls.get(i).getStatus()%> <img src="../examples/img/new.PNG" width="25" height="25" alt="Locked"/></td>
                                            <%
                                                }

                                                if (ls.get(i).getStatus().equalsIgnoreCase("unlocked")) {
                                            %>

                                    </tr>
                                    <%
                                            no++;
                                        }
                                    %>
                                </tbody>
                                 <%
                                }


                            %>
                            </table>
                           
                            <br> 
                            <h5 style="margin-left: 830px"><%="________________"%></h5>
                            <h5 style="margin-right: -830px"><%="Printed On " + date%></h5>
                            <br> 
                            </div>

                            </div>
                            </div>
                            </div>
                            <br>
                            <table border="0">

                                <tbody>
                                    <tr>

                                        <td><input type="button" value="Print The Above Report" onclick="javascript:printDiv('s')" class="btn btn-inverse" style="width: 1003px;"/></td>
                                    </tr>
                                </tbody>
                            </table>   
                        </center>
                        </body>
                        </html>
