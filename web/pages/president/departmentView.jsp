<%@page import="enginees.Departments"%>
<%@page import="enginees.Engineer"%>
<%@page import="java.util.List"%>
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="p" scope="request" class="enginees.Departments"/>
<!DOCTYPE html>
<%
    User u = (User) session.getAttribute("President");
    if (u == null) {
%>
<jsp:forward page="LoginOfficer.jsp"/>
<%
    }
    Staff stu = Staff.getStudentFromUser_ID(u.getUser_id() + "");
%>

<head>
    <link rel="shortcut icon" type="image/png" href="../examples/img/im.PNG"/>
    <meta charset="UTF-8" />
    <title>Online Information System of Civil Engineers for IER</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <link rel="stylesheet" href="../assets/plugins/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    <link rel="stylesheet" href="../assets/css/theme.css" />
    <link rel="stylesheet" href="../assets/css/MoneAdmin.css" />
    <link rel="stylesheet" href="../assets/plugins/Font-Awesome/css/font-awesome.css" />
    <link href="../assets/css/layout2.css" rel="stylesheet" />
    <link href="../assets/plugins/flot/examples/examples.css" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/plugins/timeline/timeline.css" />

    <link rel="stylesheet" type="text/css" href="../dataTables/css/jquery.dataTables.css"/>
    <script type="text/javascript" src="../dataTables/js/jQuery.js"></script>
    <script type="text/javascript"  src="../dataTables/js/jquery.dataTables.js"></script>


    <script>

        $(document).ready(function () {
            // alert(); 


            $("#myDemo").DataTable();



        });

    </script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <div >    

            <div style="width: 100%;height: 100%;border-bottom:   0px black solid;background-color: white;">
                 <h3>Department List</h3>
                <table border="1" class="table table-striped">
                    <thead style="background-color:skyblue">
                        <tr>
                            <th>Department_ID</th>
                            <th>Department_Name</th>
                            <th>Description</th>                                 
                            <th>Option</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Departments> compList = Departments.getDepartmentList();
                            for (int i = 0; i < compList.size(); i++) {
                                if (i % 2 == 0) {
                        %>
                        <tr style="color: blue;background-color: whitesmoke;">
                            <td><%=compList.get(i).getDepartmentid()%> </td>
                            <td><%=compList.get(i).getDepartmentname()%></td>
                            <td><%=compList.get(i).getDepartmentdesc()%></td>                    
                           <td><a href="UpdateDepartment.jsp?id=<%=compList.get(i).getDepartmentid()%> ">Update</a></td>
                        </tr>                    <%
                        } else {
                        %>
                        <tr style="color: green;background-color: white;">
                            <td><%=compList.get(i).getDepartmentid()%> </td>
                            <td><%=compList.get(i).getDepartmentname()%></td>
                            <td><%=compList.get(i).getDepartmentdesc()%></td>                    
                            <td><a href="UpdateDepartment.jsp?id=<%=compList.get(i).getDepartmentid()%> ">Update</a></td>
                        </tr>
                        <%
                            }
                        %>

                        <%
                            }%>
                    </tbody>
                </table>
            </div>           
        </div>
    </center>

    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="./assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <!-- END GLOBAL SCRIPTS -->

    <!-- PAGE LEVEL SCRIPTS -->
    <script src="../assets/plugins/flot/jquery.flot.js"></script>
    <script src="../assets/plugins/flot/jquery.flot.resize.js"></script>
    <script src="../assets/plugins/flot/jquery.flot.time.js"></script>
    <script  src="../assets/plugins/flot/jquery.flot.stack.js"></script>
    <script src="../assets/js/for_index.js"></script>
</body>
</html>
