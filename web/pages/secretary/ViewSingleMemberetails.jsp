

<%@page import="enginees.Engineer"%>
<%@page import="enginees.Memberships"%>
<%@page import="java.util.Date"%>
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>

<%@page import="java.util.List"%>

<%

    if (request.getParameter("mid") != null) {

        session.setAttribute("proid", request.getParameter("mid"));
    } else {

        session.setAttribute("proid", session.getAttribute("proid"));
    }
    if (session.getAttribute("message") == null) {
        session.setAttribute("message", "");
    }
    if (session.getAttribute("mc") == null) {
        session.setAttribute("mc", "");

    }
    if (session.getAttribute("showMes") == null) {
        session.setAttribute("showMes", 0);

    }
    int countLoad = Integer.parseInt(session.getAttribute("showMes") + "");
    countLoad++;
    int counter = 0;
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="enginees.Staff"%>
<%@page import="enginees.Documents"%>
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
        <jsp:useBean id="st" scope="request" class="enginees.User"/>
        <jsp:useBean id="sta" scope="request" class="enginees.Staff"/>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>User List /IER</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <header class="main-header">
                <!-- Logo -->
                <a href="../../index.jsp" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini">IER</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Engineers System</b></span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>

                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- Messages: style can be found in dropdown.less-->
                            <li class="dropdown messages-menu">

                                <ul class="dropdown-menu">

                                </ul>
                            </li>
                            <!-- Notifications: style can be found in dropdown.less -->


                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="../../dist/img/avatar.png" class="user-image" alt="User Image">
                                    <span class="hidden-xs"><%=stu.getFname() + " " + stu.getLname()%></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="../../dist/img/avatar.png" class="img-circle" alt="User Image">

                                        <p>
                                            <%=stu.getFname() + " " + stu.getLname()%>
                                            <small></small>
                                        </p>
                                    </li>
                                    <!-- Menu Body -->
                                    <li class="user-body">

                                        <!-- /.row -->
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-default btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="../examples/Logout.jsp" class="btn btn-default btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- Control Sidebar Toggle Button -->
                            <li>
                                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="../../dist/img/avatar.png" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p><%=stu.getFname() + " " + stu.getLname()%></p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->

                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="header">MAIN NAVIGATION</li>
                        <li class="treeview">
                            <a href="../examples/SecretaryHome.jsp">
                                <i class="fa fa-dashboard"></i> <span>Home</span> <i class="fa fa-angle-left pull-right"></i>
                            </a>

                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-files-o"></i>
                                <span>Engineers</span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="../examples/LoginMember.jsp"><i class="fa fa-circle-o"></i>Record New Engineer</a></li>
                                <li><a href="../secretary/Engineers_List.jsp"><i class="fa fa-circle-o"></i>Applicants</a></li>
                                <li><a href="../secretary/LockedEngineers.jsp"><i class="fa fa-circle-o"></i>Locked Members </a></li>                           
                                <li><a href="../secretary/RejectedEngineers.jsp"><i class="fa fa-circle-o"></i>Rejected Applications</a></li>                           
                                <li><a href="../secretary/AcceptedEngineers.jsp"><i class="fa fa-circle-o"></i>Accepted Engineers</a></li>                           
                                <li><a href="../secretary/PendingMembers.jsp"><i class="fa fa-circle-o"></i>Uncompleted Applications</a></li>

                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-files-o"></i>
                                <span>Companies</span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="../examples/LoginMember.jsp"><i class="fa fa-circle-o"></i>Record New Company</a></li>
                                <li><a href="../secretary/Company_List.jsp"><i class="fa fa-circle-o"></i>Companies Applications</a></li>
                                <li><a href="../secretary/LockedCompanies.jsp"><i class="fa fa-circle-o"></i>Locked Companies </a></li>                           
                                <li><a href="../secretary/RejectedCompany.jsp"><i class="fa fa-circle-o"></i>Rejected Companies</a></li>                           
                                <li><a href="../secretary/AcceptedCompany.jsp"><i class="fa fa-circle-o"></i>Accepted Companies</a></li>                           
                                <li><a href="../secretary/PendingCompany.jsp"><i class="fa fa-circle-o"></i>Uncompleted Applications</a></li>

                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-files-o"></i>
                                <span>Members</span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="../secretary/AllAcceptedMembers.jsp"><i class="fa fa-circle-o"></i>All Accepted Members </a></li>

                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-files-o"></i>
                                <span>Branches</span>
                                <span class="label label-primary pull-right"></span>
                            </a>
                            <ul class="treeview-menu">                                
                                <li><a href="../secretary/RecordBranch.jsp"><i class="fa fa-circle-o"></i>Record New Branch</a></li>
                                <li><a href="../secretary/Branch_List.jsp"><i class="fa fa-circle-o"></i>View Branches</a></li>

                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-pie-chart"></i>
                                <span>Departments</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">

                                <li><a href="../secretary/RecordDepartment.jsp"><i class="fa fa-circle-o"></i>Record New Department</a></li>
                                <li><a href="../secretary/Department_List.jsp"><i class="fa fa-circle-o"></i>Departments List</a></li>

                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-pie-chart"></i>
                                <span>Categories</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="../secretary/RecordCategory.jsp"><i class="fa fa-circle-o"></i>Record New Category</a></li>
                                <li><a href="../secretary/Categories_List.jsp"><i class="fa fa-circle-o"></i>Categories List</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-pie-chart"></i>
                                <span>Payments</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="../secretary/RecordPayment.jsp"><i class="fa fa-circle-o"></i>Record Payment</a></li>
                                <li><a href="../secretary/PaymentReport.jsp"><i class="fa fa-circle-o"></i>Payment Report</a></li>


                            </ul>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Engineers Documents
                    </h1>

                </section>
                <!-- Main content -->
                <section class="invoice">
                    <!-- title row -->
                    <div class="row">
                        <div class="col-xs-12">
                            <h2 class="page-header">
                                <i class="fa fa-globe"></i>Documents
                                <small class="pull-right">Date: <%=new Date()%></small>
                            </h2>
                        </div>
                        <!-- /.col -->
                    </div>

                    <!-- /.row -->

                    <!-- Table row -->
                    <div class="row">
                        <div class="col-xs-12 table-responsive">
                            <table class="table table-striped" border="">
                                <thead style="background-color:skyblue">

                                    <tr>
                                        <td>Membership Id</td>
                                        <td>Names</td>
                                        <td>Memberships type</td>
                                        <td>CV</td>
                                        <td>Bank Slip</td>
                                        <td>Degree</td>

                                        <td style="background-color: #1D63A8;color:white">Accept</td>
                                        <td style="background-color: #1D63A8;color:white">Reject</td>

                                    </tr>

                                </thead>

                                <tbody>

                                    <%
                                        Engineer dd = new Engineer();
                                        List<Engineer> muList = dd.ViewSingleMemberDetails(session.getAttribute("proid").toString());

                                        if (muList.size() != 0) {
                                            int row = 0;
                                            while (row < muList.size()) {

                                    %>

                                    <tr>
                                        <td><%=muList.get(row).getTagid() + "" + muList.get(row).getEngineer_id() + "/" + muList.get(row).getTagid1() + "/" + muList.get(row).getTagid2() + "/" + muList.get(row).getEngineer_id()%></td>
                                        <td><%=muList.get(row).getNames()%></td>
                                        <td><%= muList.get(row).getRole()%></td>
                                        <td><a href="../CVs/<%= muList.get(row).getCv()%>">Review</a></td>
                                        <td><a href="../RegFees/<%= muList.get(row).getBankslip()%>">Review</a></td>
                                        <td><a href="../Degrees/<%= muList.get(row).getOfficialdoc()%>">Review</a></td>
                                        <td><a href="Update_Accept.jsp?engineer_id=<%=muList.get(row).getEngineer_id()%>&op=Accepted">Accept</a> <td><a href="Update_Reject.jsp?memberid=<%=muList.get(row).getEngineer_id()%>&op=Rejected">reject</a>




                                    </tr>

                                    <%                                                    row++;
                                            }
                                        }


                                    %>
                                </tbody>
                            </table>


                        </div>
                        <!-- /.col -->
                    </div>

                    <div class="row no-print">
                        <div class="col-xs-12">
                            <a href="ViewSingleMemberEducationDetails.jsp" class="btn btn-default"><i class="btn-primary"></i>Education qualifications</a>
                            <a href="ViewSingleMemberexperiencesDetails.jsp" class="btn btn-default"><i class="btn-primary"></i>Working Experiences</a>
                            <a href="ViewSingleMemberSupportersDetails.jsp" class="btn btn-default"><i class="btn-primary"></i>Supporters</a>


                        </div>
                    </div>
                </section>
                <!-- /.content -->
                <div class="clearfix"></div>
            </div>
            <!-- /.content-wrapper -->
            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    Designed by  <b>Moise Ingabire</b> 
                </div>
                <strong>Copyright &copy; 2016 <a href="http://almsaeedstudio.com">Institution of Engineers Rwanda</a>.</strong> All rights
                reserved.
            </footer>
            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Create the tabs -->
                <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                    <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
                    <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- Home tab content -->
                    <div class="tab-pane" id="control-sidebar-home-tab">
                        <h3 class="control-sidebar-heading">Recent Activity</h3>
                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                        <p>Will be 23 on April 24th</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon fa fa-user bg-yellow"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                                        <p>New phone +1(800)555-1234</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                                        <p>nora@example.com</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon fa fa-file-code-o bg-green"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                                        <p>Execution time 5 seconds</p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- /.control-sidebar-menu -->

                        <h3 class="control-sidebar-heading">Tasks Progress</h3>
                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="javascript:void(0)">
                                    <h4 class="control-sidebar-subheading">
                                        Custom Template Design
                                        <span class="label label-danger pull-right">70%</span>
                                    </h4>

                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <h4 class="control-sidebar-subheading">
                                        Update Resume
                                        <span class="label label-success pull-right">95%</span>
                                    </h4>

                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <h4 class="control-sidebar-subheading">
                                        Laravel Integration
                                        <span class="label label-warning pull-right">50%</span>
                                    </h4>

                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <h4 class="control-sidebar-subheading">
                                        Back End Framework
                                        <span class="label label-primary pull-right">68%</span>
                                    </h4>

                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- /.control-sidebar-menu -->

                    </div>
                    <!-- /.tab-pane -->
                    <!-- Stats tab content -->
                    <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
                    <!-- /.tab-pane -->
                    <!-- Settings tab content -->
                    <div class="tab-pane" id="control-sidebar-settings-tab">
                        <form method="post">
                            <h3 class="control-sidebar-heading">General Settings</h3>

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Report panel usage
                                    <input type="checkbox" class="pull-right" checked>
                                </label>

                                <p>
                                    Some information about this general settings option
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Allow mail redirect
                                    <input type="checkbox" class="pull-right" checked>
                                </label>

                                <p>
                                    Other sets of options are available
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Expose author name in posts
                                    <input type="checkbox" class="pull-right" checked>
                                </label>

                                <p>
                                    Allow the user to show his name in blog posts
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <h3 class="control-sidebar-heading">Chat Settings</h3>

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Show me as online
                                    <input type="checkbox" class="pull-right" checked>
                                </label>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Turn off notifications
                                    <input type="checkbox" class="pull-right">
                                </label>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Delete chat history
                                    <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                                </label>
                            </div>
                            <!-- /.form-group -->
                        </form>
                    </div>
                    <!-- /.tab-pane -->
                </div>
            </aside>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

        <!-- jQuery 2.2.0 -->
        <script src="../../plugins/jQuery/jQuery-2.2.0.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../../plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="../../dist/js/app.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../../dist/js/demo.js"></script>
    </body>
</html>
