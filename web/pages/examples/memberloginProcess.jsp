
<%@page import="enginees.Engineer"%>
<jsp:useBean id="b" scope="request" class="enginees.Engineer">
    <jsp:setProperty name="b" property="*" />
</jsp:useBean>
<%
    {
        Engineer u = Engineer.getClient(b.getEmails());
        if (u == null) {
            b.setMsg("<h4 style=color:red >Invalid Email! </h4>");
        } else {
            if (u.getPassword().equals(b.getPassword())) {
                if (u.getStatus().equalsIgnoreCase("pending") && u.getMembertype().equalsIgnoreCase("Individual")) {

                    session.setAttribute("Engineer", u);
%>
<jsp:forward  page="../forms/ApplyDocuments.jsp"/>
<%
    }
    if (u.getStatus().equalsIgnoreCase("Requesting") && u.getMembertype().equalsIgnoreCase("Individual")) {

        session.setAttribute("Memberships", u);
%>
<jsp:forward  page="../forms/FinishRegMsg.jsp"/>
<%
    }
    if (u.getStatus().equalsIgnoreCase("Accepted")) {

        session.setAttribute("Engineer", u);
%>
<jsp:forward  page="../forms/AcceptedMemberHome.jsp"/>
<%
    }
    if (u.getStatus().equalsIgnoreCase("pending") && u.getMembertype().equalsIgnoreCase("Company")) {

        session.setAttribute("Company", u);
%>
<jsp:forward  page="../forms/ApplyDocumentsCompany.jsp"/>
<%
    }
    if (u.getStatus().equalsIgnoreCase("Requesting") && u.getMembertype().equalsIgnoreCase("Company")) {

        session.setAttribute("Company", u);
%>
<jsp:forward  page="../forms/FinishRegMsgCompany.jsp"/>
<%
                }

            } else {
                b.setMsg("<h4 style=color:red >Invalid Password!</h4>");
            }
        }
    }

%>
<jsp:forward page="LoginMember.jsp"/>