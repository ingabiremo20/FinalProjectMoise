<%@page import="enginees.Engineer"%>
<%@page import="java.util.List"%>
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    User u = (User) session.getAttribute("Secretary");
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
    <title>Online Management of Civil Engineers Activity for IER</title>
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
                            <li> <a href="../examples/Logout.jsp" style="background-color: blue"><i class="icon-signout"></i>Change Password </a>
                                <a href="../examples/Logout.jsp"><i class="icon-signout"></i>Logout </a>


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
                    <a href="../examples/SecretaryHome.jsp" >
                        <i class="icon-table"></i> Home
                    </a>                   
                </li>
                <li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#component-nav">
                        <i class="icon-tasks"></i> Engineers     

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-success">5</span>&nbsp;
                    </a>
                    <ul class="collapse" id="component-nav">

                        <li><a href="../secretary/LockedEngineers.jsp"><i class="icon-angle-right"></i>Locked Engineers </a></li>                           
                        <li><a href="../secretary/RejectedEngineers.jsp"><i class="icon-angle-right"></i>Rejected Applications</a></li>                           
                        <li><a href="../secretary/AcceptedEngineers.jsp"><i class="icon-angle-right"></i>Accepted Engineers</a></li>                           
                        <li><a href="../secretary/PendingMembers.jsp"><i class="icon-angle-right"></i>Engineers Applications</a></li>
                        <li><a href="../secretary/AllAcceptedMembers.jsp"><i class="fa fa-circle-o"></i>All Accepted Members </a></li>

                    </ul>
                </li>

                <li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle collapsed" data-target="#form-nav">
                        <i class="icon-pencil"></i> Companies

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp;&nbsp; <span class="label label-success">5</span>&nbsp;&nbsp;
                    </a>
                    <ul class="collapse" id="form-nav">
                        <li><a href="../secretary/LockedCompanies.jsp"><i class="icon-angle-right"></i>Locked Companies </a></li>                           
                        <li><a href="../secretary/RejectedCompany.jsp"><i class="icon-angle-right"></i>Rejected Companies</a></li>                           
                        <li><a href="../secretary/AcceptedCompany.jsp"><i class="icon-angle-right"></i>Accepted Companies</a></li>                           
                        <li><a href="../secretary/PendingCompany.jsp"><i class="icon-angle-right"></i>Companies Applications</a></li>
                        <li><a href="../secretary/AllAcceptedMembers.jsp"><i class="fa fa-circle-o"></i>All Accepted Members </a></li>

                    </ul>

                </li>




                <li><a href="../examples/SecretaryHome.jsp"><i class="icon-film"></i> Back </a></li>
            </ul>
        </div>
        <!--END MENU SECTION -->
        <!--PAGE CONTENT -->
        <div id="content">
            <div style="width: 100%;margin-top: -8px;height: auto;border-bottom:   0px black solid;">
                <center>
                    <%="<h1 style=color:green>Hello," + stu.getFname() + " " + stu.getLname()%></h1>
                    <h1>Welcome to Online Management of Civil Engineers Activities <br></h1><h2>for Institution of Engineers Rwanda</h2>    
                </center>
            </div>
            <div class="span_11">
                <center><img src="../../pages/images/LogoIER.jpg"><span class="badge"></span></center>
            </div>
            <!--TABLE, PANEL, ACCORDION AND MODAL  -->
        </div>
        <!--END PAGE CONTENT -->
        <div id="right">
            <div class="well well-small">
                <button class="btn btn-block">Reports Menu</button>
                <a href="../reports/Enginer_report.jsp" class="btn btn-default" style="color: blue" target="_blank">Accepted Members</a>
                <a href="../reports/SuspendedEnginer_report.jsp" class="btn btn-default" style="color: blueviolet" target="_blank">Suspended Members</a>
                <a href="../reports/RequestingEnginer_report.jsp" class="btn btn-default" style="color: brown" target="_blank">Membership Applications</a>

            </div>

        </div>

        <!-- END RIGHT STRIP  SECTION -->
    </div>

    <!--TABLE, PANEL, ACCORDION AND MODAL  -->

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
