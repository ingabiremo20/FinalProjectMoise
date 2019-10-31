 


<%@page import="enginees.ActivityReg"%>
<jsp:useBean id="st" scope="request" class="enginees.ActivityReg">
    <jsp:setProperty name="st" property="*" />
</jsp:useBean>

<%
    
        if (st.insert()) {
            st.setMsg("<h3 style=color:green>You have Joined the Event. </h3>");
        } else {
            st.setMsg("<h3 style=color:red>There is An Error During the process</h3>");
        }
     
%>
<jsp:forward page="../Members/JoinActivity.jsp"/>