/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enginees;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Date;
import java.util.*;

/**
 *
 * @author Fabien
 */
public class Engineer {

    int check;
    private String formMessage = "";
    private boolean valid = true;
    private int engineer_id;
    private Connection conn = null;
    private String names;
    private String emails, identitymsg,membersexmsg;

    private String password, passwordmsg,password2,namesmsg;
    private String role, status, msg;
    private int categoryid = 0;
    private int departmentid = 0;
    private int branchid = 0, recierId, stockholdid;
    private String membertitle = "";
    private String tagid = "", stockholdNames, identification, stockholdTel, stockholdqual;
    private String tagid2 = "";
    private String tagid1 = "",membernationmsg,emailsmsg;
    private String projectid, projectname, projectYear, projectClient;
    private String memberdob = "", identity = "";
    private String memberpobirth = "", memberpobirthmsg, bigdate, enddate, description;
    private String membersex = "", supporternamesmsg;
    private String memberlocation = "", memberlocationmsg, supporternames, supportierid, supporterphone, signature;
    private String memberphone, memberphonemsg, acInstitution, certfAward, yearOfAward;
    private String membernation = "";
    private String memberregdate = "", memberdobmsg;
    private String cv = "Pending", officialdoc = "Pending", bankslip = "Pending";
    private String tecreport = "Pending", prophoto = "Pending", nid = "Pending";

    public String getMembersexmsg() {
        return membersexmsg;
    }

    public void setMembersexmsg(String membersexmsg) {
        this.membersexmsg = membersexmsg;
    }

    public String getMembernationmsg() {
        return membernationmsg;
    }

    public void setMembernationmsg(String membernationmsg) {
        this.membernationmsg = membernationmsg;
    }

    public String getEmailsmsg() {
        return emailsmsg;
    }

    public void setEmailsmsg(String emailsmsg) {
        this.emailsmsg = emailsmsg;
    }

    public String getNamesmsg() {
        return namesmsg;
    }

    public void setNamesmsg(String namesmsg) {
        this.namesmsg = namesmsg;
    }

    public String getMemberdobmsg() {
        return memberdobmsg;
    }

    public void setMemberdobmsg(String memberdobmsg) {
        this.memberdobmsg = memberdobmsg;
    }

    public String getMemberpobirthmsg() {
        return memberpobirthmsg;
    }

    public void setMemberpobirthmsg(String memberpobirthmsg) {
        this.memberpobirthmsg = memberpobirthmsg;
    }

    public String getMemberlocationmsg() {
        return memberlocationmsg;
    }

    public void setMemberlocationmsg(String memberlocationmsg) {
        this.memberlocationmsg = memberlocationmsg;
    }

    public String getSupporternamesmsg() {
        return supporternamesmsg;
    }

    public void setSupporternamesmsg(String supporternamesmsg) {
        this.supporternamesmsg = supporternamesmsg;
    }

    public int getRecierId() {
        return recierId;
    }

    public void setRecierId(int recierId) {
        this.recierId = recierId;
    }

    public int getStockholdid() {
        return stockholdid;
    }

    public void setStockholdid(int stockholdid) {
        this.stockholdid = stockholdid;
    }

    public String getStockholdNames() {
        return stockholdNames;
    }

    public void setStockholdNames(String stockholdNames) {
        this.stockholdNames = stockholdNames;
    }

    public String getIdentification() {
        return identification;
    }

    public void setIdentification(String identification) {
        this.identification = identification;
    }

    public String getStockholdTel() {
        return stockholdTel;
    }

    public void setStockholdTel(String stockholdTel) {
        this.stockholdTel = stockholdTel;
    }

    public String getStockholdqual() {
        return stockholdqual;
    }

    public void setStockholdqual(String stockholdqual) {
        this.stockholdqual = stockholdqual;
    }

    public String getProjectid() {
        return projectid;
    }

    public void setProjectid(String projectid) {
        this.projectid = projectid;
    }

