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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Fabien
 */
public class ActivityReg {

    private int activRegid, engineer_id, activid;

    private String joinDate, names, memberlocation, memberemail, memberphone;

    private String status = "Joined";
    private String msg;
    private String formMessage = "";
    private boolean valid = true;
    private Connection conn = null;

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
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

    public String getFormMessage() {
        return formMessage;
    }

    public void setFormMessage(String formMessage) {
        this.formMessage = formMessage;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public int getActivid() {
        return activid;
    }

    public void setActivid(int activid) {
        this.activid = activid;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getActivRegid() {
        return activRegid;
    }

    public void setActivRegid(int activRegid) {
        this.activRegid = activRegid;
    }

    public int getEngineer_id() {
        return engineer_id;
    }

    public void setEngineer_id(int engineer_id) {
        this.engineer_id = engineer_id;
    }

    public String getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public static int getMaxID() {
        int id = 1;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from activityreg");
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
            joinDate = sdf.format(today);
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into activityreg values(?,?,?,?,?)");
            pst.setInt(1, getMaxID());
            pst.setInt(2, engineer_id);
            pst.setInt(3, activid);
            pst.setString(4, joinDate);
            pst.setString(5, status);

            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

   
    public List<ActivityReg> ViewActivityregMemberlist(String mid) {
        List<ActivityReg> memberdetails = new ArrayList<ActivityReg>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select engineer_id,activid,joinDate,status from activityreg where activid='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships();
                ActivityReg u = new ActivityReg();
                u.setEngineer_id(re.getInt(1));
                u.setActivid(re.getInt(2));
                u.setJoinDate(re.getString(3));
                u.setStatus(re.getString(4));

            }
            re.close();
            stm.close();
            conn.close();

        } catch (Exception e) {
            formMessage = "Error:" + e.getMessage();
        }

        return memberdetails;

    }

}
