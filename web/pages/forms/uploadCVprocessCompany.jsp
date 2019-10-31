
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="enginees.DBClassConnector"%>
<%@page import="java.sql.Connection"%>
<jsp:useBean id="b" scope="request" class="enginees.Engineer"/>
<%
    String op = request.getParameter("op");
    int appNo = Integer.parseInt(request.getParameter("id"));
    Connection con = DBClassConnector.getConnection();
    Statement statement = con.createStatement();
    ResultSet rs = null;
    PreparedStatement pst = con.prepareStatement("UPDATE `engineer` SET `cv`='" + op + "' WHERE `engineer_id`=?");
    pst.setInt(1, appNo);
    pst.executeUpdate();
    response.sendRedirect("./UploadDocsCompany.jsp");
%>