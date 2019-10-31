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
import java.util.Date;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author moise
 */
public class Branches {
private Connection conn = null;
    private int branchid;
    private String branchname;
    private String branchaddress,formMessage;
    private Date creationdate;
    private String branchaddressmsg, branchnamemsg;
    private String msg, operator = "Create";
    private boolean valid = true;

    public String getFormMessage() {
        return formMessage;
    }

    public void setFormMessage(String formMessage) {
        this.formMessage = formMessage;
    }

    public Branches() {
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }
public static List<Branches> getBranchList() {
        List<Branches> l = new ArrayList<Branches>();
        try {
             Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from branches");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Branches pr = new Branches();
                pr.setBranchid(rs.getInt(1));
                pr.setBranchname(rs.getString(2));
                pr.setBranchaddress(rs.getString(3));
                pr.setCreationdate(rs.getDate(4));
                l.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }
    public boolean create() {

        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement y = con.prepareStatement("insert into branches values(?,?,?,?)");
            y.setInt(1, branchid);
            y.setString(2, branchname);
            y.setString(3, branchaddress);
            y.setDate(4, new java.sql.Date(creationdate.getTime()));
            y.execute();
            //infoMsg = "inserted correctly";
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            //infoMsg = "not inserted";
            return false;

        }
    }

    public boolean update() {
        try {

            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("update branches set branchid='"+branchid+"', branchname='"+branchname+"',branchaddress='"+branchaddress+"' where branchid='"+branchid+"'");
            pst.setString(2, branchname);
            pst.setString(3, branchaddress);
            pst.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            ex.printStackTrace();
            return false;
        }
    }
public  List<Branches> ViewBranches() {
        List<Branches> myBranchesList = new ArrayList<Branches>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select * from branches";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {
//`universityid`, `university`, `referencephone`, `province`, `address`, `headofit`, `rector`, `email`
                Branches u = new Branches();
                u.setBranchid(re.getInt(1));
                u.setBranchname(re.getString(2));
                u.setBranchaddress(re.getString(3));
               

                myBranchesList.add(u);
            }
            re.close();
            stm.close();
            conn.close();

        } catch (Exception e) {
            formMessage = "Error:" + e.getMessage();
        }

        return myBranchesList;

    }
  
    public static List<Branches> BranchList() {
        List<Branches> l = new ArrayList<Branches>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from branches");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Branches pr = new Branches();
                pr.setBranchid(rs.getInt(1));
                pr.setBranchname(rs.getString(2));
                pr.setBranchaddress(rs.getString(3));
                pr.setCreationdate(rs.getDate(4));
                l.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static Branches getBranchid(String id) {
        Branches pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from branches where branchid='" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Branches();
                pr.setBranchid(rs.getInt(1));
                pr.setBranchname(rs.getString(2));
                pr.setBranchaddress(rs.getString(3));
                pr.setCreationdate(rs.getDate(4));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public boolean delete() {
        try {

            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from branches where branchid=?");
            pst.setInt(1, branchid);
            pst.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            ex.printStackTrace();
            return false;
        }
    }

    public static Branches getBranch_name(String name) {
        Branches pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from branches where Branchname=" + name + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr.setBranchid(rs.getInt(1));
                pr.setBranchname(rs.getString(2));
                pr.setBranchaddress(rs.getString(3));
                pr.setCreationdate(rs.getDate(4));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public int getBranchid() {
        return branchid;
    }

    public void setBranchid(int branchid) {
        this.branchid = branchid;
    }

    public String getBranchname() {
        return branchname;
    }

    public void setBranchname(String branchname) {
        this.branchname = branchname;
    }

    public String getBranchaddress() {
        return branchaddress;
    }

    public void setBranchaddress(String branchaddress) {
        this.branchaddress = branchaddress;
    }

    public Date getCreationdate() {
        return creationdate;
    }

    public void setCreationdate(Date creationdate) {
        this.creationdate = creationdate;
    }

    public String getBranchaddressmsg() {
        return branchaddressmsg;
    }

    public void setBranchaddressmsg(String branchaddressmsg) {
        this.branchaddressmsg = branchaddressmsg;
    }

    public String getBranchnamemsg() {
        return branchnamemsg;
    }

    public void setBranchnamemsg(String branchnamemsg) {
        this.branchnamemsg = branchnamemsg;
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
