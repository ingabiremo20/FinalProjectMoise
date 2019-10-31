/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enginees;

import static enginees.Documents.getMaxID;
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
public class Docs {
 private String cv;
private int memberid;
 private String formMessage = "", msg;
private Connection conn = null;
 private String operator = "insert";
    private boolean valid = true;

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


public boolean insert() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into Documents values(?,?)");
            pst.setString(1, cv);
            pst.setInt(2, memberid);
           
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
public List<Docs> ViewALlDocs() {
        List<Docs> myDocList = new ArrayList<Docs>();
        try {

            conn = new ConnectorToDb().connector();
            String query = "select * from documents";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {

                Docs u = new Docs();                
                u.setCv(re.getString(1));
                u.setMemberid(re.getInt(2));
                             
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

    public String getCv() {
        return cv;
    }

    public void setCv(String cv) {
        this.cv = cv;
    }

 
   
    public int getMemberid() {
        return memberid;
    }

    public void setMemberid(int memberid) {
        this.memberid = memberid;
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
