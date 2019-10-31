

<%@page import="enginees.DBClassConnector"%>
<%@page import="java.sql.*"%>
<%@ page import ="javax.sql.*" %>  
<%
    String op = request.getParameter("op");
    int appNo = Integer.parseInt(request.getParameter("engineer_id"));
    int appNo1 = Integer.parseInt(request.getParameter("activid"));
    Connection con = DBClassConnector.getConnection();
    Statement statement = con.createStatement();
    ResultSet rs = null;
    PreparedStatement pst = con.prepareStatement("update activityreg set status='" + op + "' where engineer_id=? and activid=?");
    pst.setInt(1, appNo);
    pst.setInt(2, appNo1);
    pst.executeUpdate();
    response.sendRedirect("./ViewActivityJoinedMemberlist.jsp");
%>