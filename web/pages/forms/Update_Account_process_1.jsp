
<jsp:useBean id="st" scope="request" class="enginees.Engineer">
    <jsp:setProperty name="st" property="*" />
</jsp:useBean>
<%
    
    if (st.isValid()) {
        if (st.Update()) {
%>
<jsp:forward page="../secretary/Decisions.jsp"/>
<%
        } else {
            st.setMsg("<h4 style=color:red > Not Update! Please Try Again</h4>");
        }
    } else {
        st.setMsg("<h4 style=color:red>Check Validation Plse</h4>");
    }

%>
<jsp:forward page="../secretary/Decisions.jsp"/>
