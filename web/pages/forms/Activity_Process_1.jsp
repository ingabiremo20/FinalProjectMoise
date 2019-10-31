 


<%@page import="enginees.Activity"%>
<jsp:useBean id="st" scope="request" class="enginees.Activity">
    <jsp:setProperty name="st" property="*" />
</jsp:useBean>

<%
    
    if (st.isValid()) {
        if (st.updateActivity()) {
%>
<jsp:forward page="../Admin/Activity_List.jsp"/>
<%
        } else {
            st.setMsg("<h4 style=color:red > Not Update! Please Try Again</h4>");
        }
    } else {
        st.setMsg("<h4 style=color:red>Check Validation Plse</h4>");
    }

%>
<jsp:forward page="../forms/Activity_1.jsp"/>