<%@page import="java.util.Date"%>
<%@page import="enginees.MemberExperiences"%>
<jsp:useBean id="b" scope="request" class="enginees.MemberExperiences">
    <jsp:setProperty name="b" property="*"/>
</jsp:useBean>


<%

    if (b.isValid()) {     
        if (b.getOperator().equalsIgnoreCase("insert")) {
            MemberExperiences memb = new MemberExperiences();
            memb.setExperienceid(b.getExperienceid());
            memb.setBigdate(b.getBigdate());
            memb.setEnddate(b.getEnddate());
            memb.setDescription(b.getDescription());
            memb.setEngineer_id(b.getEngineer_id());           
            if (memb.insert()) {
               b.setMsg(" Successfully registered");
               } else {
                b.setMsg("Not registered!");
            }

        }

    }

%>
<jsp:forward page="ApplyExperiences.jsp"/>