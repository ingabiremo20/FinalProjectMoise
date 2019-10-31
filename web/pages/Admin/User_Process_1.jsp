 


<%@page import="enginees.User"%>
<jsp:useBean id="st" scope="request" class="enginees.User">
    <jsp:setProperty name="st" property="*" />
</jsp:useBean>

<%
    
    if (st.isValid()) {
        if (st.update()) {
%>
<jsp:forward page="../examples/User_List.jsp"/>
<%
        } else {
            st.setMsg("<h4 style=color:red > Not Update! Please Try Again</h4>");
        }
    } else {
        st.setMsg("<h4 style=color:red>Check Validation Plse</h4>");
    }

%>
<jsp:forward page="../forms/New_User_1.jsp"/>