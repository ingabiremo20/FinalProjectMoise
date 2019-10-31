
<%@page import="java.util.Date"%>
<%@page import="enginees.User"%>
<jsp:useBean id="st" scope="request" class="enginees.User"/>
<%

    int id = Integer.parseInt(request.getParameter("id"));

    User sec = User.getUserByID(id);
    st.setUser_id(id);
    st.setRole(sec.getRole());
    
    st.setOperator("Update");

%>

<jsp:forward page="../forms/New_User_1.jsp"/>