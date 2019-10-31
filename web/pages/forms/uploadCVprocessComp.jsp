<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="enginees.DBClassConnector"%>
<%@page import="enginees.Engineer"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="enginees.Documents"%>
<%@page import="enginees.Memberships"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.DataInputStream"%>
<jsp:useBean id="b" scope="request" class="enginees.Engineer">
    <jsp:setProperty name="b" property="*"/>
</jsp:useBean>
<%
    Engineer u = (Engineer) session.getAttribute("Company");
    if (u == null) {
%>
<jsp:forward page="LoginMember.jsp"/>
<%
    }
%>

<%

    DataInputStream in = null;
    String contentType = request.getContentType();
    System.out.println("Content type is :: " + contentType);
    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
        in = new DataInputStream(request.getInputStream());
    }
    int formDataLength = request.getContentLength();
    byte dataBytes[] = new byte[formDataLength];
    int byteRead = 0;
    int totalBytesRead = 0;
    while (totalBytesRead < formDataLength) {
        byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
        totalBytesRead += byteRead;
    }
    String file = new String(dataBytes);
    String saveFile = file.substring(file.indexOf("filename=\"") + 10);
    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
    saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
    //image link
    int lastIndex = contentType.lastIndexOf("=");
    String boundary = contentType.substring(lastIndex + 1, contentType.length());
    out.println(boundary);
    int pos;
    pos = file.indexOf("filename=\"");
    pos = file.indexOf("\n", pos) + 1;
    pos = file.indexOf("\n", pos) + 1;
    pos = file.indexOf("\n", pos) + 1;
    int boundaryLocation = file.indexOf(boundary, pos) - 4;
    int startPos = ((file.substring(0, pos)).getBytes()).length;
    int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
    FileOutputStream fileOut = new FileOutputStream(saveFile);

    // File fdest = new File("C:\\Users\\mc\\Documents\\NetBeansProjects\\RuraLicenseApplication\\web\\Slips");
    //File fdest = new File("F:\\NetBeansProjects\\WebApplication4\\web\\Papers");
    File fdest = new File("C:\\Users\\moise\\Documents\\NetBeansProjects\\FinalProjectMoise\\web\\pages\\CVs");
    // File fdest = new File("D:\\uploadDir");
    if (fdest.exists()) {
        boolean s = true;
    } else {

        fdest.mkdir();
    }
//=======================================================
    boolean bool = true;
    String ValMes = "";
    session.setAttribute("message", "");
    session.setAttribute("mc", "");
    session.setAttribute("showMes", 0);
    if (saveFile.contains(".pdf")) {
        bool = true;

    } else {
        bool = false;
        ValMes = "You must uplaod Your File In PDF Format Only";

    }

//========================================================
    String indexName = "";
    Random s = new Random();
    int d = s.nextInt(1000);
     indexName = "CV_" +u.getEngineer_id()+".pdf";
    if (bool) {

        try {

            //================================================================================
            FileOutputStream fileOut1 = new FileOutputStream(fdest + "\\" + indexName);

            fileOut.write(dataBytes);
            fileOut1.write(dataBytes, startPos, (endPos - startPos));
            fileOut1.flush();
            fileOut1.close();
            session.setAttribute("cv_link", indexName);
            session.setAttribute("yes", 1);
            //out.println(session.getAttribute("yes"));
              Engineer ss = new Engineer();
            ss.setCv(indexName);
            if (ss.updateCV()){
                b.setMsg("<h4 style=color:green>Successiful Uploaded</h4>");
            } else {
                b.setMsg("<h4 style=color:red>Failure in Uploading Please Upload Again</h4>");
            }
        } catch (Exception e) {
            b.setMsg("<h4 style=color:red>Failure in Uploading Please Upload Again</h4>");

        }

    } else {
        b.setMsg("<h4 style=color:red>You must uplaod Your File In PDF Format Only</h4>");

    }
%>
<jsp:forward page="UploadDocsCompany.jsp"/>