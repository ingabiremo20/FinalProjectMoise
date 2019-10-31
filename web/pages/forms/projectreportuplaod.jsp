<%
   
    if(request.getParameter("docid")!=null){
    session.setAttribute("pid3",request.getParameter("docid") );
        
    }else{
    session.setAttribute("pid3",session.getAttribute("pid3"));
        
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






<%@page import="java.util.List"%>

<%@page import="enginees.Documents"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8" />
    <title>Online Thesis</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="Claudette" />
    <link rel="stylesheet" href="../assets/plugins/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    <link rel="stylesheet" href="../assets/css/theme.css" />
    <link rel="stylesheet" href="../assets/css/MoneAdmin.css" />
    <link rel="stylesheet" href="../assets/plugins/Font-Awesome/css/font-awesome.css" />
    <link href="../assets/css/layout2.css" rel="stylesheet" />
    <link href="../assets/plugins/flot/examples/examples.css" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/plugins/timeline/timeline.css" />

</head>
<body class="padTop53 " >

     <!-- MAIN WRAPPER -->
    <div id="wrap" >


        <!-- HEADER SECTION -->
        <div id="top">

            <nav class="navbar navbar-inverse navbar-fixed-top " style="padding-top: 10px;">
                <a data-original-title="Show/Hide Menu" data-placement="bottom" data-tooltip="tooltip" class="accordion-toggle btn btn-primary btn-sm visible-xs" data-toggle="collapse" href="#menu" id="menu-toggle">
                    <i class="icon-align-justify"></i>
                </a>
                <!-- LOGO SECTION -->
                <header class="navbar-header">

                    <a href="#" class="navbar-brand">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="../assets/img/emblem.png" alt="REB" />
                        <br><span>High Education Council</span>

                    </a>
                </header>
                <!-- END LOGO SECTION -->
                <ul class="nav navbar-top-links navbar-right">





                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="icon-user "></i>&nbsp; <i class="icon-chevron-down ">User:<%=session.getAttribute("name") %></i>
                        </a>

                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="icon-user"></i></a>
                            </li>

                            <li class="divider"></li>
                            <li><a href="../login.jsp"><i class="icon-signout"></i> Logout </a>
                            </li>
                        </ul>

                    </li>
                    <!--END ADMIN SETTINGS -->
                </ul>

            </nav>

        </div>
        <!-- END HEADER SECTION -->



        <!-- MENU SECTION -->
        <div id="left" >


            <ul id="menu" class="collapse">
                <br/><br/>

                <li class="panel active">
                    <a href="#" >
                        <i class="icon-table"></i> Home


                    </a>                   
                </li>



                <li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#component-nav">
                        <i class="icon-tasks"></i> Students     

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-default"></span>&nbsp;
                    </a>
                    <ul class="collapse" id="component-nav">


                        <li class=""><a href="addNewStudents.jsp"><i class="icon-angle-right"></i> Add Students </a></li>
                        <li class=""><a href="CheckFinalProject.jsp"><i class="icon-angle-right"></i>Add Project </a></li>
                        <li class=""><a href="CheckITStudents.jsp"><i class="icon-angle-right"></i> Check Students</a></li>

                        <li class=""><a href="CheckFinalProject.jsp"><i class="icon-angle-right"></i>Check Final Projects</a></li>

                    </ul>
                </li>
                <li class="panel ">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle collapsed" data-target="#form-nav">
                        <i class="icon-pencil"></i> IT Faculty

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-success"></span>&nbsp;
                    </a>
                    <ul class="collapse" id="form-nav">
                        <li class=""><a href="CheckItDepartment.jsp"><i class="icon-angle-right"></i>Check Department</a></li>
                        <li class=""><a href="DepartmentDetails.jsp"><i class="icon-angle-right"></i> Check Department Details </a></li>


                    </ul>
                </li>

                <li class="panel">
                    <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#pagesr-nav">
                        <i class="icon-table"></i> Users

                        <span class="pull-right">
                            <i class="icon-angle-left"></i>
                        </span>
                        &nbsp; <span class="label label-info"></span>&nbsp;
                    </a>
                    <ul class="collapse" id="pagesr-nav">

                        <li><a href="CheckUers.jsp"><i class="icon-angle-right"></i> Check Profile</a></li>


                    </ul>
                </li>







                <li><a href="index.jsp"><i class="icon-film"></i> Back </a></li>






            </ul>

        </div>
        <!--END MENU SECTION -->



        <!--PAGE CONTENT -->
        <div id="content">
            <br/><br/>
            <div class="inner" style="min-height: 700px;">
                <div class="row">
                    <div class="col-lg-12">
                        <h4>IT_Faculty:Current User:<%=session.getAttribute("name") %></h4>
                    </div>
                </div>
                <hr />

                <!--BLOCK SECTION -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                New User Information:<span>


                                        <%
                                            if (countLoad == 2) {
                                                session.setAttribute("showMes", countLoad);
                                                if (session.getAttribute("mc").toString().equals("Red")) {
                                        %>
                                        <div>
                                            <span style="color:red"><%=session.getAttribute("message")%></span>
                                        </div>

                                        <%

                                        } else {
                                        %>

                                        <div>
                                            <span style="color:green"><%=session.getAttribute("message")%></span>
                                        </div>

                                        <%
                                                }
                                            }
                                        %>

                                    </span>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                       
                                        <form role="form" action="../forms/uploadCVprocess_1.jsp" method="post" enctype="multipart/form-data">
                       
                                           
                                            <div class="form-group">
                                                <label>Upload Proposal Sheet:</label>
                                               
                                                <input   class="form-control" required="" type="file" name="file" value="" />
                                            </div>
                                            
                             
                                            <button type="submit" class="btn btn-success ">Confirm</button>
                                            <button type="reset" class="btn btn-default ">Reset</button>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">


                </div>
                <!--END STACKING CHART SCETION  -->

         
                <!--TABLE, PANEL, ACCORDION AND MODAL  -->


            </div>

        </div>
        <!--END PAGE CONTENT -->

             <!--END PAGE CONTENT -->

   <div id="right">

            <div class="well well-small">
                <button class="btn btn-block"> Papers By Universities </button>
                <button class="btn btn-primary btn-block"><a href="../Reports/Auca_rep.jsp" style="color: white">AUCA</a></button>
                <button class="btn btn-info btn-block"><a href="../Reports/Ur_rep.jsp" style="color: white"> UNR</a></button>
                <button class="btn btn-success btn-block"><a href="../Reports/Unilak_rep.jsp" style="color: white"> UNILAK</a></button>
                <button class="btn btn-danger btn-block"><a href="../Reports/Uk_rep.jsp" style="color: white"> UK</a> </button>
                <button class="btn btn-warning btn-block"><a href="../Reports/Iprc_rep.jsp" style="color: white">IPRC </a></button>
                <button class="btn btn-inverse btn-block"><a href="../Reports/Ulk_rep.jsp" style="color: white"> ULK </a></button>
            </div>
            <div class="well well-small">

            </div>




        </div>
        <!-- END RIGHT STRIP  SECTION -->
    </div>

    <!--END MAIN WRAPPER -->

    <!-- FOOTER -->
    <div id="footer">
        <p>&copy;Online IT Project For Students Developped By  Claudette &nbsp;2016 &nbsp;</p>
    </div>
    <!--END FOOTER -->


    <!-- GLOBAL SCRIPTS -->
    <script src="../assets/plugins/jquery-2.0.3.min.js"></script>
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
