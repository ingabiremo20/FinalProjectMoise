
<%@page import="java.util.Date"%>
<%@page import="enginees.Categories"%>
<jsp:useBean id="p" scope="request" class="enginees.Categories">
    <jsp:setProperty name="p" property="*"/>
</jsp:useBean>

<%

     if (p.isValid()) {
          if (p.getOperator().equalsIgnoreCase("Update")) {
            Categories sec = new Categories();
            sec.setCategoryid(p.getCategoryid());
            sec.setCategoryname(p.getCategoryname());
            sec.setCategorydesc(p.getCategorydesc());
            
            if (sec.update()) {
                p.setMsg("New Category Successfully Updated");
            } else {
                p.setMsg("New Category Not Updated");
            }

        }
        if (p.getOperator().equalsIgnoreCase("delete")) {
            Categories sec = new Categories();
           sec.setCategoryid(p.getCategoryid());
            sec.setCategoryname(p.getCategoryname());
            sec.setCategorydesc(p.getCategorydesc());          
            if (sec.delete()) {
                p.setMsg("New Category Successfully deleted");
            } else {
                p.setMsg("New Category Not deleted");
            }

        }
       
        if (p.getOperator().equalsIgnoreCase("Create")) {
            Categories sec = new Categories();
           sec.setCategoryid(p.getCategoryid());
            sec.setCategoryname(p.getCategoryname());
            sec.setCategorydesc(p.getCategorydesc()); 
            if (sec.create()) {
                p.setMsg("New Category Successfully added");
            } else {
                p.setMsg("New Category Not added");
            }

        }

    }

%>
<jsp:forward page="RecordCategory.jsp"/>
