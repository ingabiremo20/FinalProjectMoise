<%@page import="java.util.Date"%>
<%@page import="enginees.ProjectsDone"%>
<%@page import="enginees.Branches"%>
<%@page import="enginees.Memberships"%>
<jsp:useBean id="b" scope="request" class="enginees.ProjectsDone">
    <jsp:setProperty name="b" property="*"/>
</jsp:useBean>

<%

    if (b.isValid()) {
        if (b.getOperator().equalsIgnoreCase("Update")) {
            ProjectsDone prj = new ProjectsDone();
            prj.setProjectid(b.getProjectid());
            prj.setEngineer_id(b.getEngineer_id());
            prj.setProjectname(b.getProjectname());
            prj.setProjectYear(b.getProjectYear());
            prj.setProjectClient(b.getProjectClient());

            if (prj.update()) {
                prj.setMsg("Project Successfully Updated");
            } else {
                prj.setMsg("Project Not Updated");
            }

        }
        if (b.getOperator().equalsIgnoreCase("delete")) {
            ProjectsDone prj = new ProjectsDone();
            prj.setProjectid(b.getProjectid());
            prj.setEngineer_id(b.getEngineer_id());
            prj.setProjectname(b.getProjectname());
            prj.setProjectYear(b.getProjectYear());
            prj.setProjectClient(b.getProjectClient());
            if (prj.delete()) {
                b.setMsg("Project Successfully deleted");
            } else {
                b.setMsg("Project Not deleted");
            }
        }

        if (b.getOperator().equalsIgnoreCase("SAVE")) {
            ProjectsDone prj = new ProjectsDone();
            prj.setProjectid(b.getProjectid());
            prj.setEngineer_id(b.getEngineer_id());
            prj.setProjectname(b.getProjectname());
            prj.setProjectYear(b.getProjectYear());
            prj.setProjectClient(b.getProjectClient());
            if (prj.SAVE()) {
                b.setMsg("New Project Successfully added");
            } else {
                b.setMsg("New Project Not added");
            }

        }

    }

%>
<jsp:forward page="ApplyCompanyProject.jsp"/>