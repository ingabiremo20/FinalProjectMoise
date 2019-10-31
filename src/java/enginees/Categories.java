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
public class Categories {
    private int categoryid;
    private String categoryname;
    private String categorydesc;    
    private String categoryidmsg, categorynamemsg,categorydescmsg;
    private String msg, operator = "Create";
    private boolean valid = true;

    public Categories() {
    }
public boolean create() {

        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement y = con.prepareStatement("insert into categories values(?,?,?)");
            y.setInt(1, categoryid);
            y.setString(2, categoryname);
            y.setString(3, categorydesc);            
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
            PreparedStatement y = con.prepareStatement("update branches set categoryid='"+categoryid+"', categoryname='"+categoryname+"',categorydesc='"+categorydesc+"' where categoryid='"+categoryid+"'");
            y.setInt(1, categoryid);
            y.setString(2, categoryname);
            y.setString(3, categorydesc);
            y.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            ex.printStackTrace();
            return false;
        }
    }
public static List<Categories> getCategoryList() {
        List<Categories> l = new ArrayList<Categories>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from categories");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Categories pr = new Categories();
                pr.setCategoryid(rs.getInt(1));
                pr.setCategoryname(rs.getString(2));
                pr.setCategorydesc(rs.getString(3));                
                l.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static Categories getCategoryid(String id) {
        Categories pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from categories where categoryid='" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Categories();
                pr.setCategoryid(rs.getInt(1));
                pr.setCategoryname(rs.getString(2));
                pr.setCategorydesc(rs.getString(3));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public boolean delete() {
        try {

            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from Categories where Categoryid=?");
            pst.setInt(1, categoryid);
            pst.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            ex.printStackTrace();
            return false;
        }
    }

    public static Categories getCategory_name(String name) {
        Categories pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from Categories where Categoryname=" + name + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr.setCategoryid(rs.getInt(1));
                pr.setCategoryname(rs.getString(2));
                pr.setCategorydesc(rs.getString(3));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }
    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    public String getCategorydescmsg() {
        return categorydescmsg;
    }

    public void setCategorydescmsg(String categorydescmsg) {
        this.categorydescmsg = categorydescmsg;
    }

    public String getCategorydesc() {
        return categorydesc;
    }

    public void setCategorydesc(String categorydesc) {
        this.categorydesc = categorydesc;
    }

    public String getCategoryidmsg() {
        return categoryidmsg;
    }

    public void setCategoryidmsg(String categoryidmsg) {
        this.categoryidmsg = categoryidmsg;
    }

    public String getCategorynamemsg() {
        return categorynamemsg;
    }

    public void setCategorynamemsg(String categorynamemsg) {
        this.categorynamemsg = categorynamemsg;
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
