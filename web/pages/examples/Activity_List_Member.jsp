<%@page import="enginees.Activity"%>
<%@page import="enginees.Branches"%>
<%@page import="enginees.Engineer"%>
<%@page import="java.util.List"%>
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Engineer u = (Engineer) session.getAttribute("Individual");
    if (u == null) {
%>
<jsp:forward page="../examples/LoginMember.jsp"/>
<%
    }
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
        <div id="top"  style="background:  #4682B4">

            <nav class="main-header" style="padding-top: auto;">
                <a data-original-title="Show/Hide Menu" data-placement="bottom" data-tooltip="tooltip" class="accordion-toggle btn btn-primary btn-sm visible-xs" data-toggle="collapse" href="#menu" id="menu-toggle">
                    <i class="icon-align-justify"></i>
                </a>
                <!-- LOGO SECTION -->
                <header class="navbar-header" >
                    <br><span style="color: white; font-size: 50px; font-style: oblique; font-weight: 900">UNITED FOR BETTER SERVICES</span>
                    <a href="#" class="navbar-brand">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="../../images/logo6.JPG" alt="IER" height="80" width="80" />
                        <br><span style="color: black">Rwanda Engineering Council</span>


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
                            <li><a href="../examples/Log.jsp"><i class="icon-signout"></i>Logout </a>
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
                    <a href="../forms/AcceptedMemberHome.jsp" >
                        <i class="icon-table"></i> Home
                    </a>                   
                </li><li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#component-nav">
                        <i class="icon-tasks"></i> IER Activity     

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-success">1</span>&nbsp;
                    </a>
                    <ul class="collapse" id="component-nav">
                        <li><a href="../examples/Activity_List_Member.jsp"><i class="fa fa-circle-o"></i>Activity List</a></li>

                    </ul>
                </li>
                <li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle collapsed" data-target="#form-nav">
                        <i class="icon-pencil"></i> Account Management

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-success">1</span>&nbsp;
                    </a>
                    <ul class="collapse" id="form-nav">
                        <li class=""><a href="../forms/ChangePasswordForm.jsp"><i class="icon-angle-right"></i>Change Password</a></li>
                        </ul>
                </li>

                <li><a href="../forms/AcceptedMemberHome.jsp"><i class="icon-film"></i> Back </a></li>
            </ul>

        </div>
        <!--END MENU SECTION -->
        <!--PAGE CONTENT -->
        <div id="content">
            <br/><br/>
            <div class="inner" style="min-height: 300px;">
                <div class="row">
                    <div class="col-lg-12">
                        <%="<h4 style=color:green>Hello," + u.getNames() + " "%></h4>


                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">

                        <h3>List of Open Activities</h3>
                    </div>
                </div>
                <hr />

                <!-- END HEADER SECTION -->
                <!--PAGE CONTENT -->
                <div style="margin-left: 50px;margin-right: 10px">     

                    <div  style="overflow: auto">
                        <table border="1" id="myDemo">
                            <thead style="background-color:skyblue">
                                <tr>
                                    <%                            List<Activity> ls = Activity.getList();
                                        {
                                    %>
                                    <th>No</th>
                                   
                                    <th>Activity Names</th>
                                    <th>Beginning Date </th>
                                    <th>Ending Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%                                                  int no = 1;
                                    for (int i = 0; i < ls.size(); i++) {

                                %>
                                <tr style="font-size: 20px">
                                    <td><%=no%></td>

                                    <td><%=ls.get(i).getActivitname()%></td>
                                    
                                    <td><%=ls.get(i).getActivitbigDate()%></td>
                                    <td><%=ls.get(i).getActivitendDate()%></td>
                                    <td><%=ls.get(i).getActivitstatus()%></td>
                                    <td style="background-color: #DDDDDD"><a href="../Members/JoinActivity.jsp?mid=<%=ls.get(i).getActivid()%>">More Details</a></td>
                                    </a></td>
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


    </div>

    <!--END PAGE CONTENT -->

    <!-- RIGHT STRIP  SECTION -->

    <!-- END RIGHT STRIP  SECTION -->



    <!--END MAIN WRAPPER -->

    <!-- FOOTER -->
    <div id="footer">
        <div id="sp-footer1" class="span8"><center><span class="copyright">Copyright &copy; 2017 <a href="http://www.engineersrwanda.rw/" target="_blank">Institution of Engineers Rwanda</a>.</strong> All rights
                    reserved.Designed by  <b>Moise Ingabire</b></span></center><a href="#" title=""></a></div>
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
