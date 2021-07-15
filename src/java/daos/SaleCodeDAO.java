/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.SaleCodeDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBConnect;

/**
 *
 * @author phath
 */
public class SaleCodeDAO {

    public List<SaleCodeDTO> getSaleCodeList(String codeStatus) throws SQLException {
        List<SaleCodeDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnect.makeConnection();

            if (conn != null) {
                String sql = "SELECT codeID, percentage, codeName, createDate, expDate, codeStatus"
                        + " FROM tblSaleCode WHERE codeStatus = ?";

                stm = conn.prepareStatement(sql);
                stm.setBoolean(1, Boolean.parseBoolean(codeStatus));
                rs = stm.executeQuery();
                while (rs.next()) {
                    String codeID = rs.getString("codeID");
                    String percentage = rs.getString("percentage");
                    String codeName = rs.getString("codeName");
                    String createDate = rs.getString("createDate");
                    String expDate = rs.getString("expDate");
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(new SaleCodeDTO(codeID, codeName, percentage, createDate, expDate, Boolean.parseBoolean(codeStatus)));
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

    public SaleCodeDTO getCode(String codeID) {
        SaleCodeDTO code = new SaleCodeDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT codeName, percentage, createDate, expDate, codeStatus "
                        + " FROM tblSaleCode WHERE codeID LIKE ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + codeID + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String codeName = rs.getString("codeName");
                    String percentage = rs.getString("percentage");
                    String createDate = rs.getString("createDate");
                    String expDate = rs.getString("expDate");
                    boolean codeStatus = rs.getBoolean("codeStatus");
                    code = new SaleCodeDTO(codeID, codeName, percentage, createDate, expDate, codeStatus);
                }
            }

        } catch (Exception e) {
        }
        return code;
    }

    public SaleCodeDTO ApplyCode(String codeID) {
        SaleCodeDTO code = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT codeName, percentage, createDate, expDate, codeStatus "
                        + " FROM tblSaleCode WHERE codeID=? AND expDate>GETDATE()";
                stm = conn.prepareStatement(sql);
                stm.setString(1, codeID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String codeName = rs.getString("codeName");
                    String percentage = rs.getString("percentage");
                    String createDate = rs.getString("createDate");
                    String expDate = rs.getString("expDate");
                    boolean codeStatus = rs.getBoolean("codeStatus");
                    code = new SaleCodeDTO(codeID, codeName, percentage, createDate, expDate, codeStatus);
                }
            }

        } catch (Exception e) {
        }
        return code;
    }
    
    public boolean updateSaleCode(SaleCodeDTO code, String newCodeID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblSaleCode SET percentage = ?, codeName = ?, expDate = ? "
                        + "WHERE codeID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, code.getPercentage());
                stm.setString(2, code.getCodeName());
                stm.setString(3, code.getExpDate());
                stm.setString(4, code.getCodeID());
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
    
    public void createSaleCode(SaleCodeDTO code) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                System.out.println("HEY");
                String sql = "INSERT INTO tblSaleCode(codeID, codeName, createDate, expDate, percentage, codeStatus)"
                        + " VALUES(?, ?, ?, ?, ?, ?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, code.getCodeID());
                stm.setString(2, code.getCodeName());
                stm.setString(3, code.getCreateDate());
                stm.setString(4, code.getExpDate());
                stm.setString(5, code.getPercentage());
                stm.setBoolean(6, code.getCodeStatus());
                System.out.println("Finish");
                stm.execute();
                System.out.println("done");
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

    public boolean deactiveSaleCode(String codeID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblSaleCode SET codeStatus = 0 "
                        + " WHERE codeID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, codeID);
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
