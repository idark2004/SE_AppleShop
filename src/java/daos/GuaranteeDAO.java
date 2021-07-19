/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.GuaranteeDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import utils.DBConnect;
import utils.DBSupport;

/**
 *
 * @author phath
 */
public class GuaranteeDAO {

    public boolean submit(GuaranteeDTO guarant) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean check = false;
        DBSupport sp = new DBSupport();
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblGuarantee(guarantID,orderID,receiveDate,expectedDate,guarantDescription,ownerName,contactNumber,guarantFee,guarantStatus) "
                        + " VALUES(?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "GUA-" + sp.getNumbRows("guarantID", "tblGuarantee"));
                stm.setString(2, guarant.getOrderID());
                stm.setString(3, guarant.getReceiveDate());
                stm.setString(4, guarant.getExpectedDate());
                stm.setString(5, guarant.getGuarantDescription());
                stm.setString(6, guarant.getOwnerName());
                stm.setString(7, guarant.getContactNumber());
                stm.setString(8, guarant.getGuarantFee());
                stm.setString(9, guarant.getGurantStatus());
                check = stm.executeUpdate() > 0;
            }
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

    public List<GuaranteeDTO> getAll() throws SQLException {
        List<GuaranteeDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT guarantID, orderID, receiveDate,expectedDate,guarantDescription, ownerName, contactNumber,guarantFee,guarantStatus "
                        + " FROM tblGuarantee";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String guarantID = rs.getString("guarantID");
                    String orderID = rs.getString("orderID");
                    String receiveDate = rs.getString("receiveDate");
                    String expectedDate = rs.getString("expectedDate");
                    String guarantDescription = rs.getString("guarantDescription");
                    String ownerName = rs.getString("ownerName");
                    String contactNumber = rs.getString("contactNumber");
                    String guarantFee = rs.getString("guarantFee");
                    String guarantStatus = rs.getString("guarantStatus").trim();
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(new GuaranteeDTO(guarantID, orderID, receiveDate, expectedDate, guarantDescription, ownerName, contactNumber, guarantFee, guarantStatus));
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
        return list;
    }

    public boolean statusAction(String guarantID, String status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        Date currentDate = cal.getTime();
        String completeDate = dateFormat.format(currentDate);
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = null;
                if (status.equals("Cancel")) {
                    sql = "UPDATE tblGuarantee SET guarantStatus = ? "
                            + " WHERE guarantID LIKE ?";
                    stm = conn.prepareStatement(sql);
                    stm.setString(1, status);
                    stm.setString(2, "%" + guarantID + "%");
                } else {
                    sql = "UPDATE tblGuarantee SET guarantStatus = ?, actualDate = ? "
                            + " WHERE guarantID LIKE ?";
                    stm = conn.prepareStatement(sql);
                    stm.setString(1, status);
                    stm.setString(2, completeDate);
                    stm.setString(3, "%" + guarantID + "%");
                }

                check = stm.executeUpdate() > 0;
            }
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
}
