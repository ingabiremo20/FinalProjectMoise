

<%@page import="enginees.DBClassConnector"%>
<%@page import="java.sql.*"%>
<%@ page import ="javax.sql.*" %>  
<%
    String op = request.getParameter("op");
    int appNo = Integer.parseInt(request.getParameter("apply_id"));
    Connection con = DBClassConnector.getConnection();
    Statement statement = con.createStatement();
    ResultSet rs = null;
    PreparedStatement pst = con.prepareStatement("update applications set status='" + op + "' where apply_id=?");
    pst.setInt(1, appNo);
    pst.executeUpdate();
    response.sendRedirect("./Accepted_Applicant.jsp");
%>