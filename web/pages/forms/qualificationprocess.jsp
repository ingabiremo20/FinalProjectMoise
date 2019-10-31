<%@page import="java.util.Date"%>
<%@page import="enginees.MemberQualifications"%>
<jsp:useBean id="b" scope="request" class="enginees.MemberQualifications">
    <jsp:setProperty name="b" property="*"/>
</jsp:useBean>


<%

    if (b.isValid()) {     
        if (b.getOperator().equalsIgnoreCase("insert")) {
            MemberQualifications memb = new MemberQualifications();
            memb.setAcadQlif(b.getAcadQlif());
            memb.setAcInstitution(b.getAcInstitution());
            memb.setCertfAward(b.getCertfAward());
            memb.setYearOfAward(b.getYearOfAward());
            memb.setEngineer_id(b.getEngineer_id());           
            if (memb.insert()) {
               b.setMsg(" Successfully registered");
               } else {
                b.setMsg("Not registered!");
            }

        }

    }

%>
<jsp:forward page="ApplyQualifications.jsp"/>