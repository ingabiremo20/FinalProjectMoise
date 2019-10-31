<%@page import="enginees.Categories"%>
<%@page import="enginees.Departments"%>
<%@page import="enginees.Branches"%>
<%@page import="enginees.Engineer"%>
<%@page import="java.util.List"%>
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="st" scope="request" class="enginees.Engineer"/>
<!DOCTYPE html>
<%
    Engineer u = (Engineer) session.getAttribute("Company");
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
    <script src="../../js/form-validation.js" type="text/javascript"></script>


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
                    <a href="../examples/Company_Home.jsp" >
                        <i class="icon-table"></i> Home
                    </a>                   
                </li><li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#component-nav">
                        <i class="icon-tasks"></i> Profile    

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-success">2</span>&nbsp;
                    </a>
                    <ul class="collapse" id="component-nav">

                        <li><a href="../forms/Update_Account_Company.jsp"><i class="fa fa-circle-o"></i>Update your Account</a></li>
                        <li><a href="../examples/View_Account_Company.jsp"><i class="fa fa-circle-o"></i>Upload Document</a></li>

                    </ul>
                </li>
                <li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle collapsed" data-target="#form-nav">
                        <i class="icon-pencil"></i> Others

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-success">2</span>&nbsp;
                    </a>
                    <ul class="collapse" id="form-nav">
                        <li class=""><a href="../forms/ApplyStockholders.jsp"><i class="icon-angle-right"></i>ShareHolders</a></li>
                        <li><a href="../forms/ApplyCompanyProject.jsp"><i class="icon-angle-right"></i>Projects Done</a></li>
                    </ul>
                </li>
                <li><a href="../examples/Company_Home.jsp"><i class="icon-film"></i> Back </a></li>
            </ul>
        </div>
        <!--END MENU SECTION -->
        <!--PAGE CONTENT -->
        <div id="content">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Account Update:<span>


                        </span>
                    </div>
                    <div class="panel-heading">
                        <%="<h4 style=color:green>Hello," + u.getNames() + " " %></h4>



                        </span>
                    </div>
                    <h4 style="color: red">${st.msg}</h4>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <form role="form" action="Update_Account_processCompany.jsp" onsubmit="return validateForm()" method="POST">
                                   <div class="box-body">
                                        <div class="form-group">
                                            <input type="hidden" class="form-control" name="engineer_id" value="<%=u.getEngineer_id()%>" id="exampleInputEmail1">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Names</label>
                                            <input type="text" class="form-control" name="names" value="<%=u.getNames()%>" id="exampleInputEmail1" readonly="">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Email Address</label>
                                            <input type="email" class="form-control" name="emails" id="exampleInputPassword1" value="<%=u.getEmails()%>" readonly="">
                                        </div>
                                        <div class="form-group">
                                            <input type="hidden" class="form-control" name="password" value="<%=u.getPassword()%>" id="exampleInputPassword1">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Phone Number</label>
                                            <input type="text" class="form-control" name="memberphone" value="<%=u.getMemberphone()%>" id="exampleInputEmail1" placeholder="Phone Number" readonly="">
                                        </div>
                                         <div class="form-group">
                                            <label for="exampleInputEmail1">TIN/VAT</label>
                                            <h4 style="color: red">${st.identitymsg}</h4>
                                            <input type="text" class="form-control" name="identity" id="exampleInputEmail1" placeholder="TIN/VAT"  required="">
                                        </div>
                                        <div class="form-group">

                                            <input type="hidden" class="form-control" name="branchid" value="<%=u.getBranchid()%>" id="exampleInputEmail1" placeholder="Phone Number" readonly="">
                                        </div>
                                    
                                    <div class="form-group">

                                        <input type="hidden" class="form-control" name="departmentid" value="<%=u.getDepartmentid()%>" id="exampleInputEmail1" placeholder="Phone Number" readonly="">
                                    </div>
                            
                            <div class="form-group">

                                <input type="hidden" class="form-control" name="categoryid" value="<%=u.getCategoryid()%>" id="exampleInputEmail1" placeholder="Phone Number" readonly="">
                            </div>
                            <div class="form-group">

                                <input type="hidden" class="form-control" name="membertitle" value="<%=u.getMembertitle()%>" id="exampleInputEmail1" placeholder="Phone Number" readonly="">
                            </div>
                            <div class="form-group">

                                <input type="hidden" class="form-control" name="memberdob" value="<%=u.getMemberdob()%>" id="exampleInputEmail1" placeholder="Phone Number" readonly="">
                            </div>
                            <div class="form-group">

                                <input type="hidden" class="form-control" name="membersex" value="<%=u.getMembersex()%>" id="exampleInputEmail1" placeholder="Phone Number" readonly="">
                            </div>
                            <div class="form-group">

                                <input type="hidden" class="form-control" name="membernation" value="Rwanda" id="exampleInputEmail1" placeholder="Phone Number" readonly="">
                            </div>

                        
                        <div class="form-group">
                            <label for="exampleInputEmail1">Head Office Address </label>
                            <h4 style="color: red">${st.memberpobirthmsg}</h4>
                            <input type="text" class="form-control" name="memberpobirth" id="exampleInputEmail1" placeholder="Address" required="">
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleInputEmail1">Street No</label>
                            <h4 style="color: red">${st.memberlocationmsg}</h4>
                            <input type="text" class="form-control" name="memberlocation" id="exampleInputEmail1" placeholder="Street No">
                        </div>

                        <div class="form-group">
                            
                            <input type="hidden" class="form-control" name="membernation" value="<%=u.getMembernation()%>" id="exampleInputEmail1" placeholder="Nationality" required="">
                        </div>
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                               


                            </div>
 </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--END PAGE CONTENT -->
  </div>
  </div>

            <!-- END RIGHT STRIP  SECTION -->


            <!--TABLE, PANEL, ACCORDION AND MODAL  -->

            <div id="right">
                <div class="well well-small">
                  <!--reports  -->  
                    
                    
                </div>

            </div>
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
