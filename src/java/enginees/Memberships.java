/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enginees;

import static enginees.Application.getMaxID;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author moise
 */
public class Memberships {

    int check;

    private String formMessage = "";
    private Connection conn = null;
    private int memberid;
    private int categoryid = 0;
    private int departmentid = 0;
    private int branchid = 0;
    private String membernames, membertype, departmentidmsg;
    private String branchidmsg, supporternames, Supporterphone, supportierid, signature;
    private String membertitle = "", membertitlemsg, categoryidmsg;
    private String memberdob = "", acInstitution = "", certfAward = "", yearOfAward = "";
    private String memberpobirth = "", memberpobirthmsg, memberdobmsg;
    private String membersex = "", membersexmsg, memberidmsg;
    private String memberlocation = "", memberlocationmsg;
    private String memberphone, memberphonemsg;
    private String memberemail, memberemailmsg;
    private String membernation = "", membernationmsg, bigdate = "", enddate = "", description = "";
    private String memberstatus = "", memberstatusmsg, memberregdatemsg, memberpassword, memberpasswordmsg;
    private String memberregdate;
    private String docid = "Pending", cv = "Pending", officialdoc = "Pending", bankslip = "Pending";
    private String msg, LoginMsg;
    private boolean valid = true;

    public String getSupporterphone() {
        return Supporterphone;
    }

    public void setSupporterphone(String Supporterphone) {
        this.Supporterphone = Supporterphone;
    }

    public String getSupporternames() {
        return supporternames;
    }

    public void setSupporternames(String supporternames) {
        this.supporternames = supporternames;
    }

    public String getSupportierid() {
        return supportierid;
    }

