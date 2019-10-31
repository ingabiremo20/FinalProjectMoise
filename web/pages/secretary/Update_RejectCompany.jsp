

<%@page import="enginees.DBClassConnector"%>
<%@page import="java.sql.*"%>
<%@ page import ="javax.sql.*" %>  
<%
    String op = request.getParameter("op");
    int appNo = Integer.parseInt(request.getParameter("engineer_id"));
    Connection con = DBClassConnector.getConnection();
    Statement statement = con.createStatement();
    ResultSet rs = null;
    PreparedStatement pst = con.prepareStatement("update engineer set status='" + op + "' where engineer_id=?");
    pst.setInt(1, appNo);
    pst.executeUpdate();
    response.sendRedirect("../secretary/Coments.jsp");
%>