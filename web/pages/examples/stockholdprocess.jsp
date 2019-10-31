<%@page import="java.util.Date"%>
<%@page import="enginees.Stockholders"%>
<jsp:useBean id="b" scope="request" class="enginees.Stockholders">
    <jsp:setProperty name="b" property="*"/>
</jsp:useBean>


<%

    if (b.isValid()) {     
        if (b.getOperator().equalsIgnoreCase("Create")) {
            Stockholders hold = new Stockholders();
            hold.setStockholdid(b.getStockholdid());
            hold.setStockholdNames(b.getStockholdNames());
            hold.setStockholdTel(b.getStockholdTel());
            hold.setStockholdqual(b.getStockholdqual());
            hold.setIdentification(b.getIdentification());
            hold.setEngineer_id(b.getEngineer_id());
            hold.setRecierId(b.getRecierId());
             
            if (hold.create()) {
               b.setMsg(" Successfully registered");
               } else {
                b.setMsg("Not registered!");
            }

        }

    }

%>
<jsp:forward page="../forms/ApplyStockholders.jsp"/>