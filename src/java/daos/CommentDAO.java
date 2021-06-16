/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import utils.DBConnect;
import dtos.CommentDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author ADMIN
 */
public class CommentDAO {
    public ArrayList<CommentDTO> getAllProductComment(String pid) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        String sql = "SELECT id, productID, ownerName, description, userID FROM tblComments WHERE productID=?";

        ArrayList<CommentDTO> lst = new ArrayList<>();

        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                stm = conn.prepareStatement(sql);
                stm.setString(1, pid);
                rs = stm.executeQuery();

                while (rs.next()) {
                    CommentDTO co = new CommentDTO();
                    co.setId(rs.getString("id"));
                    co.setProductID(pid);
                    co.setOwnerName(rs.getString("ownerName"));
                    co.setDescription(rs.getString("description"));
                    co.setUserID(rs.getString("userID"));
                    
                    lst.add(co);
                }
            }
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
        return lst;
    }
    
    public boolean CreateComment(CommentDTO comment) throws NamingException, SQLException{
        Connection conn= null;
        PreparedStatement stm = null;
        boolean check = false;
        try{
            conn = DBConnect.makeConnection();
            
            if (conn!=null){
                String sql= "INSERT INTO tblComments (id, productID, ownerName, description, userID) "
                + "VALUES (?, ?, ?, ?, ?)";
                stm=conn.prepareStatement(sql);                
                stm.setString(1, "CMT00");
                stm.setString(2, comment.getProductID());
                stm.setString(3, comment.getOwnerName());
                stm.setString(4, comment.getDescription());
                stm.setString(5, comment.getUserID());                
                check = stm.executeUpdate() > 0;                
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (stm!=null){
                stm.close();
            }
            if (conn!=null) {
                conn.close();
            }
        }
        return check;
    }
}
