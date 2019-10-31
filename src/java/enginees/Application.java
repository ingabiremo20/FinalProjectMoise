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

/**
 *
 * @author Fabien
 */
public class Application {

    private int apply_id,reg_id;
    private String comp_name;
    private String names;
    private String qualification, project_name;
    private String msg, status;

    public int getApply_id() {
        return apply_id;
    }

    public void setApply_id(int apply_id) {
        this.apply_id = apply_id;
    }

    public String getComp_name() {
        return comp_name;
    }

    public void setComp_name(String comp_name) {
        this.comp_name = comp_name;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public int getReg_id() {
        return reg_id;
    }

    public void setReg_id(int reg_id) {
        this.reg_id = reg_id;
    }


    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
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
            PreparedStatement pst = con.prepareStatement("select * from applications");
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
            PreparedStatement pst = con.prepareStatement("insert into applications values(?,?,?,?,?,?,?)");
            pst.setInt(1, getMaxID());
            pst.setString(2, comp_name);
            pst.setString(3, names);
            pst.setString(4, qualification);
            pst.setInt(5, reg_id);
            pst.setString(6, project_name);
            pst.setString(7, status);
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Application getClientFromID(String id) {
        Application pr = null;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from applications where apply_id= " + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Application();
                pr.setApply_id(rs.getInt(1));
                pr.setComp_name(rs.getString(2));
                pr.setNames(rs.getString(3));
                pr.setQualification(rs.getString(4));
                pr.setReg_id(rs.getInt(5));
                pr.setProject_name(rs.getString(6));
                pr.setStatus(rs.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static Application getClientFromName(String id) {
        Application pr = null;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from applications where comp_name= '" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Application();
                pr.setApply_id(rs.getInt(1));
                pr.setComp_name(rs.getString(2));
                pr.setNames(rs.getString(3));
                pr.setQualification(rs.getString(4));
                pr.setReg_id(rs.getInt(5));
                pr.setProject_name(rs.getString(6));
                pr.setStatus(rs.getString(7));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static List<Application> getList() {
        List<Application> l = new ArrayList<Application>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from applications");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Application pr = new Application();
                pr.setApply_id(rs.getInt(1));
                pr.setComp_name(rs.getString(2));
                pr.setNames(rs.getString(3));
                pr.setQualification(rs.getString(4));
                pr.setReg_id(rs.getInt(5));
                pr.setProject_name(rs.getString(6));
                pr.setStatus(rs.getString(7));
                if (!pr.getStatus().equals("Pending")) {
                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Application> getListe() {
        List<Application> l = new ArrayList<Application>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from applications");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Application pr = new Application();
                pr.setApply_id(rs.getInt(1));
                pr.setComp_name(rs.getString(2));
                pr.setNames(rs.getString(3));
                pr.setQualification(rs.getString(4));
                pr.setReg_id(rs.getInt(5));
                pr.setProject_name(rs.getString(6));
                pr.setStatus(rs.getString(7));
                if (pr.getStatus().equals("Pending")) {
                    l.add(pr);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<Application> getListes() {
        List<Application> l = new ArrayList<Application>();
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from applications");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Application pr = new Application();
                pr.setApply_id(rs.getInt(1));
                pr.setComp_name(rs.getString(2));
                pr.setNames(rs.getString(3));
                pr.setQualification(rs.getString(4));
                pr.setReg_id(rs.getInt(5));
                pr.setProject_name(rs.getString(6));
                pr.setStatus(rs.getString(7));
                l.add(pr);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

}
