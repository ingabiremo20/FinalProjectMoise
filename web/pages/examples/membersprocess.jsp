 

<%@page import="enginees.Memberships"%>
<jsp:useBean id="b" scope="request" class="enginees.Memberships">
    <jsp:setProperty name="b" property="*"/>
</jsp:useBean>
<%
   
        Memberships sc = Memberships.getMemberFromName(b.getMemberemail());
        if (sc == null) {
            if (b.insert()) {
                b.setMsg("<h5 style=color:green>Successfully Registered</h5>");
            } else {
                b.setMsg("<h5 style=color:red>Registration Fails</h5>");
            }
        } else {
            b.setMsg("<h5 style=color:red>Email Already Taken</h5>");
        }
%>
<jsp:forward page="LoginMember.jsp"/>
