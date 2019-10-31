/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enginees;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author moise
 */
public class MemberExperiences {
    private int experienceid;
    private int engineer_id;
    private String bigdate,bigdatemsg,memberidmsg,experienceidmsg;
    private String enddate,enddatemsg;
    private String description,descriptionmsg;
    private String msg, operator = "insert";
    private boolean valid = true; 
    
    public boolean update() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement y = con.prepareStatement("update experiences set description=? where experienceid=?");                       
            y.setString(4, description);           
            y.execute();           
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
  
    public boolean delete() {
        try {

            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from experiences where experienceid=?");
            pst.setInt(1, experienceid);
            pst.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            ex.printStackTrace();
            return false;
        }
    }
    public static List<MemberExperiences> getexperiencesListbymember(int id) {
        List<MemberExperiences> l = new ArrayList<MemberExperiences>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from experiences where experienceid='" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                MemberExperiences pr = new MemberExperiences(); 
                pr.setExperienceid(rs.getInt(1));                
                pr.setBigdate(rs.getString(2));
                pr.setEnddate(rs.getString(3));
                pr.setDescription(rs.getString(4));
                pr.setEngineer_id(rs.getInt(5));              
                l.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }
    public static int getMaxID() {
        int id = 1;
        try {
            Connection con = enginees.DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from experiences");
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
            PreparedStatement y = con.prepareStatement("insert into experiences values(?,?,?,?,?)");
            y.setInt(1, getMaxID());
            y.setString(2, bigdate);
            y.setString(3, enddate);
            y.setString(4,description);
            y.setInt(5, engineer_id);
           
            y.execute();
            //infoMsg = "inserted correctly";
            return true;
        } catch (Exception e) {
            e.printStackTrace();
           // infoMsg = "not inserted";
            return false;
        }
    }
    public MemberExperiences() {
    }

    public int getExperienceid() {
        return experienceid;
    }

    public void setExperienceid(int experienceid) {
        this.experienceid = experienceid;
    }

    public int getEngineer_id() {
        return engineer_id;
    }

    public void setEngineer_id(int engineer_id) {
        this.engineer_id = engineer_id;
    }

   
    public String getBigdate() {
        return bigdate;
        
    }

    public void setBigdate(String bigdate) {
        this.bigdate = bigdate;
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
       Date d1= new Date();
       
        String mydate=sdf.format(d1);
        
        if(mydate.compareTo(this.bigdate)<0){
            valid=false;
            bigdatemsg=("invalid Date");
        }
    }

    public String getBigdatemsg() {
        return bigdatemsg;
    }

    public void setBigdatemsg(String bigdatemsg) {
        this.bigdatemsg = bigdatemsg;
    }

    public String getMemberidmsg() {
        return memberidmsg;
    }

    public void setMemberidmsg(String memberidmsg) {
        this.memberidmsg = memberidmsg;
    }

    public String getExperienceidmsg() {
        return experienceidmsg;
    }

    public void setExperienceidmsg(String experienceidmsg) {
        this.experienceidmsg = experienceidmsg;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
         SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
       Date d1= new Date();
       
        String mydate=sdf.format(d1);
        
        if(mydate.compareTo(this.enddate)<0){
            valid=false;
            enddatemsg=("invalid Date");
        }
    }

    public String getEnddatemsg() {
        return enddatemsg;
    }

    public void setEnddatemsg(String enddatemsg) {
        this.enddatemsg = enddatemsg;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
        if(!this.description.matches("^[a-zA-Z\\s]*$")){
            valid=false;
            descriptionmsg=("Characters Only Accepted");
        }
        if(this.description.length()==0 || this.description.length()<6){
        valid=false;
        descriptionmsg=("Your Description is too short");
        }
    }

    public String getDescriptionmsg() {
        return descriptionmsg;
    }

    public void setDescriptionmsg(String descriptionmsg) {
        this.descriptionmsg = descriptionmsg;
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
