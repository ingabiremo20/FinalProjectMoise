 

<%@page import="enginees.Engineer"%>
<jsp:useBean id="st" scope="request" class="enginees.Engineer">
    <jsp:setProperty name="st" property="*"/>
</jsp:useBean>
<%
    Engineer sc = Engineer.getClient(st.getEmails());
    if (sc == null) {
        if (st.isValid()) {
            if (st.insert()) {
                st.setMsg("<h5 style=color:green>Successfully Registered</h5>");
            } else {
                st.setMsg("<h5 style=color:red>Registration Fails</h5>");
            }
        } else {
            st.setMsg("<h5 style=color:red>Check Validation Plse</h5>");
        }
    } else {
        st.setMsg("<h5 style=color:red>Email Already Taken</h5>");
    }
%>
<jsp:forward page="RegisterMember.jsp"/>
