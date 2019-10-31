
<%@page import="java.util.Date"%>
<%@page import="enginees.Activity"%>
<jsp:useBean id="st" scope="request" class="enginees.Activity"/>
<%

    int id = Integer.parseInt(request.getParameter("id"));

    Activity sec = Activity.getActivityID(id);
    st.setActivid(id);
    st.setActivitname(sec.getActivitname());
    st.setActivitdetails(sec.getActivitdetails());
    st.setActivitendDate(sec.getActivitendDate());
    st.setActivitbigDate(sec.getActivitbigDate());
    st.setActivitstatus(sec.getActivitstatus());
    st.setPlace(sec.getPlace());
    st.setOperator("Update");

%>

<jsp:forward page="../forms/Activity_1.jsp"/>