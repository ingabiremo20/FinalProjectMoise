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
public class ProjectsDone {
    private int projectid;
    private int engineer_id;
    private String projectname,projectnamemsg,projectidmsg,companyregnomsg;
    private String projectYear,projectyearmsg;
    private String projectClient,projectclientmsg;
    private String msg, operator = "SAVE";
    private boolean valid = true; 
    public boolean update() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement y = con.prepareStatement("update projectsdone set projectclient=? where projectid=?");                       
            y.setString(5, projectClient);           
            y.execute();           
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
  
    public boolean delete() {
        try {

            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from projectsdone where projectid=?");
            pst.setInt(1, projectid);
            pst.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            ex.printStackTrace();
            return false;
        }
    }
    public static List<ProjectsDone> getProjectsDoneList(int id) {
        List<ProjectsDone> l = new ArrayList<ProjectsDone>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from projectsDone where memberid='" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                ProjectsDone pr = new ProjectsDone();                
                pr.setProjectid(rs.getInt(1));
                pr.setEngineer_id(rs.getInt(2));
                pr.setProjectname(rs.getString(3));
                pr.setProjectYear(rs.getString(4));
                pr.setProjectClient(rs.getString(5));              
                l.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }
public boolean SAVE() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement y = con.prepareStatement("insert into projectsdone values(?,?,?,?,?)");
            y.setInt(1, projectid);
            y.setInt(2, engineer_id);
            y.setString(3, projectname);
            y.setString(4, projectYear);
            y.setString(5, projectClient);
           
            y.execute();
            //infoMsg = "inserted correctly";
            return true;
        } catch (Exception e) {
            e.printStackTrace();
           // infoMsg = "not inserted";
            return false;
        }
    }
    public ProjectsDone() {
    }

    public int getProjectid() {
        return projectid;
    }

    public void setProjectid(int projectid) {
        this.projectid = projectid;
    }

    public int getEngineer_id() {
        return engineer_id;
    }

    public void setEngineer_id(int engineer_id) {
        this.engineer_id = engineer_id;
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

    public String getProjectnamemsg() {
        return projectnamemsg;
    }

    public void setProjectnamemsg(String projectnamemsg) {
        this.projectnamemsg = projectnamemsg;
    }

    public String getProjectidmsg() {
        return projectidmsg;
    }

    public void setProjectidmsg(String projectidmsg) {
        this.projectidmsg = projectidmsg;
    }

    public String getCompanyregnomsg() {
        return companyregnomsg;
    }

    public void setCompanyregnomsg(String companyregnomsg) {
        this.companyregnomsg = companyregnomsg;
    }

    public String getProjectyearmsg() {
        return projectyearmsg;
    }

    public void setProjectyearmsg(String projectyearmsg) {
        this.projectyearmsg = projectyearmsg;
    }

    public String getProjectclientmsg() {
        return projectclientmsg;
    }

    public void setProjectclientmsg(String projectclientmsg) {
        this.projectclientmsg = projectclientmsg;
    }
    
}
