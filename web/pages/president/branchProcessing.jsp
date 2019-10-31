
<%@page import="java.util.Date"%>
<%@page import="enginees.Branches"%>
<jsp:useBean id="p" scope="request" class="enginees.Branches">
    <jsp:setProperty name="p" property="*"/>
</jsp:useBean>

<%

     if (p.isValid()) {
          if (p.getOperator().equalsIgnoreCase("Update")) {
            Branches sec = new Branches();
            sec.setBranchid(p.getBranchid());
            sec.setBranchname(p.getBranchname());
            sec.setBranchaddress(p.getBranchaddress());
            sec.setCreationdate(new Date());
            if (sec.update()) {
                p.setMsg("New Branch Successfully Updated");
            } else {
                p.setMsg("New Branch Not Updated");
            }

        }
        if (p.getOperator().equalsIgnoreCase("delete")) {
            Branches sec = new Branches();
            sec.setBranchid(p.getBranchid());
            sec.setBranchname(p.getBranchname());
            sec.setBranchaddress(p.getBranchaddress());
            sec.setCreationdate(new Date());            
            if (sec.delete()) {
                p.setMsg("New Branch Successfully deleted");
            } else {
                p.setMsg("New Branch Not deleted");
            }

        }
       
        if (p.getOperator().equalsIgnoreCase("Create")) {
            Branches sec = new Branches();
            sec.setBranchid(p.getBranchid());
            sec.setBranchname(p.getBranchname());
            sec.setBranchaddress(p.getBranchaddress());
            sec.setCreationdate(new Date());
            if (sec.create()) {
                p.setMsg("New Branch Successfully added");
            } else {
                p.setMsg("New Branch Not added");
            }

        }

    }

%>
<jsp:forward page="RecordBranch.jsp"/>
