

<%@page import="enginees.DBClassConnector"%>
<%@page import="java.sql.*"%>
<%@ page import ="javax.sql.*" %>  
<%
    String op = request.getParameter("op");
    int memberpNo = Integer.parseInt(request.getParameter("memberid"));
    Connection con = DBClassConnector.getConnection();
    Statement statement = con.createStatement();
    ResultSet rs = null;
    PreparedStatement pst = con.prepareStatement("update memberships set memberstatus='" + op + "' where memberid=?");
    pst.setInt(1, memberpNo);
    pst.executeUpdate();
    response.sendRedirect("FinishRegMsg.jsp");
%>