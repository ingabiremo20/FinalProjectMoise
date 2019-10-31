

<%@page import="enginees.DBClassConnector"%>
<%@page import="java.sql.*"%>
<%@ page import ="javax.sql.*" %>  
<%
    String op = request.getParameter("op");
    int appNo = Integer.parseInt(request.getParameter("activid"));
    Connection con = DBClassConnector.getConnection();
    Statement statement = con.createStatement();
    ResultSet rs = null;
    PreparedStatement pst = con.prepareStatement("update activities set activitstatus='" + op + "' where activid=?");
    pst.setInt(1, appNo);
    pst.executeUpdate();
    response.sendRedirect("./Activity_List.jsp");
%>