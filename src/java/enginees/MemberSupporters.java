/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enginees;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author moise
 */
public class MemberSupporters {
    private int suportid;
    private int engineer_id,supportierid;
    private String supporternames,supporternamesmsg,supporterphone;
    private String signature,signaturemsg;
    private String msg, operator = "insert";
    private boolean valid = true; 

    public String getSupporterphone() {
        return supporterphone;
    }

    public void setSupporterphone(String supporterphone) {
        this.supporterphone = supporterphone;
    }
    
   
  
    public boolean delete() {
        try {

            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from supporters where suportid=?");
            pst.setInt(1, suportid);
            pst.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            ex.printStackTrace();
            return false;
        }
    }
    public static List<MemberSupporters> getsupportersListbymember(int id) {
        List<MemberSupporters> l = new ArrayList<MemberSupporters>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from supporters where memberid='" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                MemberSupporters pr = new MemberSupporters(); 
                pr.setSuportid(rs.getInt(1));                       
                pr.setSupporternames(rs.getString(2));
                pr.setSuportid(rs.getInt(3));              
                pr.setEngineer_id(rs.getInt(4)); 
                pr.setSignature(rs.getString(5));
                pr.setSupporterphone(rs.getString(6));
                l.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }
    public static int getMaxID() {
        int id = 0000;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from supporters");
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
             Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement y = con.prepareStatement("insert into supporters values(?,?,?,?,?,?)");
            y.setInt(1, getMaxID());
            y.setString(2,supporternames );
            y.setInt(3, supportierid);
            y.setInt(4, engineer_id);
            y.setString(5,signature="unsigned" );
            y.setString(6,supporterphone);
            y.execute();
            //infoMsg = "inserted correctly";
            return true;
        } catch (Exception e) {
            e.printStackTrace();
           // infoMsg = "not inserted";
            return false;
        }
    }
    public MemberSupporters() {
    }

    public int getEngineer_id() {
        return engineer_id;
    }

    public void setEngineer_id(int engineer_id) {
        this.engineer_id = engineer_id;
    }

    

 
    public int getSuportid() {
        return suportid;
    }

    public void setSuportid(int suportid) {
        this.suportid = suportid;
    }

    public int getSupportierid() {
        return supportierid;
    }

    public void setSupportierid(int supportierid) {
        this.supportierid = supportierid;
    }

    public String getSupporternames() {
        return supporternames;
    }

    public void setSupporternames(String supporternames) {
        this.supporternames = supporternames;
    }

    public String getSupporternamesmsg() {
        return supporternamesmsg;
    }

    public void setSupporternamesmsg(String supporternamesmsg) {
        this.supporternamesmsg = supporternamesmsg;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getSignaturemsg() {
        return signaturemsg;
    }

    public void setSignaturemsg(String signaturemsg) {
        this.signaturemsg = signaturemsg;
    }

    



    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

   
}
