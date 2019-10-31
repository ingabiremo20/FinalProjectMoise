

<%@page import="enginees.DBClassConnector"%>
<%@page import="enginees.Branches"%>
<%@page import="enginees.Departments"%>
<%@page import="enginees.Categories"%>
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
    User u = (User) session.getAttribute("Admin");
    if (u == null) {
%>
<jsp:forward page="Staff_Login.jsp"/>
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
            <div id="ds" style="width: 95%;height: auto;background-color: white;color: black;border: 0px #000 solid;background-color:red">

                <div style="width: 100%;height: auto;margin-top: 0px;border:  3px black solid;border-radius: 0px;background-color: whitesmoke">
                    <div style="width: 100%;height: auto;border-bottom:   0px black solid;background-color: white">
                        <center>
                            <img src="../examples/img/header.JPG" width="1144.5" height="250" alt="toplogo"/>

                        </center>
                    </div>
                    <div style="width: 100%;height: auto;border-bottom:   0px black solid;background-color: white">
                        <h1><u>Registered Engineer Report</u></h1>
                        <br>
                        <center>    
                            <table  border="0" class="table table-striped" >


                                <thead  style=" border: 1px; font-size: 20px; font-style: inherit">
                                <th>No</th>
                                <th>Id</th>
                                <th>Names</th>
                                <th>Branch</th>
                                <th>Departments</th>
                                <th>Category</th>
                                <th>Nationality</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Type</th>
                                <th>Registration Date</th>
                                <th>Status</th>                            



                                </thead>


                                <%                                        Connection con = DBClassConnector.getConnection();
                                    Statement statement = con.createStatement();
                                    String aa = request.getParameter("d1");
                                    String ab = request.getParameter("d2");
                                    String cb = request.getParameter("d3");
                                    ResultSet resultset = null;
                                    if ((aa == "") || (aa == null)) {
                                        resultset = statement.executeQuery("select * from engineer WHERE status='Accepted'");
                                    } else {
                                        resultset = statement.executeQuery("SELECT * FROM `engineer` WHERE status='Accepted' and role='" + cb + "' and memberregdate between '" + aa + "' and '" + ab + "'");
                                    }

                                %>

                                <%while (resultset.next()) {
                                        int no = 1;
                                        String df = resultset.getString(17);
                                        String d = df.substring(0, 4);
                                %>

                                <tr style="font-size: 16px">
                                    <td><%=no%></td>
                                    <td><%=resultset.getString(24) + "" + resultset.getString(1) + "/" + resultset.getString(25) + "/" + resultset.getString(26) + "/" + d%> </td>
                                    <td><%=resultset.getString(2)%></td>                                              
                                    <td><%=Branches.getBranchid(resultset.getString(9)).getBranchname()%></td>
                                    <td><%=Departments.getDepartmentByid(resultset.getString(8)).getDepartmentname()%></td>
                                    <td><%=Categories.getCategoryid(resultset.getString(7)).getCategoryname()%></td>
                                    <td><%=resultset.getString(16)%></td>                                                               
                                    <td><%=resultset.getString(3)%></td>                                        
                                    <td><%=resultset.getString(15)%></td>                    
                                    <td><%=resultset.getString(5)%></td>                    
                                    <td><%=resultset.getString(17)%></td>                              
                                    <td><%=resultset.getString(6)%></td>                            

                                    <% no++;
                                        }
                                    %>

                                </tr>
                            </table>
                            <%

                            %>
                            <br> 
                            <h5 style="margin-left: 830px"><%="________________"%></h5>
                            <h5 style="margin-right:-830px"><%="Printed On " + date%></h5>
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
