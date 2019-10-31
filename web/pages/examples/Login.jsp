<%-- 
    Document   : index
    Created on : Nov 16, 2016, 10:12:57 PM
    Author     : Fabien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" type="image/png" href="img/im.PNG"/>
        <jsp:useBean id="st" scope="request" class="enginees.Engineer"/>
        <title>Engineer :: Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Majestic Login Form Widget Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- font files -->
        <link href='//fonts.googleapis.com/css?family=Muli:400,300,300italic,400italic' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Comfortaa:400,300,700' rel='stylesheet' type='text/css'>
        <!-- /font files -->
        <!-- css files -->
        <link href="css/animate-custom.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- /css files -->
    </head>
    <body>	
        <h1 class="w3ls" style="color: black">Institution of Engineers Rwanda</h1>			
        <div id="container_demo" >
            <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
            <a class="hiddenanchor" id="toregister"></a>
            <a class="hiddenanchor" id="tologin"></a>
            <div id="wrapper">
                <div id="login" class="animate form">
                    <form  action="Engineer_Process.jsp" method="post" autocomplete="on"> 
                        <h2>Engineers Login</h2> 
                        <p> ${st.msg}</p>
                        <p> 
                            <label for="username" class="uname" data-icon="u" ><span>Your email Address</span></label>
                            <input id="username" name="emails" required="required" type="text" placeholder="EMAIL ADDRESS"/>
                        </p>
                        <p> 
                            <label for="password" class="youpasswd" data-icon="p"><span>Your password</span></label>
                            <input id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO" /> 
                        </p>
                        <p class="keeplogin"> 
                            <input type="checkbox" id="brand" value="">
                            <label for="brand"><span></span> Remember me?</label>
                        </p>
                        <p class="login button"> 
                            <input type="submit" value="Login" /> 
                        </p>
                        <p class="change_link">
                            <span>Not a member yet ?</span>
                            <a href="#toregister" class="to_register">Register Now</a>
                        </p>
                    </form>
                </div>
                <div id="register" class="animate form">
                    <form  action="Login_Process.jsp" method="post" autocomplete="on"> 
                        <h2> Sign up </h2> 
                        <h3 align="center">${st.msg}</h3>
                        <p> 
                            <label for="usernamesignup" class="uname" data-icon="u"><span>Your name</span></label>
                            <input id="usernamesignup" name="names" required="required" type="text" placeholder="FULL NAMES" />
                        </p>
                        <p> 
                            <label for="emailsignup" class="youmail" data-icon="e" ><span>Your email</span></label>
                            <input id="emailsignup" name="emails" required="required" type="email" placeholder="EXAMPLE@MAIL.COM"/> 
                        </p>
                        <p> 
                            <label for="passwordsignup" class="youpasswd" data-icon="p"><span>Your password</span></label>
                            <input id="passwordsignup" name="password" required="required" type="password" placeholder="eg. X8df!90EO"/>
                        </p>
                        <div class="form-group">
                            <label><span>Phone NUmber</span></label>
                            <input type="text" name="memberphone" class="r-form-first-name form-control" id="r-form-first-name"  required="" placeholder="Phone Number">
                            <div class="col-sm-2">
                                <p class="help-block"><h5 style="color: red">${st.memberphonemsg}</h5></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label ><span>Your Membership Type</span></label>
                            <select name="membertype" class="r-form-last-name form-control" id="r-form-last-name" >
                                <option>--Select membership Type--</option>
                                <option>Individual</option>
                                <option>Company</option>
                            </select>
                        </div>
                        <p class="signin button"> 
                            <input type="submit" value="Sign up"/> 
                        </p>
                        <p class="change_link">  
                            <span>Back to Home</span>
                            <a href="../Home.jsp" class="to_register">Home</a>
                        </p>
                    </form>
                </div>
            </div>
        </div>
        <p class="agileits" style="color: black">© 2016 Institution of Engineers Rwanda. All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank" style="color: black">Moise Ingabire</a></p>  
    </body>
</html>

