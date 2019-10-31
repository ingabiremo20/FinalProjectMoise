<%@page import="enginees.Application"%>
<jsp:useBean id="st" scope="request" class="enginees.Application">
    <jsp:setProperty name="st" property="*" />
</jsp:useBean>
<%
    Application l = Application.getClientFromName(st.getComp_name());
    if (l == null) {
        if (st.insert()) {
            st.setMsg("<h3 style=color:green>Well Recorded</h3>");
        } else {
            st.setMsg("<h3 style=color:red>Not Recorded</h3>");
        }
    } else {
        st.setMsg("<h3 style=color:red>Already Recorded</h3>");
    }
%>
<jsp:forward page="Apply.jsp"/>