    public String getProjectname() {
        return projectname;
    }

    public void setProjectname(String projectname) {
        this.projectname = projectname;
    }

    public String getProjectYear() {
        return projectYear;
    }

    public void setProjectYear(String projectYear) {
        this.projectYear = projectYear;
    }

    public String getProjectClient() {
        return projectClient;
    }

    public void setProjectClient(String projectClient) {
        this.projectClient = projectClient;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
        if (!this.identity.matches("[0-9]+")) {
            valid = false;
            identitymsg = ("Only Numbers Accepted");
        }
        
        if (this.identity.length() == 0 || this.identity.length() < 8 || this.identity.length() > 16) {
            valid = false;
            identitymsg = ("invalid identity");
        }
    }

    public String getPasswordmsg() {
        return passwordmsg;
    }

    public void setPasswordmsg(String passwordmsg) {
        this.passwordmsg = passwordmsg;
    }

    public String getTagid() {
        return tagid;
    }

    public void setTagid(String tagid) {
        this.tagid = tagid;
    }

    public String getTagid2() {
        return tagid2;
    }

    public void setTagid2(String tagid2) {
        this.tagid2 = tagid2;
    }

    public String getTagid1() {
        return tagid1;
    }

    public void setTagid1(String tagid1) {
        this.tagid1 = tagid1;
    }

    public String getTecreport() {
        return tecreport;
    }

    public void setTecreport(String tecreport) {
        this.tecreport = tecreport;
    }

    public String getProphoto() {
        return prophoto;
    }

    public void setProphoto(String prophoto) {
        this.prophoto = prophoto;
    }

    public String getNid() {
        return nid;
    }

    public void setNid(String nid) {
        this.nid = nid;
    }

    public String getSupporternames() {
        return supporternames;
    }

    public void setSupporternames(String supporternames) {
        this.supporternames = supporternames;
         if(!this.supporternames.matches("^[a-zA-Z\\s]*$")){
            valid=false;
            supporternamesmsg=("Characters Only Accepted");
        }
        if (this.supporternames.length() == 0 || this.supporternames.length() < 3) {
            valid = false;
            supporternamesmsg = ("Your Name is too short");
        }
    }

    public String getSupportierid() {
        return supportierid;
    }

    public void setSupportierid(String supportierid) {
        this.supportierid = supportierid;
    }

    public String getSupporterphone() {
        return supporterphone;
    }

