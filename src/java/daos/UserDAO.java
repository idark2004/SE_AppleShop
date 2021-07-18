/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import utils.DBConnect;
import dtos.UserDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBSupport;

/**
 *
 * @author ADMIN
 */
public class UserDAO {

    public UserDTO checkLogin(String email, String password) throws NamingException, SQLException {
        Connection conn = null; //doi tuong ket noi
        PreparedStatement stm = null; //doi tuong truy van
        ResultSet rs = null;//doi tuong nhan ket qua

        String sql = "SELECT * FROM tblUsers WHERE userEmail=? AND password=? ";

        try {
            conn = DBConnect.makeConnection(); // tao doi tuong connection qua DBConnection

            if (conn != null) {
                stm = conn.prepareStatement(sql); // tao truy van
                stm.setString(1, email); //gan tham so 1 la bien truyen vao
                stm.setString(2, password);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String id = rs.getString("userID");
                    String n = rs.getString("name");
                    String un = rs.getString("userEmail");
                    String pn = rs.getString("userPhoneNumber");
                    String a = rs.getString("userAddress");
                    String rid = rs.getString("roleID");
                    UserDTO u = new UserDTO(id, n, un, "", pn, a, rid);

                    return u;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }

            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public UserDTO getUserProfile(String uid) throws NamingException, SQLException {
        Connection conn = null; //doi tuong ket noi
        PreparedStatement stm = null; //doi tuong truy van
        ResultSet rs = null;//doi tuong nhan ket qua

        String sql = "SELECT * FROM tblUsers WHERE userID=?";

        try {
            conn = DBConnect.makeConnection(); // tao doi tuong connection qua DBConnection

            if (conn != null) {
                stm = conn.prepareStatement(sql); // tao truy van
                stm.setString(1, uid); //gan tham so 1 la bien truyen vao
                rs = stm.executeQuery();

                while (rs.next()) {
                    String id = rs.getString("userID");
                    String n = rs.getString("name");
                    String un = rs.getString("userEmail");
                    String p = rs.getString("password");
                    String pn = rs.getString("userPhoneNumber");
                    String a = rs.getString("userAddress");
                    String rid = rs.getString("roleID");

                    UserDTO u = new UserDTO(id, n, un, p, pn, a, rid);

                    return u;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }

            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public UserDTO findByEmail(String email) throws NamingException, SQLException {
        Connection conn = null; //doi tuong ket noi
        PreparedStatement stm = null; //doi tuong truy van
        ResultSet rs = null;//doi tuong nhan ket qua

        String sql = "SELECT * FROM tblUsers WHERE userEmail=?";

        try {
            conn = DBConnect.makeConnection(); // tao doi tuong connection qua DBConnection

            if (conn != null) {
                stm = conn.prepareStatement(sql); // tao truy van
                stm.setString(1, email); //gan tham so 1 la bien truyen vao
                rs = stm.executeQuery();

                while (rs.next()) {
                    String id = rs.getString("userID");
                    String n = rs.getString("name");
                    String un = rs.getString("userEmail");
                    String p = rs.getString("password");
                    String pn = rs.getString("userPhoneNumber");
                    String a = rs.getString("userAddress");
                    String rid = rs.getString("roleID");

                    UserDTO u = new UserDTO(id, n, un, p, pn, a, rid);

                    return u;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }

            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }
    
    public String GetRoleKey(String roleID) throws NamingException, SQLException {
        Connection conn = null; //doi tuong ket noi
        PreparedStatement stm = null; //doi tuong truy van
        ResultSet rs = null;//doi tuong nhan ket qua

        String sql = "SELECT roleKey FROM tblRoles WHERE roleID=?";

        try {
            conn = DBConnect.makeConnection(); // tao doi tuong connection qua DBConnection

            if (conn != null) {
                stm = conn.prepareStatement(sql); // tao truy van
                stm.setString(1, roleID); //gan tham so 1 la bien truyen vao
                rs = stm.executeQuery();

                while (rs.next()) {
                    String key = rs.getString("roleKey");

                    return key;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }

            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public boolean UpdateUserDetail(UserDTO u) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean check =false;
        String sql = "UPDATE tblUsers SET userPhoneNumber=?, userAddress=? WHERE userID=?";
        try {
            conn = DBConnect.makeConnection();

            if (conn != null) {
                stm = conn.prepareStatement(sql);

                stm.setString(1, u.getPhone());
                stm.setString(2, u.getAddress());
                stm.setString(3, u.getUserID());

                check = stm.executeUpdate() > 0;                
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean UpdateUserPassword(UserDTO u) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        String sql = "UPDATE tblUsers SET password=? WHERE userID=?";
        try {
            conn = DBConnect.makeConnection();

            if (conn != null) {
                stm = conn.prepareStatement(sql);

                stm.setString(1, u.getPassword());
                stm.setString(2, u.getUserID());

                stm.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public void insert(UserDTO user) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBConnect.makeConnection(); // tao doi tuong connection qua DBConnection
            if (conn != null) {
                DBSupport db = new DBSupport();
                String userID="US-";
                String sql = "INSERT INTO tblUsers(userID, name, userEmail, password, userPhoneNumber, userAddress, roleID, userStatus)"
                        + " VALUES(?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID+db.getNumbRows("userID", "tblUsers"));
                stm.setString(2, user.getName());
                stm.setString(3, user.getEmail());
                stm.setString(4, user.getPassword());
                stm.setString(5, user.getPhone());
                stm.setString(6, user.getAddress());
                stm.setString(7, user.getRoleID());
                stm.setBoolean(8, true);
                stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void manageGoogleUser(UserDTO user) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                long d = System.currentTimeMillis();
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date currentDate = new Date(d);
                String sql = "INSERT INTO tblGoogleUsers(idToken, fullName, email, createDate,status, roleID) "
                        + " VALUES(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getName());
                stm.setString(3, user.getEmail());
                stm.setString(4, formatter.format(currentDate));
                stm.setBoolean(5, Boolean.parseBoolean(user.getStatus()));
                stm.setString(6, user.getRoleID());
                stm.execute();
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<UserDTO> getUserList(String roleID) throws SQLException {
        List<UserDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT userID, name, userEmail, userPhoneNumber, userAddress, userStatus "
                        + " FROM tblUsers "
                        + " WHERE roleID LIKE ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + roleID + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String name = rs.getString("name");
                    String email = rs.getString("userEmail");                    
                    String phone = rs.getString("userPhoneNumber");
                    String address = rs.getString("userAddress");
                    String status = rs.getString("userStatus");
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(new UserDTO(userID, name, email, "", phone, address, status ,roleID));
                }
            }
        } 
        finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

}
