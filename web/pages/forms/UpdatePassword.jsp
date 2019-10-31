 


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="enginees.Engineer"%>
<jsp:useBean id="st" scope="request" class="enginees.Engineer">
    <jsp:setProperty name="st" property="*" />
</jsp:useBean>
<%
    String Engineer_id = request.getParameter("Engineer_id");
    String oldpassword = request.getParameter("oldpassword"); // pass1 is the name of the input tag
    String password1 = request.getParameter("newpassword"); // pass1 is the name of the input tag
    String password2 = request.getParameter("conpassword");
    String pass = "";
   
    if (password1 != null && password2 != null) {

        // check if they are equal:
        if (!password1.equals(password2)) {
            st.setMsg("<h4 style=color:red>Confirm Password Not Match</h4>");
        }

        if (password1.equals(password2)) {

            int id = 0;
            try {
                Connection con = enginees.DBClassConnector.getConnection();
                Statement sta = con.createStatement();
                ResultSet rs = sta.executeQuery("select AES_decrypt(password,'Ingabire@@moise89'),engineer_id from engineer where engineer_id='" + Engineer_id + "'");
                if (rs.next()) {
                    id = rs.getInt(2);
                    pass = rs.getString(1);
                }
                
                if (pass.equals(oldpassword)) {
                    
                    Statement st1 = con.createStatement();
                    int i = st1.executeUpdate("update engineer set password=aes_encrypt('" + password1 + "','Ingabire@@moise89') where engineer_id='" + id + "'");
                    //  out.println("Password changed successfully");
                    st.setMsg("<h4 style=color:red>Password changed successfully</h4>");
                    st1.close();
                    con.close();
                } else {
                    //  out.println("Invalid Current Password");
                    st.setMsg("<h4 style=color:red>Invalid Current Password</h4>");
                }
            } catch (Exception e) {
                out.println(e);
            }
        }
    }
%>
<jsp:forward page="ChangePasswordForm.jsp"/>