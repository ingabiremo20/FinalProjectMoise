<%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*" %>
<%@page import="enginees.Engineer"%>
<%@page import="java.util.List"%>
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="st" scope="request" class="enginees.Engineer"/>

<%

    //Creating a result for getting status that messsage is delivered or not!
    String result;

    // Get recipient's email-ID, message & subject-line from index.html page
    final String to = request.getParameter("mail");

    final String subject = request.getParameter("sub");

    final String messg = request.getParameter("mess");

    // Sender's email ID and password needs to be mentioned
    final String from = "Your_email";

    final String pass = Email_Password

    // Defining the gmail host
    String host = "smtp.gmail.com";

    // Creating Properties object
    Properties props = new Properties();

    // Defining properties
    props.put("mail.smtp.host", host);

    props.put("mail.transport.protocol", "smtp");

    props.put("mail.smtp.auth", "true");

    props.put("mail.smtp.starttls.enable", "true");

    props.put("mail.user", from);

    props.put("mail.password", pass);

    props.put("mail.port", "465");

    // Authorized the Session object.
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    });

    try {

        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);

        // Set From: header field of the header.
        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(to));

        // Set Subject: header field
        message.setSubject(subject);

        // Now set the actual message
        message.setText(messg);

        // Send message
        Transport.send(message);

        result = "Your mail sent successfully....";
        st.setMsg("Your mail sent successfully....");
    } catch (MessagingException mex) {

        mex.printStackTrace();

        st.setMsg("Error: unable to send mail....");

    }

%>



<h1><center><font color="blue">Sending Mail</font></h1>
<center><h4 style="color: red">${st.msg}</h4></center>
<center><h1><a href="pages/secretary/PendingMembers.jsp"><i class="ItemCommentsLink"></i>Back To The Applicants List </a></h1></center>