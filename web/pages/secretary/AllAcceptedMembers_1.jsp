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

<!DOCTYPE html>

<head>
    <link rel="shortcut icon" type="image/png" href="../examples/img/im.PNG"/>
    <meta charset="UTF-8" />
    <title>Online Open Source for Thesis</title>
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
                    <a href="../ITfaculty/index.jsp" >
                        <i class="icon-table"></i> Home
                    </a>                   
                </li><li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#component-nav">
                        <i class="icon-tasks"></i> Student Project     

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-default"></span>&nbsp;
                    </a>
                    <ul class="collapse" id="component-nav">


                        <li class=""><a href="../ITfaculty/addNewStudents.jsp"><i class="icon-angle-right"></i> Add Students </a></li>
                        <li class=""><a href="../ITfaculty/CheckFinalProject.jsp"><i class="icon-angle-right"></i>Add Project </a></li>
                            <%-- <li class=""><a href="../ITfaculty/CheckITStudents.jsp"><i class="icon-angle-right"></i> Check Students</a></li>--%>
                        <li class=""><a href="../ITfaculty/CheckFinalProject.jsp"><i class="icon-angle-right"></i>Check Final Projects</a></li>

                    </ul>
                </li>
                <li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle collapsed" data-target="#form-nav">
                        <i class="icon-pencil"></i> IT Faculty

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-success">2</span>&nbsp;
                    </a>
                    <ul class="collapse" id="form-nav">
                        <li class=""><a href="../ITfaculty/CheckItDepartment.jsp"><i class="icon-angle-right"></i>Check Department</a></li>
                        <li class=""><a href="../ITfaculty/CheckUers.jsp"><i class="icon-angle-right"></i> IT Faculty Students </a></li>
                    </ul>
                </li>
                <li><a href="../ITfaculty/index.jsp"><i class="icon-film"></i> Back </a></li>
            </ul>

        </div>
        <!--END MENU SECTION -->
        <!--PAGE CONTENT -->
        <div id="content">
            <br/><br/>
            <div class="inner" style="min-height: 300px;">
                <div class="row">
                    <div class="col-lg-12">
                        <h4>IT_Faculty Head</h4>
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

                                    <th>Id</th>
                                    <th>Names</th>
                                    <th>Nationality</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Type</th>
                                    <th>Registration Date</th>
                                    <th>Status</th>                                        
                                    <th>Details</th>  

                                </tr>

                            </thead>

                            <tbody>

                                <%

                                    List<Engineer> ls = Engineer.getListOfAcceptedMember();
                                    if (ls.size() != 0) {
                                        int i = 0;
                                        while (i < ls.size()) {

                                %>

                                <tr>


                                    <td><%=ls.get(i).getTagid() + "" + ls.get(i).getEngineer_id() + "/" + ls.get(i).getTagid1() + "/" + ls.get(i).getTagid2() + "/" + ls.get(i).getEngineer_id()%></td>
                                    <td><%=ls.get(i).getNames()%></td>
                                    <td><%=ls.get(i).getMembernation()%></td>
                                    <td><%=ls.get(i).getEmails()%></td>
                                    <td><%=ls.get(i).getMemberphone()%></td>
                                    <td><%=ls.get(i).getRole()%></td>
                                    <td><%=ls.get(i).getMemberregdate()%></td>
                                    <td><%=ls.get(i).getStatus()%></td>
                                    <td style="background-color: #DDDDDD"><a href="../secretary/ViewSingleMemberEducationDetailss.jsp?mid=<%=ls.get(i).getEngineer_id()%>">More Details</a></td>

                                </tr>

                                <%                                                    i++;
                                        }
                                    }


                                %>




                            </tbody>
                        </table>

                    </div>
                    <div class="bs-example4" data-example-id="simple-responsive-table">
                        <div class="row no-print">
                            <div class="col-xs-12">
                                <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
                                    <i class="fa fa-download"> <a href="#" style="color: white"> Print Report</a>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--TABLE, PANEL, ACCORDION AND MODAL  -->
            </div>
            <!--END PAGE CONTENT -->


            <!-- END RIGHT STRIP  SECTION -->
        </div>

        <!--TABLE, PANEL, ACCORDION AND MODAL  -->
        <div id="right">
            <div class="well well-small">
                <button class="btn btn-block"> Papers By Universities </button>
                <button class="btn btn-primary btn-block"><a href="../Reports/Auca_rep.jsp" style="color: white">AUCA</a></button>
                <button class="btn btn-info btn-block"><a href="../Reports/Ur_rep.jsp" style="color: white"> UNR</a></button>
                <button class="btn btn-success btn-block"><a href="../Reports/Unilak_rep.jsp" style="color: white"> UNILAK</a></button>
                <button class="btn btn-danger btn-block"><a href="../Reports/Uk_rep.jsp" style="color: white"> UK</a> </button>
                <button class="btn btn-warning btn-block"><a href="../Reports/Iprc_rep.jsp" style="color: white">IPRC</a> </button>
                <button class="btn btn-inverse btn-block"><a href="../Reports/Ulk_rep.jsp" style="color: white"> ULK </a></button>
            </div>
            <div class="well well-small">
            </div>
        </div>
    </div>


    <!--END PAGE CONTENT -->

    <!-- RIGHT STRIP  SECTION -->

    <!-- END RIGHT STRIP  SECTION -->



    <!--END MAIN WRAPPER -->

    <!-- FOOTER -->
    <div id="footer">
        <p>&copy;Developped By  moise &nbsp;20117 &nbsp;</p>
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
