<%@page import="enginees.Activity"%>
<%@page import="enginees.Branches"%>
<%@page import="enginees.Engineer"%>
<%@page import="java.util.List"%>
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    User u = (User) session.getAttribute("President");
    if (u == null) {
%>
<jsp:forward page="../examples/LoginOfficer.jsp"/>
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
<body class="hold-transition skin-blue sidebar-mini" >

    <!-- MAIN WRAPPER -->
    <div id="wrap" >

        <!-- HEADER SECTION -->
        <div id="top"  style="background: #3d6082">

            <nav class="main-header" style="padding-top: auto;">
                <a data-original-title="Show/Hide Menu" data-placement="bottom" data-tooltip="tooltip" class="accordion-toggle btn btn-primary btn-sm visible-xs" data-toggle="collapse" href="#menu" id="menu-toggle">
                    <i class="icon-align-justify"></i>
                </a>
                <!-- LOGO SECTION -->
                <header class="navbar-header" >

                    <a href="#" class="navbar-brand">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="../examples/img/im.PNG" alt="IER" height="70" width="70" />
                        <br><span>Rwanda Engineering Council</span>

                    </a>
                </header>
                <!-- END LOGO SECTION -->
                <ul class="nav navbar-top-links navbar-right">

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="icon-user "></i>&nbsp; <i class="icon-chevron-down ">Logout</i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="icon-user"></i></a>
                            </li>

                            <li class="divider"></li>
                            <li><a href="../examples/Logout.jsp"><i class="icon-signout"></i>Logout </a>
                            </li>
                        </ul>

                    </li>
                    <!--END ADMIN SETTINGS -->
                </ul>

            </nav>

        </div>
        <div id="left">
            <ul id="menu" class="collapse">

                <br/><br/>

                <li class="panel active">
                    <a href="../examples/PresidentHome.jsp" >
                        <i class="icon-table"></i> Home
                    </a>                   
                </li>
                <li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#component-nav">
                        <i class="icon-tasks"></i> Records     

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-success">3</span>&nbsp;
                    </a>
                    <ul class="collapse" id="component-nav">

                        <li><a href="../president/RecordBranch.jsp"><i class="fa fa-circle-o"></i>Record New Branch</a></li>
                        <li><a href="../president/RecordDepartment.jsp"><i class="fa fa-circle-o"></i>Record New Department</a></li>
                        <li><a href="../president/RecordCategory.jsp"><i class="fa fa-circle-o"></i>Record New Category</a></li>

                    </ul>
                </li>

                <li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle collapsed" data-target="#form-nav">
                        <i class="icon-pencil"></i> Activities

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp;&nbsp; <span class="label label-success">3</span>&nbsp;&nbsp;
                    </a>
                    <ul class="collapse" id="form-nav">
                        <li><a href="../president/Activity.jsp"><i class="fa fa-circle-o"></i>New Activity</a></li>
                        <li><a href="../president/Activity_List.jsp"><i class="fa fa-circle-o"></i>Open Activities</a></li>
                        <li><a href="../president/Activity_List_Closed.jsp"><i class="fa fa-circle-o"></i>Finished Activities</a></li>
                    </ul>
                </li>
                <li><a href="../examples/PresidentHome.jsp"><i class="icon-film"></i> Back </a></li>
            </ul>
        </div>
        <!--END MENU SECTION -->
        <!--PAGE CONTENT -->
        <div id="content">
            <br/><br/>
            <div class="inner" style="min-height: 300px;">
                <div class="row">
                    <div class="col-lg-12">
                        <%="<h4 style=color:green>Hello," + stu.getFname() + " " + stu.getLname()%></h4>


                    </div>
                </div>
                <hr />

                <!-- END HEADER SECTION -->
                <!--PAGE CONTENT -->
                <div style="margin-left: 50px;margin-right: 10px">     
                    <h3><center><u><b>FINISHED ACTIVITIES</b></u></center></h3>
                    <div  style="overflow: auto">
                        <table border="1" id="myDemo">
                            <thead style="background-color:skyblue">
                                <tr>
                                    <%                            List<Activity> ls = Activity.getListClosed();
                                        {
                                    %>
                                    <th>No</th>
                                    <th>Id</th>
                                    <th>Activity Names</th>
                                    <th>Place</th>
                                    <th>Descriptions</th>
                                    <th>Beginning Date </th>
                                    <th>Ending Date</th>
                                    <th>Status</th>
                                    <th>Members</th>


                                </tr>

                            </thead>

                            <tbody>

                                <%                                                  int no = 1;
                                    for (int i = 0; i < ls.size(); i++) {

                                %>
                                <tr>
                                    <td><%=no%></td>
                                    <td><%=ls.get(i).getActivid()%></td>
                                    <td><%=ls.get(i).getActivitname()%></td>
                                    <td><%=ls.get(i).getPlace()%></td>
                                    <td><%=ls.get(i).getActivitdetails()%></td>
                                    <td><%=ls.get(i).getActivitbigDate()%></td>
                                    <td><%=ls.get(i).getActivitendDate()%></td>
                                    <td><%=ls.get(i).getActivitstatus()%></td>
                                      <td style="background-color: #DDDDDD"><a href="../president/ViewActivityJoinedMemberlist.jsp?mid=<%=ls.get(i).getActivid()%>">Members</a></td>
                               
                                </tr>
                                <%
                                        no++;
                                    }
                                %>
                            </tbody>
                        </table>
                        <%
                            }


                        %>
                    </div>

                </div>
                <!--TABLE, PANEL, ACCORDION AND MODAL  -->
            </div>
            <!--END PAGE CONTENT -->


            <!-- END RIGHT STRIP  SECTION -->
        </div>

        <!--END PAGE CONTENT -->


        <!-- END RIGHT STRIP  SECTION -->


        <!--TABLE, PANEL, ACCORDION AND MODAL  -->

      <div id="right">
        <div class="well well-small">
            <button class="btn btn-block">Reports Menu</button>
            <a href="../examples/Enginer_report.jsp" class="btn btn-default" style="color: blue" target="_blank">Accepted Members</a>
            <a href="../examples/SuspendedEnginer_report.jsp" class="btn btn-default" style="color: #00ce53" target="_blank">Suspended Members</a>
            <a href="../examples/RequestingEnginer_report.jsp" class="btn btn-default" style="color: #000088" target="_blank">Requesting Members</a>
            <a href="../examples/User_report.jsp" class="btn btn-default" style="color: blueviolet" target="_blank">System Users</a>

        </div>

    </div>
    </div>

    <!--END PAGE CONTENT -->

    <!-- RIGHT STRIP  SECTION -->

    <!-- END RIGHT STRIP  SECTION -->



    <!--END MAIN WRAPPER -->

    <!-- FOOTER -->
    <div id="footer">

        <p>Copyright &copy; 2017 <a href="#">Institution of Engineers Rwanda</a>.</strong> All rights
            reserved.Designed by  <b>Moise Ingabire</b></p>
    </div>
    <!--END FOOTER -->


    <!-- GLOBAL SCRIPTS -->

    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="./assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <!-- END GLOBAL SCRIPTS -->

    <!-- PAGE LEVEL SCRIPTS -->
    <script src="../assets/plugins/flot/jquery.flot.js"></script>
    <script src="../assets/plugins/flot/jquery.flot.resize.js"></script>
    <script src="../assets/plugins/flot/jquery.flot.time.js"></script>
    <script  src="../assets/plugins/flot/jquery.flot.stack.js"></script>
    <script src="../assets/js/for_index.js"></script>

    <!-- END PAGE LEVEL SCRIPTS -->


</body>

<!-- END BODY -->
</html>
