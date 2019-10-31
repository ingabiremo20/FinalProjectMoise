
<jsp:useBean id="p" scope="request" class="enginees.Documents">
    <jsp:setProperty name="p" property="*"/>
</jsp:useBean>
<%
    {
            if (p.insert()) {
                p.setMsg("<h5 style=color:green> Successfully Registered</h5>");
            } else {
                p.setMsg("<h5 style=color:red>Registration Fails</h5>");
            }

%>
<%
    }
%>

<jsp:forward page="../examples/Engineer_Home.jsp"/>