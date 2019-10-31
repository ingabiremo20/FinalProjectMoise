

<%@page import="enginees.DBClassConnector"%>
<%@page import="java.sql.*"%>
<%
    int username = Integer.parseInt(request.getParameter("id"));
    Connection con = DBClassConnector.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = null;
    PreparedStatement ps = con.prepareStatement("delete from users where  user_id=?");
    ps.setInt(1, username);
    ps.executeUpdate();
    response.sendRedirect("./User_List.jsp");
%>