    public void setSupportierid(String supportierid) {
        this.supportierid = supportierid;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getAcInstitution() {
        return acInstitution;
    }

    public void setAcInstitution(String acInstitution) {
        this.acInstitution = acInstitution;
    }

    public String getCertfAward() {
        return certfAward;
    }

    public void setCertfAward(String certfAward) {
        this.certfAward = certfAward;
    }

    public String getYearOfAward() {
        return yearOfAward;
    }

    public void setYearOfAward(String yearOfAward) {
        this.yearOfAward = yearOfAward;
    }

    public String getBigdate() {
        return bigdate;
    }

    public void setBigdate(String bigdate) {
        this.bigdate = bigdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMembertype() {
        return membertype;
    }

    public void setMembertype(String membertype) {
        this.membertype = membertype;
    }

    public String getMemberpassword() {
        return memberpassword;
    }

    public void setMemberpassword(String memberpassword) {
        this.memberpassword = memberpassword;
    }

    public String getMemberpasswordmsg() {
        return memberpasswordmsg;
    }

    public void setMemberpasswordmsg(String memberpasswordmsg) {
        this.memberpasswordmsg = memberpasswordmsg;
    }


    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public static List<Memberships> ViewALlDocs() {
        List<Memberships> myDocList = new ArrayList<Memberships>();
        try {

            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select m.membernames,m.membernation,m.memberemail,m.memberphone,m.membertype,m.memberregdate,m.memberstatus from memberships m, documents d where m.memberid= d.memberid ");
            ResultSet re = pst.executeQuery();
            while (re.next()) {

                Memberships u = new Memberships();
                u.setMembernames(re.getString(1));
                u.setMembernation(re.getString(2));
                u.setMemberemail(re.getString(3));
                u.setMemberphone(re.getString(4));
                u.setMembertype(re.getString(5));
                u.setMemberregdate(re.getString(6));
                u.setMemberstatus(re.getString(7));

                myDocList.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return myDocList;

    }

    public static int getMaxID() {
        int id = 101;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from Memberships");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id + 1;
    }

    public static List<Memberships> getListOfApplicantsPending() {
        List<Memberships> l = new ArrayList<Memberships>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from memberships");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Memberships pr = new Memberships();
                pr.setMemberid(rs.getInt(1));
                pr.setCategoryid(rs.getInt(2));
                pr.setDepartmentid(rs.getInt(3));
                pr.setBranchid(rs.getInt(4));
                pr.setMembernames(rs.getString(5));
                pr.setMembertitle(rs.getString(6));
                pr.setMemberdob(rs.getString(7));
                pr.setMemberpobirth(rs.getString(8));
                pr.setMembersex(rs.getString(9));
                pr.setMemberlocation(rs.getString(10));
                pr.setMemberphone(rs.getString(11));
                pr.setMemberemail(rs.getString(12));
                pr.setMembernation(rs.getString(13));
                pr.setMemberregdate(rs.getString(14));
                pr.setMemberstatus(rs.getString(15));
                pr.setMembertype(rs.getString(17));
                if (pr.getMemberstatus().equals("pending") && pr.getMembertype().equals("Individual")) {
                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Memberships> getListOfCompanyPending() {
        List<Memberships> l = new ArrayList<Memberships>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from memberships");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Memberships pr = new Memberships();
                pr.setMemberid(rs.getInt(1));
                pr.setCategoryid(rs.getInt(2));
                pr.setDepartmentid(rs.getInt(3));
                pr.setBranchid(rs.getInt(4));
                pr.setMembernames(rs.getString(5));
                pr.setMembertitle(rs.getString(6));
                pr.setMemberdob(rs.getString(7));
                pr.setMemberpobirth(rs.getString(8));
                pr.setMembersex(rs.getString(9));
                pr.setMemberlocation(rs.getString(10));
                pr.setMemberphone(rs.getString(11));
                pr.setMemberemail(rs.getString(12));
                pr.setMembernation(rs.getString(13));
                pr.setMemberregdate(rs.getString(14));
                pr.setMemberstatus(rs.getString(15));
                pr.setMembertype(rs.getString(17));
                if (pr.getMemberstatus().equals("pending") && pr.getMembertype().equals("Company")) {
                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public List<Memberships> ViewSingleMemberDetails(String mid) {
        List<Memberships> memberdetails = new ArrayList<Memberships>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select m.memberid, m.membernames,m.membertype,m.memberstatus,d.docid from memberships m, documents d where  m.memberid=d.memberid and m.memberid='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships();
                Memberships u = new Memberships();
                u.setMemberid(re.getInt(1));
                u.setMembernames(re.getString(2));
                u.setMembertype(re.getString(3));
                u.setMemberstatus(re.getString(4));
                u.setDocid(re.getString(5));

                memberdetails.add(u);
            }
            re.close();
            stm.close();
            conn.close();

        } catch (Exception e) {
            formMessage = "Error:" + e.getMessage();
        }

        return memberdetails;

    }

    public List<Memberships> ViewSingleCompanyDetails(String mid) {
        List<Memberships> memberdetails = new ArrayList<Memberships>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select m.memberid, m.membernames,m.membertype,m.memberstatus,d.docid from memberships m, documents d where  m.memberid=d.memberid and m.memberid='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships();
                Memberships u = new Memberships();
                u.setMemberid(re.getInt(1));
                u.setMembernames(re.getString(2));
                u.setMembertype(re.getString(3));
                u.setMemberstatus(re.getString(4));
                u.setDocid(re.getString(5));

                memberdetails.add(u);
            }
            re.close();
            stm.close();
            conn.close();

        } catch (Exception e) {
            formMessage = "Error:" + e.getMessage();
        }

        return memberdetails;

    }

    public List<Memberships> ViewSingleMemberExperienceDetails(String mid) {
        List<Memberships> memberdetails = new ArrayList<Memberships>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select bigdate, enddate,description from experiences where memberid='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships();
                Memberships u = new Memberships();
                u.setBigdate(re.getString(1));
                u.setEnddate(re.getString(2));
                u.setDescription(re.getString(3));
                memberdetails.add(u);
            }
            re.close();
            stm.close();
            conn.close();

        } catch (Exception e) {
            formMessage = "Error:" + e.getMessage();
        }

        return memberdetails;

    }

    public int checkPhone(String check) {
        int k = 0;
        try {
            Connection con = DBClassConnector.getConnection();
            String select = "select membernames from memberships where memberphone = ?";
            PreparedStatement pst = con.prepareStatement(select);
            pst.setString(1, check);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                k = k + 1;
            }
            con.close();
        } catch (Exception err) {

        }
        return k;
    }

    public List<Memberships> ViewSingleMemberEducationDetails(String mid) {
        List<Memberships> memberdetails = new ArrayList<Memberships>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select acInstitution, certfAward, yearOfAward from qualifications where memberid='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {
                //  Memberships u = new Memberships();
                Memberships u = new Memberships();
                u.setAcInstitution(re.getString(1));
                u.setCertfAward(re.getString(2));
                u.setYearOfAward(re.getString(3));
                memberdetails.add(u);
            }
            re.close();
            stm.close();
            conn.close();

        } catch (Exception e) {
            formMessage = "Error:" + e.getMessage();
        }

