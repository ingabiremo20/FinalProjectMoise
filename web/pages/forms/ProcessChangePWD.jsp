<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="enginees.Engineer"%>
<jsp:useBean id="st" scope="request" class="enginees.Engineer">
    <jsp:setProperty name="st" property="*"/>
</jsp:useBean>
<%
    String OldPassword = request.getParameter("OldPassword");
    String Engineer_id = request.getParameter("Engineer_id");
    String Newpass = request.getParameter("newpassword");
    String conpass = request.getParameter("conpassword");
    String pass = "";
    int id = 0;
    try {
        Connection con = enginees.DBClassConnector.getConnection();
        Statement sta = con.createStatement();
        ResultSet rs = null;
        sta = con.createStatement();
        rs = sta.executeQuery("select password from engineer where engineer_id= '" + Engineer_id + "' ");
        if (rs.next()) {
            pass = rs.getString("password");
        }
        if (Newpass != conpass) {
            st.setMsg("Confirm Password Not Match");
        }
        if (Newpass.equals(conpass)) {
            if (pass.equals(OldPassword)) {
                sta = con.createStatement();
                int i = sta.executeUpdate("update engineer set password='" + Newpass + "' where engineer_id= '" + Engineer_id + "'");
                st.setMsg("Password changed successfully");

                sta.close();
                con.close();
            } else {
                st.setMsg("Old Password doesn't match");
            }
            /*}else{
out.println("new password and confirm new password is not matching");
}*/
        }
    } catch (Exception e) {
        out.println(e);
    }
%>
<jsp:forward page="ChangePasswordForm.jsp"/>
