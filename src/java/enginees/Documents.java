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
import java.util.ArrayList;
import java.util.List;



/**
 *
 * @author moise
 */
public class Documents {
   private String docid,cv="Pending",officialdoc="Pending",bankslip="Pending";
   private int memberid;
   private String memberphone,memberlname,memberfname;
   private String formMessage = "", msg;
    private Connection conn = null;
    
    public List<Documents> ViewALlDocs() {
        List<Documents> myDocList = new ArrayList<Documents>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select * from documents";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                Documents u = new Documents();                
                u.setDocid(re.getString(1));
                u.setMemberid(re.getInt(2));
                u.setCv(re.getString(3));
                u.setOfficialdoc(re.getString(4));
                u.setBankslip(re.getString(5));
                u.setMemberfname(re.getString(6));
                u.setMemberlname(re.getString(7));               
                u.setMemberphone(re.getString(8));               
                myDocList.add(u);
            }
            re.close();
            stm.close();
            conn.close();

        } catch (Exception e) {
            formMessage = "Error:" + e.getMessage();
        }

        return myDocList;

    }
    public boolean updateCV() {

        try {
            conn = new ConnectorToDb().connector();
            //=================================================

            String q = "update documents set cv='" +cv+ "' where memberid='" + memberid + "'";
            Statement pst = conn.createStatement();

            if (pst.executeUpdate(q) == 1) {
                formMessage = "1 Row is Updaated";
            } else {

                formMessage = "no Row Updated";
            }

            //===========================
            pst.close();
            conn.close();
            //=================================
            return true;

        } catch (Exception e) {
            formMessage = e.getMessage();
            return false;

        }

    }
    public boolean updateBankSlip() {

        try {
            conn = new ConnectorToDb().connector();
            //=================================================

            String q = "update documents set bankslip='" + cv + "' where memberid='" + memberid + "'";
            Statement pst = conn.createStatement();

            if (pst.executeUpdate(q) == 1) {
                formMessage = "1 Row is Updaated";
            } else {

                formMessage = "no Row Updated";
            }

            //===========================
            pst.close();
            conn.close();
            //=================================
            return true;

        } catch (Exception e) {
            formMessage = e.getMessage();
            return false;

        }

    }
    public boolean updateOfficialDoc() {

        try {
            conn = new ConnectorToDb().connector();
            //=================================================

            String q = "update documents set officialdoc='" + cv + "' where memberid='" + memberid + "'";
            Statement pst = conn.createStatement();

            if (pst.executeUpdate(q) == 1) {
                formMessage = "1 Row is Updaated";
            } else {

                formMessage = "no Row Updated";
            }

            //===========================
            pst.close();
            conn.close();
            //=================================
            return true;

        } catch (Exception e) {
            formMessage = e.getMessage();
            return false;

        }

    }
    
    public List<Documents> ViewSingleDocument(String docid) {
        List<Documents> myDOCList = new ArrayList<Documents>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select p.docid,p.memberid,p.cv,p.officialdoc,p.bankslip,m.memberfname,m.memberlname,m.memberphone from documents p,memberships m, where p.memberid=m.memberid and p.docid='" + docid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                Documents u = new Documents();                
                u.setDocid(re.getString(1));
                u.setMemberid(re.getInt(2));
                u.setCv(re.getString(3));
                u.setOfficialdoc(re.getString(4));
                u.setBankslip(re.getString(5));
                u.setMemberfname(re.getString(6));
                u.setMemberlname(re.getString(7));               
                u.setMemberphone(re.getString(8));               
                myDOCList.add(u);
            }
            re.close();
            stm.close();
            conn.close();

        } catch (Exception e) {
            formMessage = "Error:" + e.getMessage();
        }

        return myDOCList;

    }
    public static String getMaxID() {
        String id = "IER-830";
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from Documents");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id + 1;
    }
    public boolean insert() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into Documents values(?,?,?,?,?)");
            pst.setString(1, getMaxID());
            pst.setInt(2, memberid);
            pst.setString(3, cv);
            pst.setString(4, officialdoc);
            pst.setString(5, bankslip);
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
public boolean insertNewDocument() {

        try {
            conn = new ConnectorToDb().connector();
            //=================================================
            java.util.Random r = new java.util.Random();
            int accNo = r.nextInt(10);
            accNo *= 2;
            java.util.Random e = new java.util.Random();
            int accNo2 = e.nextInt(100);
            accNo2 += 2;
            java.util.Random ri = new java.util.Random();
            int accNo3 = ri.nextInt(10000);
            accNo3 += 3;
            docid = "DOC-" + accNo + "" + accNo2;

            String q = "INSERT INTO `Documents` VALUES ('" + docid + "','" + memberid + "','" + cv + "','" + officialdoc + "','" + bankslip + "')";
            Statement pst = conn.createStatement();

            if (pst.executeUpdate(q) == 1) {
                formMessage = "1 Row is Added";
            } else {

                formMessage = "no Row added";
            }

            //===========================
            pst.close();
            conn.close();
            //=================================
            return true;

        } catch (Exception e) {
            formMessage = e.getMessage();
            return false;

        }

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

    public int getMemberid() {
        return memberid;
    }

    public void setMemberid(int memberid) {
        this.memberid = memberid;
    }

    public String getMemberphone() {
        return memberphone;
    }

    public void setMemberphone(String memberphone) {
        this.memberphone = memberphone;
    }

    public String getMemberlname() {
        return memberlname;
    }

    public void setMemberlname(String memberlname) {
        this.memberlname = memberlname;
    }

    public String getMemberfname() {
        return memberfname;
    }

    public void setMemberfname(String memberfname) {
        this.memberfname = memberfname;
    }

    public String getFormMessage() {
        return formMessage;
    }

    public void setFormMessage(String formMessage) {
        this.formMessage = formMessage;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }
    
}
