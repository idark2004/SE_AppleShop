/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.ProductDAO;
import dtos.CartItemDTO;
import dtos.ErrorDTO;
import dtos.OrderDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author phath
 */
public class CartController extends HttpServlet {

    public static final String ERROR = "error.jsp";
    public static final String ORDERED = "orderCompletion.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String url = ERROR;
        ProductDAO dao = new ProductDAO();
        OrderDTO newOrder = new OrderDTO();
        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
        String perform = request.getParameter("perform");
        try {
            switch (perform) {
                case "Order Complete":
                    String cusName = request.getParameter("cusName");
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String payMethod = request.getParameter("payMethod");
                    double total = Double.parseDouble(request.getParameter("total"));
                    String userID = null;
                    if (cart != null) {
                        newOrder = dao.completeOrder(cart, address, cusName, email, phone, userID, null, payMethod, total);
                        String orderID = newOrder.getOrderID();
                        boolean check = dao.addOrderDetail(cart, orderID);
                        if (check) {
                            session.removeAttribute("cart");
                            url = ORDERED;
                        }
                    }
            }
        } catch (Exception e) {
            request.setAttribute("ERROR", e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
