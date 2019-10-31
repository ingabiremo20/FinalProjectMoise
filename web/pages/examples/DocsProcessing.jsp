
<%@page import="enginees.Docs"%>
<jsp:useBean id="p" scope="request" class="enginees.Docs">
    <jsp:setProperty name="p" property="*"/>
</jsp:useBean>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="enginees.Documents"%>
<%@page import="enginees.Memberships"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.DataInputStream"%>
<jsp:useBean id="b" scope="request" class="enginees.Memberships"/>

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
    File fdest = new File("C:\\Users\\moise\\Documents\\NetBeansProjects\\Engineur\\web\\pages\\CVs");
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
    indexName = "CV_" + d + " _" + saveFile;
    if (bool) {

        try {

            //================================================================================
            FileOutputStream fileOut1 = new FileOutputStream(fdest + "\\" + indexName);

            fileOut.write(dataBytes);
            fileOut1.write(dataBytes, startPos, (endPos - startPos));
            fileOut1.flush();
            fileOut1.close();
            session.setAttribute("Cv_link", indexName);
            session.setAttribute("yes", 1);
            
            if (p.isValid()) {     
        if (p.getOperator().equalsIgnoreCase("insert")) {
            Docs docc = new Docs();
           
            docc.setCv(p.getCv());
           docc.setMemberid(p.getMemberid());
            if (docc.insert()) {
               b.setMsg(" Successfully registered");
               } else {
                b.setMsg("Not registered! check your Phone number");
            }

        }

    }

            //out.println(session.getAttribute("yes"));
          

        } catch (Exception e) {

            session.setAttribute("showMes", 1);
            session.setAttribute("message", "Failure in Uploading Please Upload Again" + e.getMessage());
            session.setAttribute("mc", "red");
            response.sendRedirect("UploadDocs.jsp");

        }

    } else {
        session.removeAttribute("photo");
        session.setAttribute("fileCounter", null);
        session.setAttribute("showMes", 1);
        session.setAttribute("message", "Fail To Upload Error:" + ValMes);
        session.setAttribute("mc", "red");
        response.sendRedirect("uploaddocs.jsp");

    }

%>
<%    {
        

%>
<%    }
%>

<jsp:forward page="../examples/Engineer_Home.jsp"/>