<%@page import="java.util.Date"%>
<%@page import="enginees.Memberships"%>
<jsp:useBean id="b" scope="request" class="enginees.Memberships">
    <jsp:setProperty name="b" property="*"/>
</jsp:useBean>


<%

    if (b.isValid()) {     
        if (b.getOperator().equalsIgnoreCase("insert")) {
            Memberships memb = new Memberships();
            memb.setBranchid(b.getBranchid());
            memb.setBranchid(b.getBranchid());
            memb.setCategoryid(b.getCategoryid());
            memb.setDepartmentid(b.getDepartmentid());
            memb.setMembernames(b.getMembernames());
            memb.setMemberlocation(b.getMemberlocation());
            memb.setMemberemail(b.getMemberemail());
            memb.setMembernation(b.getMembernation());
            memb.setMembertitle(b.getMembertitle());
            memb.setMemberpobirth(b.getMemberpobirth());
            memb.setMemberdob(b.getMemberdob());
            memb.setMemberstatus(b.getMemberstatus());
            memb.setMembersex(b.getMembersex());
            memb.setMemberphone(b.getMemberphone());
            memb.setMemberregdate(new Date());
            memb.setMemberpassword(b.getMemberpassword());
            memb.setMemberid(b.getMemberid()); 
            if (memb.insert()) {
               b.setMsg(" Successfully registered");
               } else {
                b.setMsg("Not registered! check your Phone number");
            }

        }

    }

%>
<jsp:forward page="Apply.jsp"/>