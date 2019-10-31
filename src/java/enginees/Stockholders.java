/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enginees;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author moise
 */
public class Stockholders {

    private int stockholdid;
    private int engineer_id,recierId;
    private String stockholdNames;
    private String identification;
    private String stockholdTel;
    private String stockholdqual;
    private String msg, operator = "Create";
    private boolean valid = true;
    
    public boolean create() {

        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement y = con.prepareStatement("insert into stockholders values(?,?,?,?,?,?,?)");
            y.setInt(1, stockholdid);
            y.setInt(6, engineer_id);
            y.setString(2, stockholdNames);
            y.setString(3, identification);            
            y.setString(4, stockholdTel);            
            y.setString(5, stockholdqual);            
            y.setInt(7, recierId);            
            y.execute();
            //infoMsg = "inserted correctly";
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            //infoMsg = "not inserted";
            return false;

        }
    }
    public String getMsg() {
        return msg;
    }

    public int getRecierId() {
        return recierId;
    }

    public void setRecierId(int recierId) {
        this.recierId = recierId;
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

    public int getStockholdid() {
        return stockholdid;
    }

    public void setStockholdid(int stockholdid) {
        this.stockholdid = stockholdid;
    }

    public int getEngineer_id() {
        return engineer_id;
    }

    public void setEngineer_id(int engineer_id) {
        this.engineer_id = engineer_id;
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

}