        return memberdetails;

    }

    public List<Memberships> ViewSingleMemberSupportersDetails(String mid) {
        List<Memberships> memberdetails = new ArrayList<Memberships>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select supporternames , supportierid,supporterphone, signature from supporters where memberid='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships(); supporternames   | supportierid  signature
                Memberships u = new Memberships();
                u.setSupporternames(re.getString(1));
                u.setSupporterphone(re.getString(2));
                u.setSupportierid(re.getString(3));
                u.setSignature(re.getString(4));
                memberdetails.add(u);
            }
            re.close();
            stm.close();
            conn.close();

        } catch (Exception e) {
            formMessage = "Error:" + e.getMessage();
        }

        return memberdetails;

    }

    public static List<Memberships> getListOfIndividualRequest() {
        List<Memberships> l = new ArrayList<Memberships>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from memberships");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Memberships pr = new Memberships();
                pr.setMemberid(rs.getInt(1));
                pr.setCategoryid(rs.getInt(2));
                pr.setDepartmentid(rs.getInt(3));
                pr.setBranchid(rs.getInt(4));
                pr.setMembernames(rs.getString(5));
                pr.setMembertitle(rs.getString(6));
                pr.setMemberdob(rs.getString(7));
                pr.setMemberpobirth(rs.getString(8));
                pr.setMembersex(rs.getString(9));
                pr.setMemberlocation(rs.getString(10));
                pr.setMemberphone(rs.getString(11));
                pr.setMemberemail(rs.getString(12));
                pr.setMembernation(rs.getString(13));
                pr.setMemberregdate(rs.getString(14));
                pr.setMemberstatus(rs.getString(15));
                pr.setMembertype(rs.getString(17));
                if (pr.getMemberstatus().equals("Requesting") && pr.getMembertype().equals("Individual")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Memberships> getListOfCompanyRequest() {
        List<Memberships> l = new ArrayList<Memberships>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from memberships");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Memberships pr = new Memberships();
                pr.setMemberid(rs.getInt(1));
                pr.setCategoryid(rs.getInt(2));
                pr.setDepartmentid(rs.getInt(3));
                pr.setBranchid(rs.getInt(4));
                pr.setMembernames(rs.getString(5));
                pr.setMembertitle(rs.getString(6));
                pr.setMemberdob(rs.getString(7));
                pr.setMemberpobirth(rs.getString(8));
                pr.setMembersex(rs.getString(9));
                pr.setMemberlocation(rs.getString(10));
                pr.setMemberphone(rs.getString(11));
                pr.setMemberemail(rs.getString(12));
                pr.setMembernation(rs.getString(13));
                pr.setMemberregdate(rs.getString(14));
                pr.setMemberstatus(rs.getString(15));
                pr.setMembertype(rs.getString(17));
                if (pr.getMemberstatus().equals("Requesting") && pr.getMembertype().equals("Company")) {
                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Memberships> getListOfIndividualLocked() {
        List<Memberships> l = new ArrayList<Memberships>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from memberships");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Memberships pr = new Memberships();
                pr.setMemberid(rs.getInt(1));
                pr.setCategoryid(rs.getInt(2));
                pr.setDepartmentid(rs.getInt(3));
                pr.setBranchid(rs.getInt(4));
                pr.setMembernames(rs.getString(5));
                pr.setMembertitle(rs.getString(6));
                pr.setMemberdob(rs.getString(7));
                pr.setMemberpobirth(rs.getString(8));
                pr.setMembersex(rs.getString(9));
                pr.setMemberlocation(rs.getString(10));
                pr.setMemberphone(rs.getString(11));
                pr.setMemberemail(rs.getString(12));
                pr.setMembernation(rs.getString(13));
                pr.setMemberregdate(rs.getString(14));
                pr.setMemberstatus(rs.getString(15));
                pr.setMembertype(rs.getString(17));
                if (pr.getMemberstatus().equals("Locked") && pr.getMembertype().equals("Individual")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Memberships> getListOfCompanyLocked() {
        List<Memberships> l = new ArrayList<Memberships>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from memberships");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Memberships pr = new Memberships();
                pr.setMemberid(rs.getInt(1));
                pr.setCategoryid(rs.getInt(2));
                pr.setDepartmentid(rs.getInt(3));
                pr.setBranchid(rs.getInt(4));
                pr.setMembernames(rs.getString(5));
                pr.setMembertitle(rs.getString(6));
                pr.setMemberdob(rs.getString(7));
                pr.setMemberpobirth(rs.getString(8));
                pr.setMembersex(rs.getString(9));
                pr.setMemberlocation(rs.getString(10));
                pr.setMemberphone(rs.getString(11));
                pr.setMemberemail(rs.getString(12));
                pr.setMembernation(rs.getString(13));
                pr.setMemberregdate(rs.getString(14));
                pr.setMemberstatus(rs.getString(15));
                pr.setMembertype(rs.getString(17));
                if (pr.getMemberstatus().equals("Locked") && pr.getMembertype().equals("Company")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Memberships> getListOfIndividualAccepted() {
        List<Memberships> l = new ArrayList<Memberships>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from memberships");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Memberships pr = new Memberships();
                pr.setMemberid(rs.getInt(1));
                pr.setCategoryid(rs.getInt(2));
                pr.setDepartmentid(rs.getInt(3));
                pr.setBranchid(rs.getInt(4));
                pr.setMembernames(rs.getString(5));
                pr.setMembertitle(rs.getString(6));
                pr.setMemberdob(rs.getString(7));
                pr.setMemberpobirth(rs.getString(8));
                pr.setMembersex(rs.getString(9));
                pr.setMemberlocation(rs.getString(10));
                pr.setMemberphone(rs.getString(11));
                pr.setMemberemail(rs.getString(12));
                pr.setMembernation(rs.getString(13));
                pr.setMemberregdate(rs.getString(14));
                pr.setMemberstatus(rs.getString(15));
                pr.setMembertype(rs.getString(17));
                if (pr.getMemberstatus().equals("Accepted") && pr.getMembertype().equals("Individual")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Memberships> getListOfCompanyAccepted() {
        List<Memberships> l = new ArrayList<Memberships>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from memberships");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Memberships pr = new Memberships();
                pr.setMemberid(rs.getInt(1));
                pr.setCategoryid(rs.getInt(2));
                pr.setDepartmentid(rs.getInt(3));
                pr.setBranchid(rs.getInt(4));
                pr.setMembernames(rs.getString(5));
                pr.setMembertitle(rs.getString(6));
                pr.setMemberdob(rs.getString(7));
                pr.setMemberpobirth(rs.getString(8));
                pr.setMembersex(rs.getString(9));
                pr.setMemberlocation(rs.getString(10));
                pr.setMemberphone(rs.getString(11));
                pr.setMemberemail(rs.getString(12));
                pr.setMembernation(rs.getString(13));
                pr.setMemberregdate(rs.getString(14));
                pr.setMemberstatus(rs.getString(15));
                pr.setMembertype(rs.getString(17));
                if (pr.getMemberstatus().equals("Accepted") && pr.getMembertype().equals("Company")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Memberships> getListOfAcceptedMember() {
        List<Memberships> l = new ArrayList<Memberships>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from memberships");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Memberships pr = new Memberships();
                pr.setMemberid(rs.getInt(1));
                pr.setCategoryid(rs.getInt(2));
                pr.setDepartmentid(rs.getInt(3));
                pr.setBranchid(rs.getInt(4));
                pr.setMembernames(rs.getString(5));
                pr.setMembertitle(rs.getString(6));
                pr.setMemberdob(rs.getString(7));
                pr.setMemberpobirth(rs.getString(8));
                pr.setMembersex(rs.getString(9));
                pr.setMemberlocation(rs.getString(10));
                pr.setMemberphone(rs.getString(11));
                pr.setMemberemail(rs.getString(12));
                pr.setMembernation(rs.getString(13));
                pr.setMemberregdate(rs.getString(14));
                pr.setMemberstatus(rs.getString(15));
                pr.setMembertype(rs.getString(17));
                if (pr.getMemberstatus().equals("Accepted")) {
                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Memberships> getListOfIndividualRejected() {
        List<Memberships> l = new ArrayList<Memberships>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from memberships");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Memberships pr = new Memberships();
                pr.setMemberid(rs.getInt(1));
                pr.setCategoryid(rs.getInt(2));
                pr.setDepartmentid(rs.getInt(3));
                pr.setBranchid(rs.getInt(4));
                pr.setMembernames(rs.getString(5));
                pr.setMembertitle(rs.getString(6));
                pr.setMemberdob(rs.getString(7));
                pr.setMemberpobirth(rs.getString(8));
                pr.setMembersex(rs.getString(9));
                pr.setMemberlocation(rs.getString(10));
                pr.setMemberphone(rs.getString(11));
                pr.setMemberemail(rs.getString(12));
                pr.setMembernation(rs.getString(13));
                pr.setMemberregdate(rs.getString(14));
                pr.setMemberstatus(rs.getString(15));
                pr.setMembertype(rs.getString(17));
                if (pr.getMemberstatus().equals("Rejected") && pr.getMembertype().equals("Individual")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Memberships> getListOfCompanyRejected() {
        List<Memberships> l = new ArrayList<Memberships>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from memberships");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Memberships pr = new Memberships();
                pr.setMemberid(rs.getInt(1));
                pr.setCategoryid(rs.getInt(2));
                pr.setDepartmentid(rs.getInt(3));
                pr.setBranchid(rs.getInt(4));
                pr.setMembernames(rs.getString(5));
                pr.setMembertitle(rs.getString(6));
                pr.setMemberdob(rs.getString(7));
                pr.setMemberpobirth(rs.getString(8));
                pr.setMembersex(rs.getString(9));
                pr.setMemberlocation(rs.getString(10));
                pr.setMemberphone(rs.getString(11));
                pr.setMemberemail(rs.getString(12));
                pr.setMembernation(rs.getString(13));
                pr.setMemberregdate(rs.getString(14));
                pr.setMemberstatus(rs.getString(15));
                pr.setMembertype(rs.getString(17));
                if (pr.getMemberstatus().equals("Rejected") && pr.getMembertype().equals("Company")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public boolean insert() {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            Date today = new Date();
            memberregdate = sdf.format(today);
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into memberships values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setInt(1, getMaxID());
            pst.setInt(2, categoryid);
            pst.setInt(3, departmentid);
            pst.setInt(4, branchid);
            pst.setString(5, membernames);
            pst.setString(6, membertitle);
            pst.setString(7, memberdob);
            pst.setString(8, memberpobirth);
            pst.setString(9, membersex);
            pst.setString(10, memberlocation);
            if (check == 0) {
                pst.setString(11, memberphone);
            } else {
                valid = false;
                memberphonemsg = "Telephone Already in Our DB.";
            }
            pst.setString(12, memberemail);
            pst.setString(13, membernation);
            pst.setString(15, memberstatus = "pending");
            pst.setString(14, memberregdate);
            pst.setString(16, memberpassword);
            pst.setString(17, membertype);
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Memberships getMemberFromName(String id) {
        Memberships pr = null;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from memberships where memberemail= '" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Memberships();
                pr.setMemberid(rs.getInt(1));
                pr.setCategoryid(rs.getInt(2));
                pr.setDepartmentid(rs.getInt(3));
                pr.setBranchid(rs.getInt(4));
                pr.setMembernames(rs.getString(5));
                pr.setMembertitle(rs.getString(6));
                pr.setMemberdob(rs.getString(7));
                pr.setMemberpobirth(rs.getString(8));
                pr.setMembersex(rs.getString(9));
                pr.setMemberlocation(rs.getString(10));
                pr.setMemberphone(rs.getString(11));
                pr.setMemberemail(rs.getString(12));
                pr.setMembernation(rs.getString(13));
                pr.setMemberregdate(rs.getString(14));
                pr.setMemberstatus(rs.getString(15));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static Memberships getMember(String id) {
        Memberships pr = null;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from Memberships where memberemail='" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Memberships();
                pr.setMemberid(rs.getInt(1));
                pr.setCategoryid(rs.getInt(2));
                pr.setDepartmentid(rs.getInt(3));
                pr.setBranchid(rs.getInt(4));
                pr.setMembernames(rs.getString(5));
                pr.setMembertitle(rs.getString(6));
                pr.setMemberdob(rs.getString(7));
                pr.setMemberpobirth(rs.getString(8));
                pr.setMembersex(rs.getString(9));
                pr.setMemberlocation(rs.getString(10));
                pr.setMemberphone(rs.getString(11));
                pr.setMemberemail(rs.getString(12));
                pr.setMembernation(rs.getString(13));
                pr.setMemberregdate(rs.getString(14));
                pr.setMemberstatus(rs.getString(15));
                pr.setMemberpassword(rs.getString(16));
                pr.setMembertype(rs.getString(17));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public int getMemberid() {
        return memberid;
    }

    public void setMemberid(int memberid) {
        this.memberid = memberid;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public int getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(int departmentid) {
        this.departmentid = departmentid;
    }

    public int getBranchid() {
        return branchid;
    }

    public void setBranchid(int branchid) {
        this.branchid = branchid;
    }

    public String getMembernames() {
        return membernames;
    }

    public void setMembernames(String membernames) {
        this.membernames = membernames;
    }

    public String getDepartmentidmsg() {
        return departmentidmsg;
    }

    public void setDepartmentidmsg(String departmentidmsg) {
        this.departmentidmsg = departmentidmsg;
    }

    public String getBranchidmsg() {
        return branchidmsg;
    }

    public void setBranchidmsg(String branchidmsg) {
        this.branchidmsg = branchidmsg;
    }

    public String getMembertitle() {
        return membertitle;
    }

    public void setMembertitle(String membertitle) {
        this.membertitle = membertitle;
    }

    public String getMembertitlemsg() {
        return membertitlemsg;
    }

    public void setMembertitlemsg(String membertitlemsg) {
        this.membertitlemsg = membertitlemsg;
    }

    public String getCategoryidmsg() {
        return categoryidmsg;
    }

    public void setCategoryidmsg(String categoryidmsg) {
        this.categoryidmsg = categoryidmsg;
    }

    public String getMemberdob() {
        return memberdob;
    }

    public void setMemberdob(String memberdob) {
        this.memberdob = memberdob;
    }

    public String getMemberpobirth() {
        return memberpobirth;
    }

    public void setMemberpobirth(String memberpobirth) {
        this.memberpobirth = memberpobirth;
    }

    public String getMemberpobirthmsg() {
        return memberpobirthmsg;
    }

    public void setMemberpobirthmsg(String memberpobirthmsg) {
        this.memberpobirthmsg = memberpobirthmsg;
    }

    public String getMemberdobmsg() {
        return memberdobmsg;
    }

    public void setMemberdobmsg(String memberdobmsg) {
        this.memberdobmsg = memberdobmsg;
    }

    public String getMembersex() {
        return membersex;
    }

    public void setMembersex(String membersex) {
        this.membersex = membersex;
    }

    public String getMembersexmsg() {
        return membersexmsg;
    }

    public void setMembersexmsg(String membersexmsg) {
        this.membersexmsg = membersexmsg;
    }

    public String getMemberidmsg() {
        return memberidmsg;
    }

    public void setMemberidmsg(String memberidmsg) {
        this.memberidmsg = memberidmsg;
    }

    public String getMemberlocation() {
        return memberlocation;
    }

    public void setMemberlocation(String memberlocation) {
        this.memberlocation = memberlocation;
    }

    public String getMemberlocationmsg() {
        return memberlocationmsg;
    }

    public void setMemberlocationmsg(String memberlocationmsg) {
        this.memberlocationmsg = memberlocationmsg;
    }

    public String getMemberphone() {
        return memberphone;
    }

    public void setMemberphone(String memberphone) {
        this.memberphone = memberphone;
        if (this.memberphone.length() == 10) {
            check = checkPhone(memberphone);
        } else {
            valid = false;
            memberphonemsg = "Phone number must be Ten";
        }
    }

    public String getMemberphonemsg() {
        return memberphonemsg;
    }

    public void setMemberphonemsg(String memberphonemsg) {
        this.memberphonemsg = memberphonemsg;

    }

    public String getMemberemail() {
        return memberemail;
    }

    public void setMemberemail(String memberemail) {
        this.memberemail = memberemail;
    }

    public String getMemberemailmsg() {
        return memberemailmsg;
    }

    public void setMemberemailmsg(String memberemailmsg) {
        this.memberemailmsg = memberemailmsg;
    }

    public String getMembernation() {
        return membernation;
    }

    public void setMembernation(String membernation) {
        this.membernation = membernation;
    }

    public String getMembernationmsg() {
        return membernationmsg;
    }

    public void setMembernationmsg(String membernationmsg) {
        this.membernationmsg = membernationmsg;
    }

    public String getMemberstatus() {
        return memberstatus;
    }

    public void setMemberstatus(String memberstatus) {
        this.memberstatus = memberstatus;
    }

    public String getMemberstatusmsg() {
        return memberstatusmsg;
    }

    public void setMemberstatusmsg(String memberstatusmsg) {
        this.memberstatusmsg = memberstatusmsg;
    }

    public String getMemberregdatemsg() {
        return memberregdatemsg;
    }

    public void setMemberregdatemsg(String memberregdatemsg) {
        this.memberregdatemsg = memberregdatemsg;
    }

    public int getCheck() {
        return check;
    }

    public void setCheck(int check) {
        this.check = check;
    }

    public String getMemberregdate() {
        return memberregdate;
    }

    public void setMemberregdate(String memberregdate) {
        this.memberregdate = memberregdate;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getLoginMsg() {
        return LoginMsg;
    }

    public void setLoginMsg(String LoginMsg) {
        this.LoginMsg = LoginMsg;
    }

    public String getDocid() {
        return docid;
    }

    public void setDocid(String docid) {
        this.docid = docid;
    }

    public String getCv() {
        return cv;
    }

    public void setCv(String cv) {
        this.cv = cv;
    }

    public String getOfficialdoc() {
        return officialdoc;
    }

    public void setOfficialdoc(String officialdoc) {
        this.officialdoc = officialdoc;
    }

    public String getBankslip() {
        return bankslip;
    }

    public void setBankslip(String bankslip) {
        this.bankslip = bankslip;
    }

    public String getFormMessage() {
        return formMessage;
    }

    public void setFormMessage(String formMessage) {
        this.formMessage = formMessage;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

}
