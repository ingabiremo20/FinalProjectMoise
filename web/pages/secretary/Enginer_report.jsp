

<%@page import="enginees.Memberships"%>
<%@page import="enginees.Engineer"%>
<%@page import="enginees.Application"%>
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.*"%>
<%
    User u = (User) session.getAttribute("Secretary");
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
        <title>Enginers Report</title>
        <link href="styless/fonts.css" rel="stylesheet" />
        <link href="styless/bootstrap.css" rel="stylesheet" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>

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
                            <img src="img/im.PNG" width="124" height="124" alt="toplogo"/>
                            <h3>Institution of Engineers Rwanda</h3>
                            <h4>Kigali-Rwanda</h4>
                        </center>
                    </div>

                    <div style="width: 100%;height: auto;border-bottom:   0px black solid;background-color: white;">
                        <h2><u>Members Reports</u></h2>
                        <br>
                        <center>    
                            <table class="table table-striped" border="1">
                                <%                             List<Engineer> ls = Engineer.getListOfAcceptedMember();

                                %>
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>ID</th>                                        
                                        <th>Names</th>
                                        <th>Nationality</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Type</th>
                                        <th>Registration Date</th>
                                        <th>Status</th>                                        

                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                                  int no = 1;
                                        for (int i = 0; i < ls.size(); i++) {

                                    %>
                                    <tr>
                                        <td><%=no%></td>                                        
                                        <td><%=ls.get(i).getTagid() + "" + ls.get(i).getEngineer_id() + "/" + ls.get(i).getTagid1() + "/" + ls.get(i).getTagid2() + "/" + ls.get(i).getEngineer_id()%></td>
                                        <td><%=ls.get(i).getNames()%></td>
                                        <td><%=ls.get(i).getMembernation()%></td>
                                        <td><%=ls.get(i).getEmails()%></td>
                                        <td><%=ls.get(i).getMemberphone()%></td>
                                        <td><%=ls.get(i).getRole()%></td>
                                        <td><%=ls.get(i).getMemberregdate()%></td>
                                        <td><%=ls.get(i).getStatus()%></td>

                                    </tr>
                                    <%
                                            no++;
                                        }
                                    %>
                                </tbody>
                            </table>
                            <%

                            %>
                            <br> 
                            <h5 style="margin-left: -830px"><%="________________"%></h5>
                            <h5 style="margin-right: -830px"><%="Printed On " + date%></h5>
                            <h5 style="margin-right: -830px"><%="Signature by  "%></h5>
                            <h3 style="margin-right: -830px"><%=" " + stu.getFname() + "  " + stu.getLname()%></h3>
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
