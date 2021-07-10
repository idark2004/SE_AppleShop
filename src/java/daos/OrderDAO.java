/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.AreaChartDTO;
import dtos.BarChartDTO;
import utils.DBConnect;
import dtos.OrderDTO;
import dtos.OrderDetailDTO;
import dtos.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author ADMIN
 */
public class OrderDAO {
    public ArrayList<OrderDTO> getAllOrder() throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT orderID, orderDate, cusName, price, address, payMethod, status FROM tblOrders ";

        ArrayList<OrderDTO> lst = new ArrayList<>();

        try {
            c = DBConnect.makeConnection();
            if (c != null) {
                ps = c.prepareStatement(sql);
                rs = ps.executeQuery();
                
                if(rs != null) System.out.println("rs <> null");
                else System.out.println("rs null");
                
                while (rs.next()) {
                    OrderDTO o = new OrderDTO();
                    o.setOrderID(rs.getString("orderID"));
                    o.setOrderDate(rs.getString("orderDate"));
                    o.setCusName(rs.getString("cusName"));
                    o.setPrice(rs.getDouble("price"));
                    o.setAddress(rs.getString("address"));
                    o.setPayMethod(rs.getString("payMethod"));
                    o.setStatus(rs.getString("status"));
                    
                    lst.add(o);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return lst;
    }
    
    public ArrayList<OrderDTO> getAllUserOrder(String userID) throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT orderID, orderDate, cusName, orderPrice, orderAddress, payMethod, orderStatus FROM tblOrders WHERE userID=?";

        ArrayList<OrderDTO> lst = new ArrayList<>();

        try {
            c = DBConnect.makeConnection();
            if (c != null) {
                ps = c.prepareStatement(sql);
                ps.setString(1, userID);
                rs = ps.executeQuery();
                
                
                if(rs != null) System.out.println("rs <> null");
                else System.out.println("rs null");
                
                while (rs.next()) {
                    OrderDTO o = new OrderDTO();
                    o.setOrderID(rs.getString("orderID"));
                    o.setOrderDate(rs.getString("orderDate"));
                    o.setCusName(rs.getString("cusName"));
                    o.setPrice(rs.getDouble("orderPrice"));
                    o.setAddress(rs.getString("orderAddress"));
                    o.setPayMethod(rs.getString("payMethod"));
                    o.setStatus(rs.getString("orderStatus"));
                    
                    lst.add(o);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return lst;
    }
    
    public OrderDTO getOrder(String oid) throws NamingException, SQLException {
        Connection c = null; //doi tuong ket noi
        PreparedStatement ps = null; //doi tuong truy van
        ResultSet rs = null;//doi tuong nhan ket qua

        String sql = "SELECT orderID, cusName, orderDate, orderPrice , orderAddress, payMethod, orderStatus "
                + " FROM tblOrders "
                + " WHERE orderID=?";

        try {
            DBConnect db = new DBConnect();
            c = db.makeConnection(); // tao doi tuong connection qua DBConnection

            if (c != null) {
                ps = c.prepareStatement(sql); // tao truy van
                ps.setString(1, oid); //gan tham so 1 la bien truyen vao
                rs = ps.executeQuery();

                while (rs.next()) {
                    OrderDTO o = new OrderDTO();
                    o.setOrderID(oid);
                    o.setCusName(rs.getString("cusName"));
                    o.setOrderDate(rs.getString("orderDate"));
                    o.setPayMethod(rs.getString("payMethod"));
                    o.setPrice(rs.getDouble("orderPrice"));
                    o.setAddress(rs.getString("orderAddress"));
                    o.setPayMethod(rs.getString("payMethod"));
                    o.setStatus(rs.getString("orderStatus"));

                    return o;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (ps != null) {
                ps.close();
            }

            if (c != null) {
                c.close();
            }
        }
        return null;
    }
    
    public ArrayList<OrderDetailDTO> getAllOrderDetail(String oid) throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT p.productName, s.color, s.ram, s.storage, o.orderQuantity, s.specPrice "
                + " FROM tblProducts p, tblProductSpec s, tblOrderDetail o "
                + " WHERE o.orderID= ? AND o.productID = p.productID AND o.specID = s.specID;";

        ArrayList<OrderDetailDTO> lst = new ArrayList<>();

        try {
            c = DBConnect.makeConnection();
            if (c != null) {
                ps = c.prepareStatement(sql);
                ps.setString(1, oid);
                rs = ps.executeQuery();

                while (rs.next()) {
                    ProductDTO p = new ProductDTO();
                    p.setName(rs.getString("name"));
                    p.setColor(rs.getString("color"));
                    p.setRam(rs.getString("ram"));
                    p.setStorage(rs.getString("storage"));
                    p.setPrice(rs.getDouble("price"));
                    
                    OrderDetailDTO od = new OrderDetailDTO();
                    od.setOrderID(oid);
                    od.setQuantity(rs.getInt("quantity"));
                    od.setProduct(p);
                    
                    lst.add(od);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return lst;
    }
    
    public BarChartDTO getMonthlyRevenue(int month) throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT SUM(orderPrice) as price, MONTH(completedDate) AS Months "
                + "FROM tblOrders "
                + "WHERE MONTH(completedDate) = ? AND orderStatus != 'Cancelled' "
                + "GROUP BY Month(completedDate)";
        
        try {
            c = DBConnect.makeConnection();
            if (c != null) {
                ps = c.prepareStatement(sql);
                ps.setInt(1, month);
                rs = ps.executeQuery();
                while (rs.next()) {
                    BarChartDTO data=new BarChartDTO();
                    data.setRevenue(rs.getInt("price"));
                    data.setMonth(rs.getInt("Months"));
                    return data;
                }
                    //System.out.println("Revenue: "+lst.get(i-1).getRevenue());
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return null;
    }
    
    public AreaChartDTO getDailyRevenue(int month, int day) throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT SUM(orderPrice) as price , CAST(completedDate AS DATE) as date "
                + "FROM tblOrders "
                + "WHERE orderStatus != 'Cancelled' AND DAY(completedDate)=? AND MONTH(completedDate)=? "
                + "GROUP BY CAST(completedDate AS DATE)";
        
        try {
            c = DBConnect.makeConnection();
            if (c != null) {
                ps = c.prepareStatement(sql);
                ps.setInt(1, day);
                ps.setInt(2, month);
                rs = ps.executeQuery();
                while (rs.next()) {
                    AreaChartDTO data=new AreaChartDTO();
                    data.setRevenue(rs.getInt("price"));
                    return data;
                }
                    //System.out.println("Revenue: "+lst.get(i-1).getRevenue());
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return null;
    }
}
