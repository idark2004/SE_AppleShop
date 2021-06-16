/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import utils.DBConnect;
import dtos.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author ADMIN
 */
public class UserDAO {
    public UserDTO checkLogin(String email, String password) throws NamingException, SQLException {
        Connection c = null; //doi tuong ket noi
        PreparedStatement ps = null; //doi tuong truy van
        ResultSet rs = null;//doi tuong nhan ket qua
        
        String sql ="SELECT * FROM tblUsers WHERE email=? AND password=?";
        
        try{
            DBConnect db = new DBConnect();
            c = db.makeConnection(); // tao doi tuong connection qua DBConnection
            
            if (c!=null){
                ps = c.prepareStatement(sql); // tao truy van
                ps.setString(1, email); //gan tham so 1 la bien truyen vao
                ps.setString(2, password);
                rs = ps.executeQuery();
                
                while (rs.next()){
                    String id = rs.getString("userID");
                    String n = rs.getString("name");
                    String un = rs.getString("email");
                    String pn = rs.getString("phoneNumber");
                    String a = rs.getString("address");
                    String rid= rs.getString("roleID");
                    
                    UserDTO u= new UserDTO(id, n, un, "", pn, a, rid);
                    
                    return u;
                }
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            if(rs !=null){
                rs.close();
            }
            
            if (ps !=null){
                ps.close();
            }
            
            if (c!=null){
                c.close();
            }
        }
        return null;
    }
    
    public UserDTO userDetail(String uid) throws NamingException, SQLException {
        Connection c = null; //doi tuong ket noi
        PreparedStatement ps = null; //doi tuong truy van
        ResultSet rs = null;//doi tuong nhan ket qua
        
        String sql ="SELECT * FROM tblUsers WHERE userID=?";
        
        try{
            DBConnect db = new DBConnect();
            c = db.makeConnection(); // tao doi tuong connection qua DBConnection
            
            if (c!=null){
                ps = c.prepareStatement(sql); // tao truy van
                ps.setString(1, uid); //gan tham so 1 la bien truyen vao
                rs = ps.executeQuery();
                
                while (rs.next()){
                    String id = rs.getString("userID");
                    String n = rs.getString("name");
                    String un = rs.getString("email");
                    String p = rs.getString("password");
                    String pn = rs.getString("phoneNumber");
                    String a = rs.getString("address");
                    String rid= rs.getString("roleID");
                    
                    UserDTO u= new UserDTO(id, n, un, p, pn, a, rid);
                    
                    return u;
                }
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            if(rs !=null){
                rs.close();
            }
            
            if (ps !=null){
                ps.close();
            }
            
            if (c!=null){
                c.close();
            }
        }
        return null;
    }
    
    public boolean UpdateUserDetail(UserDTO u) throws NamingException, SQLException{
        Connection c= null;
        PreparedStatement ps = null;
        String sql= "UPDATE tblUsers SET phoneNumber=?, address=? WHERE userID=?";
        try{
            c = DBConnect.makeConnection();
            
            if (c!=null){
                ps=c.prepareStatement(sql);
                
                ps.setString(1, u.getPhone());
                ps.setString(2, u.getAddress());
                ps.setString(3, u.getUserID());
                
                ps.executeUpdate();
                return true;
            }
        } catch (Exception e){
            e.printStackTrace();
            return false;
        } finally {
            if (ps!=null){
                ps.close();
            }
            if (c!=null) {
                c.close();
            }
        }
        return false;
    }
    
    public void insert(UserDTO user) throws SQLException{
        Connection conn = null;
        PreparedStatement stm = null;
        try {
             DBConnect db = new DBConnect();
            conn = db.makeConnection(); // tao doi tuong connection qua DBConnection
            if(conn != null){
                String sql = "INSERT INTO tblUsers(userID, name, email, password, phoneNumber, address, roleID)"
                        + " VALUES(?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "TEST21");
                stm.setString(2, user.getName());
                stm.setString(3, user.getEmail());
                stm.setString(4, user.getPassword());
                stm.setString(5, user.getPhone());
                stm.setString(6, user.getAddress());
                stm.setString(7, user.getRoleID());
                stm.executeQuery();
            }
        } 
        finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
    
    
}
