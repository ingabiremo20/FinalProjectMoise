<%@page import="java.util.Date"%>
<%@page import="enginees.MemberSupporters"%>
<jsp:useBean id="b" scope="request" class="enginees.MemberSupporters">
    <jsp:setProperty name="b" property="*"/>
</jsp:useBean>


<%

    if (b.isValid()) {     
        if (b.getOperator().equalsIgnoreCase("insert")) {
            MemberSupporters memb = new MemberSupporters();
            memb.setSuportid(b.getSuportid());
            memb.setSupporternames(b.getSupporternames());
            memb.setSupportierid(b.getSupportierid());
            memb.setEngineer_id(b.getEngineer_id());
            memb.setSignature(b.getSignature());           
            memb.setSupporterphone(b.getSupporterphone());           
            if (memb.insert()) {
               b.setMsg(" Successfully registered");
               } else {
                b.setMsg("Not registered! verify the supporter membership No");
            }

        }

    }

%>
<jsp:forward page="ApplyReferences.jsp"/>