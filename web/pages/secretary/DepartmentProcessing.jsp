
<%@page import="java.util.Date"%>
<%@page import="enginees.Departments"%>
<jsp:useBean id="p" scope="request" class="enginees.Departments">
    <jsp:setProperty name="p" property="*"/>
</jsp:useBean>

<%

     if (p.isValid()) {
          if (p.getOperator().equalsIgnoreCase("Update")) {
            Departments sec = new Departments();
            sec.setDepartmentid(p.getDepartmentid());
            sec.setDepartmentname(p.getDepartmentname());
            sec.setDepartmentdesc(p.getDepartmentdesc());
            
            if (sec.update()) {
                p.setMsg("New Department Successfully Updated");
            } else {
                p.setMsg("New Department Not Updated");
            }

        }
        if (p.getOperator().equalsIgnoreCase("delete")) {
            Departments sec = new Departments();
            sec.setDepartmentid(p.getDepartmentid());
            sec.setDepartmentname(p.getDepartmentname());
            sec.setDepartmentdesc(p.getDepartmentdesc());         
            if (sec.delete()) {
                p.setMsg("New Department Successfully deleted");
            } else {
                p.setMsg("New Department Not deleted");
            }

        }
       
        if (p.getOperator().equalsIgnoreCase("Create")) {
            Departments sec = new Departments();
            sec.setDepartmentid(p.getDepartmentid());
            sec.setDepartmentname(p.getDepartmentname());
            sec.setDepartmentdesc(p.getDepartmentdesc()); 
            if (sec.create()) {
                p.setMsg("New Department Successfully added");
            } else {
                p.setMsg("New Department Not added");
            }

        }

    }

%>
<jsp:forward page="RecordDepartment.jsp"/>
