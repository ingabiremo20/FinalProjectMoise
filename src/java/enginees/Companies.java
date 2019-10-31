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
import java.util.Date;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author moise
 */
public class Companies {

    private int companyregno, companyregnomsg;
    private String  companyTIN,companyTINmsg;   
    private String companyname,companyregdate, companyactivity1, companyactivity2, companyactivity3, companystatus;
    private String companynamemsg,companyregdatemsg, requestdatemsg, companyactivity1msg, companyactivity2msg, companyactivity3msg, companystatusmsg;
    private Date  requestdate;
    private String msg, operator = "Create";
    private boolean valid = true;
public boolean update() {
        try {

            Connection con = DBClassConnector.getConnection();
            PreparedStatement y = con.prepareStatement("update companies set companyregno='"+companyregno+"', companyTIN='"+companyTIN+"',companystatus='"+companystatus+"' where companyregno='"+companyregno+"'");
            y.setInt(1, companyregno);
            y.setString(2, companyTIN);
           
            y.setString(3, companyregdate);
            y.setString(4, companyname);
            y.setString(5, companyactivity1);
            y.setString(6, companyactivity2);
            y.setString(7, companyactivity3);
            y.setString(8, companystatus= "desactivate");
            y.setDate(9, new java.sql.Date(requestdate.getTime()));
            y.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            ex.printStackTrace();
            return false;
        }
    }

  
    public static List<Companies> getCompaniesList() {
        List<Companies> l = new ArrayList<Companies>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from companies");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Companies pr = new Companies();               
                pr.setCompanyregno(rs.getInt(1));
                pr.setCompanyTIN(rs.getString(2));                              
                pr.setCompanyregdate(rs.getString(3));
                pr.setCompanyname(rs.getString(4));
                pr.setCompanyactivity1(rs.getString(5));
                pr.setCompanyactivity2(rs.getString(6));
                pr.setCompanyactivity3(rs.getString(7));                                
                pr.setCompanystatus(rs.getString(8));
                pr.setRequestdate(rs.getDate(9));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static Companies getCompanyByid(int id) {
        Companies pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from companies where companyregno='" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Companies();
               pr.setCompanyregno(rs.getInt(1));
                pr.setCompanyTIN(rs.getString(2));                              
                pr.setCompanyregdate(rs.getString(3));
                pr.setCompanyname(rs.getString(4));
                pr.setCompanyactivity1(rs.getString(5));
                pr.setCompanyactivity2(rs.getString(6));
                pr.setCompanyactivity3(rs.getString(7));                                
                pr.setCompanystatus(rs.getString(8));
                pr.setRequestdate(rs.getDate(9));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public boolean delete() {
        try {

            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from companies where companyregno=?");
            pst.setInt(1, companyregno);
            pst.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            ex.printStackTrace();
            return false;
        }
    }

    public static Companies getCompaniesByName(String name) {
        Companies pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from Companies where Companyname=" + name + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                 pr = new Companies();
                pr.setCompanyregno(rs.getInt(1));
                pr.setCompanyTIN(rs.getString(2));                              
                pr.setCompanyregdate(rs.getString(3));
                pr.setCompanyname(rs.getString(4));
                pr.setCompanyactivity1(rs.getString(5));
                pr.setCompanyactivity2(rs.getString(6));
                pr.setCompanyactivity3(rs.getString(7));                                
                pr.setCompanystatus(rs.getString(8));
                pr.setRequestdate(rs.getDate(9));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }
    
    public boolean create() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement y = con.prepareStatement("insert into companies values(?,?,?,?,?,?,?,?,?)");
            y.setInt(1, companyregno);
            y.setString(2, companyTIN);           
            y.setString(3, companyregdate);
            y.setString(4, companyname);
            y.setString(5, companyactivity1);
            y.setString(6, companyactivity2);
            y.setString(7, companyactivity3);
            y.setString(8, companystatus= "desactivate");
            y.setDate(9, new java.sql.Date(requestdate.getTime()));
            y.execute();
            //infoMsg = "inserted correctly";
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            // infoMsg = "not inserted";
            return false;
        }
    }

    public Companies() {
    }

    public int getCompanyregno() {
        return companyregno;
    }

    public void setCompanyregno(int companyregno) {
        this.companyregno = companyregno;
    }

    public int getCompanyregnomsg() {
        return companyregnomsg;
    }

    public void setCompanyregnomsg(int companyregnomsg) {
        this.companyregnomsg = companyregnomsg;
    }

    public String getCompanyTIN() {
        return companyTIN;
    }

    public void setCompanyTIN(String companyTIN) {
        this.companyTIN = companyTIN;
    }

    public String getCompanyTINmsg() {
        return companyTINmsg;
    }

    public void setCompanyTINmsg(String companyTINmsg) {
        this.companyTINmsg = companyTINmsg;
    }

    
    

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname;
    }

    public String getCompanyactivity1() {
        return companyactivity1;
    }

    public void setCompanyactivity1(String companyactivity1) {
        this.companyactivity1 = companyactivity1;
    }

    public String getCompanyactivity2() {
        return companyactivity2;
    }

    public void setCompanyactivity2(String companyactivity2) {
        this.companyactivity2 = companyactivity2;
    }

    public String getCompanyactivity3() {
        return companyactivity3;
    }

    public void setCompanyactivity3(String companyactivity3) {
        this.companyactivity3 = companyactivity3;
    }

    public String getCompanystatus() {
        return companystatus;
    }

    public void setCompanystatus(String companystatus) {
        this.companystatus = companystatus;
    }

    public String getCompanynamemsg() {
        return companynamemsg;
    }

    public void setCompanynamemsg(String companynamemsg) {
        this.companynamemsg = companynamemsg;
    }

    public String getCompanyactivity1msg() {
        return companyactivity1msg;
    }

    public void setCompanyactivity1msg(String companyactivity1msg) {
        this.companyactivity1msg = companyactivity1msg;
    }

    public String getCompanyactivity2msg() {
        return companyactivity2msg;
    }

    public void setCompanyactivity2msg(String companyactivity2msg) {
        this.companyactivity2msg = companyactivity2msg;
    }

    public String getCompanyactivity3msg() {
        return companyactivity3msg;
    }

    public void setCompanyactivity3msg(String companyactivity3msg) {
        this.companyactivity3msg = companyactivity3msg;
    }

    public String getCompanystatusmsg() {
        return companystatusmsg;
    }

    public void setCompanystatusmsg(String companystatusmsg) {
        this.companystatusmsg = companystatusmsg;
    }

   

    public Date getRequestdate() {
        return requestdate;
    }

    public void setRequestdate(Date requestdate) {
        this.requestdate = requestdate;
    }

    public String getCompanyregdate() {
        return companyregdate;
    }

    public void setCompanyregdate(String companyregdate) {
        this.companyregdate = companyregdate;
    }

    public String getCompanyregdatemsg() {
        return companyregdatemsg;
    }

    public void setCompanyregdatemsg(String companyregdatemsg) {
        this.companyregdatemsg = companyregdatemsg;
    }

    public String getRequestdatemsg() {
        return requestdatemsg;
    }

    public void setRequestdatemsg(String requestdatemsg) {
        this.requestdatemsg = requestdatemsg;
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
