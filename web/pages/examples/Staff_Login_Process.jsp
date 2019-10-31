
<%@page import="enginees.User"%>
<jsp:useBean id="s" scope="request" class="enginees.User">
    <jsp:setProperty name="s" property="*" />
</jsp:useBean>

<%
    {
        User u = User.getUser(s.getUsername());
        if (u == null) {
            s.setMsg("<h1 style=color:red >Invalid Email</h1>");

        } else {

            if (u.getPassword().equals(s.getPassword())) {
                if (u.getRole().equalsIgnoreCase("Receptionist") && u.getStatus().equalsIgnoreCase("unlocked")) {
                    session.setAttribute("Receptionist", u);
%>
<jsp:forward  page="ReceptionistHome.jsp"/>
<%
    } if (u.getRole().equalsIgnoreCase("Secretary") && u.getStatus().equalsIgnoreCase("unlocked")) {
                    session.setAttribute("Secretary", u);
%>
<jsp:forward  page="SecretaryHome.jsp"/>
<%
    }if (u.getRole().equalsIgnoreCase("President") && u.getStatus().equalsIgnoreCase("unlocked")) {
                    session.setAttribute("President", u);
%>
<jsp:forward  page="PresidentHome.jsp"/>
<%
    }if (u.getRole().equalsIgnoreCase("Vice President") && u.getStatus().equalsIgnoreCase("unlocked")) {
                    session.setAttribute("VicePresident", u);
%>
<jsp:forward  page="VicePresidentHome.jsp"/>
<%
    }else {
        s.setMsg("<h5 style=color:red >Your Account Is Locked! Contact The System Administrator</h5>");
    }

    if (u.getRole().equalsIgnoreCase("Admin")) {
        session.setAttribute("Admin", u);
%>
<jsp:forward  page="AdminHome.jsp"/>
<%
                }
            } else {
                s.setMsg("<h1 style=color:red >Invalid Password!</h1>");
            }
        }
    }

%>
<jsp:forward page="LoginOfficer.jsp"/>