/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

/**
 *
 * @author phath
 */
public class DBSupport {

    public int getNumbRows(String tableID, String tableName) throws SQLException {
        int count = 0;
        Connection conn = null;
        CallableStatement stm = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String procedure = "{call countRows(?,?,?)}";
                stm = conn.prepareCall(procedure);
                stm.setString(1, tableID);
                stm.setString(2, tableName);
                stm.registerOutParameter(3, Types.INTEGER);
                stm.execute();

                count = stm.getInt(3);
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return count;
    }

    public void increaseCount(String column, String productID) throws SQLException {
        Connection conn = null;
        CallableStatement stm = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String procedure = "{call increaseCount(?,?)}";
                stm = conn.prepareCall(procedure);
                stm.setString(1, column);
                stm.setString(2, productID);
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
}
