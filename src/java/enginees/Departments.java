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
import javax.swing.JOptionPane;

/**
 *
 * @author moise
 */
public class Departments {

    private String formMessage = "";
    private Connection conn = null;
    private int departmentid;
    private String departmentname, memberdob, memberpobirth, memberlocation, memberemail, memberphone;
    private String departmentdesc, membernames, membertitle,memberstatus;
    private String depidmsg, depnamemsg, depdescriptionmsg;
    private String msg, operator = "Create";
    private boolean valid = true;

    public String getMemberstatus() {
        return memberstatus;
    }

    public void setMemberstatus(String memberstatus) {
        this.memberstatus = memberstatus;
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

    public String getMemberlocation() {
        return memberlocation;
    }

    public void setMemberlocation(String memberlocation) {
        this.memberlocation = memberlocation;
    }

    public String getMemberemail() {
        return memberemail;
    }

    public void setMemberemail(String memberemail) {
        this.memberemail = memberemail;
    }

    public String getMemberphone() {
        return memberphone;
    }

    public void setMemberphone(String memberphone) {
        this.memberphone = memberphone;
    }

    public String getMembernames() {
        return membernames;
    }

    public void setMembernames(String membernames) {
        this.membernames = membernames;
    }

    public String getMembertitle() {
        return membertitle;
    }

    public void setMembertitle(String membertitle) {
        this.membertitle = membertitle;
    }

    public boolean create() {

        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement y = con.prepareStatement("insert into departments values(?,?,?)");
            y.setInt(1, departmentid);
            y.setString(2, departmentname);
            y.setString(3, departmentdesc);
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
            PreparedStatement y = con.prepareStatement("update departments set departmentid='" + departmentid + "', departmentname='" + departmentname + "',departmentdesc='" + departmentdesc + "' where departmentid='" + departmentid + "'");
            y.setInt(1, departmentid);
            y.setString(2, departmentname);
            y.setString(3, departmentdesc);
            y.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            ex.printStackTrace();
            return false;
        }
    }

    public static List<Departments> getDepartmentList() {
        List<Departments> l = new ArrayList<Departments>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from departments");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Departments pr = new Departments();
                pr.setDepartmentid(rs.getInt(1));
                pr.setDepartmentname(rs.getString(2));
                pr.setDepartmentdesc(rs.getString(3));
                l.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public List<Engineer> ViewDepartmentMemberlist(String mid) {
        List<Engineer> memberdetails = new ArrayList<Engineer>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select engineer_id, membernames, membertitle, memberdob, memberpobirth,memberlocation,memberemail,memberphone,memberstatus from memberships where departmentid='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships();
                Engineer u = new Engineer();
                u.setEngineer_id(re.getInt(1));
                u.setNames(re.getString(2));
                u.setMembertitle(re.getString(3));
                u.setMemberdob(re.getString(4));
                u.setMemberpobirth(re.getString(5));
                u.setMemberlocation(re.getString(6));
                u.setEmails(re.getString(7));
                u.setMemberphone(re.getString(8));
                u.setStatus(re.getString(9));
                 if (u.getStatus().equals("Accepted")) {
                    memberdetails.add(u);
                }
               
            }
            re.close();
            stm.close();
            conn.close();

        } catch (Exception e) {
            formMessage = "Error:" + e.getMessage();
        }

        return memberdetails;

    }

    public static Departments getDepartmentByid(String id) {
        Departments pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from departments where departmentid='" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Departments();
                pr.setDepartmentid(rs.getInt(1));
                pr.setDepartmentname(rs.getString(2));
                pr.setDepartmentdesc(rs.getString(3));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public boolean delete() {
        try {

            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from departments where departmentid=?");
            pst.setInt(1, departmentid);
            pst.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            ex.printStackTrace();
            return false;
        }
    }

    public static Departments getDepartment_name(String name) {
        Departments pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from departments where depname=" + name + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr.setDepartmentid(rs.getInt(1));
                pr.setDepartmentname(rs.getString(2));
                pr.setDepartmentdesc(rs.getString(3));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public Departments() {
    }

    public int getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(int departmentid) {
        this.departmentid = departmentid;
    }

    public String getDepartmentname() {
        return departmentname;
    }

    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname;
    }

    public String getDepartmentdesc() {
        return departmentdesc;
    }

    public void setDepartmentdesc(String departmentdesc) {
        this.departmentdesc = departmentdesc;
    }

    public String getDepidmsg() {
        return depidmsg;
    }

    public void setDepidmsg(String depidmsg) {
        this.depidmsg = depidmsg;
    }

    public String getDepnamemsg() {
        return depnamemsg;
    }

    public void setDepnamemsg(String depnamemsg) {
        this.depnamemsg = depnamemsg;
    }

    public String getDepdescriptionmsg() {
        return depdescriptionmsg;
    }

    public void setDepdescriptionmsg(String depdescriptionmsg) {
        this.depdescriptionmsg = depdescriptionmsg;
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
