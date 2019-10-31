<%@page import="java.util.Date"%>
<%@page import="enginees.Companies"%>
<%@page import="enginees.Branches"%>
<jsp:useBean id="p" scope="request" class="enginees.Companies">
    <jsp:setProperty name="p" property="*"/>
</jsp:useBean>

<%

    if (p.isValid()) {
        try {

            if (p.getOperator().equalsIgnoreCase("Update")) {
                Companies sec = new Companies();
                sec.setCompanyregno(p.getCompanyregno());
                sec.setCompanyTIN(p.getCompanyTIN());                
                sec.setCompanyregdate(p.getCompanyregdate());
                sec.setCompanyname(p.getCompanyname());
                sec.setCompanyactivity1(p.getCompanyactivity1());
                sec.setCompanyactivity2(p.getCompanyactivity2());
                sec.setCompanyactivity3(p.getCompanyactivity3());
                sec.setCompanystatus(p.getCompanystatus());
                sec.setRequestdate(new Date());
                if (sec.update()) {
                    p.setMsg("Company Successfully Updated");
                } else {
                    p.setMsg("Company Not Updated");
                }

            }
            if (p.getOperator().equalsIgnoreCase("delete")) {
                Companies sec = new Companies();
                sec.setCompanyregno(p.getCompanyregno());
                sec.setCompanyTIN(p.getCompanyTIN());
               
                sec.setCompanyregdate(p.getCompanyregdate());
                sec.setCompanyname(p.getCompanyname());
                sec.setCompanyactivity1(p.getCompanyactivity1());
                sec.setCompanyactivity2(p.getCompanyactivity2());
                sec.setCompanyactivity3(p.getCompanyactivity3());
                sec.setCompanystatus(p.getCompanystatus());
                sec.setRequestdate(new Date());
                if (sec.delete()) {
                    p.setMsg("Company Successfully deleted");
                } else {
                    p.setMsg("Company Not deleted");
                }
            }

            if (p.getOperator().equalsIgnoreCase("Create")) {
                Companies sec = new Companies();
                sec.setCompanyregno(p.getCompanyregno());
                sec.setCompanyTIN(p.getCompanyTIN());
                
                sec.setCompanyregdate(p.getCompanyregdate());
                sec.setCompanyname(p.getCompanyname());
                sec.setCompanyactivity1(p.getCompanyactivity1());
                sec.setCompanyactivity2(p.getCompanyactivity2());
                sec.setCompanyactivity3(p.getCompanyactivity3());
                sec.setCompanystatus(p.getCompanystatus());
                sec.setRequestdate(new Date());
                if (sec.create()) {
                    p.setMsg("Data Saved");
                } else {
                    p.setMsg("Not added");
                }

            }
        } catch (Exception e) {
            p.setMsg("Invalid data");
        }
    }

%>
<jsp:forward page="ApplyCompany.jsp"/>
