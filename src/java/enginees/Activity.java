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

public class Activity {

    private int activid;
    private String activitname, activitbigDatemsg, activitendDatemsg;
    private String activitdetails;
    private String activitendDate;
    private String activitbigDate;
    private String activitstatus = "Open";
    private String msg, place;
    private String formMessage = "", operator = "Update";
    private boolean valid = true;
    private Connection conn = null;

    public String getActivitbigDatemsg() {
        return activitbigDatemsg;
    }

    public void setActivitbigDatemsg(String activitbigDatemsg) {
        this.activitbigDatemsg = activitbigDatemsg;
    }

    public String getActivitendDatemsg() {
        return activitendDatemsg;
    }

    public void setActivitendDatemsg(String activitendDatemsg) {
        this.activitendDatemsg = activitendDatemsg;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
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

    public String getActivitname() {
        return activitname;
    }

    public void setActivitname(String activitname) {
        this.activitname = activitname;
    }

    public String getActivitdetails() {
        return activitdetails;
    }

    public void setActivitdetails(String activitdetails) {
        this.activitdetails = activitdetails;
    }

    public String getActivitendDate() {
        return activitendDate;
    }

    public void setActivitendDate(String activitendDate) {
        this.activitendDate = activitendDate;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
        Date d11 = new Date();

        String endmydate = sdf.format(d11);

        if (endmydate.compareTo(this.activitendDate) < 0) {
            valid = false;
            activitendDatemsg = ("invalid Date");
        }
    }

    public String getActivitbigDate() {
        return activitbigDate;
    }

    public void setActivitbigDate(String activitbigDate) {
        this.activitbigDate = activitbigDate;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
        Date d1 = new Date();

        String mydate = sdf.format(d1);

        if (mydate.compareTo(this.activitbigDate) < 0) {
            valid = false;
            activitbigDatemsg = ("invalid Date");
        }
    }

    public String getActivitstatus() {
        return activitstatus;
    }

    public void setActivitstatus(String activitstatus) {
        this.activitstatus = activitstatus;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<Activity> ViewSingleActivityDetails(String mid) {
        List<Activity> activdetails = new ArrayList<Activity>();
        try {
            conn = new ConnectorToDb().connector();
            String query = "select * from activities where activid='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                Activity u = new Activity();
                u.setActivid(re.getInt(1));
                u.setActivitname(re.getString(2));
                u.setActivitdetails(re.getString(3));
                u.setActivitendDate(re.getString(4));
                u.setActivitbigDate(re.getString(5));
                u.setActivitstatus(re.getString(6));
                u.setPlace(re.getString(7));
                activdetails.add(u);
            }
            re.close();
            stm.close();
            conn.close();

        } catch (Exception e) {
            formMessage = "Error:" + e.getMessage();
        }

        return activdetails;

    }

    public static int getMaxID() {
        int id = 1;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from activities");
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
            PreparedStatement pst = con.prepareStatement("insert into activities values(?,?,?,?,?,?,?)");
            pst.setInt(1, getMaxID());
            pst.setString(2, activitname);
            pst.setString(3, activitdetails);
            pst.setString(4, activitendDate);
            pst.setString(5, activitbigDate);
            pst.setString(6, activitstatus);
            pst.setString(7, place);
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Activity getClientFromID(String id) {
        Activity pr = null;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from activities where activid= " + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Activity();
                pr.setActivid(rs.getInt(1));
                pr.setActivitname(rs.getString(2));
                pr.setActivitdetails(rs.getString(3));
                pr.setActivitendDate(rs.getString(4));
                pr.setActivitbigDate(rs.getString(5));
                pr.setActivitstatus(rs.getString(6));
                pr.setPlace(rs.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static Activity getActivityID(int id) {
        Activity pr = null;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from activities where activid='" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Activity();
                pr.setActivid(rs.getInt(1));
                pr.setActivitname(rs.getString(2));
                pr.setActivitdetails(rs.getString(3));
                pr.setActivitendDate(rs.getString(4));
                pr.setActivitbigDate(rs.getString(5));
                pr.setActivitstatus(rs.getString(6));
                pr.setPlace(rs.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public List<ActivityReg> ViewActivitMemberlist(String mid) {
        List<ActivityReg> memberdetails = new ArrayList<ActivityReg>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select activid, engineer_id, joinDate, status from ActivityReg where activid='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships();
                ActivityReg u = new ActivityReg();
                u.setActivid(re.getInt(1));
                u.setEngineer_id(re.getInt(2));
                u.setJoinDate(re.getString(3));
                u.setStatus(re.getString(4));
                if (u.getStatus().equals("Joined") || u.getStatus().equals("Attended") || u.getStatus().equals("Absent")) {
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

    public List<ActivityReg> ViewActivityregMemberlist(String mid) {
        List<ActivityReg> memberdetails = new ArrayList<ActivityReg>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select joindate,status from activityreg where activid='" + mid + "'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                //  Memberships u = new Memberships();
                ActivityReg u = new ActivityReg();

                u.setJoinDate(re.getString(1));
                u.setStatus(re.getString(2));

                if (u.getStatus().equals("Joined") && u.getStatus().equals("Attended") && u.getStatus().equals("Absent")) {
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

    public static Activity getClientFromName(String id) {
        Activity pr = null;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from activities where activitname= '" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Activity();
                pr.setActivid(rs.getInt(1));
                pr.setActivitname(rs.getString(2));
                pr.setActivitdetails(rs.getString(3));
                pr.setActivitendDate(rs.getString(4));
                pr.setActivitbigDate(rs.getString(5));
                pr.setActivitstatus(rs.getString(6));
                pr.setPlace(rs.getString(7));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static List<Activity> getList() {
        List<Activity> l = new ArrayList<Activity>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from activities");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Activity pr = new Activity();
                pr.setActivid(rs.getInt(1));
                pr.setActivitname(rs.getString(2));
                pr.setActivitdetails(rs.getString(3));
                pr.setActivitendDate(rs.getString(4));
                pr.setActivitbigDate(rs.getString(5));
                pr.setActivitstatus(rs.getString(6));
                pr.setPlace(rs.getString(7));
                if (pr.getActivitstatus().equals("Open")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Activity> getListClosed() {
        List<Activity> l = new ArrayList<Activity>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from activities");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Activity pr = new Activity();
                pr.setActivid(rs.getInt(1));
                pr.setActivitname(rs.getString(2));
                pr.setActivitdetails(rs.getString(3));
                pr.setActivitendDate(rs.getString(4));
                pr.setActivitbigDate(rs.getString(5));
                pr.setActivitstatus(rs.getString(6));
                pr.setPlace(rs.getString(7));
                if (pr.getActivitstatus().equals("Closed")) {

                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public boolean updateActivity() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("UPDATE `activities` SET `activitname`=?,`activitdetails`=?,`activitendDate`=?,`activitbigDate`=?,`activitstatus`=?,`place`=? WHERE `activid`=?");
            pst.setInt(7, activid);
            pst.setString(1, activitname);
            pst.setString(2, activitdetails);
            pst.setString(3, activitendDate);
            pst.setString(4, activitbigDate);
            pst.setString(5, activitstatus);
            pst.setString(6, place);
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
