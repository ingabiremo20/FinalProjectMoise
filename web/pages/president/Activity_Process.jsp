 


<%@page import="enginees.Activity"%>
<jsp:useBean id="st" scope="request" class="enginees.Activity">
    <jsp:setProperty name="st" property="*" />
</jsp:useBean>

<%
    
        if (st.insert()) {
            st.setMsg("<h3 style=color:green>Well Recorded</h3>");
        } else {
            st.setMsg("<h3 style=color:red>Not Recorded</h3>");
        }
     
%>
<jsp:forward page="../president/Activity.jsp"/>