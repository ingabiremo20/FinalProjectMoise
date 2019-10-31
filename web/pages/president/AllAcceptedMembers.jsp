<%@page import="enginees.Engineer"%>
<%@page import="enginees.Memberships"%>
<%@page import="java.util.Date"%>
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>
<%
    User u = (User) session.getAttribute("President");
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
                            <a href="../examples/PresidentHome.jsp">
                                <i class="fa fa-dashboard"></i> <span>Home</span> <i class="fa fa-angle-left pull-right"></i>
                            </a>

                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-files-o"></i>
                                <span>Engineers</span>
                            </a>
                            <ul class="treeview-menu">
                                 <li><a href="../president/AllAcceptedMembers.jsp"><i class="fa fa-circle-o"></i>View Accepted Members</a></li>                           
                                 <li><a href="../president/LockedMembers.jsp"><i class="fa fa-circle-o"></i>View Suspended Members</a></li>                           
                               
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-files-o"></i>
                                <span>Branches</span>
                                <span class="label label-primary pull-right"></span>
                            </a>
                            <ul class="treeview-menu">                                
                                <li><a href="../president/Branch_List.jsp"><i class="fa fa-circle-o"></i>View Branches</a></li>

                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-pie-chart"></i>
                                <span>Departments</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">

                                <li><a href="../president/Department_List.jsp"><i class="fa fa-circle-o"></i>Departments List</a></li>

                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-pie-chart"></i>
                                <span>Categories</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="../president/Categories_List.jsp"><i class="fa fa-circle-o"></i>Categories List</a></li>


                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-pie-chart"></i>
                                <span>Activities</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="../president/Activity.jsp"><i class="fa fa-circle-o"></i>New Activity</a></li>
                                <li><a href="../president/Activity_List.jsp"><i class="fa fa-circle-o"></i>Open Activities</a></li>
                                <li><a href="../president/Activity_List_Closed.jsp"><i class="fa fa-circle-o"></i>Finished Activities</a></li>


                            </ul>
                        </li>
             
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-pie-chart"></i>
                                <span>Payments</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">                               
                                <li><a href="../president/PaymentReport.jsp"><i class="fa fa-circle-o"></i>Payment Report</a></li>
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
                        List of Engineers
                    </h1>
                   
                </section>
                <!-- Main content -->
                <section class="invoice">
                    <!-- title row -->
                    <div class="row">
                        <div class="col-xs-12">
                            <h2 class="page-header">
                                <i class="fa fa-globe"></i>Engineers  List
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
                                <%                            List<Engineer> ls = Engineer.getListOfAcceptedMember();
                                    {
                                %>
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Id</th>
                                        <th>Names</th>
                                        <th>Nationality</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Type</th>
                                        <th>Registration Date</th>
                                        <th>Status</th>                                        
                                        <th>CV</th>                                        
                                        <th>Degree</th>                                        
                                        <th>Bank Slip</th>                                        
                                        <th>Details</th>                                        
                                                                                
                                       
                                       
                                        
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                                  int no = 1;
                                        for (int i = 0; i < ls.size(); i++) {

                                    %>
                                    <tr>
                                        <td><%=no%></td>
                                        
                                        <td><%=ls.get(i).getEngineer_id()%></td>
                                        <td><%=ls.get(i).getNames()%></td>
                                        <td><%=ls.get(i).getMembernation()%></td>
                                        <td><%=ls.get(i).getEmails()%></td>
                                        <td><%=ls.get(i).getMemberphone()%></td>
                                        <td><%=ls.get(i).getRole()%></td>
                                        <td><%=ls.get(i).getMemberregdate()%></td>
                                        <td><%=ls.get(i).getStatus()%></td>
                                         <td ><a href="../../pages/CVs/<%=ls.get(i).getCv()%>" style="color: yellowgreen" target="_blank">Review</a>
                                         <td ><a href="../../pages/CVs/<%=ls.get(i).getOfficialdoc()%>" style="color: yellowgreen"target="_blank">Review</a>
                                           
                                        <td ><a href="../../pages/CVs/<%=ls.get(i).getBankslip()%>" style="color: yellowgreen"target="_blank">Review</a>
                                      
                                        <td style="background-color: #DDDDDD"><a href="../president/ViewSingleMemberEducationDetailss.jsp?mid=<%=ls.get(i).getEngineer_id()%>">More Details</a></td>
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
                        <!-- /.col -->
                    </div>

                    <div class="row no-print">
                        <div class="col-xs-12">
                            <a href="Enginer_report.jsp" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a>

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
                <strong>Copyright &copy; 2016 <a href="#">Institution of Engineers Rwanda</a>.</strong> All rights
                reserved.
            </footer>
            <!-- Control Sidebar -->
            
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
