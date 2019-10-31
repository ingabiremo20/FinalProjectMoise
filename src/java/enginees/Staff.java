package enginees;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Staff {

    private int staff_id, userid, dep_id,branchid;
    private String fname, lname, op = "Register",lnamemsg,emailmsg,telmsg,fnamemsg, dep_idv, tel, msg, gender, email, user_idv, usernamemsg, password, password2, passwordmsg;
    private boolean valid = true; 

    public String getEmailmsg() {
        return emailmsg;
    }

    public void setEmailmsg(String emailmsg) {
        this.emailmsg = emailmsg;
    }

    public String getTelmsg() {
        return telmsg;
    }

    public void setTelmsg(String telmsg) {
        this.telmsg = telmsg;
    }
    
    public String getLnamemsg() {
        return lnamemsg;
    }

    public void setLnamemsg(String lnamemsg) {
        this.lnamemsg = lnamemsg;
    }

    public String getFnamemsg() {
        return fnamemsg;
    }

    public void setFnamemsg(String fnamemsg) {
        this.fnamemsg = fnamemsg;
    }

    public int getBranchid() {
        return branchid;
    }

    public void setBranchid(int branchid) {
        this.branchid = branchid;
    }


    public String getDep_idv() {
        return dep_idv;
    }

    public String getOp() {
        return op;
    }

    public void setOp(String op) {
        this.op = op;
    }

    public void setDep_idv(String dep_idv) {
        this.dep_idv = dep_idv;
    }

    

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getDep_id() {
        return dep_id;
    }

    public void setDep_id(int dep_id) {
        this.dep_id = dep_id;
    }

    public boolean isValid() {
        return valid;
    }

    public String getUsernamemsg() {
        return usernamemsg;
    }

    public void setUsernamemsg(String usernamemsg) {
        this.usernamemsg = usernamemsg;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
        if (!password.equals(password2)) {
            valid = false;
            passwordmsg = "Password Missmatching";
        }
    }

    public String getPasswordmsg() {
        return passwordmsg;
    }

    public void setPasswordmsg(String passwordmsg) {
        this.passwordmsg = passwordmsg;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
                if (!this.password.matches("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,20})") ) {
                    valid = false;
            passwordmsg = ("Password length should be between 8 and 20and  Must contain Atleast one uppercase, a Number and a special Chararacter");
        }
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public static Staff getStudentFromUser_ID(String id) {
        Staff pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from staffs where  user_id=" + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Staff();
                pr.setStaff_id(rs.getInt(1));
                pr.setFname(rs.getString(2));
                pr.setLname(rs.getString(3));
                pr.setGender(rs.getString(4));
                pr.setTel(rs.getString(5));
                pr.setEmail(rs.getString(6));
                pr.setUserid(rs.getInt(7));
                pr.setBranchid(rs.getInt(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static Staff getStaff_USER_id(String id) {
        Staff pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from staff where user_id= " + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Staff();
                pr.setStaff_id(rs.getInt(1));
                pr.setFname(rs.getString(2));
                pr.setLname(rs.getString(3));
                pr.setGender(rs.getString(4));
                pr.setTel(rs.getString(5));
                pr.setEmail(rs.getString(6));
                pr.setUserid(rs.getInt(7));
                pr.setBranchid(rs.getInt(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static Staff getStaff_ID(String id) {
        Staff pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from staffs where staff_id= " + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Staff();
                pr.setStaff_id(rs.getInt(1));
                pr.setFname(rs.getString(2));
                pr.setLname(rs.getString(3));
                pr.setGender(rs.getString(4));
                pr.setTel(rs.getString(5));
                pr.setEmail(rs.getString(6));
                pr.setUserid(rs.getInt(7));
                pr.setBranchid(rs.getInt(8));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

//    public boolean delete() {
//        try {
//            Connection con = DBClassConnector.getConnection();
//            PreparedStatement pst = con.prepareStatement("delete from purchase where purchase_id=?");
//            pst.setInt(1, purchase_id);
//         
//            pst.execute();
//            return true;
//        } catch (Exception e) {
//            System.out.println(">>>>Error Hint>> "+e);
//            e.printStackTrace();
//            return false;
//        }
//    }
    public static int getMaxID() {
        int id = 0;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from staffs");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id + 1;
    }

    public static List<Staff> getStudentList() {
        List<Staff> l = new ArrayList<Staff>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from staffs");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Staff pr = new Staff();
                pr.setStaff_id(rs.getInt(1));
                pr.setFname(rs.getString(2));
                pr.setLname(rs.getString(3));
                pr.setGender(rs.getString(4));
                pr.setTel(rs.getString(5));
                pr.setEmail(rs.getString(6));
                pr.setUserid(rs.getInt(7));
                pr.setBranchid(rs.getInt(8));
                l.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

//    public void setStudent_names(String student_names) {
//        this.student_names = student_names;
//        try {
//            if (student_names.length() < 4) {
//                student_namesnsg = "Too Short Names ";
//                valid = false;
//            } else {
//                String[] p = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
//                for (int i = 0; i < p.length; i++) {
//                    if (student_names.contains(p[i])) {
//                        student_namesnsg = "Too Short Names ";
//                        valid = false;
//                        break;
//                    }
//
//                }
//
//
//            }
//        } catch (Exception e) {
//        }
//    }
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public boolean insert() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into staffs values(?,?,?,?,?,?,?,?)");
            pst.setInt(1, getMaxID());
            pst.setString(2, fname);
            pst.setString(3, lname);
            pst.setString(4, gender);
            pst.setString(5, tel);
            pst.setString(6, email);
            pst.setInt(7, userid);
            pst.setInt(8, branchid);
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
//     public boolean update() {
//        try {
//            Connection con = DBClassConnector.getConnection();
//            PreparedStatement pst = con.prepareStatement("update students set stu_reg_number=?,stu_fname=?,stu_lname=?,stu_mname=?,stu_gender=?,stu_phone=?,stu_email=?,stu_dep_id=? where st_id=?");
//            pst.setInt(9, student_id);
//            pst.setString(1, reg_number);
//            pst.setString(2, student_fname);
//            pst.setString(3, student_lname);
//            pst.setString(4, student_mname);
//            pst.setString(5, gender);
//            
//            pst.setString(6, tel);
//            pst.setString(7, email);
//            pst.setInt(8,Department.getDepartmentFromName(dep_idv).getDept_id());
//            
//            pst.execute();
//            return true;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }

//     public boolean delete() {
//        try {
//            Connection con = DBClassConnector.getConnection();
//            PreparedStatement pst = con.prepareStatement("delete from students  where st_id=?");
//            pst.setInt(1, student_id);
//            
//            
//            pst.execute();
//            return true;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
         if (this.tel.length() == 0 || this.tel.length() < 10|| this.tel.length() >10) {
            valid = false;
            telmsg = (" 10 Digits Only");
        }
        if (!this.tel.matches("[0-9]+")) {
            valid = false;
            telmsg = ("Numbers Only Accepted");
        }
       
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
        if (!this.email.matches("^[A-Za-z](.*)([@]{1})(.{1,})(\\.)(.{1,})")) {
            valid = false;
           emailmsg = ("invalid E-mail");
        }
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
        if(!this.fname.matches("^[a-zA-Z\\s]*$")){
            valid=false;
            fnamemsg=("Characters Only Accepted");
        }
        if(this.fname.length()==0 || this.fname.length()<3){
        valid=false;
        fnamemsg=("Your First Name is too short");
        }
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
         if(!this.lname.matches("^[a-zA-Z\\s]*$")){
            valid=false;
            lnamemsg=("Characters Only Accepted");
        }
        if(this.lname.length()==0 || this.lname.length()<3){
        valid=false;
        lnamemsg=("Your Last Name is too short");
        }
    }

    public String getUser_idv() {
        return user_idv;
    }

    public void setUser_idv(String user_idv) {
        this.user_idv = user_idv;
    }

}
