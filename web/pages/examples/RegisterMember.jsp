<%-- 
    Document   : index
    Created on : Apr 27, 2017, 4:03:39 PM
    Author     : moise
--%>
<%@page import="enginees.Categories"%>
<%@page import="enginees.Departments"%>
<%@page import="java.util.List"%>
<%@page import="enginees.Branches"%>
<%@page import="enginees.Memberships"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="st" scope="request" class="enginees.Engineer"/>
<!DOCTYPE html>

<html slick-uniqueid="3" style="" prefix="og: http://ogp.me/ns#" class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths" lang="en-gb"><!--<![endif]-->
    <!-- Mirrored from www.engineersrwanda.rw/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 27 Apr 2017 13:45:14 GMT -->
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!-- base href="http://www.engineersrwanda.rw/" -->
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="The Institution of Engineers Rwanda(IER), started in 2008 as learned society of engineering profession with an aim to promote and develop engineering services and best practice for sustainable development of our country. This was in line with government’s commitment to promote science and technol ogy for the national development, while promoting the engineering profession leading to improved quality and efficicy of services. ">

        <title> Institution of Engineers Rwanda </title>

        <link href="index.html" rel="alternate" type="application/atom+xml" title="Atom 1.0">
        <link href="../../images/favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon">
        <link rel="stylesheet" href="../../css/k2.css" type="text/css">
        <link rel="stylesheet" href="../../css/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="../../css/bootstrap-responsive.css" type="text/css">
        <link rel="stylesheet" href="../../css/font-awesome.css" type="text/css">
        <link rel="stylesheet" href="../../css/css.css" type="text/css">
        <link rel="stylesheet" href="../../css/mobile-menu.css" type="text/css">
        <link rel="stylesheet" href="../../css/template.css" type="text/css">
        <link rel="stylesheet" href="../../css/preset3.css" type="text/css">
        <link rel="stylesheet" href="../../css/mod_news_show_sp2.css" type="text/css">
        <link rel="stylesheet" href="../../css/style.css" type="text/css">
        <link rel="stylesheet" href="../../css/css_002.css" type="text/css">
        <link rel="stylesheet" href="../../css/slideshow.css" type="text/css">
        <link rel="stylesheet" href="../../css/gallery.css" type="text/css">
        <style type="text/css">
            .container{max-width:1170px}
            body, p{font-family:'Droid Serif'; -webkit-font-smoothing: subpixel-antialiased !important;}
            h1, h2, h3, h4{font-family:'Droid Serif'; -webkit-font-smoothing: subpixel-antialiased !important;}
            #sp-header-wrapper{
                padding: 0 !important;
            } #sp-header-wrapper a{

            } #sp-header-wrapper a:hover{

            } #sp-menu-wrapper{
                padding: 0 !important;
            } #sp-menu-wrapper a{

            } #sp-menu-wrapper a:hover{

            } #sp-slider-wrapper{
                padding: 0 !important;
            } #sp-slider-wrapper a{

            } #sp-slider-wrapper a:hover{

            } #sp-main-body-wrapper{
                background: rgba(246, 180, 74, 0) !important;padding: 0 !important;
            } #sp-main-body-wrapper a{

            } #sp-main-body-wrapper a:hover{

            } #sp-component-area-wrapper{

            } #sp-component-area-wrapper a{

            } #sp-component-area-wrapper a:hover{

            } #sp--wrapper{

            } #sp--wrapper a{

            } #sp--wrapper a:hover{

            }
            #sp-header-wrapper{
                padding: 0 !important;
            } #sp-header-wrapper a{

            } #sp-header-wrapper a:hover{

            } #sp-menu-wrapper{
                padding: 0 !important;
            } #sp-menu-wrapper a{

            } #sp-menu-wrapper a:hover{

            } #sp-slider-wrapper{
                padding: 0 !important;
            } #sp-slider-wrapper a{

            } #sp-slider-wrapper a:hover{

            } #sp-main-body-wrapper{
                background: rgba(246, 180, 74, 0) !important;padding: 0 !important;
            } #sp-main-body-wrapper a{

            } #sp-main-body-wrapper a:hover{

            } #sp-component-area-wrapper{

            } #sp-component-area-wrapper a{

            } #sp-component-area-wrapper a:hover{

            } #sp--wrapper{

            } #sp--wrapper a{

            } #sp--wrapper a:hover{

            }
            #sp-header-wrapper{
                padding: 0 !important;
            } #sp-header-wrapper a{

            } #sp-header-wrapper a:hover{

            } #sp-menu-wrapper{
                padding: 0 !important;
            } #sp-menu-wrapper a{

            } #sp-menu-wrapper a:hover{

            } #sp-slider-wrapper{
                padding: 0 !important;
            } #sp-slider-wrapper a{

            } #sp-slider-wrapper a:hover{

            } #sp-main-body-wrapper{
                background: rgba(246, 180, 74, 0) !important;padding: 0 !important;
            } #sp-main-body-wrapper a{

            } #sp-main-body-wrapper a:hover{

            } #sp-component-area-wrapper{

            } #sp-component-area-wrapper a{

            } #sp-component-area-wrapper a:hover{

            } #sp--wrapper{

            } #sp--wrapper a{

            } #sp--wrapper a:hover{

            }
            #sp-header-wrapper{
                padding: 0 !important;
            } #sp-header-wrapper a{

            } #sp-header-wrapper a:hover{

            } #sp-menu-wrapper{
                padding: 0 !important;
            } #sp-menu-wrapper a{

            } #sp-menu-wrapper a:hover{

            } #sp-slider-wrapper{
                padding: 0 !important;
            } #sp-slider-wrapper a{

            } #sp-slider-wrapper a:hover{

            } #sp-main-body-wrapper{
                background: rgba(246, 180, 74, 0) !important;padding: 0 !important;
            } #sp-main-body-wrapper a{

            } #sp-main-body-wrapper a:hover{

            } #sp-component-area-wrapper{

            } #sp-component-area-wrapper a{

            } #sp-component-area-wrapper a:hover{

            } #sp--wrapper{

            } #sp--wrapper a{

            } #sp--wrapper a:hover{

            } #sp-main-bottom-wrapper{

            } #sp-main-bottom-wrapper a{

            } #sp-main-bottom-wrapper a:hover{

            } #sp-footer-wrapper{
                padding: 0 !important;
            } #sp-footer-wrapper a{

            } #sp-footer-wrapper a:hover{

            }

            #je_accord178.je_acc {color: #FFFFFF; font-family: 'Open Sans', Arial, sans-serif;}
            #je_accord178.je_acc > ul > li > a { border-left: 1px solid #004f93; border-right: 1px solid #004f93; border-top: 1px solid #004f93; color: #FFFFFF; background: #0077BB;}
            #je_accord178.je_acc > ul > li > a:hover,
            #je_accord178.je_acc > ul > li.active > a,
            #je_accord178.je_acc > ul > li.open > a { color: #FFFFFF; background: #0063a7;}
            #je_accord178.je_acc > ul > li.open > a { border-bottom: 1px solid #004f93;}
            #je_accord178.je_acc > ul > li:last-child > a,
            #je_accord178.je_acc > ul > li.last > a {border-bottom: 1px solid #004f93;}
            #je_accord178 .holder::after { border-top: 2px solid #FFFFFF; border-left: 2px solid #FFFFFF;}
            #je_accord178.je_acc > ul > li > a:hover > span::after,
            #je_accord178.je_acc > ul > li.active > a > span::after,
            #je_accord178.je_acc > ul > li.open > a > span::after { border-color: #FFFFFF;}
            #je_accord178.je_acc ul ul li a { border-bottom: 1px solid #212a36; border-left: 1px solid #212a36; border-right: 1px solid #212a36; color: #ffffff; background: #49525E;}
            #je_accord178.je_acc ul ul li:hover > a,
            #je_accord178.je_acc ul ul li.open > a,
            #je_accord178.je_acc ul ul li.active > a { color: #ffffff; background: #353e4a;}
            #je_accord178.je_acc > ul > li > ul > li.open:last-child > a,
            #je_accord178.je_acc > ul > li > ul > li.last.open > a { border-bottom: 1px solid #212a36;}
            #je_accord178.je_acc ul ul li.has-sub > a::after { border-top: 2px solid #ffffff; border-left: 2px solid #ffffff;}
            #je_accord178.je_acc ul ul li.active > a::after,
            #je_accord178.je_acc ul ul li.open > a::after,
            #je_accord178.je_acc ul ul li > a:hover::after { border-color: #ffffff;}

        </style>
        <script async="" src="../../css/cbgapi.loaded_1"></script>
        <script async="" src="../../css/cbgapi.loaded_0"></script><script src="js/mootools-core.js" type="text/javascript"></script>
        <script src="../../js/core.js" type="text/javascript"></script>
        <script src="../../js/jquery.js" type="text/javascript"></script>
        <script src="../../js/jquery-noconflict.js" type="text/javascript"></script>
        <script src="../../js/jquery-migrate.js" type="text/javascript"></script>
        <script src="../../js/k2.js" type="text/javascript"></script>
        <script src="../../js/tabs-state.js" type="text/javascript"></script>
        <script src="../../js/jquery-noconflict_002.js" type="text/javascript"></script>
        <script src="../../js/bootstrap.js" type="text/javascript"></script>
        <script src="../../js/modernizr-2.js" type="text/javascript"></script>
        <script src="../../js/helix.js" type="text/javascript"></script>
        <script src="../../js/menu.js" type="text/javascript"></script>
        <script src="../../js/main.js" type="text/javascript"></script>
        <script src="../../js/mootools-more.js" type="text/javascript"></script>
        <script src="../../js/nssp2.js" type="text/javascript"></script>
        <script src="../../js/widgets.js" type="text/javascript"></script>
        <script gapi_processed="true" src="../../js/plusone.js" type="text/javascript"></script>
        <script src="../../js/mootools-mobile.js" type="text/javascript"></script>
        <script src="../../js/rokmediaqueries.js" type="text/javascript"></script>
        <script src="../../js/roksprocket.js" type="text/javascript"></script>
        <script src="../../js/moofx.js" type="text/javascript"></script>
        <script src="../../js/features.js" type="text/javascript"></script>
        <script src="../../js/slideshow.js" type="text/javascript"></script>     
        <script src="../../js/form-validation.js" type="text/javascript"></script>     

        <script type="text/javascript">
            spnoConflict(function ($) {

                function mainmenu() {
                    $('.sp-menu').spmenu({
                        startLevel: 0,
                        direction: 'ltr',
                        initOffset: {
                            x: 0,
                            y: 0
                        },
                        subOffset: {
                            x: 0,
                            y: 10
                        },
                        center: 0
                    });
                }

                mainmenu();

                $(window).on('resize', function () {
                    mainmenu();
                });


            });

            jQuery(function ( ) {
                jQuery(document).ready(function () {
                    jQuery('.active').addClass('open');
                    jQuery('.active').children('ul').slideDown();
                    jQuery('#je_accord178 li.has-sub>a').on('mouseenter', function () {

                        var element = jQuery(this).parent('li');

                        if (element.hasClass('open')) {
                            element.removeClass('open');
                            element.find('li').removeClass('open');
                            element.find('ul').slideUp('normal');
                        } else {
                            element.addClass('open');
                            element.children('ul').slideDown('normal');
                            element.siblings('li').children('ul').slideUp('normal');
                            element.siblings('li').removeClass('open');
                            element.siblings('li').find('li').removeClass('open');
                            element.siblings('li').find('ul').slideUp('normal');
                        }
                    });

                    jQuery('#je_accord178>ul>li.has-sub>a').append('<span class="holder"></span>');
                });
            });

            if (typeof RokSprocket == 'undefined')
                RokSprocket = {};
            Object.merge(RokSprocket, {
                SiteURL: 'http://www.engineersrwanda.rw/',
                CurrentURL: 'http://www.engineersrwanda.rw/',
                AjaxURL: 'http://www.engineersrwanda.rw/'
            });

            window.addEvent('domready', function () {
                RokSprocket.instances.slideshow = new RokSprocket.Slideshow();
            });

            window.addEvent('domready', function () {
                RokSprocket.instances.slideshow.attach(127, '{"animation":"fromTopLeft","autoplay":"1","delay":"5"}');
            });

        </script>


        <link rel="stylesheet" href="../../js/gallery.html">
        <script src="../../js/button.js" async="" charset="utf-8" type="text/javascript"></script></head>
    <body class="featured homepage  ltr preset3 menu-home responsive bg hfeed clearfix">
        <div class="body-innerwrapper">
            <!--[if lt IE 8]>
            <div class="chromeframe alert alert-danger" style="text-align:center">You are using an <strong>outdated</strong> browser. Please <a target="_blank" href="http://browsehappy.com/">upgrade your browser</a> or <a target="_blank" href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</div>
            <![endif]-->
            <header id="sp-header-wrapper" class=" "><div class="container"><div class="row-fluid" id="header">
                        <div id="sp-logo" class="span12"><div class="logo-wrapper"><a href="#"><img alt="" class="image-logo" src="images/logo.jpg"></a></div></div>
                    </div></div></header><section id="sp-menu-wrapper" class=" "><div class="container"><div class="row-fluid" id="menu">
                        <div id="sp-menu" class="span12">	


                            <div id="sp-main-menu" class="visible-desktop">
                                <ul class="sp-menu level-0">

                                    <li class="menu-item first  home-icon open"><a href="#" class="menu-item active first  home-icon open"><span class="menu"><span class="menu-title"></span></span></a></li>
                                    <li class="menu-item first  home-icon open"><a href="#" class="menu-item active first  home-icon open"><span class="menu"><span class="menu-title"></span></span></a></li>
                                    <li class="menu-item first  home-icon open"><a href="#" class="menu-item active first  home-icon open"><span class="menu"><span class="menu-title"></span></span></a></li>
                                    <li class="menu-item first  home-icon open"><a href="#" class="menu-item active first  home-icon open"><span class="menu"><span class="menu-title"></span></span></a></li>
                                    <li class="menu-item first  home-icon open"><a href="#" class="menu-item active first  home-icon open"><span class="menu"><span class="menu-title"></span></span></a></li>
                                    <li class="menu-item first  home-icon open"><a href="../../Home.jsp" class="menu-item active first  home-icon open"><span class="menu"><span class="menu-title"> Home</span></span></a></li>
                                    <li class="menu-item first  home-icon open"><a href="../../about.jsp" class="menu-item active first  home-icon open"><span class="menu"><span class="menu-title"> About Us</span></span></a></li>


                                    <li class="menu-item parent "><a href="#" class="menu-item parent "><span class="menu"><span class="menu-title">Members Directory</span></span></a><div style="top: 52px; left: 0px;" class="sp-submenu sub-level"><div style="margin-top: 0px; margin-left: 0px;" class="sp-submenu-wrap"><div class="sp-submenu-inner clearfix" style="width: 250px;"><div class="megacol col1 first" style="width: 250px;">

                                                        <ul class="sp-menu level-1">

                                                            <li class="menu-item first"><a href="#" class="menu-item first"><span class="menu"><span class="menu-title">List of registered Engineers</span></span></a></li>

                                                            <li class="menu-item"><a href="#" class="menu-item"><span class="menu"><span class="menu-title">List of approved firms</span></span></a></li>

                                                        </ul></div></div></div></div></li>


                                    <li class="menu-item"><a href="../../contact_us.jsp" class="menu-item"><span class="menu"><span class="menu-title">Contact Us</span></span></a></li>



                                    <li class="menu-item"><a href="../../pages/examples/LoginOfficer.jsp"  class="menu-item"><span class="menu"><span class="menu-title">Staffs</span></span></a></li>
                                    <li class="menu-item parent "><a href="#" class="menu-item parent "><span class="menu"><span class="menu-title">Members</span></span></a><div style="top: 52px; left: 0px;" class="sp-submenu sub-level"><div style="margin-top: 0px; margin-left: 0px;" class="sp-submenu-wrap"><div class="sp-submenu-inner clearfix" style="width: 250px;"><div class="megacol col1 first" style="width: 250px;">

                                                        <ul class="sp-menu level-1">
                                                            <li class="menu-item first"><a href="../../requirements.jsp" class="menu-item first"><span class="menu"><span class="menu-title">Membership Requirements</span></span></a></li>
                                                            <li class="menu-item first"><a href="../../pages/examples/LoginMember.jsp" class="menu-item first"><span class="menu"><span class="menu-title">Login</span></span></a></li>

                                                            <li class="menu-item"><a href="../../pages/examples/RegisterMember.jsp" class="menu-item"><span class="menu"><span class="menu-title">Register As Engineer</span></span></a></li>
                                                            <li class="menu-item"><a href="../../pages/examples/RegisterMemberCompany.jsp" class="menu-item"><span class="menu"><span class="menu-title">Register As Engineering Company</span></span></a></li>

                                                        </ul></div></div></div></div></li>

                                </ul>        
                            </div>  				
                        </div>
                    </div></div></section>

            <div class="top-content">
                <div class="container" style="background: whitesmoke">

                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <center> <h1 style="font-size: 35px">Engineer Registration Form</h1></center>

                        </div>
                    </div>
                    <div class="row register-form">
                        <div class="col-sm-4 col-sm-offset-1" style="background: white">
                            <center><form  action="Login_Process.jsp" onsubmit="return validateForm()" method="post" class="r-form">
                                    <h4 style="color: red">${st.msg}</h4>
                                    <div class="form-group">
                                        <label ><span><b>Full Names</b></span></label>  
                                        <h4 style="color: red">${st.namesmsg}</h4>
                                        <input type="text" name="names" id="names" placeholder="Full Name" onblur="validateName(name)" required=""  />
                                    </div>
                                    <div>
                                        <label for="email">Email</label>
                                        <h4 style="color: red">${st.emailsmsg}</h4>
                                        <input type="text" name="emails" id="emails"placeholder="Your Email" onblur="validateEmail(name)" required=""  />
                                        <span id="emailsError" style="display: none;color: red">You must enter a valid email address (Ex. abcd@abcd.abc)</span>

                                    </div>
                                    <div class="form-group">
                                        <label ><span><b>Your Password</b></span></label>
                                        <label style="color: red"><span><b>${st.passwordmsg}</b></span></label>
                                        <input type="password" id="password" name="password" placeholder="Your password" onblur="validatePassword(name)" class="r-form-last-name form-control" required="" id="r-form-last-name">

                                    </div>
                                    <div class="form-group">
                                        <label ><span><b>Confirm Your Password</b></span></label>

                                        <input type="password" id="password" name="password2" placeholder="Confirm Your Password" onblur="validatePassword(name)" class="r-form-last-name form-control" required="" id="r-form-last-name">

                                    </div>
                                    <div class="form-group">

                                        <input type="hidden" name="role" value="Individual">
                                    </div>
                                    <div class="form-group">

                                        <input type="hidden" name="tagid" value="A">
                                    </div>
                                    <div class="form-group">

                                        <input type="hidden" name="tagid1" value="EC">
                                    </div>
                                    <div class="form-group">

                                        <input type="hidden" name="tagid2" value="IER">
                                    </div>
                                    <div class="form-group">
                                        <label><span><b>Phone Number</b></span></label>
                                        <h4 style="color: red">${st.memberphonemsg}</h4>
                                        <input type="text" id="memberphone" name="memberphone" onblur="validatePhone(name)" class="r-form-first-name form-control" id="r-form-first-name"  required="" placeholder="Phone Number">

                                    </div>
                                    <div class="form-group">
                                        <div class="form-group">
                                            <label>Select Branch</label>
                                            <select type="text" name="branchid" id="branchid" onblur="validateSelectBranch(name)" value="" class=" form-control" required="">
                                                <option>---Select Branch---</option>
                                                <%                                                    Branches uni = new Branches();
                                                    List<Branches> mydatabr = uni.BranchList();
                                                    if (mydatabr.size() != 0) {
                                                        int row = 0;
                                                        while (row < mydatabr.size()) {

                                                %>
                                                <option value="<%=mydatabr.get(row).getBranchid()%>" id="exampleInputPassword1"><%=mydatabr.get(row).getBranchname()%>,<%=mydatabr.get(row).getBranchaddress()%></option> 

                                                <%

                                                            row++;
                                                        }

                                                    }

                                                %>
                                            </select>
                                        </div>
                                        <span  class="validateError" id="branchidError" style="display: none; color: red">You must select your Branch</span>

                                    </div>
                                    <div class="form-group">
                                        <div class="form-group">
                                            <label>Select Department</label>
                                            <select type="text" class=" form-control" id="departmentid" onblur="validateSelectDepart(name)" name="departmentid"  required="">
                                                <option>---Select Department---</option>
                                                <%                                                        Departments dep = new Departments();
                                                    List<Departments> mydatadep = dep.getDepartmentList();
                                                    if (mydatadep.size() != 0) {
                                                        int row = 0;
                                                        while (row < mydatadep.size()) {

                                                %>
                                                <option value="<%=mydatadep.get(row).getDepartmentid()%>"><%=mydatadep.get(row).getDepartmentname()%></option> 

                                                <%

                                                            row++;
                                                        }

                                                    }

                                                %>
                                            </select>
                                            <span  class="validateError" id="departmentidError" style="display: none; color: red">You must select the department</span>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group">
                                            <label>Select Category</label>
                                            <select type="text" class=" form-control" id="categoryid" name="categoryid" required="" onblur="validateSelectCategory(name)">
                                                <option>--Select Category--</option>
                                                <%                                                        Categories cat = new Categories();
                                                    List<Categories> mydatacat = cat.getCategoryList();
                                                    if (mydatacat.size() != 0) {
                                                        int row = 0;
                                                        while (row < mydatacat.size()) {

                                                %>
                                                <option value="<%=mydatacat.get(row).getCategoryid()%>"><%=mydatacat.get(row).getCategoryname()%></option> 

                                                <%

                                                            row++;
                                                        }

                                                    }

                                                %>
                                            </select>
                                            <span  class="validateError" id="categoryidError" style="display: none; color: red">You must select the Category</span>

                                        </div>
                                    </div>

                                    <button type="submit" class="btn-primary">Sign me up! </button>
                                </form>

                            </center>

                        </div>
                        <div class="col-sm-6 forms-right-icons">
                            <div class="row">
                                <div class="col-sm-2 icon"><i class=""></i></div>

                            </div>
                            <div class="row">
                                <div class="col-sm-2 icon"><i class=""></i></div>

                            </div>
                            <div class="row">
                                <div class="col-sm-2 icon"><i class=""></i></div>

                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>







        <footer id="sp-footer-wrapper" class=" "><div class="container"><div class="row-fluid" id="footer">
                    <div id="sp-footer1" class="span8"><center><span class="copyright">Copyright &copy; 2017 <a href="http://www.engineersrwanda.rw/" target="_blank">Institution of Engineers Rwanda</a>.</strong> All rights
                                reserved.Designed by  <b>Moise Ingabire</b></span></center><a href="#" title=""></a></div>


                </div></div></footer>	

        <a class="hidden-desktop btn btn-inverse sp-main-menu-toggler" href="#" data-toggle="collapse" data-target=".nav-collapse">
            <i class="icon-align-justify"></i>
        </a>




    </body>
</html>

