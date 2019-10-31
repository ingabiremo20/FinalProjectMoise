package enginees;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class User {

    private int user_id = getMaxID();
    private String username, names, usernamemsg;
    private String password, passwordmsg;
    private String role, status, rolemsg, msg;
    private boolean valid = true; 
    private String operator = "Update";

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

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public User() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public static int getMaxID() {
        int id = 10190;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from users");
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
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into users values(?,?,aes_encrypt(?,?),?,?)");
            pst.setInt(1, user_id);
            pst.setString(2, username);
            pst.setString(3, password);
            pst.setString(4, new DBClassConnector().encrypter());
            pst.setString(5, role);
           
            pst.setString(6, "unlocked");
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public String toString() {
        return "User{" + "username=" + username + ", usernamemsg=" + usernamemsg + ", password=" + password + ", passwordmsg=" + passwordmsg + ", role=" + role + ", rolemsg=" + rolemsg + '}';
    }

    public void tt(List<String> l) {
    }

    public static void main(String args[]) {

    }

    public static List<User> getUserList() {
        List<User> l = new ArrayList<User>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from users");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                User pr = new User();
                pr.setUser_id(rs.getInt(1));
                pr.setUsername(rs.getString(2));
                pr.setPassword(rs.getString(3));
                pr.setRole(rs.getString(4));
                pr.setStatus(rs.getString(5));
                if (!pr.getRole().equals("Admin")) {
                    l.add(pr);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static List<User> getUserListEngineers() {
        List<User> l = new ArrayList<User>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from users");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                User pr = new User();
                pr.setUser_id(rs.getInt(1));
                pr.setUsername(rs.getString(2));
                pr.setPassword(rs.getString(3));
                pr.setRole(rs.getString(4));
                pr.setStatus(rs.getString(5));
                if (pr.getRole().equals("student")) {
                    l.add(pr);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static User getUser(String username) {
        User pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
             PreparedStatement pst = con.prepareStatement("SELECT userid,username,AES_decrypt(password,'Ingabire@@moise89'),roles,userstatus from users where username='" + username + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new User();
                pr.setUser_id(rs.getInt(1));
                pr.setUsername(rs.getString(2));
                pr.setPassword(rs.getString(3));
                pr.setRole(rs.getString(4));
                pr.setStatus(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static User getUserByID(int id) {
        User pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from users where userid=" + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new User();

                pr.setUser_id(rs.getInt(1));

                pr.setUsername(rs.getString(2));
                pr.setPassword(rs.getString(3));
                pr.setRole(rs.getString(4));
                pr.setStatus(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public boolean update() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("update users set roles=? where userid=?");
            pst.setInt(2, user_id);
            pst.setString(1, role);
            
            pst.execute();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }

    }

    public boolean UnlockUser(String op) {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("update users set usr_status='" + op + "' where usr_username=?");

            pst.setString(1, username);

            pst.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            return false;
        }

    }

    public boolean lockUser() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("update users set usr_status='locked' where username=?");
            pst.setString(1, username);

            pst.execute();
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            return false;
        }

    }

    public boolean update_lock_unlock(String on, String id) {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("update users set userstatus=? where username=?");
            pst.setString(1, on);
            pst.setString(2, username);
            pst.execute();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }

    }

    public boolean delete() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from users where usr_username=?");
            pst.setString(1, username);
            pst.execute();
            con.close();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();

            return false;
        }

    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsernamemsg() {
        return usernamemsg;
    }

    public void setUsernamemsg(String usernamemsg) {
        this.usernamemsg = usernamemsg;
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

    public String getPasswordmsg() {
        return passwordmsg;
    }

    public void setPasswordmsg(String passwordmsg) {
        this.passwordmsg = passwordmsg;

    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
        if(!this.role.matches("^[a-zA-Z\\s]*$")){
            valid=false;
            rolemsg=("Characters Only Accepted");
        }
        if(this.role.length()==0 || this.role.length()<3){
        valid=false;
        rolemsg=("This is too short");
        }
    }

    public String getRolemsg() {
        return rolemsg;
    }

    public void setRolemsg(String rolemsg) {
        this.rolemsg = rolemsg;
    }
}
