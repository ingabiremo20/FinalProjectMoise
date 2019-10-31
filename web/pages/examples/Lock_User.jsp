

<%@page import="enginees.User"%>
<jsp:useBean id="st" scope="request" class="enginees.User"/>

<%
    User u = User.getUser(request.getParameter("id"));
    if (u.update_lock_unlock(request.getParameter("op"), request.getParameter("id"))) {
        st.setMsg("<h3 style=color:green>User Successfully " + request.getParameter("op") + "</h3>");
    } else {
        st.setMsg("Try Again");
    }


%>
<jsp:forward page="User_List.jsp"/>