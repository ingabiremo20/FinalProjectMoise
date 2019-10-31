
<%@page import="enginees.Engineer"%>
<jsp:useBean id="st" scope="request" class="enginees.Engineer">
    <jsp:setProperty name="st" property="*" />
</jsp:useBean>
<%
    {
        Engineer u = Engineer.getClient(st.getEmails());
        if (u == null) {
            st.setMsg("<h1 style=color:red >Invalid Email! </h1>");
        } else {
            if (u.getPassword().equals(st.getPassword())) {
                if ( u.getStatus().equalsIgnoreCase("pending") && u.getRole().equalsIgnoreCase("Individual")) {
                    
                    session.setAttribute("Individual", u);
%>
<jsp:forward  page="Engineer_Home.jsp"/>
<%
                } if ( u.getStatus().equalsIgnoreCase("pending") && u.getRole().equalsIgnoreCase("Company")) {
                    
                    session.setAttribute("Company", u);
%>
<jsp:forward  page="Company_Home.jsp"/>
<%
                }if ( u.getStatus().equalsIgnoreCase("Requesting") && u.getRole().equalsIgnoreCase("Individual")) {
                    
                    session.setAttribute("Individual", u);
%>
<jsp:forward  page="../forms/FinishRegMsg.jsp"/>
<%
                }if ( u.getStatus().equalsIgnoreCase("Accepted")&& u.getRole().equalsIgnoreCase("Company")) {
                    
                    session.setAttribute("Individual", u);
%>
<jsp:forward  page="../forms/AcceptedMemberHome.jsp"/>
<%
                }if ( u.getStatus().equalsIgnoreCase("Accepted")&& u.getRole().equalsIgnoreCase("Individual")) {
                    
                    session.setAttribute("Individual", u);
%>
<jsp:forward  page="../forms/AcceptedMemberHome.jsp"/>
<%
                }if ( u.getStatus().equalsIgnoreCase("Locked")) {
                    
                   st.setMsg("<h3 style=color:red >This Account is Locked! Please Contact our Office </h3>");
%>
                 
<%
                }if ( u.getStatus().equalsIgnoreCase("Rejected")) {
                    
                   st.setMsg("<h3 style=color:red >Your Apllication has been Rejected! Please Contact our Office </h3>");
%>
                 
<%
                }

            } else {
                st.setMsg("<h1 style=color:red >Invalid Password!</h1>");
            }
        }
    }

%>
<jsp:forward page="LoginMember.jsp"/>