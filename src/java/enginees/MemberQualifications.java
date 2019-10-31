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
public class MemberQualifications {

    private int acadQlif;
    private int engineer_id;
    private String acInstitution, acInstitutionmsg, yearOfAward, yearOfAwardmsg;
    private String certfAward, certfAwardmsg;
    private String msg, operator = "insert";
    private boolean valid = true;

    public boolean delete() {
        try {

            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from qualifications where AcadQlif=?");
            pst.setInt(1, acadQlif);
            pst.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            ex.printStackTrace();
            return false;
        }
    }

    public static List<MemberQualifications> getqualificationsListbymember(int id) {
        List<MemberQualifications> l = new ArrayList<MemberQualifications>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from qualifications where memberid='" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                MemberQualifications pr = new MemberQualifications();
                pr.setAcadQlif(rs.getInt(1));
                pr.setAcInstitution(rs.getString(2));
                pr.setCertfAward(rs.getString(3));
                pr.setYearOfAward(rs.getString(4));
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
            PreparedStatement pst = con.prepareStatement("select * from qualifications");
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
            PreparedStatement y = con.prepareStatement("insert into qualifications values(?,?,?,?,?)");
            y.setInt(1, getMaxID());
            y.setString(2, acInstitution);
            y.setString(3, certfAward);
            y.setInt(5, engineer_id);
            y.setString(4, yearOfAward);
            y.execute();
            //infoMsg = "inserted correctly";
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            // infoMsg = "not inserted";
            return false;
        }
    }

    public MemberQualifications() {
    }

    public int getAcadQlif() {
        return acadQlif;
    }

    public void setAcadQlif(int acadQlif) {
        this.acadQlif = acadQlif;
    }

    public String getAcInstitution() {
        return acInstitution;
    }

    public void setAcInstitution(String acInstitution) {
        this.acInstitution = acInstitution;
        if (!this.acInstitution.matches("^[a-zA-Z\\s]*$")) {
            valid = false;
            acInstitutionmsg = ("Characters Only Accepted");
        }
        if (this.acInstitution.length() == 0 || this.acInstitution.length() < 10) {
            valid = false;
            acInstitutionmsg = ("Name is too short");
        }
    }

    public String getAcInstitutionmsg() {
        return acInstitutionmsg;
    }

    public void setAcInstitutionmsg(String acInstitutionmsg) {
        this.acInstitutionmsg = acInstitutionmsg;
    }

    public String getYearOfAward() {
        return yearOfAward;
    }

    public void setYearOfAward(String yearOfAward) {
        this.yearOfAward = yearOfAward;
        if (!this.yearOfAward.matches("^[1-9][0-9]*$")) {
            valid = false;
            yearOfAwardmsg = ("Year Not Accepted");
        }
        if (this.yearOfAward.length() == 0 || this.yearOfAward.length() < 4 || this.yearOfAward.length() > 4) {
            valid = false;
            yearOfAwardmsg = ("4 Digit Only eg:1990");
        }
    }

    public String getYearOfAwardmsg() {
        return yearOfAwardmsg;
    }

    public void setYearOfAwardmsg(String yearOfAwardmsg) {
        this.yearOfAwardmsg = yearOfAwardmsg;
    }

    public String getCertfAward() {
        return certfAward;
    }

    public void setCertfAward(String certfAward) {
        this.certfAward = certfAward;
        if (!this.certfAward.matches("^[a-zA-Z\\s]*$")) {
            valid = false;
            certfAwardmsg = ("Characters Only Accepted");
        }
        if (this.certfAward.length() == 0 || this.certfAward.length() < 10) {
            valid = false;
            certfAwardmsg = ("This is too Short");
        }
    }

    public String getCertfAwardmsg() {
        return certfAwardmsg;
    }

    public void setCertfAwardmsg(String certfAwardmsg) {
        this.certfAwardmsg = certfAwardmsg;
    }

    public int getEngineer_id() {
        return engineer_id;
    }

    public void setEngineer_id(int engineer_id) {
        this.engineer_id = engineer_id;
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