    public void setSupporterphone(String supporterphone) {
        this.supporterphone = supporterphone;
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

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
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

    public String getFormMessage() {
        return formMessage;
    }

    public void setFormMessage(String formMessage) {
        this.formMessage = formMessage;
    }

    public int getCheck() {
        return check;
    }

    public void setCheck(int check) {
        this.check = check;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
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

    public String getMembertitle() {
        return membertitle;
    }

    public void setMembertitle(String membertitle) {
        this.membertitle = membertitle;
    }

    public String getMemberdob() {
        return memberdob;
    }

    public void setMemberdob(String memberdob) {
        this.memberdob = memberdob;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
        Date d1 = new Date();

        String mydate = sdf.format(d1);

        if (mydate.compareTo(this.memberdob) < 0) {
            valid = false;
            memberdobmsg = ("invalid Date of Birth");
        }
    }

    public String getMemberpobirth() {
        return memberpobirth;
    }

    public void setMemberpobirth(String memberpobirth) {
        this.memberpobirth = memberpobirth;
        if (!this.memberpobirth.matches("^[a-zA-Z\\s]*$")) {
            valid = false;
            memberpobirthmsg = ("Characters Only Accepted eg:Kigali Remera ");
        }
        if (this.memberpobirth.length() == 0 || this.memberpobirth.length() < 3) {
            valid = false;
            memberpobirthmsg = ("Your Address is too short");
        }
    }

    public String getMembersex() {
        return membersex;
    }

    public void setMembersex(String membersex) {
        this.membersex = membersex;
        if (!this.membersex.matches("^[a-zA-Z\\s]*$")) {
            valid = false;
            membersexmsg = ("Please Make a Selection");
        }
    }

    public String getMemberlocation() {
        return memberlocation;
    }

    public void setMemberlocation(String memberlocation) {
        this.memberlocation = memberlocation;
         if (!this.memberlocation.matches("^[a-zA-Z0-9\\s]*$")) {
            valid = false;
            memberlocationmsg = ("Only Characters Accepted");
        }
    }

    public String getIdentitymsg() {
        return identitymsg;
    }

    public void setIdentitymsg(String identitymsg) {
        this.identitymsg = identitymsg;
    }

    public String getMemberphone() {
        return memberphone;
    }

    public void setMemberphone(String memberphone) {
        this.memberphone = memberphone;
         if (!this.memberphone.matches("[0-9]+")) {
            valid = false;
            memberphonemsg = ("Only Numbers Accepted");
        }
        if (this.memberphone.length() == 10) {
            check = checkPhone(memberphone);
        } else {
            valid = false;
            memberphonemsg = "Phone number must be Ten";
        }
    }

    public int checkPhone(String check) {
        int k = 0;
        try {
            Connection con = DBClassConnector.getConnection();
            String select = "select names from engineer where memberphone=?";
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

    public String getMemberphonemsg() {
        return memberphonemsg;
    }

    public void setMemberphonemsg(String memberphonemsg) {
        this.memberphonemsg = memberphonemsg;
    }

    public String getMembernation() {
        return membernation;
    }

    public void setMembernation(String membernation) {
        this.membernation = membernation;
         if (!this.membernation.matches("^[a-zA-Z\\s]*$")) {
            valid = false;
            membernationmsg = ("Enter YOur Country");
        }
    }

    public String getMemberregdate() {
        return memberregdate;
    }

    public void setMemberregdate(String memberregdate) {
        this.memberregdate = memberregdate;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
         if(!this.names.matches("^[a-zA-Z\\s]*$")){
            valid=false;
            namesmsg=("Characters Only Accepted");
        }
        if(this.names.length()==0 || this.names.length()<3){
        valid=false;
        namesmsg=("Your Name is too short");
        }
    }

    public String getEmails() {
        return emails;
    }

    public void setEmails(String emails) {
        this.emails = emails;
         if (!this.emails.matches("^[A-Za-z](.*)([@]{1})(.{1,})(\\.)(.{1,})")) {
            valid = false;
           emailsmsg = ("invalid E-mail");
        }
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getEngineer_id() {
        return engineer_id;
    }

    public void setEngineer_id(int engineer_id) {
        this.engineer_id = engineer_id;
    }
public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
        if (!password.equals(password2)) {
            valid = false;
            passwordmsg = "Password Missmatching";
        }
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
       this.password = password;
                if (!this.password.matches("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,20})") ) {
                    valid = false;
            passwordmsg = ("Password length should be between 8 and 20and  Must contain Atleast one uppercase, a Number and a special Chararacter");
        }

    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public static int getMaxID() {
        int id = 101;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id + 1;
    }

    public boolean insert() {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date today = new Date();
            memberregdate = sdf.format(today);
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into engineer values(?,?,?,aes_encrypt(?,?),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setInt(1, getMaxID());
            pst.setString(2, names);
            pst.setString(3, emails);
            pst.setString(4, password);
            pst.setString(5, new DBClassConnector().encrypter());
            pst.setString(6, role);
            pst.setString(7, "pending");
            pst.setInt(8, categoryid);
            pst.setInt(9, departmentid);
            pst.setInt(10, branchid);
            pst.setString(11, membertitle);
            pst.setString(12, memberdob);
            pst.setString(13, memberpobirth);
            pst.setString(14, membersex);
            pst.setString(15, memberlocation);
            if (check == 0) {
                pst.setString(16, memberphone);
            } else {
                valid = false;
                memberphonemsg = "Telephone Already in Our DB.";
            }
            pst.setString(17, membernation);
            pst.setString(18, memberregdate);
            pst.setString(19, cv);
            pst.setString(20, officialdoc);
            pst.setString(21, bankslip);
            pst.setString(22, tecreport);
            pst.setString(23, nid);
            pst.setString(24, prophoto);
            pst.setString(25, tagid);
            pst.setString(26, tagid1);
            pst.setString(27, tagid2);
            pst.setString(28, identity);
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<Engineer> getListOfApplicantsPending() {
        List<Engineer> l = new ArrayList<Engineer>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Engineer pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                pr.setTecreport(rs.getString(21));
                pr.setNid(rs.getString(22));
                pr.setProphoto(rs.getString(23));
                pr.setTagid(rs.getString(24));
                pr.setTagid1(rs.getString(25));
                pr.setTagid2(rs.getString(26));
                pr.setIdentity(rs.getString(27));

                if (pr.getStatus().equals("pending")) {
                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Engineer> getListOfLockedMembers() {
        List<Engineer> l = new ArrayList<Engineer>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Engineer pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                pr.setTecreport(rs.getString(21));
                pr.setNid(rs.getString(22));
                pr.setProphoto(rs.getString(23));
                pr.setTagid(rs.getString(24));
                pr.setTagid1(rs.getString(25));
                pr.setTagid2(rs.getString(26));
                pr.setIdentity(rs.getString(27));

                if (pr.getStatus().equals("Locked")) {
                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Engineer> getListOfCompanyPending() {
        List<Engineer> l = new ArrayList<Engineer>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Engineer pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                pr.setTecreport(rs.getString(21));
                pr.setNid(rs.getString(22));
                pr.setProphoto(rs.getString(23));
                pr.setTagid(rs.getString(24));
                pr.setTagid1(rs.getString(25));
                pr.setTagid2(rs.getString(26));
                pr.setIdentity(rs.getString(27));

                if (pr.getStatus().equals("pending") && pr.getRole().equals("Company")) {
                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public List<Engineer> ViewSingleMemberExperienceDetails(String mid) {
        List<Engineer> memberdetails = new ArrayList<Engineer>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select bigdate, enddate,description from experiences where engineer_id='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships();
                Engineer u = new Engineer();
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

    public List<Engineer> ViewMemberDetails(String mid) {
        List<Engineer> memberdetails = new ArrayList<Engineer>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select names, engineer_id, email, status from engineer where engineer_id='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships();
                Engineer u = new Engineer();
                u.setNames(re.getString(1));
                u.setEngineer_id(re.getInt(2));
                u.setEmails(re.getString(3));
                u.setStatus(re.getString(4));

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

    public List<Engineer> ViewSingleCompanyProjectDetails(String mid) {
        List<Engineer> memberdetails = new ArrayList<Engineer>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select projectid, projectname, projectYear, projectClient from projectsdone where engineer_id='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships();
                Engineer u = new Engineer();
                u.setProjectid(re.getString(1));
                u.setProjectname(re.getString(2));
                u.setProjectYear(re.getString(3));
                u.setProjectClient(re.getString(4));
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

    public List<Engineer> ViewSingleCompanyStockholdersDetails(String mid) {
        List<Engineer> memberdetails = new ArrayList<Engineer>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select stockholdid, stockholdNames, identification, stockholdTel, stockholdqual,  recierId from stockholders where engineer_id='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships();
                Engineer u = new Engineer();
                u.setStockholdid(re.getInt(1));
                u.setStockholdNames(re.getString(2));
                u.setIdentification(re.getString(3));
                u.setStockholdTel(re.getString(4));
                u.setStockholdqual(re.getString(5));
                u.setRecierId(re.getInt(6));

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

    public int checkPhones(String check) {
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

    public List<Engineer> ViewSingleMemberEducationDetails(String mid) {
        List<Engineer> memberdetails = new ArrayList<Engineer>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select acInstitution, certfAward, yearOfAward from qualifications where engineer_id='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {
                //  Memberships u = new Memberships();
                Engineer u = new Engineer();
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

    public List<Engineer> ViewSingleMemberSupportersDetails(String mid) {
        List<Engineer> memberdetails = new ArrayList<Engineer>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select supporternames , supportierid,supporterphone, signature from supporters where engineer_id='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships(); supporternames   | supportierid  signature
                Engineer u = new Engineer();
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

    public static List<Engineer> getListOfIndividualRequest() {
        List<Engineer> l = new ArrayList<Engineer>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Engineer pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                pr.setTecreport(rs.getString(21));
                pr.setNid(rs.getString(22));
                pr.setProphoto(rs.getString(23));
                pr.setTagid(rs.getString(24));
                pr.setTagid1(rs.getString(25));
                pr.setTagid2(rs.getString(26));
                pr.setIdentity(rs.getString(27));
                if (pr.getStatus().equals("pending") && pr.getRole().equals("Individual")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Engineer> getListOfCompanyRequest() {
        List<Engineer> l = new ArrayList<Engineer>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Engineer pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                pr.setTecreport(rs.getString(21));
                pr.setNid(rs.getString(22));
                pr.setProphoto(rs.getString(23));
                pr.setTagid(rs.getString(24));
                pr.setTagid1(rs.getString(25));
                pr.setTagid2(rs.getString(26));
                pr.setIdentity(rs.getString(27));
                if (pr.getStatus().equals("pending") && pr.getRole().equals("Company")) {
                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Engineer> getListOfIndividualLocked() {
        List<Engineer> l = new ArrayList<Engineer>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Engineer pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                pr.setTecreport(rs.getString(21));
                pr.setNid(rs.getString(22));
                pr.setProphoto(rs.getString(23));
                pr.setTagid(rs.getString(24));
                pr.setTagid1(rs.getString(25));
                pr.setTagid2(rs.getString(26));
                pr.setIdentity(rs.getString(27));
                if (pr.getStatus().equals("Locked") && pr.getRole().equals("Individual")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Engineer> getListOfCompanyLocked() {
        List<Engineer> l = new ArrayList<Engineer>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Engineer pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                pr.setTecreport(rs.getString(21));
                pr.setNid(rs.getString(22));
                pr.setProphoto(rs.getString(23));
                pr.setTagid(rs.getString(24));
                pr.setTagid1(rs.getString(25));
                pr.setTagid2(rs.getString(26));
                pr.setIdentity(rs.getString(27));
                if (pr.getStatus().equals("Locked") && pr.getRole().equals("Company")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Engineer> getListOfIndividualAccepted() {
        List<Engineer> l = new ArrayList<Engineer>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Engineer pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                pr.setTecreport(rs.getString(21));
                pr.setNid(rs.getString(22));
                pr.setProphoto(rs.getString(23));
                pr.setTagid(rs.getString(24));
                pr.setTagid1(rs.getString(25));
                pr.setTagid2(rs.getString(26));
                pr.setIdentity(rs.getString(27));
                if (pr.getStatus().equals("Accepted") && pr.getRole().equals("Individual")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Engineer> getListOfCompanyAccepted() {
        List<Engineer> l = new ArrayList<Engineer>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Engineer pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                pr.setTecreport(rs.getString(21));
                pr.setNid(rs.getString(22));
                pr.setProphoto(rs.getString(23));
                pr.setTagid(rs.getString(24));
                pr.setTagid1(rs.getString(25));
                pr.setTagid2(rs.getString(26));
                pr.setIdentity(rs.getString(27));
                if (pr.getStatus().equals("Accepted") && pr.getRole().equals("Company")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Engineer> getListOfAcceptedMember() {
        List<Engineer> l = new ArrayList<Engineer>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Engineer pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                pr.setTecreport(rs.getString(21));
                pr.setNid(rs.getString(22));
                pr.setProphoto(rs.getString(23));
                pr.setTagid(rs.getString(24));
                pr.setTagid1(rs.getString(25));
                pr.setTagid2(rs.getString(26));
                pr.setIdentity(rs.getString(27));
                if (pr.getStatus().equals("Accepted")) {
                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Engineer> getListOfIndividualRejected() {
        List<Engineer> l = new ArrayList<Engineer>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Engineer pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                pr.setTecreport(rs.getString(21));
                pr.setNid(rs.getString(22));
                pr.setProphoto(rs.getString(23));
                pr.setTagid(rs.getString(24));
                pr.setTagid1(rs.getString(25));
                pr.setTagid2(rs.getString(26));
                pr.setIdentity(rs.getString(27));
                if (pr.getStatus().equals("Rejected") && pr.getRole().equals("Individual")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public List<Engineer> ViewSingleMemberDetails(String mid) {
        List<Engineer> memberdetails = new ArrayList<Engineer>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select * where engineer_id='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships();
                Engineer u = new Engineer();
                u.setEngineer_id(re.getInt(1));
                u.setNames(re.getString(2));
                u.setRole(re.getString(5));
                u.setStatus(re.getString(6));
                u.setCv(re.getString(18));
                u.setOfficialdoc(re.getString(19));
                u.setBankslip(re.getString(20));
                u.setTecreport(re.getString(21));
                u.setNid(re.getString(22));
                u.setProphoto(re.getString(23));
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

    public List<Engineer> ViewSingleCompanyDetails(String mid) {
        List<Engineer> memberdetails = new ArrayList<Engineer>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select m.engineer_id, m.names,m.role,m.status, from engineer m, where m.engineer_id='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships();
                Engineer u = new Engineer();
                u.setEngineer_id(re.getInt(1));
                u.setNames(re.getString(2));
                u.setRole(re.getString(3));
                u.setStatus(re.getString(4));

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

    public static List<Engineer> getListOfCompanyRejected() {
        List<Engineer> l = new ArrayList<Engineer>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Engineer pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                pr.setTecreport(rs.getString(21));
                pr.setNid(rs.getString(22));
                pr.setProphoto(rs.getString(23));
                pr.setTagid(rs.getString(24));
                pr.setTagid1(rs.getString(25));
                pr.setTagid2(rs.getString(26));
                pr.setIdentity(rs.getString(27));
                if (pr.getStatus().equals("Rejected") && pr.getRole().equals("Company")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public boolean updatePsw() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("update engineer set password=aes_encrypt(?,'Ingabire@@moise89') where engineer_id=?");
            pst.setInt(2, engineer_id);
            pst.setString(1, password);

            pst.execute();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }

    }

    public boolean Update() {
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("UPDATE `engineer` SET `password`=Aes_encrypt(?,'Ingabire@@moise89'),`categoryid`=?,`departmentid`=?,`branchid`=?,`membertitle`=?,`memberdob`=?,`memberpobirth`=?,`membersex`=?,`memberlocation`=?,`memberphone`=?,`membernation`=?, `identity`=? WHERE `engineer_id`=?");
            pst.setString(1, password);
            pst.setInt(2, categoryid);
            pst.setInt(3, departmentid);
            pst.setInt(4, branchid);
            pst.setString(5, membertitle);
            pst.setString(6, memberdob);
            pst.setString(7, memberpobirth);
            pst.setString(8, membersex);
            pst.setString(9, memberlocation);
            pst.setString(10, memberphone);
            pst.setString(11, membernation);
            pst.setInt(13, engineer_id);
            pst.setString(12, identity);

            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Engineer getClientFromID(String id) {
        Engineer pr = null;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select engineer_id,names,email,AES_decrypt(password,'Ingabire@@moise89'),role,status,categoryid,departmentid,branchid,membertitle,memberdob,memberpobirth,membersex,membernation,memberphone from engineer where engineer_id= " + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static Engineer getClientFromName(String id) {
        Engineer pr = null;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer where names= '" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static Engineer getClient(String Citizen_id) {
        Engineer pr = null;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select engineer_id,names,email,AES_decrypt(password,'Ingabire@@moise89'),role,status,categoryid,departmentid,branchid,membertitle,memberdob,memberpobirth,membersex,membernation,memberphone from engineer where email='" + Citizen_id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static List<Engineer> getList() {
        List<Engineer> l = new ArrayList<Engineer>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from engineer");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Engineer pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                l.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public boolean updateCV() {
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("UPDATE `engineer` SET `cv`=? WHERE `engineer_id`=?");
            pst.setString(1, cv);
            pst.setInt(2, engineer_id);
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateproposalsheetProject() {

        try {
            Connection con = enginees.DBClassConnector.getConnection();
            //=================================================

            String q = "update engineer set cv='" + cv + "' where engineer_id='" + engineer_id + "'";
            Statement pst = con.createStatement();
            if (pst.executeUpdate(q) == 1) {
                formMessage = "1 Row is Updaated";
            } else {

                formMessage = "no Row Updated";
            }

            //===========================
            pst.close();
            con.close();
            //=================================
            return true;

        } catch (Exception e) {
            formMessage = e.getMessage();
            return false;

        }

    }

    public boolean updateBankSlip() {

        try {
            Connection con = enginees.DBClassConnector.getConnection();
            //=================================================

            String q = "UPDATE `engineer` SET `cv`=?,`officialdoc`=?,`bankslip`=? WHERE `engineer_id`=?";
            Statement pst = con.createStatement();

            if (pst.executeUpdate(q) == 1) {
                formMessage = "1 Row is Updaated";
            } else {

                formMessage = "no Row Updated";
            }

            //===========================
            pst.close();
            con.close();
            //=================================
            return true;

        } catch (Exception e) {
            formMessage = e.getMessage();
            return false;

        }

    }

    public boolean updateOfficialDoc() {

        try {
            Connection con = enginees.DBClassConnector.getConnection();
            //=================================================

            String q = "UPDATE `engineer` SET `cv`=?,`officialdoc`=?,`bankslip`=? WHERE `engineer_id`=?";
            Statement pst = con.createStatement();

            if (pst.executeUpdate(q) == 1) {
                formMessage = "1 Row is Updaated";
            } else {

                formMessage = "no Row Updated";
            }

            //===========================
            pst.close();
            con.close();
            //=================================
            return true;

        } catch (Exception e) {
            formMessage = e.getMessage();
            return false;

        }

    }

    public static Engineer getEngineerByid(String id) {
        Engineer pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from Engineer where engineer_id='" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Engineer();
                pr.setEngineer_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setEmails(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setStatus(rs.getString(6));
                pr.setCategoryid(rs.getInt(7));
                pr.setDepartmentid(rs.getInt(8));
                pr.setBranchid(rs.getInt(9));
                pr.setMembertitle(rs.getString(10));
                pr.setMemberdob(rs.getString(11));
                pr.setMemberpobirth(rs.getString(12));
                pr.setMembersex(rs.getString(13));
                pr.setMembernation(rs.getString(14));
                pr.setMemberphone(rs.getString(15));
                pr.setMembernation(rs.getString(16));
                pr.setMemberregdate(rs.getString(17));
                pr.setCv(rs.getString(18));
                pr.setOfficialdoc(rs.getString(19));
                pr.setBankslip(rs.getString(20));
                pr.setTecreport(rs.getString(21));
                pr.setNid(rs.getString(22));
                pr.setProphoto(rs.getString(23));
                pr.setTagid(rs.getString(24));
                pr.setTagid1(rs.getString(25));
                pr.setTagid2(rs.getString(26));
                pr.setIdentity(rs.getString(27));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

}
