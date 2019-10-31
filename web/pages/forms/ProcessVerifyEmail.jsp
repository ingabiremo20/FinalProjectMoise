<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@page import="enginees.Engineer"%>
<jsp:useBean id="st" scope="request" class="enginees.Engineer">
    <jsp:setProperty name="st" property="*"/>
</jsp:useBean>
<%
    String email = request.getParameter("emails");    
    String passs = "";
    int id = 0;
    try {
        Connection con = enginees.DBClassConnector.getConnection();
        Statement sta = con.createStatement();
        ResultSet rs = null;
       // sta = con.createStatement();
        rs = sta.executeQuery("select * from engineer where emails= '" + email + "'");
        if (rs.next()) {
            passs = rs.getString("emails");
        }       
        if (passs.equals(email)) {
             String result;

    // Get recipient's email-ID, message & subject-line from index.html page
    final String to = request.getParameter("emails");

    final String subject = request.getParameter("sub");

    final String messg = request.getParameter("mess");

    // Sender's email ID and password needs to be mentioned
    final String from = "shemaclaude200@gmail.com";

    final String pass = "claude200";

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

        st.setMsg("Your mail sent successfully....");

    } catch (MessagingException mex) {

        mex.printStackTrace();

        st.setMsg("Error: unable to send mail....");

    }

            /*}else{
out.println("new password and confirm new password is not matching");
}*/
        }
    } catch (Exception e) {
        out.println(e);
    }
%>
<jsp:forward page="../examples/emailVerificationForm.jsp"/>
