 
<%@page import="enginees.Staff"%>
<%@page import="enginees.User"%>
<jsp:useBean id="sta" scope="request" class="enginees.Staff">

    <jsp:setProperty name="sta" property="*"/>
</jsp:useBean>
<jsp:useBean id="st" scope="request" class="enginees.User">
    <jsp:setProperty name="st" property="*"/>
</jsp:useBean>
<%
    
        User u = User.getUser(sta.getEmail());
        if (u == null) {
            sta.setUserid(User.getMaxID());
            if (sta.isValid()) {
            if (sta.insert()) {
                u = new User();
                u.setPassword(st.getPassword());
                u.setUsername(sta.getEmail());
                u.setRole(st.getRole());
                u.insert();
                sta.setMsg("<h5 style=color:green>Successefuly Created</h5>");
            } else {
                sta.setMsg("<h5 style=color:red>Registration Fails</h5>");

            }
        }
    } else {
        st.setMsg("<h5 style=color:red>Sorry!Email Already Taken</h5>");
    }


%>
<jsp:forward page="New_User.jsp"/>