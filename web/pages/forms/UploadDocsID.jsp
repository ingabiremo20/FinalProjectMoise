<%@page import="enginees.Categories"%>
<%@page import="enginees.Departments"%>
<%@page import="enginees.Branches"%>
<%@page import="enginees.Engineer"%>
<%@page import="java.util.List"%>
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <jsp:useBean id="b" scope="request" class="enginees.Engineer"/>
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
                    <a href="../examples/Engineer_Home.jsp" >
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

                        <li><a href="../forms/Update_Account.jsp"><i class="fa fa-circle-o"></i>Update your Account</a></li>
                        <li><a href="../examples/View_Account.jsp"><i class="fa fa-circle-o"></i>Upload Document</a></li>

                    </ul>
                </li>
                <li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle collapsed" data-target="#form-nav">
                        <i class="icon-pencil"></i> Others

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-success">3</span>&nbsp;
                    </a>
                    <ul class="collapse" id="form-nav">
                        <li class=""><a href="../forms/ApplyExperiences.jsp"><i class="icon-angle-right"></i>Experiences</a></li>
                        <li><a href="../forms/ApplyReferences.jsp"><i class="icon-angle-right"></i>References</a></li>
                        <li><a href="../forms/ApplyQualifications.jsp"><i class="icon-angle-right"></i>Qualifications</a></li>
                    </ul>
                </li>
                <li><a href="../examples/Engineer_Home.jsp"><i class="icon-film"></i> Back </a></li>
            </ul>
        </div>
        <!--END MENU SECTION -->
        <!--PAGE CONTENT -->
        <div id="content">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Upload National ID:<span>


                        </span>
                    </div>
                    <div class="panel-heading">
                        <%="<h4 style=color:green>Hello," + u.getNames() + " " %></h4>



                        </span>
                    </div>
                    <h4 style="color: red">${b.msg}</h4>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <form role="form" action="uploadprocessID.jsp" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" name="engineer_id" value="<%=u.getEngineer_id()%>" id="exampleInputEmail1">
                                    </div>
                                    <div class="form-group">
                                        <label>Upload ID:</label>
                                        <input   class="form-control" required="" type="file" name="file" value="" />
                                    </div>
                                    <button type="submit" class="btn btn-success ">Submit</button>
                                    <button type="reset" class="btn btn-default ">Reset</button>
                                </form>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!--END PAGE CONTENT -->
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
