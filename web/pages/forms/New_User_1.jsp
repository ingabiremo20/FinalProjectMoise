<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="enginees.Branches"%>
<%@page import="enginees.Engineer"%>
<%@page import="java.util.List"%>
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="st" scope="request" class="enginees.User"/>
<!DOCTYPE html>
<%
    User u = (User) session.getAttribute("Admin");
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
    <script type="text/javascript"  src="../../js/date_time.js"></script>


    <script>

        $(document).ready(function () {
            // alert(); 


            $("#myDemo").DataTable();



        });

    </script>

<body class="hold-transition skin-blue sidebar-mini">

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
                    <a href="../examples/AdminHome.jsp" >
                        <i class="icon-table"></i> Home
                    </a>                   
                </li><li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#component-nav">
                        <i class="icon-tasks"></i> Users     

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-success">3</span>&nbsp;
                    </a>
                    <ul class="collapse" id="component-nav">


                        <li class=""><a href="../forms/New_User.jsp"><i class="icon-angle-right"></i> New User </a></li>
                        <li class=""><a href="../examples/User_List.jsp"><i class="icon-angle-right"></i>User List </a></li>
                        <li class=""><a href="../Admin/AllAcceptedMembers.jsp"><i class="icon-angle-right"></i>Members List</a></li>

                    </ul>
                </li>
                <li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle collapsed" data-target="#form-nav">
                        <i class="icon-pencil"></i> IER Activity

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-success">3</span>&nbsp;
                    </a>
                    <ul class="collapse" id="form-nav">
                        <li class=""><a href="../forms/Activity.jsp"><i class="icon-angle-right"></i>New Activity</a></li>
                        <li><a href="../Admin/Activity_List.jsp"><i class="icon-angle-right"></i>Open Activity List</a></li>
                        <li><a href="../Admin/Activity_List_Closed.jsp"><i class="icon-angle-right"></i>Expired Activity List</a></li>
                    </ul>
                </li>
                <li><a href="../examples/AdminHome.jsp"><i class="icon-film"></i> Back </a></li>
            </ul>

        </div>
        <!--END MENU SECTION -->
        <!--PAGE CONTENT -->
        <div id="content">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span>                             

                            <small style="color: #cc0066; font-size: 24px" class="pull-right"> <span id="date_time"></span>
                                <script type="text/javascript">window.onload = date_time('date_time');</script>
                            </small>
                            <%="<h4 style=color:green>Hello," + stu.getFname() + " " + stu.getLname()%></h4>

                        </span>
                    </div>
                    <div class="panel-heading">
                        <h4>Change User Role</h4>
                        </span>
                    </div>
                    <h4 style="color: ">${st.msg}</h4>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <form role="form" action="User_Process_1.jsp" method="POST">
                                    <div class="box-body">
                                        <div class="form-group">
                                            
                                            <input type="hidden" class="form-control" name="user_id" value="${st.user_id}"  placeholder="id"required="">
                                        </div>

                                       
                                        
                                        <div class="form-group">

                                            <label>Select Role</label>
                                            <select class="form-control" name="role" value="${st.role}">
                                                <option>--Select Role--</option>
                                                <option>Admin</option>                                                          
                                                <option>Secretary</option>
                                                <option>President</option>
                                                <option>Vice President</option>
                                                <option>Receptionist</option>
                                                
                                            </select>

                                        </div>

                                    </div>
                                    <!-- /.box-body -->

                                    <div class="box-footer">
                                        <td><input type="submit" value="${st.operator}" name="operator"class="btn btn-primary" /></td>
                                         </div>
                                </form>
                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!--END PAGE CONTENT -->


        <!-- END RIGHT STRIP  SECTION -->


        <!--TABLE, PANEL, ACCORDION AND MODAL  -->

        <div id="right">
            <div class="well well-small">
                <button class="btn btn-block">Reports Menu</button>
                <a href="../Admin/AllEnginer_report.jsp" class="btn btn-default" style="color: blue" target="_blank">Accepted Members</a>
                <a href="../Admin/User_report.jsp" class="btn btn-default" style="color: blueviolet" target="_blank">System Users</a>

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
